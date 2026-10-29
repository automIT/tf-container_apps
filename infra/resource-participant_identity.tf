# One user assigned identity per participant (<login>-uami in the participant's resource group).
# It is created before the training, so the AcrPull role assignment has propagated
# and participants only reference it via a data source (exercise 6).
resource "azurerm_user_assigned_identity" "participant" {
  for_each            = local.participants
  name                = "${each.key}-uami"
  resource_group_name = data.azurerm_resource_group.participant[each.key].name
  location            = data.azurerm_resource_group.participant[each.key].location
}

resource "azurerm_role_assignment" "acr_pull" {
  for_each             = local.participants
  scope                = azurerm_container_registry.acr.id
  role_definition_name = "AcrPull"
  principal_id         = azurerm_user_assigned_identity.participant[each.key].principal_id
}
