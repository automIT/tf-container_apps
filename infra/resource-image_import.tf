# Imports the images used in the exercises into the registry.
# Requires a logged-in Azure CLI (az login) with push rights on the registry.
# Re-runs when the registry is recreated or the source image changes.
resource "terraform_data" "image_import" {
  for_each = var.images

  triggers_replace = [azurerm_container_registry.acr.id, each.value]

  provisioner "local-exec" {
    command = "az acr import --name ${azurerm_container_registry.acr.name} --subscription ${var.subscription_id} --source ${each.value} --image ${each.key} --force"
  }
}
