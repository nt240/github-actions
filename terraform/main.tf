terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "6.5.0"
    }
  }
}

provider "github" {}

resource "github_repository" "this" {
  name        = "github-actions"
  description = "A repository for GitHub Actions"

  visibility             = "public"
  has_downloads          = true
  has_issues             = true
  has_projects           = true
  has_wiki               = false
  delete_branch_on_merge = true

  auto_init = true
}

resource "github_branch_protection" "this" {
  repository_id    = github_repository.this.node_id
  pattern          = "main"
  enforce_admins   = true
  allows_deletions = false
}
