resource "tfe_team" "devs" {
  name         = "developers"
  organization = var.organization
}

resource "tfe_team" "qa" {
  name         = "qa-team"
  organization = var.organization
}

resource "tfe_team_access" "dev" {
  access       = "write"
  team_id      = tfe_team.devs.id
  workspace_id = module.aws-dev-workspace.id
}

resource "tfe_team_access" "qa" {
  access       = "read"
  team_id      = tfe_team.qa.id
  workspace_id = module.aws-qa-workspace.id
}