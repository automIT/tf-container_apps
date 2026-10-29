# The participant resource groups must already exist.
data "azurerm_resource_group" "participant" {
  for_each = local.participants
  name     = each.key
}
