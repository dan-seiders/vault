resource "vault_policy" "default_kv_admin" {
  name = "${local.entitlement_name}-admin"

  policy = templatefile("${path.module}/policies/template_default_kv_admin.tftpl", {
    kv_path = local.kv_path
    }
  )
}

resource "vault_policy" "default_kv_application" {
  name = "${local.entitlement_name}-application"

  policy = templatefile("${path.module}/policies/template_default_kv_application.tftpl", {
    kv_path = local.kv_path
    }
  )
}
