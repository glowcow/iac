output "arn_id" {
  description = "IDs of EC2"
  value       = join(", ", aws_instance.k8s-master-aws.*.arn)
}
output "image" {
  description = "images of EC2"
  value       = join(", ", aws_instance.k8s-master-aws.*.ami)
}
#output "bastion_ipv4_address_public" {
#  description = "Ansible bastion public IPv4"
#  value       = aws_instance.k8s-master-aws.0.public_ip
#}
output "ingress_dns_name" {
  description = "Ingress DNS name"
  value       = aws_instance.k8s-master-aws.0.public_dns
}
output "master_ipv4_address_public" {
  description = "public IPv4 addresses assigned to the EC2"
  value       = join(", ", aws_instance.k8s-master-aws.*.public_ip)
}
output "master_ipv4_address_private" {
  description = "private IPv4 addresses assigned to the EC2, if applicable"
  value       = join(", ", aws_instance.k8s-master-aws.*.private_ip)
}
output "worker_ipv4_address_public" {
  description = "public IPv4 addresses assigned to the EC2, if applicable"
  value       = join(", ", aws_instance.k8s-worker-aws.*.public_ip)
}
output "worker_ipv4_address_private" {
  description = "private IPv4 addresses assigned to the EC2, if applicable"
  value       = join(", ", aws_instance.k8s-worker-aws.*.private_ip)
}
output "etcd_ipv4_address_public" {
  description = "public IPv4 addresses assigned to the EC2, if applicable"
  value       = join(", ", aws_instance.k8s-etcd-aws.*.public_ip)
}
output "etcd_ipv4_address_private" {
  description = "private IPv4 addresses assigned to the EC2, if applicable"
  value       = join(", ", aws_instance.k8s-etcd-aws.*.private_ip)
}
output "haproxy_ipv4_address_public" {
  description = "public IPv4 addresses assigned to the EC2, if applicable"
  value       = join(", ", aws_instance.k8s-hap-aws.*.public_ip)
}
output "haproxy_ipv4_address_private" {
  description = "private IPv4 addresses assigned to the EC2, if applicable"
  value       = join(", ", aws_instance.k8s-hap-aws.*.private_ip)
}
output "region" {
  description = "regions of EC2"
  value       = var.aws_region
}
output "master_type" {
  description = "type of master EC2"
  value       = var.master_instance_type
}
output "worker_type" {
  description = "type of worker EC2"
  value       = var.worker_instance_type
}
output "etcd_type" {
  description = "type of master EC2"
  value       = var.etcd_instance_type
}
output "haproxy_type" {
  description = "type of worker EC2"
  value       = var.hap_instance_type
}