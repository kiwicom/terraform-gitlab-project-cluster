terraform {
  required_version = ">= 0.13"
  required_providers {
    external = {
      source = "hashicorp/external"
    }
    gitlab = {
      source = "gitlabhq/gitlab"
    }
  }
}
