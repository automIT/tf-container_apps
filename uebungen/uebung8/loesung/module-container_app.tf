module "containerapp_helloworld" {
  source = "git::https://github.com/automIT/tf_module_container_app.git?ref=2.0.0"

  ca_name                      = local.container_app_name
  resource_group_name          = data.azurerm_resource_group.rg.name
  container_app_environment_id = data.azurerm_container_app_environment.environment.id
  container_image              = "azuredocs/aci-helloworld:latest"

  # Tags der Resource Group übernehmen (u. a. "customer" aus der Automatisierung),
  # sonst zeigt jeder plan eine Änderung an den Tags.
  tags = data.azurerm_resource_group.rg.tags

  # Optionale Aufgabe: eigene Startseite statt der Standardseite des Images
  mounted_files = [
    {
      path    = "/usr/src/app/index.html"
      content = var.welcome_html
    }
  ]
}
