resource "aws_vpc" "vpc-k8s" {
  cidr_block = var.aws_vpc_subnet
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "k8s-${var.aws_region}-vpc-k8s"
  }
}

resource "aws_eip" "nat-gw-eip" {
  vpc = true
}

resource "aws_nat_gateway" "nat-gw" {
  allocation_id = aws_eip.nat-gw-eip.id
  subnet_id     = aws_subnet.master_sub.id
  depends_on = [aws_internet_gateway.main-gw]
}

resource "aws_internet_gateway" "main-gw" {
  vpc_id = aws_vpc.vpc-k8s.id
  tags = {
    Name = "k8s-${var.aws_region}-gw"
  }
}

resource "aws_route_table" "master_rt" {
  vpc_id = aws_vpc.vpc-k8s.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main-gw.id
  }
}

resource "aws_route_table" "worker_rt" {
  vpc_id = aws_vpc.vpc-k8s.id
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat-gw.id
  }
}

resource "aws_route_table_association" "master-public" {
  subnet_id = aws_subnet.master_sub.id
  route_table_id = aws_route_table.master_rt.id
}

resource "aws_route_table_association" "worker-private" {
  subnet_id = aws_subnet.worker_sub.id
  route_table_id = aws_route_table.worker_rt.id
}

resource "aws_subnet" "master_sub" {
  vpc_id                  = aws_vpc.vpc-k8s.id
  cidr_block              = var.aws_pub_subnet
  availability_zone       = var.availability_zones
  map_public_ip_on_launch = true
  tags = {
    Name = "k8s-${var.aws_region}-subnet-public"
  }
}

resource "aws_subnet" "worker_sub" {
  vpc_id                  = aws_vpc.vpc-k8s.id
  cidr_block              = var.aws_prv_subnet
  availability_zone       = var.availability_zones
  map_public_ip_on_launch = false
  tags = {
    Name = "k8s-${var.aws_region}-subnet-private"
  }
}


resource "aws_security_group" "k8s-master-sg" {
  vpc_id = aws_vpc.vpc-k8s.id
  name = "tf-k8s-master-sg"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = [aws_subnet.worker_sub.cidr_block]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "k8s-worker-sg" {
  vpc_id = aws_vpc.vpc-k8s.id
  name = "tf-k8s-worker-sg"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = [aws_subnet.master_sub.cidr_block]
  }
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = [aws_subnet.worker_sub.cidr_block]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
}