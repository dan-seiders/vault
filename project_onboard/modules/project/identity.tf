resource "vault_identity_group" "admin" {
  name     = "${local.entitlement_name}-admin"
  type     = "external"
  policies = ["${local.entitlement_name}-admin"]
}

resource "vault_identity_group" "application" {
  name     = "${local.entitlement_name}-application"
  type     = "external"
  policies = ["${local.entitlement_name}-application"]
}

resource "vault_identity_group_alias" "admin" {
  name           = "${local.entitlement_name}-admin"
  mount_accessor = data.vault_auth_backend.oidc.accessor
  canonical_id   = vault_identity_group.admin.id
}

resource "vault_identity_group_alias" "application" {
  name           = "${local.entitlement_name}-application"
  mount_accessor = data.vault_auth_backend.oidc.accessor
  canonical_id   = vault_identity_group.application.id
}

