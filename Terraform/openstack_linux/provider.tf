terraform {
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 1.43.0"
    }
#     selectel = {
#      source  = "selectel/selectel"
#      version = "~> 3.6.2"
#   }
  }
  backend "s3" {
    bucket         = "eu-west-1-tfstate-bucket"
    dynamodb_table = "eu-west-1-tfstate-lock"
    key            = "openstack_tf_state/selectel-linux.tfstate"
    region         = "eu-west-1"
    encrypt        = "true"
  }
}

#provider "selectel" {
#  token = "selectel_token"
#}

provider "openstack" {
  domain_name = var.domain_name
  tenant_id   = var.project_id
  user_name   = var.user_name
  password    = var.user_password
  auth_url    = var.os_api
  region      = var.region
}