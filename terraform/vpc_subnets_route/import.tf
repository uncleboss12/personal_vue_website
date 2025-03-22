provider "aws" {
  region = "us-west-2"
}

# Define subnets using for_each
resource "aws_subnet" "subnets" {
  for_each = {
    "private-subnet-1" = {
      id         = "subnet-0ea41340749c6e8bd"
      cidr_block = "10.0.3.0/24"
      availability_zone = "us-west-2a"
    }
    "private-subnet-2" = {
      id         = "subnet-0f23cda98987975c6"
      cidr_block = "10.0.4.0/24"
      availability_zone = "us-west-2b"
    }
    "public-subnet-1" = {
      id         = "subnet-0cd7e52b33c03c5a3"
      cidr_block = "10.0.1.0/24"
      availability_zone = "us-west-2a"
    }
    "public-subnet-2" = {
      id         = "subnet-0d578a7a5f1e1aadd"
      cidr_block = "10.0.2.0/24"
      availability_zone = "us-west-2b"
    }
  }

  vpc_id                  = "vpc-0e2ef785fe899db22" # Replace with your VPC ID
  cidr_block              = each.value.cidr_block
  availability_zone       = each.value.availability_zone
  map_public_ip_on_launch = true

  tags = {
    Name = "subnet-${each.key}"
  }
}


