terraform {
  required_version = "~> 0.14"

  required_providers {
    github = {
      source  = "hashicorp/github"
      version = "~> 4.1.0"
    }
  }
}

# Use GITHUB_TOKEN and GITHUB_OWNER env variables in TF Cloud to configure provider
provider "github" {}