module "containerapp_nginx" {
  source = "git::https://dev.azure.com/automITde/training/_git/tf_module_container_app?ref=1.0.1"

  ca_name                      = local.container_app_name
  resource_group_name          = data.azurerm_resource_group.rg.name
  container_app_environment_id = data.azurerm_container_app_environment.environment.id
  container_image              = "nginx:latest"
}
