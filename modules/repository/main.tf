resource "github_repository" "repo" {
  name        = var.name
  description = var.description
  visibility  = var.visibility
  auto_init   = true
}

data "github_team" "team" {
  # Look up each existing team by its slug (URL-friendly name)
  for_each = { for t in var.teams : t.team => t }
  slug     = each.key
}

resource "github_team_repository" "repo_team_access" {
  for_each   = { for t in var.teams : "${t.team}-${var.name}" => t }
  team_id    = data.github_team.team[each.value.team].id
  repository = github_repository.repo.name
  permission = each.value.permission
}
