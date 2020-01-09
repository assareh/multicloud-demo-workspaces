locals {
  # parse the vcs_repo for just the repository title
  vcs_repo_title = regex("/(.+)", var.vcs_repo)[0]
}

resource "tfe_workspace" "workspace" {
  name              = format("%s-%s", local.vcs_repo_title, var.vcs_branch)
  organization      = var.organization
  auto_apply        = var.auto_apply
  terraform_version = var.terraform_version
  vcs_repo {
    identifier     = var.vcs_repo
    oauth_token_id = var.vcs_oauth_token_id
    branch         = var.vcs_branch
  }
}

resource "tfe_variable" "confirm-destroy" {
  key          = "CONFIRM_DESTROY"
  value        = var.allow_destroy
  category     = "env"
  workspace_id = tfe_workspace.workspace.id
}

resource "tfe_variable" "workspace_variable" {
  count        = length(var.workspace_variables)
  key          = var.workspace_variables[count.index]["key"]
  value        = var.workspace_variables[count.index]["value"]
  category     = var.workspace_variables[count.index]["category"]
  sensitive    = var.workspace_variables[count.index]["sensitive"]
  workspace_id = tfe_workspace.workspace.id
}
