variable "base_path" {
  description = "Base path for the project"
  type        = string
}

variable "project_name" {
  description = "Name of the Organization to add to vault"
  type        = string
}

variable "entitlement_name" {
  description = "Name of the entitlement to add to vault"
  type        = string
  default     = null
}

variable "ecp" {
  description = "If application is deployed to ECP. Will be used to create k8s auth method"
  type        = bool
  default     = false
}
