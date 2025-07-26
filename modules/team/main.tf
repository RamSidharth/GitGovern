resource "github_team" "team" {
  name        = var.name
  description = var.description
  privacy     = var.privacy
  # GitHub requires a URL-friendly slug; we derive it from the team name:
  slug        = lower(replace(var.name, " ", "-"))
}

resource "github_team_membership" "team_member" {
  for_each = { for m in var.members : m.username => m }
  team_id  = github_team.team.id
  username = each.value.username
  role     = each.value.role
}
