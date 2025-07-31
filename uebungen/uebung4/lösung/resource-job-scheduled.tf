resource "azurerm_container_app_job" "scheduled_job" {
  name                          = "${var.name}-scheduled-job"
  location                      = data.azurerm_resource_group.rg.location
  resource_group_name           = data.azurerm_resource_group.rg.name
  container_app_environment_id  = data.azurerm_container_app_environment.environment.id
  replica_timeout_in_seconds    = 60

  schedule_trigger_config {
    cron_expression = "* * * * *"
  }

  template {
    container {
      name   = "scheduled-job-container"
      image  = "mcr.microsoft.com/azuredocs/aci-helloworld:latest"
      cpu    = "0.25"
      memory = "0.5Gi"
    }
  }

}
