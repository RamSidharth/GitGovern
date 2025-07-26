output "team_id" {
  description = "The ID of the created GitHub team"
  value       = github_team.team.id
}

output "team_slug" {
  description = "The slug (URL-friendly name) of the created GitHub team"
  value       = github_team.team.slug
}
