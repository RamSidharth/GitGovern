variable "name" {
  description = "Name of the GitHub team"
  type        = string
}

variable "description" {
  description = "Description of the GitHub team"
  type        = string
  default     = ""
}

variable "privacy" {
  description = "Team privacy setting: 'closed' or 'secret'"
  type        = string
  default     = "closed"
}

variable "members" {
  description = "List of maps defining team membership"
  type = list(object({
    username = string  # GitHub username
    role     = string  # 'member' or 'maintainer'
  }))
  default = []
}
