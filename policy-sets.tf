resource "tfe_policy_set" "terraform_guides_aws" {
  name                   = "Terraform-Guides-AWS"
  description            = "A collection of example Sentinel policies for AWS."
  organization           = var.organization
  policies_path          = "/governance/second-generation/aws"
  workspace_external_ids = [module.aws-dev-workspace.external_id, module.aws-qa-workspace.external_id, module.aws-prod-workspace.external_id]

  vcs_repo {
    identifier     = "assareh/terraform-guides"
    oauth_token_id = var.vcs_oauth_token_id
  }
}

resource "tfe_policy_set" "terraform_guides_azure" {
  name                   = "Terraform-Guides-Azure"
  description            = "A collection of example Sentinel policies for Azure."
  organization           = var.organization
  policies_path          = "/governance/second-generation/azure"
  workspace_external_ids = [module.azure-master-workspace.external_id]

  vcs_repo {
    identifier     = "assareh/terraform-guides"
    oauth_token_id = var.vcs_oauth_token_id
  }
}

resource "tfe_policy_set" "terraform_guides_gcp" {
  name                   = "Terraform-Guides-GCP"
  description            = "A collection of example Sentinel policies for GCP."
  organization           = var.organization
  policies_path          = "/governance/second-generation/gcp"
  workspace_external_ids = [module.gcp-master-workspace.external_id]

  vcs_repo {
    identifier     = "assareh/terraform-guides"
    oauth_token_id = var.vcs_oauth_token_id
  }
}

resource "tfe_policy_set" "terraform_guides_agnostic" {
  name                   = "Terraform-Guides-Agnostic"
  description            = "A collection of example cloud agnostic Sentinel policies."
  organization           = var.organization
  policies_path          = "/governance/second-generation/cloud-agnostic"
  workspace_external_ids = [module.aws-dev-workspace.external_id, module.aws-qa-workspace.external_id, module.aws-prod-workspace.external_id, module.azure-master-workspace.external_id, module.gcp-master-workspace.external_id]

  vcs_repo {
    identifier     = "assareh/terraform-guides"
    oauth_token_id = var.vcs_oauth_token_id
  }
}
