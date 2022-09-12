resource "digitalocean_custom_image" "chr_img" {
  name   = "tf-chr-${var.chr_ver}.vdi"
  url = "https://download.mikrotik.com/routeros/${var.chr_ver}/chr-${var.chr_ver}.vdi"
  regions = [var.do_region]
}

resource "digitalocean_vpc" "vpc" {
  name   = "${var.drplt_name}-vpc"
  region = var.do_region
  ip_range = var.vpc_cidr
}

resource "digitalocean_droplet" "chr-do" {
  image = digitalocean_custom_image.chr_img.id
  name = "${var.drplt_name}-${var.do_region}"
  region = var.do_region
  size = var.drplt_size
  vpc_uuid = digitalocean_vpc.vpc.id
  ssh_keys = [data.digitalocean_ssh_key.terraform.id]
}
