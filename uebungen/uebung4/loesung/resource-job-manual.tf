resource "azurerm_container_app_job" "manual_job" {
  name                          = "${data.azurerm_resource_group.rg.name}-manual-job"
  location                      = data.azurerm_resource_group.rg.location
  resource_group_name           = data.azurerm_resource_group.rg.name
  container_app_environment_id  = data.azurerm_container_app_environment.environment.id
  replica_timeout_in_seconds    = 1800

  manual_trigger_config {
    
  }

  template {
    container {
      name   = "manual-job-container"
      image  = "mcr.microsoft.com/azuredocs/aci-helloworld:latest"
      cpu    = "0.25"
      memory = "0.5Gi"
    }
  }
}