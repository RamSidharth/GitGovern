variable "teams" {
  description = "List of teams and their members"
  type = list(object({
    name        = string
    description = string           # Add this line here
    privacy     = string           # "closed" or "secret"
    members     = list(object({
      username = string
      role     = string            # "member" or "maintainer"
    }))
  }))
  default = []
}

variable "repositories" {
  description = "List of repositories and team permissions"
  type = list(object({
    name        = string
    description = string
    visibility  = string   # "private" or "public"
    teams       = list(object({
      team       = string
      permission = string  # "pull", "push", "admin", "maintain"
    }))
  }))
  default = []
}
