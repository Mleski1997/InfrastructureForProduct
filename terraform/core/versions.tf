terraform {
  required_providers {
    hcloud = {
        source = "hetznercloud/hcloud"
         version = "~> 1.45"
    }
  }

  required_version = "~> 1.12.0"
}