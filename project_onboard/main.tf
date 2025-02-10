terraform {
  required_version = "~>1.10"

  cloud {
    hostname     = "some-tfe-hostname"
    organization = "some-org"

    workspaces {
      name = "some-workspace"
    }
  }

  required_providers {
    tfe = {
      source  = "hashicorp/tfe"
      version = "~>0.62"
    }

    vault = {
      source  = "hashicorp/vault"
      version = "4.5.0"
    }
  }
}

provider "vault" {}
