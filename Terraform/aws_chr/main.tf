resource "aws_key_pair" "tf-chr" {
  key_name   = "tf-chr"
  public_key = file("~/.ssh/id_ed25519.pub")
}

resource "aws_instance" "chr-aws" {
  count = var.ec2_count
  ami = var.ami_image
  instance_type = var.instance_type
  associate_public_ip_address = true
  subnet_id = aws_subnet.private.id
  key_name = aws_key_pair.tf-chr.key_name
  vpc_security_group_ids = [aws_security_group.chr-sg.id]
  tags = {
      Name = "${var.ec2_name}-${var.aws_region}-n${count.index}"
    }
}
