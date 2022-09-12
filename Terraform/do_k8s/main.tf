resource "digitalocean_vpc" "k8s-vpc" {
  name   = "${var.cluster_name}-vpc"
  region = var.do_region
  ip_range = var.vpc_cidr
}

resource "digitalocean_kubernetes_cluster" "k8s" {
  name   = var.cluster_name
  region = var.do_region
  version = var.cluster_version
  vpc_uuid = digitalocean_vpc.k8s-vpc.id
  maintenance_policy {
    start_time  = "04:00"
    day         = "sunday"
  }
  node_pool {
    name       = "worker"
    size       = var.cluster_node_size
    auto_scale = true
    min_nodes  = 2
    max_nodes  = var.cluster_node_count_max

    taint {
      key    = "workloadKind"
      value  = "database"
      effect = "NoSchedule"
    }
  }
}
