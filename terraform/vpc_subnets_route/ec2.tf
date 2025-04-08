# Security Group for EC2 Instance
resource "aws_security_group" "web-sg" {
  name        = "web-sg"
  description = "Web Security Group"
  vpc_id      = "vpc-0e2ef785fe899db22" 

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allow SSH from anywhere (adjust as needed)
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allow HTTP from anywhere
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allow HTTPS from anywhere
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # Allow all outbound traffic
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "web-sg"
  }
}

# EC2 Instance
resource "aws_instance" "dev_personal_instance" {
  ami           = "ami-0520f976ad2e6300c" # Replace with your desired AMI ID
  instance_type = "t2.micro"
  subnet_id     = "subnet-0cd7e52b33c03c5a3" 
  key_name      = "terraform-aws-key-pair"     # Replace with your key pair name

  # Attach the security group
  vpc_security_group_ids = [aws_security_group.web-sg.id]

  # User data script (optional, if you want to use it directly)
  /*user_data = <<-EOF
    #!/bin/bash
    yum update -y
    yum install -y docker git
    systemctl start docker
    systemctl enable docker
    usermod -aG docker ec2-user
    mkdir -p /usr/local/lib/docker/cli-plugins
    curl -SL https://github.com/docker/compose/releases/download/v2.34.0/docker-compose-linux-x86_64 -o /usr/local/lib/docker/cli-plugins/docker-compose
    chmod +x /usr/local/lib/docker/cli-plugins/docker-compose
    reboot
  EOF
*/
  tags = {
    Name = "dev_personal_instance"
  }

  # Remote exec provisioner
  provisioner "remote-exec" {
    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file("terraform-aws-key-pair.pem") 
      host        = self.public_ip
    }

    inline = [
      "sudo yum update -y",
      "sudo yum install -y docker git",
      "sudo systemctl start docker",
      "sudo systemctl enable docker",
      "sudo usermod -aG docker ec2-user",
      "sudo mkdir -p /usr/local/lib/docker/cli-plugins",
      "sudo curl -SL https://github.com/docker/compose/releases/download/v2.34.0/docker-compose-linux-x86_64 -o /usr/local/lib/docker/cli-plugins/docker-compose",
      "sudo chmod +x /usr/local/lib/docker/cli-plugins/docker-compose",
      "sudo reboot"
    ]
  }
}