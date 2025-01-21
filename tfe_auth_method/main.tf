terraform {
  required_version = "~>1.10"

  cloud {
    hostname     = "you_tfe.your_domain.com"
    organization = "your_org"

    workspaces {
      name = "some_workspace"
    }
  }

  required_providers {
    tfe = {
      source  = "hashicorp/tfe"
      version = "0.62.0"
    }

    vault = {
      source  = "hashicorp/vault"
      version = "4.5.0"
    }
  }
}

provider "vault" {}
