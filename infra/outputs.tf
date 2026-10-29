output "login_server" {
  description = "Login server of the container registry"
  value       = azurerm_container_registry.acr.login_server
}

output "images" {
  description = "Fully qualified image references for the exercises"
  value       = [for image in keys(var.images) : "${azurerm_container_registry.acr.login_server}/${image}"]
}

output "participant_identities" {
  description = "User assigned identity per participant"
  value       = { for k, v in azurerm_user_assigned_identity.participant : k => v.id }
}
