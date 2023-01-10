variable "pvt_key" {
  description = "SSH private key to access VM"
  type        = string
  default     = "~/.ssh/id_ed25519"
}
variable "def_user" {
  description = "Default username of Ubuntu 22.04"
  type        = string
  default     = "asediuk"
}
variable "pve_node" {
  type = string
  default     = "pi"
}
variable "pve_tmp" {
  type = string
  default     = "ubuntu-22.04"
}
variable "pve_vm_ip" {
  type = list
  default     = ["10.1.1.101/25", "10.1.1.102/25"]
}
variable "vm_count" {
  type        = number
  default     = 2
}
variable "cores_count" {
  type        = number
  default     = 1
}
variable "mem_count" {
  type        = number
  default     = 2048
}
variable "proxmox_api_url" {
  type = string
}
variable "proxmox_api_token_id" {
  type = string
}
variable "proxmox_api_token_secret" {
  type = string
}