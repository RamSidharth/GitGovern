# Teams and membership
module "teams" {
  source  = "./modules/team"
  for_each = { for t in var.teams : t.name => t }
  name      = each.value.name
  privacy   = each.value.privacy
  members   = each.value.members
}

# Repositories and team permissions
module "repositories" {
  source  = "./modules/repository"
  for_each = { for r in var.repositories : r.name => r }
  name        = each.value.name
  description = each.value.description
  visibility  = each.value.visibility
  teams       = each.value.teams
}
