terraform {
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
