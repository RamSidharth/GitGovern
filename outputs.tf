# outputs.tf

# Output IDs of all created teams from the team module instances
output "team_ids" {
  description = "IDs of the GitHub teams created"
  value = {
    for team_name, mod in module.teams :
    team_name => mod.team_id
  }
}

# Output clone URLs of all repositories from the repository module instances
output "repository_clone_urls" {
  description = "HTTPS clone URLs for all managed repositories"
  value = {
    for repo_name, mod in module.repositories :
    repo_name => mod.repo_clone_url
  }
}
