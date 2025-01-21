resource "vault_policy" "admin" {
  name   = "admin"
  policy = file("${path.module}/policies/admin.hcl")
}

#  This can be used to pull in/create all policies from files in the policy directory
# resource "vault_policy" "all" {
#   for_each = fileset("${path.module}/policies", "*.hcl")

#   name   = trimsuffix(each.key, ".hcl")
#   policy = file("${path.module}/policies/${each.value}")
# }
