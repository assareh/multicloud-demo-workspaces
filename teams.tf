resource "tfe_team" "admin_team" {
  name         = "admins"
  organization = var.organization
}

resource "tfe_team" "dev_team" {
  name         = "developers"
  organization = var.organization
}

resource "tfe_team" "manager_team" {
  name         = "managers"
  organization = var.organization
}

resource "tfe_team" "qa_team" {
  name         = "qa-team"
  organization = var.organization
}

resource "tfe_team_access" "dev_access" {
  access       = "write"
  team_id      = tfe_team.dev_team.id
  workspace_id = module.aws-dev-workspace.id
}

resource "tfe_team_access" "qa_access" {
  access       = "read"
  team_id      = tfe_team.qa_team.id
  workspace_id = module.aws-qa-workspace.id
}

# give people team memberships

