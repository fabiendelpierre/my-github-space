# A few repositories to help me test Spacelift.io
# https://spacelift.io

resource "github_repository" "spacelift_administration" {
  name        = "my-spacelift-account-admin"
  description = "Manages my Spacelift.io account"
  visibility  = "public"

  template {
    owner = split("/",github_repository.tf_repo_template.full_name)[0]
    repository = github_repository.tf_repo_template.name
  }
}

resource "github_repository" "azure_msdn_subscription_spacelift" {
  name        = "my-azure-msdn-subscription_spacelift"
  description = "Manages my Azure MSDN subscription with Terraform and Spacelift.io"
  visibility  = "public"

  template {
    owner = split("/",github_repository.tf_repo_template.full_name)[0]
    repository = github_repository.tf_repo_template.name
  }
}