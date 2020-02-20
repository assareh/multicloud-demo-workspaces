module "gcp_gke_dev_workspace" {
  source       = "./workspace"
  organization = var.organization
  token        = var.token

  vcs_repo           = "assareh/gke-cluster"
  vcs_branch         = "dev"
  vcs_oauth_token_id = var.vcs_oauth_token_id

  terraform_version = "0.12.12"
  auto_apply        = "true"
  allow_destroy     = "1"

  workspace_variables = [
    {
      key       = "gcp_project"
      value     = "andy-assareh-demo"
      category  = "terraform"
      sensitive = false
    }
  ]
}

resource "tfe_notification_configuration" "gcp_gke_dev_notification" {
  name                  = "Slack notifications to #test-assareh-alerts"
  enabled               = true
  destination_type      = "slack"
  triggers              = ["run:needs_attention", "run:errored"]
  url                   = var.webhook_url
  workspace_external_id = module.gcp_gke_dev_workspace.external_id
}

# GCP credentials
resource "tfe_variable" "gcp_gke_dev_credentials_variable" {
  key          = "gcp_credentials"
  value        = data.local_file.gcp_credentials.content
  category     = "terraform"
  sensitive    = true
  workspace_id = module.gcp_gke_dev_workspace.id
}