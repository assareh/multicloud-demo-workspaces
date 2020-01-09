module "gcp-master-workspace" {
  source             = "./workspace"
  organization       = var.organization
  vcs_repo           = "assareh/gcp-compute-instance"
  vcs_branch         = "master"
  vcs_oauth_token_id = var.vcs_oauth_token_id
  auto_apply         = "true"
  allow_destroy      = "1"
  token              = var.token
  terraform_version  = "0.12.19"
  workspace_variables = [
    {
      key       = "gcp_project"
      value     = "andy-assareh-demo"
      category  = "terraform"
      sensitive = false
    }
  ]
}

resource "tfe_notification_configuration" "gcp-master-slack-assareh" {
  name                  = "Slack notifications to #test-assareh-alerts"
  enabled               = true
  destination_type      = "slack"
  triggers              = ["run:needs_attention", "run:errored"]
  url                   = var.webhook_url
  workspace_external_id = module.gcp-master-workspace.external_id
}

# GCP credentials
resource "tfe_variable" "gcp_credentials" {
  key          = "gcp_credentials"
  value        = var.gcp_credentials
  category     = "terraform"
  sensitive    = true
  workspace_id = module.gcp-master-workspace.id
}
