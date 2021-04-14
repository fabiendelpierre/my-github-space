resource "github_repository" "tf_repo_template" {
  name        = "terraform-repository-template"
  description = "My template for Terraform code repositories"
  visibility  = "public"

  auto_init   = true
  is_template = true

  has_issues    = true
  has_projects  = false
  has_wiki      = true

  gitignore_template  = "Terraform"
  license_template    = "unlicense"
}

resource "github_repository_file" "tf_repo_template_readme" {
  repository  = github_repository.tf_repo_template.name
  branch      = github_repository.tf_repo_template.default_branch
  file        = "README.md"

  commit_message  = "README template"
  commit_author   = "Terraform Cloud"
  commit_email    = "foo@app.terraform.io"

  overwrite_on_create = true

  content = <<EOF
# Terraform code repository

Short description

## What this does

Lorem ipsum

## Variables

Lorem ipsum

## Code example

```hcl
terraform {
  ...
}
```
EOF
}

resource "github_repository" "tf_cloud_administration" {
  name        = "my-terraform-cloud-account-admin"
  description = "Manages my Terraform Cloud account"
  visibility  = "public"

  template {
    owner = split("/",github_repository.tf_repo_template.full_name)[0]
    repository = github_repository.tf_repo_template.name
  }
}

resource "github_repository" "azure_msdn_subscription" {
  name        = "my-azure-msdn-subscription"
  description = "Manages my Azure MSDN subscription with Terraform"
  visibility  = "public"

  template {
    owner = split("/",github_repository.tf_repo_template.full_name)[0]
    repository = github_repository.tf_repo_template.name
  }
}

output "azure_msdn_subscription_repo" {
  value = github_repository.azure_msdn_subscription
}

resource "github_repository" "vault_configuration" {
  name        = "my-vault-cluster-configuration"
  description = "Manages my Hashicorp Vault instance in Azure"
  visibility  = "public"

  template {
    owner = split("/",github_repository.tf_repo_template.full_name)[0]
    repository = github_repository.tf_repo_template.name
  }
}

output "vault_configuration_repo" {
  value = github_repository.vault_configuration
}

resource "github_actions_secret" "vault_config_oidc_discovery_url" {
  repository       = github_repository.vault_configuration.name
  secret_name      = "TF_VAR_oidc_discovery_url"
  plaintext_value  = var.vault_config_oidc_discovery_url
}

resource "github_actions_secret" "vault_config_oidc_client_id" {
  repository       = github_repository.vault_configuration.name
  secret_name      = "TF_VAR_oidc_client_id"
  plaintext_value  = var.vault_config_oidc_client_id
}

resource "github_actions_secret" "vault_config_oidc_client_secret" {
  repository       = github_repository.vault_configuration.name
  secret_name      = "TF_VAR_oidc_client_secret"
  plaintext_value  = var.vault_config_oidc_client_secret
}

resource "github_actions_secret" "vault_config_oidc_allowed_redirect_uris" {
  repository       = github_repository.vault_configuration.name
  secret_name      = "TF_VAR_oidc_allowed_redirect_uris"
  plaintext_value  = var.vault_config_oidc_allowed_redirect_uris
}

resource "github_actions_secret" "vault_config_oidc_group_mappings" {
  repository       = github_repository.vault_configuration.name
  secret_name      = "TF_VAR_oidc_group_mappings"
  plaintext_value  = var.vault_config_oidc_group_mappings
}

resource "github_repository" "module_azurerm_keyvault" {
  name        = "terraform-azurerm-keyvault"
  description = "Simple module to create an instance of Azure Key Vault"
  visibility  = "public"

  template {
    owner = split("/",github_repository.tf_repo_template.full_name)[0]
    repository = github_repository.tf_repo_template.name
  }
}

output "module_azurerm_keyvault_repo" {
  value = github_repository.module_azurerm_keyvault
}

resource "github_repository" "module_azurerm_virtualnetwork" {
  name        = "terraform-azurerm-virtualnetwork"
  description = "Simple module to create an Azure Virtual Network"
  visibility  = "public"

  template {
    owner = split("/",github_repository.tf_repo_template.full_name)[0]
    repository = github_repository.tf_repo_template.name
  }
}

output "module_azurerm_virtualnetwork_repo" {
  value = github_repository.module_azurerm_virtualnetwork
}

resource "github_repository" "module_azurerm_storageaccount" {
  name        = "terraform-azurerm-storageaccount"
  description = "Create an Azure Storage Account"
  visibility  = "public"

  template {
    owner = split("/",github_repository.tf_repo_template.full_name)[0]
    repository = github_repository.tf_repo_template.name
  }
}

output "module_azurerm_storageaccount_repo" {
  value = github_repository.module_azurerm_storageaccount
}

resource "github_repository" "module_azurerm_hashicorpvault" {
  name        = "terraform-azurerm-hashicorpvault"
  description = "Create a Hashicorp Vault VM in Azure"
  visibility  = "public"

  template {
    owner = split("/",github_repository.tf_repo_template.full_name)[0]
    repository = github_repository.tf_repo_template.name
  }
}

output "module_azurerm_hashicorpvault_repo" {
  value = github_repository.module_azurerm_hashicorpvault
}