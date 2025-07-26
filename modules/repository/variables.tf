variable "name" {
  description = "Name of the GitHub repository"
  type        = string
}

variable "description" {
  description = "Description of the repository"
  type        = string
}

variable "visibility" {
  description = "Repository visibility: 'private' or 'public'"
  type        = string
  default     = "private"
}

variable "teams" {
  description = "List of maps specifying teams and their permission on this repo"
  type = list(object({
    team       = string      # Team name
    permission = string      # One of: pull, push, admin, maintain
  }))
  default = []
}
