resource "tfe_policy_set" "terraform_guides_aws_v2_policy_set" {
  name                   = "Terraform-Guides-AWS-Second-Gen"
  description            = "A collection of example Sentinel policies for AWS (Second Generation)."
  organization           = var.organization
  policies_path          = "/governance/second-generation/aws"
  workspace_external_ids = [module.aws_dev_workspace.external_id, module.aws_qa_workspace.external_id, module.aws_prod_workspace.external_id]

  vcs_repo {
    identifier     = "assareh/terraform-guides"
    oauth_token_id = var.vcs_oauth_token_id
  }
}

resource "tfe_policy_set" "terraform_guides_aws_v1_policy_set" {
  name                   = "Terraform-Guides-AWS-First-Gen"
  description            = "A collection of example Sentinel policies for AWS (First Generation)."
  organization           = var.organization
  policies_path          = "/governance/first-generation/aws"
  workspace_external_ids = [module.aws_dev_workspace.external_id, module.aws_qa_workspace.external_id, module.aws_prod_workspace.external_id]

  vcs_repo {
    identifier     = "assareh/terraform-guides"
    oauth_token_id = var.vcs_oauth_token_id
  }
}

resource "tfe_policy_set" "terraform_guides_azure_policy_set" {
  name                   = "Terraform-Guides-Azure"
  description            = "A collection of example Sentinel policies for Azure."
  organization           = var.organization
  policies_path          = "/governance/second-generation/azure"
  workspace_external_ids = [module.azure_master_workspace.external_id, module.azure_dev_workspace.external_id]

  vcs_repo {
    identifier     = "assareh/terraform-guides"
    oauth_token_id = var.vcs_oauth_token_id
  }
}

resource "tfe_policy_set" "terraform_guides_gcp_v2_policy_set" {
  name                   = "Terraform-Guides-GCP-Second-Gen"
  description            = "A collection of example Sentinel policies for GCP (Second Generation)."
  organization           = var.organization
  policies_path          = "/governance/second-generation/gcp"
  workspace_external_ids = [module.gcp_dev_workspace.external_id, module.gcp_stage_workspace.external_id, module.gcp_prod_workspace.external_id, module.gcp_gke_dev_workspace.external_id, module.gcp_gke_stage_workspace.external_id, module.gcp_gke_prod_workspace.external_id]

  vcs_repo {
    identifier     = "assareh/terraform-guides"
    oauth_token_id = var.vcs_oauth_token_id
  }
}

resource "tfe_policy_set" "terraform_guides_gcp_v1_policy_set_" {
  name                   = "Terraform-Guides-GCP-First-Gen"
  description            = "A collection of example Sentinel policies for GCP (First Generation)."
  organization           = var.organization
  policies_path          = "/governance/first-generation/gcp"
  workspace_external_ids = [module.gcp_dev_workspace.external_id, module.gcp_stage_workspace.external_id, module.gcp_prod_workspace.external_id, module.gcp_gke_dev_workspace.external_id, module.gcp_gke_stage_workspace.external_id, module.gcp_gke_prod_workspace.external_id]

  vcs_repo {
    identifier     = "assareh/terraform-guides"
    oauth_token_id = var.vcs_oauth_token_id
  }
}

# need a better way to represent these lists
resource "tfe_policy_set" "terraform_guides_agnostic_policy_set" {
  name                   = "Terraform-Guides-Agnostic"
  description            = "A collection of example cloud agnostic Sentinel policies."
  organization           = var.organization
  policies_path          = "/governance/second-generation/cloud-agnostic"
  workspace_external_ids = [module.aws_dev_workspace.external_id, module.aws_qa_workspace.external_id, module.aws_prod_workspace.external_id, module.azure_master_workspace.external_id, module.azure_dev_workspace.external_id, module.gcp_dev_workspace.external_id, module.gcp_stage_workspace.external_id, module.gcp_prod_workspace.external_id, module.gcp_gke_dev_workspace.external_id, module.gcp_gke_stage_workspace.external_id, module.gcp_gke_prod_workspace.external_id]

  vcs_repo {
    identifier     = "assareh/terraform-guides"
    oauth_token_id = var.vcs_oauth_token_id
  }
}
