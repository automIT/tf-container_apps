resource "azurerm_container_app" "containerapp" {
  name                         = local.container_app_name
  container_app_environment_id = azurerm_container_app_environment.environment.id
  resource_group_name          = data.azurerm_resource_group.rg.name
  revision_mode                = "Single"


  ingress {
    external_enabled = true
    target_port      = 80
    traffic_weight {
      percentage      = 100
      latest_revision = true
    }
  }

  template {
    container {
      name   = "app"
      image  = "mcr.microsoft.com/azuredocs/aci-helloworld:latest"
      cpu    = var.cpu
      memory = var.memory
    }
  }

  # Den Tag "customer" setzt die Automatisierung auf Ebene der Resource Group,
  # er soll nicht bei jedem plan als Änderung auftauchen.
  lifecycle {
    ignore_changes = [tags["customer"]]
  }
}
