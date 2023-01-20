 resource "local_file" "ansible_inventory" {
  content = templatefile("ansible_inventory.tftpl",
    {
     host_hap = [for i in aws_instance.k8s-hap-aws.*.tags : i.Name],
     addr_hap = aws_instance.k8s-hap-aws.*.public_ip,
     host_master = [for i in aws_instance.k8s-master-aws.*.tags : i.Name],
     addr_master = aws_instance.k8s-master-aws.*.private_ip,
     host_etcd = [for i in aws_instance.k8s-etcd-aws.*.tags : i.Name],
     addr_etcd = aws_instance.k8s-etcd-aws.*.private_ip,
     host_worker = [for i in aws_instance.k8s-worker-aws.*.tags : i.Name],
     addr_worker = aws_instance.k8s-worker-aws.*.private_ip,
     user = var.def_user
     bastion = aws_instance.k8s-hap-aws.0.public_ip
    }
  )
  filename = "../../Ansible/inventory.ini"
}