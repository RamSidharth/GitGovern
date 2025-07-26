repositories = [
  {
    name        = "core-service"
    description = "The main microservice repo"
    visibility  = "private"
    teams = [
      { team = "Developers", permission = "push" },
      { team = "Ops", permission = "pull" }
    ]
  },
  {
    name        = "infra"
    description = "Infrastructure as Code"
    visibility  = "private"
    teams = [
      { team = "Ops", permission = "admin" }
    ]
  }
]
