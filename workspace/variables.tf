variable "organization" {
  description = "Name of the organization"
}

variable vcs_repo {}
variable vcs_branch {}
variable vcs_oauth_token_id {}

variable "token" {
  description = "Terraform Cloud authentication token"
}

variable "auto_apply" {
  description = "Whether to auto apply changes when a plan is successful"
  default     = false
}

variable "terraform_version" {
  description = "The version of Terraform to use for this workspace."
  default     = "0.12.10"
}

variable "allow_destroy" {
  description = "Whether to allow terraform destroy, 1 to allow, 0 to disallow"
}

variable "workspace_variables" {
  type = list(object({
    key       = string
    value     = any
    category  = string
    sensitive = bool
  }))
  description = "A data structure of variables to populate in the workspace"
}
