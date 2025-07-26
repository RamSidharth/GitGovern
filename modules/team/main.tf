resource "github_team" "team" {
  name        = var.name
  description = var.description
  privacy     = var.privacy
  # Earlier Slug was mentioned here, now its removed
}

resource "github_team_membership" "team_member" {
  for_each = { for m in var.members : m.username => m }
  team_id  = github_team.team.id
  username = each.value.username
  role     = each.value.role
}
