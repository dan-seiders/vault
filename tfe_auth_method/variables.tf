variable "tfe_hostname" {
  description = "The hostname of TFE deployment"
  type        = string
}

variable "tfe_organization" {
  description = "The organization to allow authentication to Vault"
  type        = string
}

variable "tfe_project" {
  description = "The project to allow auth to Vault"
  type        = string
  default     = ""
}

variable "tfe_workspace" {
  description = "The project to allow auth to Vault"
  type        = string
  default     = ""
}
