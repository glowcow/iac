output "cluster_urn" {
  description = "IDs of k8s-cluster"
  value       = join(", ", digitalocean_kubernetes_cluster.k8s.*.urn)
}

output "cluster_version" {
  description = "images of k8s-cluster"
  value       = join(", ", digitalocean_kubernetes_cluster.k8s.*.version)
}

output "cluster_name" {
  description = "names of k8s-cluster"
  value       = join(", ", digitalocean_kubernetes_cluster.k8s.*.name)
}

output "region" {
  description = "regions of k8s-cluster"
  value       = join(", ", digitalocean_kubernetes_cluster.k8s.*.region)
}

output "node_size" {
  description = "sizes of k8s-cluster"
  value       = join(", ", digitalocean_kubernetes_cluster.k8s.node_pool.*.size)
}