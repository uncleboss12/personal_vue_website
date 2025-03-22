provider "aws" {
  region = "us-east-1"
}

import  {
  to = aws_vpc.personal_vpc
  id = "vpc-0bcadb3a7ec570ff1"
}