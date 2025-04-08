

resource "aws_internet_gateway" "personal_website_igw" {
  vpc_id = "vpc-0e2ef785fe899db22" 

  tags = {
    Name = "personal_website_igw"
  }
}

resource "aws_route_table" "public_rt" {
  vpc_id = "vpc-0e2ef785fe899db22" 

  tags = {
    Name = "public-rt"
  }
}
/*
resource "aws_route" "public_route" {
  route_table_id         = aws_route_table.public_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.personal_website_igw.id
}
*/
resource "aws_vpc" "personal-website-vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "personal-website-vpc"
  }
}