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
  name         = "qa"
  organization = var.organization
}

resource "tfe_team_access" "dev_ws_dev_team" {
  access       = "plan"
  team_id      = tfe_team.dev_team.id
  workspace_id = module.aws-dev-workspace.id
}

resource "tfe_team_access" "dev_ws_qa_team" {
  access       = "read"
  team_id      = tfe_team.qa_team.id
  workspace_id = module.aws-dev-workspace.id
}

resource "tfe_team_access" "qa_ws_qa_team" {
  access       = "write"
  team_id      = tfe_team.qa_team.id
  workspace_id = module.aws-qa-workspace.id
}

resource "tfe_team_access" "qa_ws_dev_team" {
  access       = "read"
  team_id      = tfe_team.dev_team.id
  workspace_id = module.aws-qa-workspace.id
}

resource "tfe_team_member" "iamdevloper" {
  team_id  = tfe_team.dev_team.id
  username = "iamdevloper"
}
