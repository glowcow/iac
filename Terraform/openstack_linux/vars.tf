variable "public_key" {
  description = "OpenStack provider public key"
  type = string
  default = "~/key/do_key.pub"
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
  description = "OpenStack provider volume size"
  type = string
  default = "5"
}
variable "image_name" {
  description = "OpenStack provider image name"
  type = string
  default = "Debian 11 (Bullseye) 64-bit"
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
variable "domain_name" {
  description = "OpenStack provider account ID"
  type = string
}
variable "project_id" {
  description = "OpenStack provider project ID"
  type = string
}
variable "user_name" {
  description = "OpenStack provider username"
  type = string
}
variable "user_password" {
  description = "OpenStack provider password"
  type = string
}