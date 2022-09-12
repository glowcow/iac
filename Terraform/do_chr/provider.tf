terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
  backend "s3" {
    bucket         = "eu-west-1-tfstate-bucket"
    dynamodb_table = "eu-west-1-tfstate-lock"
    key            = "do_tf_state/chr.tfstate"
    region         = "eu-west-1"
    encrypt        = "true"
  }
}

provider "digitalocean" {
  token = var.do_token
}

data "digitalocean_ssh_key" "terraform" {
  name = "tf_ssh_key"
}
