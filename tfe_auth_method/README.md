# vault

This repo can be used to quickly configure Vault to allow dynamic credentials from a Terraform deployment.

### Prerequisites

- A running, initialized and unsealed Vault deployment
- A running Terraform deployment with network connectivity to your Vault deployment
- A target TF Organization, Project and workspace for your Vault configuration
- The ability to get a short lived token from your Vault instance with the necessary permissions for setting up auth methods and policies

### Steps

1. In main.tf file:

   - update terraform.cloud.hostname to your desired terraform deployment hostname
   - update terraform.cloud.organizaion to your desired terraform organization within your TF deployment
   - update terraform.cloud.workspaces to your desired workspace name within your TF org

2. Confirm your Vault policy name and permissions:

   - this code defaults to adding an admin policy to the role that gets assigned when TF Vault provider authenticates. This is a very permissive policy and should only be for team that is managing Vault configuration via TF. Please use least privilege methodology when configuring roles and policies.

3. Initialize your TF Workspace.
   `terraform init`

4. Update TF workspace env vars
   You can add default values to the variable definitions in variables.tf, add a .tfvars file or add values to your workspace

   - tfe_hostname=some-hostname
   - tfe_organization=some-org
   - tfe_project=some-project
   - tfe_workspace=some-workspace
   - VAULT_ADDR=https://some_vault_address

### Runbook

1. Using the vault cli, authenticate to vault and generate a short lived token with to use in TF workspace. The token needs necessary permissions to provision the resources in your terraform plan/apply.
   `vault token create -period=30m`

2. Add token as sensitive workspace variable

   - VAULT_TOKEN=some_vault_token

3. Run Terraform to provision auth method

Vault now has the necessary configuration to allow Terraform to dynamically authenticate to Vault. To use this auth method for a Terraform workspace - Add TF workspace vars. The org/project/workspace/run_phase need to be within the scope of vault_jwt_auth_backend_role.

- TFC_VAULT_ADDR=https://some_hostname
- TFC_VAULT_PROVIDER_AUTH=false
- TFC_VAULT_RUN_ROLE=admin
- TFC_VAULT_AUTH_PATH=tfe
