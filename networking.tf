resource "aws_vpc" "animals_vpc" {
  cidr_block           = "172.20.0.0/16"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  tags = {
    Name      = "Animals VPC"
    Terraform = "True"
  }
}

resource "aws_subnet" "animals_subnet_a" {
  vpc_id                  = aws_vpc.animals_vpc.id
  cidr_block              = "172.20.10.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = "true"
  tags = {
    Name      = "Animals_Subnet_A"
    Terraform = "True"
  }
}

resource "aws_subnet" "animals_subnet_b" {
  vpc_id                  = aws_vpc.animals_vpc.id
  cidr_block              = "172.20.20.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = "true"
  tags = {
    Name      = "Animals_Subnet_B"
    Terraform = "True"
  }
}

resource "aws_internet_gateway" "animals_internet_gateway" {
  vpc_id = aws_vpc.animals_vpc.id
  tags = {
    Name      = "Animals_Internet_Gateway"
    Terraform = "True"
  }
}

resource "aws_default_route_table" "animals_defaultroutetable" {
  default_route_table_id = aws_vpc.animals_vpc.default_route_table_id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.animals_internet_gateway.id
  }

  tags = {
    Name      = "Animals_Route_Table"
    Terraform = "True"
  }
} 