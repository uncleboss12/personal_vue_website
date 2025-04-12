#  Build and push Docker image
####  Build the Docker image
```bash
docker build -t personal-vue-website:latest .
```

# Tag the image for your registry (replace with your Docker Hub username or ECR registry)
```bash
docker tag personal-vue-website:latest uncleboss12/personal-vue-webapp:latest
```
# Login to your registry
```bash
docker login
```
# Push the image
```bash

docker push uncleboss12/personal-vue-webapp:latest
```

# Phase 2: Development Environment Setup on EC2
```bash
# Create VPC with CIDR block
aws ec2 create-vpc --cidr-block 10.0.0.0/16 --tag-specifications 'ResourceType=vpc,Tags=[{Key=Name,Value=personal-website-vpc}]'

# Store the VPC ID
VPC_ID=$(aws ec2 describe-vpcs --filters "Name=tag:Name,Values=personal-website-vpc" --query "Vpcs[0].VpcId" --output text)

# Enable DNS hostnames
aws ec2 modify-vpc-attribute --vpc-id $VPC_ID --enable-dns-hostnames "{\"Value\":true}"

# Create internet gateway
aws ec2 create-internet-gateway --tag-specifications 'ResourceType=internet-gateway,Tags=[{Key=Name,Value=personal-website-igw}]'

# Store the IGW ID
IGW_ID=$(aws ec2 describe-internet-gateways --filters "Name=tag:Name,Values=personal-website-igw" --query "InternetGateways[0].InternetGatewayId" --output text)
```

##### Attach IGW to VPC
```bash
aws ec2 attach-internet-gateway --internet-gateway-id $IGW_ID --vpc-id $VPC_ID
```

## Create Subnets

# Create public subnets in two AZs
```bash
aws ec2 create-subnet --vpc-id $VPC_ID --cidr-block 10.0.1.0/24 --availability-zone us-west-2a --tag-specifications 'ResourceType=subnet,Tags=[{Key=Name,Value=public-subnet-1}]'
aws ec2 create-subnet --vpc-id $VPC_ID --cidr-block 10.0.2.0/24 --availability-zone us-west-2b --tag-specifications 'ResourceType=subnet,Tags=[{Key=Name,Value=public-subnet-2}]'
```
# Store subnet IDs
```bash
PUBLIC_SUBNET_1=$(aws ec2 describe-subnets --filters "Name=tag:Name,Values=public-subnet-1" --query "Subnets[0].SubnetId" --output text)
PUBLIC_SUBNET_2=$(aws ec2 describe-subnets --filters "Name=tag:Name,Values=public-subnet-2" --query "Subnets[0].SubnetId" --output text)
```
# Create private subnets for EKS in two AZs
```bash
aws ec2 create-subnet --vpc-id $VPC_ID --cidr-block 10.0.3.0/24 --availability-zone us-west-2a --tag-specifications 'ResourceType=subnet,Tags=[{Key=Name,Value=private-subnet-1}]'
aws ec2 create-subnet --vpc-id $VPC_ID --cidr-block 10.0.4.0/24 --availability-zone us-west-1b --tag-specifications 'ResourceType=subnet,Tags=[{Key=Name,Value=private-subnet-2}]'

PRIVATE_SUBNET_1=$(aws ec2 describe-subnets --filters "Name=tag:Name,Values=private-subnet-1" --query "Subnets[0].SubnetId" --output text)
PRIVATE_SUBNET_2=$(aws ec2 describe-subnets --filters "Name=tag:Name,Values=private-subnet-2" --query "Subnets[0].SubnetId" --output text)
```

# Enable auto-assign public IPs for public subnets
```bash
aws ec2 modify-subnet-attribute --subnet-id $PUBLIC_SUBNET_1 --map-public-ip-on-launch
aws ec2 modify-subnet-attribute --subnet-id $PUBLIC_SUBNET_2 --map-public-ip-on-launch
```

# Create route table for public subnets
```bash
aws ec2 create-route-table --vpc-id $VPC_ID --tag-specifications 'ResourceType=route-table,Tags=[{Key=Name,Value=public-rt}]'
```

