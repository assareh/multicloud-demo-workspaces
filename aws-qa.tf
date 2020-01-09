module "aws-qa-workspace" {
  source              = "./workspace"
  organization        = var.organization
  vcs_repo            = "assareh/aws-ec2-instance"
  vcs_branch          = "qa"
  vcs_oauth_token_id  = var.vcs_oauth_token_id
  auto_apply          = "true"
  allow_destroy       = "1"
  token               = var.token
  terraform_version   = "0.12.10"
  workspace_variables = []
}

resource "tfe_notification_configuration" "aws-qa-slack-assareh" {
  name                  = "Slack notifications to #test-assareh-alerts"
  enabled               = true
  destination_type      = "slack"
  triggers              = ["run:needs_attention", "run:errored"]
  url                   = var.webhook_url
  workspace_external_id = module.aws-qa-workspace.external_id
}

# AWS credentials
resource "tfe_variable" "qa_access_key" {
  key          = "AWS_ACCESS_KEY_ID"
  value        = var.AWS_ACCESS_KEY_ID
  category     = "env"
  workspace_id = module.aws-qa-workspace.id
}

resource "tfe_variable" "qa_secret_key" {
  key          = "AWS_SECRET_ACCESS_KEY"
  value        = var.AWS_SECRET_ACCESS_KEY
  category     = "env"
  sensitive    = true
  workspace_id = module.aws-qa-workspace.id
}
