resource "azurerm_log_analytics_workspace" "log_analytics" {
  name                = var.workspace_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = var.la_sku
  retention_in_days   = var.retention_in_days
}

resource "azurerm_application_insights" "app_insights" {
  name                = var.app_insights_name
  location            = var.location
  resource_group_name = var.resource_group_name
  application_type    = var.application_type
  workspace_id        = azurerm_log_analytics_workspace.log_analytics.id
}
