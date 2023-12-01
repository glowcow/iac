output "server_floating_ip" {
  value = openstack_networking_floatingip_v2.fip_tf.address
}
output "server_int_ip" {
  value = openstack_compute_instance_v2.server_tf.access_ip_v4
}
output "server_name" {
  value = openstack_compute_instance_v2.server_tf.flavor_name
}
output "server_volume_size" {
  value = var.hdd_size
}
output "CHR_version" {
  value = var.chr_ver
}