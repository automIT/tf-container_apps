data "azurerm_container_app_environment" "environment" {
  name                         = "atworkshop15"
  resource_group_name          = data.azurerm_resource_group.rg.name
}

