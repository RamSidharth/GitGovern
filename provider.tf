terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }
  }
}

provider "github" {
  token = getenv("GITHUB_TOKEN")
  owner = getenv("GITHUB_OWNER")
}
