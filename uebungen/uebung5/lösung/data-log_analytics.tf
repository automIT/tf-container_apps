data "azurerm_log_analytics_workspace" "existing" {
  name                = "existing-log-analytics-workspace"
  resource_group_name = "already-existing-rg"
}