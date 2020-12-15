resource "github_repository" "tf_repo_template" {
  name        = "terraform-repository-template"
  description = "My template for Terraform code repositories"
  visibility  = "public"

  is_template = true

  has_issues    = true
  has_projects  = false
  has_wiki      = true

  gitignore_template  = "Terraform"
  license_template    = "unlicense"
}