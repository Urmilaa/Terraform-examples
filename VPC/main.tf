## main.tf

This file creates all networking resources required for the VPC.

```hcl
#----------------------------------------
# VPC
#----------------------------------------

resource "aws_vpc" "main" {

  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "Terraform-VPC"
  }
}

#----------------------------------------
# Internet Gateway
#----------------------------------------

resource "aws_internet_gateway" "igw" {

  vpc_id = aws_vpc.main.id

  tags = {
    Name = "Terraform-IGW"
  }
}

#----------------------------------------
# Public Subnet 1
#----------------------------------------

resource "aws_subnet" "public1" {

  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet1
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "Public-Subnet-1"
  }
}

#----------------------------------------
# Public Subnet 2
#----------------------------------------

resource "aws_subnet" "public2" {

  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet2
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "Public-Subnet-2"
  }
}

#----------------------------------------
# Private Subnet 1
#----------------------------------------

resource "aws_subnet" "private1" {

  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnet1
  availability_zone = "us-east-1a"

  tags = {
    Name = "Private-Subnet-1"
  }
}

#----------------------------------------
# Private Subnet 2
#----------------------------------------

resource "aws_subnet" "private2" {

  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnet2
  availability_zone = "us-east-1b"

  tags = {
    Name = "Private-Subnet-2"
  }
}

#----------------------------------------
# Elastic IP
#----------------------------------------

resource "aws_eip" "nat" {

  domain = "vpc"

  tags = {
    Name = "NAT-EIP"
  }
}

#----------------------------------------
# NAT Gateway
#----------------------------------------

resource "aws_nat_gateway" "nat" {

  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public1.id

  depends_on = [
    aws_internet_gateway.igw
  ]

  tags = {
    Name = "Terraform-NAT"
  }
}

#----------------------------------------
# Public Route Table
#----------------------------------------

resource "aws_route_table" "public" {

  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "Public-RT"
  }
}

#----------------------------------------
# Public Route Table Associations
#----------------------------------------

resource "aws_route_table_association" "public1" {

  subnet_id      = aws_subnet.public1.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public2" {

  subnet_id      = aws_subnet.public2.id
  route_table_id = aws_route_table.public.id
}

#----------------------------------------
# Private Route Table
#----------------------------------------

resource "aws_route_table" "private" {

  vpc_id = aws_vpc.main.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat.id
  }

  tags = {
    Name = "Private-RT"
  }
}

#----------------------------------------
# Private Route Table Associations
#----------------------------------------

resource "aws_route_table_association" "private1" {

  subnet_id      = aws_subnet.private1.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private2" {

  subnet_id      = aws_subnet.private2.id
  route_table_id = aws_route_table.private.id
}
```
