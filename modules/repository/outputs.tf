output "repo_clone_url" {
  description = "HTTPS clone URL of the created repository"
  value       = github_repository.repo.clone_url
}
