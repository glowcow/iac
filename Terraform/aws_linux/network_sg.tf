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


resource "aws_subnet" "private" {
  vpc_id                  = aws_vpc.tf-main.id
  cidr_block              = var.aws_prv_subnet
  availability_zone       = var.availability_zones
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.ec2_name}-${var.aws_region}-subnet"
  }
}

resource "aws_security_group" "linux-sg" {
  vpc_id = aws_vpc.tf-main.id
  name = "tf-linux-sg"
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
    cidr_blocks = [aws_subnet.private.cidr_block]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
}
