resource "vault_jwt_auth_backend" "tfe" {
  path               = "tfe" #defaults to jwt if not defined
  oidc_discovery_url = "https://${var.tfe_hostname}"
  bound_issuer       = "https://${var.tfe_hostname}"

  tune {
    default_lease_ttl  = "1h" #tune token to shortest time possible, just longer than the longest tf plan/apply
    max_lease_ttl      = "2h"
    listing_visibility = "hidden"
    token_type         = "default-service"
  }
}

# create backend roles for different user types, teams, projects and assign least privileged token_policies. run_phase: cam also be set to plan or apply
resource "vault_jwt_auth_backend_role" "org_vault_admin" {
  backend        = vault_jwt_auth_backend.tfe.path
  role_name      = "admin"
  token_policies = ["admin"]

  bound_audiences   = ["vault.workload.identity"]
  bound_claims_type = "glob"
  bound_claims = {
    sub = "organization:${var.tfe_organization}:project:${var.tfe_project}:workspace:${var.tfe_workspace}:run_phase:*"
  }

  user_claim = "terraform_full_workspace"
  role_type  = "jwt"
}
