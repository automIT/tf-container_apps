data "azurerm_container_registry" "acr" {
  name                = var.registry_name
  resource_group_name = var.registry_resource_group_name
}
