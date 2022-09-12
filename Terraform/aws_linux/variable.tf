variable "pvt_key" {
  description = "SSH private key to access EC2"
  type        = string
  default     = "~/.ssh/id_ed25519"
}
variable "ec2_name" {
  description = "Name of the AWS EC2"
  type        = string
  default     = "linux-aws"
}
variable "instance_type" {
  description = "CPU and RAM of the AWS EC2"
  type        = string
  default     = "t2.micro"
}
variable "ami_image" {
  description = "AMI images id Ubuntu 20.04 (eu-west-1)"
  type        = string
  default     = "ami-0e88bd5a70756fd88"
}
variable "def_user" {
  description = "Default username of Ubuntu 20.04"
  type        = string
  default     = "ubuntu"
}
variable "ec2_count" {
  description = "Count of the AWS EC2"
  type        = number
  default     = 1
}
variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "eu-west-1"
}
variable "aws_prv_subnet" {
  description = "AWS private subnet"
  type        = string
  default     = "172.16.16.0/25"
}
variable "aws_vpc_subnet" {
  description = "AWS VPC subnet"
  type        = string
  default     = "172.16.16.0/24"
}
variable "availability_zones" {
  description = "Availability zones"
  type        = string
  default     = "eu-west-1a"
}
