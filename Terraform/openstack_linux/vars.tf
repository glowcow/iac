variable "public_key" {
  description = "OpenStack provider public key"
  type = string
  default     = "~/.ssh/id_ed25519.pub"
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
variable "hdd_size" {
  description = "OpenStack provider block storage volume size"
  type = string
  default = "10"
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
variable "image_name" {
  description = "OpenStack provider image name"
  type = string
  default = "Ubuntu 22.04 LTS 64-bit"
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