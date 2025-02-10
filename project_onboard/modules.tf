module "vault_project_one" {
  source       = "./modules/project"
  base_path    = "team_one"
  project_name = "project_one"
  ecp          = true
}

module "vault_project_two" {
  source           = "./modules/project"
  base_path        = "team_one"
  project_name     = "project_two"
  entitlement_name = "some-other-entitlement"
}
