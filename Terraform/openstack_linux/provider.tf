terraform {
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 1.43.0"
    }
     selectel = {
      source  = "selectel/selectel"
      version = "~> 3.6.2"
   }
  }
  backend "s3" {
    bucket         = "eu-west-1-tfstate-bucket"
    dynamodb_table = "eu-west-1-tfstate-lock"
    key            = "openstack_tf_state/selectel-linux.tfstate"
    region         = "eu-west-1"
    encrypt        = "true"
  }
}

provider "selectel" {
  token = var.st_api_token
}

provider "openstack" {
  domain_name = var.os_domain_name
  tenant_id   = var.os_project_id
  user_name   = var.os_user_name
  password    = var.os_user_password
  auth_url    = var.os_api
  region      = var.region
}