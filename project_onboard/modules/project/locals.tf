locals {
  entitlement_name = var.entitlement_name != null ? "some-prefix-${var.entitlement_name}" : "some-prefix-${var.base_path}-${var.project_name}"
  kv_path          = var.ecp == true ? var.base_path : "${var.base_path}/${var.project_name}"
}
