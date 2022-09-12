output "arn_id" {
  description = "IDs of EC2"
  value       = join(", ", aws_instance.chr-aws.*.arn)
}

output "image" {
  description = "images of EC2"
  value       = join(", ", aws_instance.chr-aws.*.ami)
}

output "ipv4_address" {
  description = "public IPv4 addresses assigned to the EC2"
  value       = join(", ", aws_instance.chr-aws.*.public_ip)
}

output "pub_dns" {
  description = "public dns assigned to the EC2"
  value       = join(", ", aws_instance.chr-aws.*.public_dns)
}

output "ipv4_address_private" {
  description = "private IPv4 addresses assigned to the EC2, if applicable"
  value       = join(", ", aws_instance.chr-aws.*.private_ip)
}

output "name" {
  description = "names of EC2"
  value       = join(", ", [for i in aws_instance.chr-aws.*.tags : i.Name])
}

output "region" {
  description = "regions of EC2"
  value       = var.aws_region
}

output "size" {
  description = "sizes of EC2"
  value       = var.instance_type
}