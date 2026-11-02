resource "azurerm_container_app_job" "scheduled_job" {
  name                         = "${data.azurerm_resource_group.rg.name}-scheduled-job"
  location                     = data.azurerm_resource_group.rg.location
  resource_group_name          = data.azurerm_resource_group.rg.name
  container_app_environment_id = data.azurerm_container_app_environment.environment.id
  replica_timeout_in_seconds   = 120

  schedule_trigger_config {
    cron_expression = "*/5 * * * *" # alle 5 Minuten (UTC)
  }

  template {
    container {
      name   = "scheduled-job-container"
      image  = "mcr.microsoft.com/k8se/quickstart-jobs:latest"
      cpu    = 0.25
      memory = "0.5Gi"
    }
  }

  # Den Tag "customer" setzt die Automatisierung auf Ebene der Resource Group,
  # er soll nicht bei jedem plan als Änderung auftauchen.
  lifecycle {
    ignore_changes = [tags["customer"]]
  }
}
