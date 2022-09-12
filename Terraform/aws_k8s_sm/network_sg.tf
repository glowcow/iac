resource "aws_vpc" "tf-main" {
  cidr_block = var.aws_vpc_subnet
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "${var.ec2_name}-${var.aws_region}-vpc"
  }
}

resource "aws_internet_gateway" "tf-gw" {
  vpc_id = aws_vpc.tf-main.id
  tags = {
    Name = "${var.ec2_name}-${var.aws_region}-gw"
  }
}

resource "aws_route_table" "tf_rt" {
  vpc_id = aws_vpc.tf-main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.tf-gw.id
  }
}

resource "aws_main_route_table_association" "rta" {
  vpc_id         = aws_vpc.tf-main.id
  route_table_id = aws_route_table.tf_rt.id
}

resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.tf-main.id
  cidr_block              = var.aws_vpc_subnet
  availability_zone       = var.availability_zones
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.ec2_name}-${var.aws_region}-subnet"
  }
}

resource "aws_security_group" "k8s-master-sg" {
  vpc_id = aws_vpc.tf-main.id
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
    from_port   = 31080
    to_port     = 31080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = [aws_subnet.public.cidr_block]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "k8s-worker-sg" {
  vpc_id = aws_vpc.tf-main.id
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
    cidr_blocks = [aws_subnet.public.cidr_block]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
}