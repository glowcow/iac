variable "public_key" {
  description = "OpenStack provider public key"
  type = string
  default     = "~/.ssh/id_ed25519.pub"
  sensitive   = true
}
variable "gd_sso" {
  description = "GoDaddy API key & secret"
  type        = string
  sensitive   = true
}
variable "region" {
  description = "OpenStack provider region"
  type = string
  default = "ru-7"
}
variable "az_zone" {
  description = "OpenStack provider API path"
  type = string
  default = "ru-7a"
}
variable "volume_type" {
  description = "OpenStack provider volume type"
  type = string
  default = "fast.ru-7a"
}
variable "chr_ver" {
  description = "Image version of mikrotik CHR"
  type        = string
  default     = "7.12.1"
}
variable "hdd_size" {
  description = "OpenStack provider block storage volume size"
  type = string
  default = "1"
}
variable "cpu_count" {
  description = "OpenStack provider vCPU count"
  type = string
  default = "1"
}
variable "mem_size" {
  description = "OpenStack provider memory size"
  type = string
  default = "1024"
}
variable "subnet_cidr" {
  description = "OpenStack provider CIDR"
  type = string
  default = "10.10.10.0/25"
}
variable "os_api" {
  description = "OpenStack provider API path"
  type = string
  default = "https://api.selvpc.ru/identity/v3"
}
variable "os_domain_name" {
  description = "OpenStack provider account ID"
  type = string
  default = "215780"
}
variable "os_project_id" {
  description = "OpenStack provider project ID"
  type = string
}
variable "os_user_name" {
  description = "OpenStack provider username"
  type = string
  default = "tf_user"
}
variable "os_user_password" {
  description = "OpenStack provider password"
  type = string
}
variable "st_api_token" {
  description = "OpenStack provider password"
  type = string
}