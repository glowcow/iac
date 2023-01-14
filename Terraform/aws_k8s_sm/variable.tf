variable "pvt_key" {
  description = "SSH private key to access EC2"
  type        = string
  default     = "~/.ssh/id_ed25519"
  sensitive   = true
}
variable "gd_sso" {
  description = "GoDaddy API key & secret"
  type        = string
  sensitive   = true
}
variable "ec2_name" {
  description = "Name of the AWS EC2"
  type        = string
  default     = "k8s-aws"
}
variable "master_instance_type" {
  description = "CPU and RAM of the AWS EC2"
  type        = string
  default     = "t2.medium"
}
variable "worker_instance_type" {
  description = "CPU and RAM of the AWS EC2"
  type        = string
  default     = "t2.medium"
}
variable "ami_image" {
  description = "AMI images id Ubuntu 22.04 (eu-west-1)"
  type        = string
  default     = "ami-026e72e4e468afa7b"
}
variable "def_user" {
  description = "Default username of Ubuntu 20.04"
  type        = string
  default     = "ubuntu"
}
variable "worker_ec2_count" {
  description = "Count of the AWS EC2"
  type        = number
  default     = 2
}
variable "master_ec2_count" {
  description = "Count of the AWS EC2"
  type        = number
  default     = 1
}
variable "ebs_size" {
  description = "Size in Gb of the AWS EBS Volume"
  type        = number
  default     = 5
}
variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "eu-west-1"
}
variable "aws_prv_subnet" {
  description = "AWS private subnet"
  type        = string
  default     = "172.16.17.0/24"
}
variable "aws_pub_subnet" {
  description = "AWS public subnet"
  type        = string
  default     = "172.16.16.0/24"
}
variable "aws_vpc_subnet" {
  description = "AWS VPC subnet"
  type        = string
  default     = "172.16.16.0/20"
}
variable "master_priv_ip" {
  description = "Master node private ip"
  type        = string
  default     = "172.16.16.111"
}
variable "availability_zones" {
  description = "Availability zones"
  type        = string
  default     = "eu-west-1a"
}
