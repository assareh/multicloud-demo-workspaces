variable "organization" {}

variable "vcs_oauth_token_id" {}

# Cloud credentials
variable "ARM_CLIENT_ID" {}
variable "ARM_CLIENT_SECRET" {}
variable "ARM_SUBSCRIPTION_ID" {}
variable "ARM_TENANT_ID" {}
variable "AWS_ACCESS_KEY_ID" {}
variable "AWS_SECRET_ACCESS_KEY" {}
variable "gcp_credentials_file" {}
variable "token" {
  description = "Terraform Cloud authentication token"
}

variable "webhook_url" {
  description = "Slack channel webhook url for notification configuration"
}

data "template_file" "gcp_credentials" {
  template = "${file(var.gcp_credentials_file)}"
}