# Store route table ID
PUBLIC_RT=$(aws ec2 describe-route-tables --filters "Name=tag:Name,Values=public-rt" --query "RouteTables[0].RouteTableId" --output text)

# Add route to internet gateway
```bash
aws ec2 create-route --route-table-id $PUBLIC_RT --destination-cidr-block 0.0.0.0/0 --gateway-id $IGW_ID
```

# Associate public subnets with route table
```bash
aws ec2 associate-route-table --route-table-id $PUBLIC_RT --subnet-id $PUBLIC_SUBNET_1
aws ec2 associate-route-table --route-table-id $PUBLIC_RT --subnet-id $PUBLIC_SUBNET_2
```

# Create security group for web servers
```bash
aws ec2 create-security-group --group-name web-sg --description "Web Security Group" --vpc-id $VPC_ID --tag-specifications 'ResourceType=security-group,Tags=[{Key=Name,Value=web-sg}]'
```
# Store security group ID
```bash
WEB_SG=$(aws ec2 describe-security-groups --filters "Name=tag:Name,Values=web-sg" --query "SecurityGroups[0].GroupId" --output text)
```

# Allow HTTP and HTTPS traffic
```bash
aws ec2 authorize-security-group-ingress --group-id $WEB_SG --protocol tcp --port 80 --cidr 0.0.0.0/0
aws ec2 authorize-security-group-ingress --group-id $WEB_SG --protocol tcp --port 443 --cidr 0.0.0.0/0
aws ec2 authorize-security-group-ingress --group-id $WEB_SG --protocol tcp --port 22 --cidr 73.37.49.61/32  # Replace with your IP
```

# Create key pair (or use an existing one)
```bash
aws ec2 create-key-pair --key-name personal-website-key --query "KeyMaterial" --output text > personal-website-key.pem
chmod 400 personal-website-key.pem
```

# Launch EC2 instance
```bash
aws ec2 run-instances \
  --image-id ami-0520f976ad2e6300c \ 
  --instance-type t2.micro \
  --key-name personal-website-key \
  --security-group-ids $WEB_SG \
  --subnet-id $PUBLIC_SUBNET_1 \
  --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=personal-website-dev}]' \
  --user-data '#!/bin/bash
    yum update -y
    yum install -y docker git
    systemctl start docker
    systemctl enable docker
    usermod -aG docker ec2-user
    mkdir -p /usr/local/lib/docker/cli-plugins
    curl -SL https://github.com/docker/compose/releases/download/v2.34.0/docker-compose-linux-x86_64 -o /usr/local/lib/docker/cli-plugins
    chmod +x /usr/local/bin/docker-compose
    reboot'
```
# Store instance ID
```bash
INSTANCE_ID=$(aws ec2 describe-instances --filters "Name=tag:Name,Values=personal-website-dev" --query "Reservations[0].Instances[0].InstanceId" --output text)
```

# Get public IP
```bash
INSTANCE_IP=$(aws ec2 describe-instances --instance-ids $INSTANCE_ID --query "Reservations[0].Instances[0].PublicIpAddress" --output text)
echo "Development server IP: $INSTANCE_IP"
```

#### Deploy to Development EC2 Instance
#### SSH to instance
```bash
ssh -i personal-website-key.pem ec2-user@$INSTANCE_IP
```
#### Clone repository
```bash
git clone https://github.com/uncleboss12/personal_vue_website.git
cd personal_vue_website
```
#### Create docker-compose.yml file
```bash
cat > docker-compose.yml << 'EOL'
version: '3'
services:
  web:
    image: uncleboss12/personal-vue-webapp:latest
    ports:
      - "80:80"
    restart: always
EOL
```

##### Run the container
```bash
docker compose up -d
```

### open the website and check the page at http://<PUBLIC_IP>


# Phase 3: Production Deployment on EKS

# Install eksctl if not installed
# For Linux: curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp && sudo mv /tmp/eksctl /usr/local/bin

