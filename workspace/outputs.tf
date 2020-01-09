output "external_id" {
  description = "The external ID of the workspace"
  value       = tfe_workspace.workspace.external_id
}

output "id" {
  description = "The human-readable ID of the workspace"
  value       = tfe_workspace.workspace.id
}