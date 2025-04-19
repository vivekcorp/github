resource "azurerm_log_analytics_workspace" "log_analytics" {
for_each = var.loganylytics
  name                = each.value.workspace_name
  location            = each.value.location
  resource_group_name = data.azurerm_resource_group.datarg[each.key].resource_group_name
  sku                 = each.value.la_sku
  retention_in_days   = each.value.retention_in_days
}

resource "azurerm_application_insights" "app_insights" {
  for_each = var.loganylytics
  name                = each.value.app_insights_name
  location            = each.value.location
  resource_group_name = data.azurerm_resource_group.datarg[each.key].resource_group_name
  application_type    = each.value.application_type
  workspace_id        = azurerm_log_analytics_workspace.log_analytics.id
}
