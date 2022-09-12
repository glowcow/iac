variable "do_token" {
  description = "Token to access DO API"
  type        = string
}
variable "pvt_key" {
  description = "SSH private key to access droplet"
  type        = string
  default     = "~/.ssh/id_ed25519"
}
variable "drplt_name" {
  description = "Name of the DO droplet"
  type        = string
  default     = "linux-do"
}
variable "drplt_size" {
  description = "CPU and RAM of the DO droplet"
  type        = string
  default     = "s-1vcpu-1gb"
}
variable "drplt_image" {
  description = "images slug of the DO droplet"
  type        = string
  default     = "ubuntu-20-04-x64"
}
variable "def_user" {
  description = "Default username of Ubuntu 20.04"
  type        = string
  default     = "root"
}
variable "vpc_cidr" {
  description = "VPC network"
  type        = string
  default     = "10.10.10.0/24"
}
variable "drplt_count" {
  description = "images count of the DO droplet"
  type        = number
  default     = 1
}
variable "do_region" {
  description = "DO region"
  type        = string
  default     = "fra1"
}

