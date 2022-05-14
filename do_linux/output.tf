output "droplet_id" {
  description = "tolist of IDs of Droplets"
  value       = join(", ", digitalocean_droplet.linux-do.*.id)
}

output "image" {
  description = "tolist of images of Droplets"
  value       = join(", ", digitalocean_droplet.linux-do.*.image)
}

output "ipv4_address" {
  description = "tolist of public IPv4 addresses assigned to the Droplets"
  value       = join(", ", digitalocean_droplet.linux-do.*.ipv4_address)
}

output "ipv4_address_private" {
  description = "tolist of private IPv4 addresses assigned to the Droplets, if applicable"
  value       = join(", ", digitalocean_droplet.linux-do.*.ipv4_address_private)
}

output "name" {
  description = "tolist of names of Droplets"
  value       = join(", ", digitalocean_droplet.linux-do.*.name)
}

output "region" {
  description = "tolist of regions of Droplets"
  value       = join(", ", digitalocean_droplet.linux-do.*.region)
}

output "size" {
  description = "tolist of sizes of Droplets"
  value       = join(", ", digitalocean_droplet.linux-do.*.size)
}