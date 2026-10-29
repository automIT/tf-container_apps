resource "azurerm_container_registry" "acr" {
  name                = var.registry_name
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = data.azurerm_resource_group.rg.location
  sku                 = var.registry_sku
  admin_enabled       = false
}
