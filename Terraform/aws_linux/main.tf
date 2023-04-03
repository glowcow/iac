resource "aws_key_pair" "tf-linux" {
  key_name   = "tf-linux"
  public_key = file("~/.ssh/id_ed25519.pub")
}

resource "aws_instance" "linux-aws" {
  count = var.ec2_count
  ami = var.ami_image
  instance_type = var.instance_type
  associate_public_ip_address = true
  subnet_id = aws_subnet.private.id
  key_name = aws_key_pair.tf-linux.key_name
  vpc_security_group_ids = [aws_security_group.linux-sg.id]
  root_block_device {
    volume_size = var.root_block_size
    volume_type = var.root_block_type
  }
  tags = {
      Name = "${var.ec2_name}-${var.aws_region}-n${count.index}"
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
