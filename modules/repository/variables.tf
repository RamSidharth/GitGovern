variable "name" {
  description = "Name of the GitHub repository"
  type        = string
}

variable "description" {
  description = "Description of the repository"
  type        = string
}

variable "visibility" {
  description = "Repository visibility: private or public"
  type        = string
  default     = "private"
}

variable "teams" {
  description = "List of teams and permissions assigned to this repo"
  type = list(object({
    team       = string
    permission = string
  }))
  default = []
}

variable "team_ids" {
  description = "Map of team names to their GitHub IDs, passed from the team module"
  type        = map(string)
  default     = {}
}
