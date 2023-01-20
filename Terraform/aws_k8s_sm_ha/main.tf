resource "aws_key_pair" "tf-k8s-sm" {
  key_name   = "tf-k8s-sm"
  public_key = file("~/.ssh/id_ed25519.pub")
}

resource "aws_instance" "k8s-master-aws" {
  count = var.master_ec2_count
  ami = var.ami_image
  instance_type = var.master_instance_type
  associate_public_ip_address = true
  subnet_id = aws_subnet.public_sub.id
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
}

resource "aws_instance" "k8s-worker-aws" {
  count = var.worker_ec2_count
  ami = var.ami_image
  instance_type = var.worker_instance_type
  associate_public_ip_address = true
  subnet_id = aws_subnet.public_sub.id
  key_name = aws_key_pair.tf-k8s-sm.key_name
  vpc_security_group_ids = [aws_security_group.k8s-worker-sg.id]
  tags = {
      Name = "${var.ec2_name}-worker${count.index}",
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
}

resource "aws_instance" "k8s-etcd-aws" {
  count = var.etcd_ec2_count
  ami = var.ami_image
  instance_type = var.etcd_instance_type
  associate_public_ip_address = true
  subnet_id = aws_subnet.public_sub.id
  key_name = aws_key_pair.tf-k8s-sm.key_name
  vpc_security_group_ids = [aws_security_group.k8s-etcd-sg.id]
  tags = {
      Name = "${var.ec2_name}-etcd${count.index}",
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
}

resource "aws_instance" "k8s-hap-aws" {
  count = var.hap_ec2_count
  ami = var.ami_image
  instance_type = var.hap_instance_type
  associate_public_ip_address = true
  subnet_id = aws_subnet.public_sub.id
  key_name = aws_key_pair.tf-k8s-sm.key_name
  vpc_security_group_ids = [aws_security_group.k8s-hap-sg.id]
  tags = {
      Name = "${var.ec2_name}-haproxy${count.index}",
    }
  connection {
      type        = "ssh"
      host        = self.public_ip
      user        = var.def_user
      private_key = file(var.pvt_key)
      timeout     = "2m"
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