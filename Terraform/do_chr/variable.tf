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
  default     = "chr-do"
}
variable "drplt_size" {
  description = "CPU and RAM of the DO droplet"
  type        = string
  default     = "s-1vcpu-512mb-10gb"
}
variable "chr_ver" {
  description = "Image version of mikrotik CHR"
  type        = string
  default     = "6.48.6"
}
variable "vpc_cidr" {
  description = "VPC network"
  type        = string
  default     = "10.10.10.0/28"
}
variable "do_region" {
  description = "DO region"
  type        = string
  default     = "fra1"
}

