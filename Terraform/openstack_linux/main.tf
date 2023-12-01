resource "openstack_compute_keypair_v2" "key_tf" {
  name       = "key_tf"
  region     = var.region
  public_key = file(var.public_key)
}

data "openstack_images_image_v2" "image" {
  most_recent = true
  visibility  = "public"
  name        = var.image_name
}

resource "random_string" "random_name_server" {
  length  = 16
  special = false
}

resource "openstack_compute_flavor_v2" "flavor_server" {
  name      = "${var.region}_server-${random_string.random_name_server.result}"
  ram       = var.mem_size
  vcpus     = var.cpu_count
  disk      = "0"
  is_public = "false"
}

resource "openstack_blockstorage_volume_v3" "volume_server" {
  name                 = "volume-${openstack_compute_flavor_v2.flavor_server.name}"
  size                 = var.hdd_size
  image_id             = data.openstack_images_image_v2.image.id
  volume_type          = var.volume_type
  availability_zone    = var.az_zone
  enable_online_resize = true
  lifecycle {
    ignore_changes = [image_id]
  }
}

resource "openstack_compute_instance_v2" "server_tf" {
  name              = "${var.region}_server_tf"
  flavor_id         = openstack_compute_flavor_v2.flavor_server.id
  key_pair          = openstack_compute_keypair_v2.key_tf.id
  availability_zone = var.az_zone
  network {
    uuid = openstack_networking_network_v2.network_tf.id
  }
  block_device {
    uuid             = openstack_blockstorage_volume_v3.volume_server.id
    source_type      = "volume"
    destination_type = "volume"
    boot_index       = 0
  }
  vendor_options {
    ignore_resize_confirmation = true
  }
  lifecycle {
    ignore_changes = [image_id]
  }
}