module "aws_qa_workspace" {
  source              = "./workspace"
  organization        = var.organization
  token               = var.token

  vcs_repo            = "assareh/aws-ec2-instance"
  vcs_branch          = "qa"
  vcs_oauth_token_id  = var.vcs_oauth_token_id

  terraform_version   = "0.12.10"
  auto_apply          = "true"
  allow_destroy       = "1"
  workspace_variables = []
}

resource "tfe_notification_configuration" "aws_qa_notification" {
  name                  = "Slack notifications to #test-assareh-alerts"
  enabled               = true
  destination_type      = "slack"
  triggers              = ["run:needs_attention", "run:errored"]
  url                   = var.webhook_url
  workspace_external_id = module.aws_qa_workspace.external_id
}

# AWS credentials
resource "tfe_variable" "qa_access_key_variable" {
  key          = "AWS_ACCESS_KEY_ID"
  value        = var.AWS_ACCESS_KEY_ID
  category     = "env"
  workspace_id = module.aws_qa_workspace.id
}

resource "tfe_variable" "qa_secret_key_variable" {
  key          = "AWS_SECRET_ACCESS_KEY"
  value        = var.AWS_SECRET_ACCESS_KEY
  category     = "env"
  sensitive    = true
  workspace_id = module.aws_qa_workspace.id
}
