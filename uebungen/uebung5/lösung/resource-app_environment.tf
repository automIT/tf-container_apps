resource "azurerm_container_app_environment" "environment" {
  name                         = "autworkshop15"
  location                     = data.azurerm_resource_group.rg.location
  resource_group_name          = data.azurerm_resource_group.rg.name
  log_analytics_workspace_id   = data.azurerm_log_analytics_workspace.existing.id
}