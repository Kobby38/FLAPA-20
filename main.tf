#creating networking for project
resource "aws_vpc" "Prod-rock-VPC" {
  cidr_block       = var.cidr-for-Prod-rock-vpc
  instance_tenancy = "default"
  enable_dns_hostnames = true
  enable_dns_support = true
  tags = {
    Name = "Prod-rock-VPC"
  }
}

#public subnet
resource "aws_subnet" "Test-public-sub1" {
  vpc_id     = aws_vpc.Prod-rock-VPC.id
  cidr_block = var.cidr-for-test-public-sub1
  availability_zone = var.Availability-Zone1
  tags = {
    Name = "Test-public-sub1"
  }
}

resource "aws_subnet" "Test-public-sub2" {
  vpc_id     = aws_vpc.Prod-rock-VPC.id
  cidr_block = var.cidr-for-test-public-sub2
  availability_zone = var.Availability-Zone2
  tags = {
    Name = "prod-pub-sub2"
  }
}

#private subnet
resource "aws_subnet" "Test-priv-sub1" {
  vpc_id     = aws_vpc.Prod-rock-VPC.id
  cidr_block = var.cidr-for-test-priv-sub1
  availability_zone = var.Availability-Zone3
    tags = {
    Name = "Test-priv-sub1"
  }
}

resource "aws_subnet" "Test-priv-sub2" {
  vpc_id     = aws_vpc.Prod-rock-VPC.id
  cidr_block = var.cidr-for-test-priv-sub2
  availability_zone = var.Availability-Zone4
  tags = {
    Name = "Test-priv-sub2"
  }
}

# route table
resource "aws_route_table" "Test-pub-route-table" {
  vpc_id = aws_vpc.Prod-rock-VPC.id

  tags = {
    Name = "Test-pub-route-table"
  }
}

resource "aws_route_table" "Test-priv-route-table" {
  vpc_id = aws_vpc.Prod-rock-VPC.id

  tags = {
    Name = "Test-priv-route-table"
  }
}

# route association public
resource "aws_route_table_association" "public-route-table-association-1" {
  subnet_id      = aws_subnet.Test-public-sub1.id
  route_table_id = aws_route_table.Test-pub-route-table.id
}

resource "aws_route_table_association" "public-route-table-association-2" {
  subnet_id      = aws_subnet.Test-public-sub2.id
  route_table_id = aws_route_table.Test-pub-route-table.id
  }

# route association private
resource "aws_route_table_association" "private-route-table-association-1" {
  subnet_id      = aws_subnet.Test-priv-sub1.id
  route_table_id = aws_route_table.Test-priv-route-table.id
}

resource "aws_route_table_association" "private-route-table-association-2" {
  subnet_id      = aws_subnet.Test-priv-sub2.id
  route_table_id = aws_route_table.Test-priv-route-table.id
}

# internet gateway

resource "aws_internet_gateway" "Test-igw" {
  vpc_id = aws_vpc.Prod-rock-VPC.id

  tags = {
    Name = "Test-igw"
  }
}

# aws route
resource "aws_route" "Test-igw-association" {
  route_table_id            = aws_route_table.Test-pub-route-table.id
  gateway_id                = aws_internet_gateway.Test-igw.id  
  destination_cidr_block    = var.internet-gateway-association
  }

# Nat Gateway for internet through the public subnet

resource "aws_eip" "EIP_for_NG" {
  vpc                       = true
  associate_with_private_ip = var.elastic-ip
  }

  resource "aws_nat_gateway" "Test-Nat-gateway" {
  allocation_id = aws_eip.EIP_for_NG.id
  subnet_id     = aws_subnet.Test-public-sub1.id
 }

 # Route NAT Gateway with private Route table
resource "aws_route" "Test-nat-association" {
  route_table_id         = aws_route_table.Test-priv-route-table.id
  nat_gateway_id         = aws_nat_gateway.Test-Nat-gateway.id
  destination_cidr_block = var.nat-gateway-destination-cidr-block
}