# Create EKS cluster
```bash
eksctl create cluster \
  --name personal-website-cluster \
  --version 1.25 \
  --region us-east-1 \
  --nodegroup-name standard-nodes \
  --node-type t3.small \
  --nodes 2 \
  --nodes-min 1 \
  --nodes-max 3 \
  --vpc-private-subnets=$PRIVATE_SUBNET_1,$PRIVATE_SUBNET_2 \
  --vpc-public-subnets=$PUBLIC_SUBNET_1,$PUBLIC_SUBNET_2 \
  --ssh-access \
  --ssh-public-key personal-website-key \
  --managed
```

## configure kubectl

```bash
# Update kubeconfig to interact with your cluster

aws eks update-kubeconfig --name personal-website-cluster --region us-east-1
```

## Create Kubernetes Deployment Files
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: personal-vue-website
  labels:
    app: personal-vue-website
spec:
  replicas: 2
  selector:
    matchLabels:
      app: personal-vue-website
  template:
    metadata:
      labels:
        app: personal-vue-website
    spec:
      containers:
      - name: personal-vue-website
        image: your-registry/personal-vue-website:latest
        ports:
        - containerPort: 80
        resources:
          requests:
            cpu: 100m
            memory: 128Mi
          limits:
            cpu: 300m
            memory: 256Mi
```

```yaml
apiVersion: v1
kind: Service
metadata:
  name: personal-vue-website-service
spec:
  selector:
    app: personal-vue-website
  ports:
  - port: 80
    targetPort: 80
  type: LoadBalancer
```

### install kubectl
```bash
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x kubectl
sudo mv kubectl /usr/local/bin/

kubectl version --client

```
# Deploy to EKS
```bash
eksctl create cluster --name personal-website --region us-west-2 --version 1.32 --vpc-private-subnets subnet-0ea41340749c6e8bd,subnet-0f23cda98987975c6 --without-nodegroup

aws eks describe-cluster --region us-west-2 --name personal-website-eks-cluster --query "cluster.status"

aws eks update-kubeconfig --region us-west-2 --name personal-website-eks-cluster

kubectl get svc
```
# Apply Kubernetes configurations
```bash
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml

kubectl create secret docker-registry my-registry-secret \
  --docker-username=<username> \
  --docker-password=<password> \
  --docker-server=<registry-url> \
  --docker-email=<email>
