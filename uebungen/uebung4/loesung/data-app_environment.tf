data "azurerm_container_app_environment" "environment" {
  name                         = local.container_app_env_name
  resource_group_name          = data.azurerm_resource_group.rg.name
}

