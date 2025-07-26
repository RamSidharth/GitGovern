resource "github_repository" "repo" {
  name        = var.name
  description = var.description
  visibility  = var.visibility
  auto_init   = true
}

# Remove the previous data "github_team" lookup that caused 404 errors;
# Instead use team IDs passed in via variable "team_ids".

resource "github_team_repository" "repo_team_access" {
  for_each = { for t in var.teams : "${t.team}-${var.name}" => t }

  # Lookup team_id from the map passed into this module (team name => ID)
  team_id    = lookup(var.team_ids, each.value.team, null)
  repository = github_repository.repo.name
  permission = each.value.permission
}
