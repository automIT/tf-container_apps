resource "azurerm_container_app_environment" "environment" {
  name                         = local.container_app_env_name
  location                     = data.azurerm_resource_group.rg.location
  resource_group_name          = data.azurerm_resource_group.rg.name
}

