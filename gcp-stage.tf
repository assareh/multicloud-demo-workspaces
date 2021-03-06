module "gcp_stage_workspace" {
  source       = "./workspace"
  organization = var.organization
  token        = var.token

  vcs_repo           = "assareh/gcp-compute-instance"
  vcs_branch         = "stage"
  vcs_oauth_token_id = var.vcs_oauth_token_id

  terraform_version = "0.12.20"
  auto_apply        = "false"
  allow_destroy     = "0"

  workspace_variables = [
    {
      key       = "gcp_project"
      value     = "andy-assareh-demo"
      category  = "terraform"
      sensitive = false
    }
  ]
}

resource "tfe_variable" "gcp_stage_env_variable" {
  key          = "env"
  value        = "stage"
  category     = "terraform"
  workspace_id = module.gcp_stage_workspace.id
}

resource "tfe_notification_configuration" "gcp_stage_notification" {
  name                  = "Slack notifications to #test-assareh-alerts"
  enabled               = true
  destination_type      = "slack"
  triggers              = ["run:needs_attention", "run:errored"]
  url                   = var.webhook_url
  workspace_external_id = module.gcp_stage_workspace.external_id
}

# GCP credentials
resource "tfe_variable" "gcp_stage_credentials_variable" {
  key          = "gcp_credentials"
  value        = data.local_file.gcp_credentials.content
  category     = "terraform"
  sensitive    = true
  workspace_id = module.gcp_stage_workspace.id
}
