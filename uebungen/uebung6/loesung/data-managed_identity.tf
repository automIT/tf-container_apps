# Created by the trainer beforehand (infra/) incl. AcrPull on the registry.
data "azurerm_user_assigned_identity" "acr_pull" {
  name                = local.identity_name
  resource_group_name = data.azurerm_resource_group.rg.name
}
