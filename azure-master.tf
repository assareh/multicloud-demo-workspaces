module "azure-master-workspace" {
  source             = "./workspace"
  organization       = var.organization
  vcs_repo           = "assareh/azure-vm"
  vcs_branch         = "master"
  vcs_oauth_token_id = var.vcs_oauth_token_id
  auto_apply         = "true"
  allow_destroy      = "1"
  token              = var.token
  terraform_version  = "0.12.19"
  workspace_variables = [
    {
      key       = "windows_dns_prefix"
      value     = "assareh-demo"
      category  = "terraform"
      sensitive = false
    },
    {
      key       = "location"
      value     = "West US"
      category  = "terraform"
      sensitive = false
    }
  ]
}

resource "tfe_notification_configuration" "azure-master-slack-assareh" {
  name                  = "Slack notifications to #test-assareh-alerts"
  enabled               = true
  destination_type      = "slack"
  triggers              = ["run:needs_attention", "run:errored"]
  url                   = var.webhook_url
  workspace_external_id = module.gcp-master-workspace.external_id
}

# Azure credentials
resource "tfe_variable" "arm_client_id" {
  key          = "ARM_CLIENT_ID"
  value        = var.ARM_CLIENT_ID
  category     = "env"
  sensitive    = false
  workspace_id = module.azure-master-workspace.id
}

resource "tfe_variable" "arm_client_secret" {
  key          = "ARM_CLIENT_SECRET"
  value        = var.ARM_CLIENT_SECRET
  category     = "env"
  sensitive    = true
  workspace_id = module.azure-master-workspace.id
}

resource "tfe_variable" "arm_subscription_id" {
  key          = "ARM_SUBSCRIPTION_ID"
  value        = var.ARM_SUBSCRIPTION_ID
  category     = "env"
  sensitive    = false
  workspace_id = module.azure-master-workspace.id
}

resource "tfe_variable" "arm_tenant_id" {
  key          = "ARM_TENANT_ID"
  value        = var.ARM_TENANT_ID
  category     = "env"
  sensitive    = false
  workspace_id = module.azure-master-workspace.id
}
