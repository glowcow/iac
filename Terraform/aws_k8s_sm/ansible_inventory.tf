 resource "local_file" "ansible_inventory" {
  content = templatefile("ansible_inventory.tftpl",
    {
     host_master = [for i in aws_instance.k8s-master-aws.*.tags : i.Name],
     addr_master = aws_instance.k8s-master-aws.*.public_ip,
     host_worker = [for i in aws_instance.k8s-worker-aws.*.tags : i.Name],
     addr_worker = aws_instance.k8s-worker-aws.*.public_ip,
     user = var.def_user
     bastion = aws_instance.k8s-master-aws.0.public_ip
    }
  )
  filename = "../../Ansible/inventory.ini"
}