```
# Check deployment status
kubectl get deployments
kubectl get pods

# Get the load balancer URL
kubectl get svc personal-vue-website-service

# Save the external IP/DNS
ELB_URL=$(kubectl get svc personal-vue-website-service -o jsonpath='{.status.loadBalancer.ingress[0].hostname}')
echo "Load balancer URL: $ELB_URL"



# Phase 4: S3 Static Website Deployment (Most Cost-Effective)
## Build and Deploy Vue.js App to S3

# Build the Vue.js app
cd personal_vue_website
npm run build

# Sync the built files to S3
aws s3 sync dist/ s3://justineobiazi-website/ --delete

# Get the S3 website URL
echo "S3 Website URL: http://justineobiazi-website.s3-website-us-east-1.amazonaws.com"

## Create CloudFront distribution
aws cloudfront create-distribution \
  --origin-domain-name justineobiazi-website.s3.amazonaws.com \
  --default-root-object index.html \
  --enabled \
  --query "Distribution.DomainName" \
  --output text > cloudfront-domain.txt

# Save the CloudFront domain
CF_DOMAIN=$(cat cloudfront-domain.txt)
echo "CloudFront URL: https://$CF_DOMAIN"

# Create a CloudFront OAI for improved security (optional but recommended)
aws cloudfront create-cloud-front-origin-access-identity \
  --cloud-front-origin-access-identity-config "CallerReference=justineobiazi-website,Comment=justineobiazi-website OAI"



## Configure Route 53
# Get hosted zone ID for justineobiazi.com (if already exists)
ZONE_ID=$(aws route53 list-hosted-zones-by-name --dns-name justineobiazi.com --query "HostedZones[0].Id" --output text | cut -d/ -f3)

# If zone doesn't exist, create it
if [ -z "$ZONE_ID" ]; then
  aws route53 create-hosted-zone --name justineobiazi.com --caller-reference "$(date +%s)"
  ZONE_ID=$(aws route53 list-hosted-zones-by-name --dns-name justineobiazi.com --query "HostedZones[0].Id" --output text | cut -d/ -f3)
fi

# Create DNS record to point to CloudFront
cat > dns-record.json << EOL
{
  "Changes": [
    {
      "Action": "UPSERT",
      "ResourceRecordSet": {
        "Name": "justineobiazi.com",
        "Type": "A",
        "AliasTarget": {
          "HostedZoneId": "Z2FDTNDATAQYW2",
          "DNSName": "$CF_DOMAIN",
          "EvaluateTargetHealth": false
        }
      }
    },
    {
      "Action": "UPSERT",
      "ResourceRecordSet": {
        "Name": "www.justineobiazi.com",
        "Type": "A",
        "AliasTarget": {
          "HostedZoneId": "Z2FDTNDATAQYW2",
          "DNSName": "$CF_DOMAIN",
          "EvaluateTargetHealth": false
        }
      }
    }
  ]
}
EOL


## Set up SSL with ACM
# Apply DNS changes
aws route53 change-resource-record-sets --hosted-zone-id $ZONE_ID --change-batch file://dns-record.json
# Request SSL certificate
aws acm request-certificate \
  --domain-names justineobiazi.com,www.justineobiazi.com \
  --validation-method DNS \
  --region us-east-1

# Get certificate ARN
CERT_ARN=$(aws acm list-certificates --query "CertificateSummaryList[?DomainName=='justineobiazi.com'].CertificateArn" --output text)
echo "Certificate ARN: $CERT_ARN"

# Create DNS validation records (manual step)
# You'll need to create CNAME records in Route 53 for certificate validation
# AWS will provide you with the record names and values in the AWS Management Console

# Update CloudFront distribution to use SSL certificate
# (This is easier to do in the AWS Management Console)

## Set up Automated Deployment with GitHub Actions
name: Deploy Website

on:
  push:
    branches: [ main ]

jobs:
  build-and-deploy:
    runs-on: ubuntu-latest
    
    steps:
    - uses: actions/checkout@v3
    
    - name: Setup Node.js
      uses: actions/setup-node@v3
      with:
        node-version: '16'
        
    - name: Install dependencies
      run: npm ci
      
    - name: Build
      run: npm run build
      
    - name: Configure AWS credentials
      uses: aws-actions/configure-aws-credentials@v1
      with:
        aws-access-key-id: ${{ secrets.AWS_ACCESS_KEY_ID }}
        aws-secret-access-key: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
        aws-region: us-east-1
        
    - name: Deploy to S3
      run: aws s3 sync dist/ s3://justineobiazi-website/ --delete
      
    - name: Invalidate CloudFront cache
      run: aws cloudfront create-invalidation --distribution-id ${{ secrets.CLOUDFRONT_DISTRIBUTION_ID }} --paths "/*"




  # Creating Infrastructure using terraform

  ## because i have already created the infrastructure manually, i am importing the infrastructure using terrafrom import 

  ```bash 
terraform import aws_vpc.personal-website-vpc vpc-0e2ef785fe899db22

terraform import 'aws_subnet.subnets["private-subnet-1"]'  subnet-0ea41340749c6e8bd
terraform import 'aws_subnet.subnets["private-subnet-2"]'  subnet-0f23cda98987975c6
terraform import 'aws_subnet.subnets[ "public-subnet-1"]' subnet-0cd7e52b33c03c5a3
terraform import 'aws_subnet.subnets["public-subnet-2"]' subnet-0d578a7a5f1e1aadd


terraform import aws_internet_gateway.personal_website_igw igw-0347b7e82a06a8dac

terraform import aws_route_table.public_rt rtb-068494c2e27083d1a

terraform import aws_security_group.web-sg sg-0beda4678455f9b2d

terraform state list

terraform validate

terraform plan

terraform apply -auto-approve
```

also i did the config and statefile using this 

```bash
 terraform plan -generate-config-out="vpc.tf"
 ```

made some errors with my vpc and security-group when i was importing configuration, where i used underscore unstead of dash, had to move the state file to the correct one isntead of destroying my vpc and security group.

```bash
terraform state mv aws_vpc.personal_website_vpc aws_vpc.personal-website-vpc

terraform state mv aws_security_group.web_sg aws_security_group.web-sg
```