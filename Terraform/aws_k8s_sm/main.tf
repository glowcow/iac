resource "aws_key_pair" "tf-k8s-sm" {
  key_name   = "tf-k8s-sm"
  public_key = file("~/.ssh/id_ed25519.pub")
}

#resource "aws_ebs_volume" "ebs_volume_master" {
#  count             = var.master_ec2_count
#  availability_zone = var.availability_zones
#  size              = var.ebs_size
#  tags = {
#      Name = "ebs-master${count.index}",
#    }
#}

resource "aws_ebs_volume" "ebs_volume_worker" {
  count             = var.worker_ec2_count
  availability_zone = var.availability_zones
  size              = var.ebs_size
  tags = {
      Name = "ebs-worker${count.index}",
    }
}

#resource "aws_volume_attachment" "volume_attachement_master" {
#  count       = var.master_ec2_count
#  volume_id   = "${aws_ebs_volume.ebs_volume_master.*.id[count.index]}"
#  device_name = "/dev/sdf"
#  instance_id = "${element(aws_instance.k8s-master-aws.*.id, count.index)}"
#}

resource "aws_volume_attachment" "volume_attachement_worker" {
  count       = var.worker_ec2_count
  volume_id   = "${aws_ebs_volume.ebs_volume_worker.*.id[count.index]}"
  device_name = "/dev/sdf"
  instance_id = "${element(aws_instance.k8s-worker-aws.*.id, count.index)}"
}

resource "aws_instance" "k8s-master-aws" {
  count = var.master_ec2_count
  ami = var.ami_image
  instance_type = var.master_instance_type
  associate_public_ip_address = true
  subnet_id = aws_subnet.master_sub.id
  private_ip = var.master_priv_ip
  key_name = aws_key_pair.tf-k8s-sm.key_name
  vpc_security_group_ids = [aws_security_group.k8s-master-sg.id]
  tags = {
      Name = "${var.ec2_name}-master${count.index}",
    }
  connection {
      type        = "ssh"
      host        = self.public_ip
      user        = var.def_user
      private_key = file(var.pvt_key)
      timeout     = "1m"
   }
  provisioner "file" {
    source      = "~/.ssh/id_ed25519"
    destination = ".ssh/id_ed25519"
  }
  provisioner "remote-exec" {
    inline = [
      "sudo cp .ssh/id_ed25519 /root/.ssh/id_ed25519",
      "chmod 600 .ssh/id_ed25519",
      "sudo chmod 600 /root/.ssh/id_ed25519",
    ]
  }
  provisioner "local-exec" {
    command = <<EOT
      curl -X PUT "https://api.godaddy.com/v1/domains/glowcow.xyz/records/A/*.k8s" \
        -H "accept: application/json" \
        -H "Content-Type: application/json" \
        -H "Authorization: sso-key ${var.gd_sso}" \
        -d '[{"data":"${self.public_ip}","port":1,"priority":1,"protocol":"string","service":"string","ttl":600,"weight":1}]'
      EOT
    sensitive = true
  }
}

resource "aws_instance" "k8s-worker-aws" {
  count = var.worker_ec2_count
  ami = var.ami_image
  instance_type = var.worker_instance_type
  associate_public_ip_address = false
  subnet_id = aws_subnet.worker_sub.id
  key_name = aws_key_pair.tf-k8s-sm.key_name
  vpc_security_group_ids = [aws_security_group.k8s-worker-sg.id]
  tags = {
      Name = "${var.ec2_name}-worker${count.index}",
    }
  connection {
      type        = "ssh"
      bastion_host = aws_instance.k8s-master-aws.0.public_ip
      host        = self.private_ip
      user        = var.def_user
      private_key = file(var.pvt_key)
      timeout     = "1m"
   }
  provisioner "file" {
    source      = "~/.ssh/id_ed25519"
    destination = ".ssh/id_ed25519"
  }
  provisioner "remote-exec" {
    inline = [
      "sudo cp .ssh/id_ed25519 /root/.ssh/id_ed25519",
      "chmod 600 .ssh/id_ed25519",
      "sudo chmod 600 /root/.ssh/id_ed25519",
    ]
  }
}