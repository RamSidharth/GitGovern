module "teams" {
  source   = "./modules/team"
  for_each = { for t in var.teams : t.name => t }

  name        = each.value.name
  description = lookup(each.value, "description", "") # safe access: fallback empty string
  privacy     = each.value.privacy
  members     = each.value.members
}

locals {
  team_ids = { for team_name, team_mod in module.teams : team_name => team_mod.team_id }
}

module "repositories" {
  source   = "./modules/repository"
  for_each = { for r in var.repositories : r.name => r }

  name        = each.value.name
  description = each.value.description
  visibility  = each.value.visibility
  teams       = each.value.teams
  team_ids    = local.team_ids
}
