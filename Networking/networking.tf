resource "aws_vpc" "vpc" {
  cidr_block = var.cidr_block_vpc
  tags = {
    Name = "${terraform.workspace}-VPC"
  }
}

resource "aws_subnet" "subnet-private-1" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.cidr-block-subnet-private-1
  availability_zone       = var.az-subnet-private-1
  map_public_ip_on_launch = var.public-ip-on-launch-subnet-private-1
  tags = {
    Name = "${terraform.workspace}-Subnet-Private-1"
  }
}

resource "aws_subnet" "subnet-private-2" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.cidr-block-subnet-private-2
  availability_zone       = var.az-subnet-private-2
  map_public_ip_on_launch = var.public-ip-on-launch-subnet-private-2
  tags = {
    Name = "${terraform.workspace}-Subnet-Private-2"
  }
}

resource "aws_subnet" "public-1" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.cidr-block-subnet-public-1
  availability_zone = var.az-subnet-public-1
  map_public_ip_on_launch =var.public-ip-on-launch-subnet-public-1
  tags = {
    Name = "${terraform.workspace}-Subnet-Public-1"
  }
}

resource "aws_subnet" "public-2" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.cidr-block-subnet-public-2
  availability_zone = var.az-subnet-public-2
  map_public_ip_on_launch = var.public-ip-on-launch-subnet-public-2
  tags = {
    Name = "${terraform.workspace}-Subnet-Public-2"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${terraform.workspace}-Internet_Gateway"
  }
}

resource "aws_route_table" "route_table" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = var.route_table_cidr_block
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "${terraform.workspace}-Route-Table"
  }
}  

resource "aws_route_table_association" "PublicSubnet1" {
  subnet_id      = aws_subnet.public-1.id
  route_table_id = aws_route_table.route_table.id
}

resource "aws_route_table_association" "PublicSubnet2" {
  subnet_id      = aws_subnet.public-2.id
  route_table_id = aws_route_table.route_table.id
}

resource "aws_default_route_table" "default-raute-table" {
  default_route_table_id = aws_route_table.route_table.id

  route {
    cidr_block = var.route_table_cidr_block
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "${terraform.workspace}-RTInternetgw"
  }
}

resource "aws_eip" "lb-1" {
  domain   = "vpc"
}

resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.lb-1.allocation_id
  subnet_id     = aws_subnet.public-1.id
  # connectivity_type = "private"
  tags = {
    Name = "NAT"
  }
  depends_on = [aws_internet_gateway.gw] 
}

resource "aws_route_table" "route_table_for_NAT" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = var.route_table_cidr_block
    nat_gateway_id = aws_nat_gateway.nat_gateway.id
  }

  tags = {
    Name = "${terraform.workspace}-RTforNAT"
  }
}  

resource "aws_route_table_association" "PrivateSubnet1" {
  subnet_id      = aws_subnet.subnet-private-1.id
  route_table_id = aws_route_table.route_table_for_NAT.id
}

resource "aws_route_table_association" "PrivateSubnet2" {
  subnet_id      = aws_subnet.subnet-private-2.id
  route_table_id = aws_route_table.route_table_for_NAT.id
}

resource "aws_default_route_table" "default-raute-table_for_NAT" {
  default_route_table_id = aws_route_table.route_table_for_NAT.id

  route {
    cidr_block = var.route_table_cidr_block
    nat_gateway_id = aws_nat_gateway.nat_gateway.id
  }

  tags = {
    Name = "${terraform.workspace}-RTforNAT"
  }
}




