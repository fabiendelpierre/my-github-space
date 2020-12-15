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