variable "do_token" {
  description = "Token to access DO API"
  type        = string
}
variable "cluster_name" {
  description = "Name of the DO k8s cluster"
  type        = string
  default     = "k8s-do"
}
variable "cluster_node_size" {
  description = "CPU and RAM of the DO k8s cluster worker"
  type        = string
  default     = "s-2vcpu-2gb"
}
variable "cluster_version" {
  description = "version slug of the DO k8s cluster"
  type        = string
  default     = "1.23.10-do.0"
}
variable "cluster_node_count_max" {
  description = "Max node count of the DO k8s cluster"
  type        = number
  default     = 4
}
variable "vpc_cidr" {
  description = "VPC network of the DO k8s cluster"
  type        = string
  default     = "10.10.10.0/24"
}
variable "do_region" {
  description = "DO region"
  type        = string
  default     = "fra1"
}
