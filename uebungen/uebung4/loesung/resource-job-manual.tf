resource "azurerm_container_app_job" "manual_job" {
  name                         = "${data.azurerm_resource_group.rg.name}-manual-job"
  location                     = data.azurerm_resource_group.rg.location
  resource_group_name          = data.azurerm_resource_group.rg.name
  container_app_environment_id = data.azurerm_container_app_environment.environment.id
  replica_timeout_in_seconds   = 120

  manual_trigger_config {

  }

  template {
    container {
      name   = "manual-job-container"
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
