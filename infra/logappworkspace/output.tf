output "log_analytics_workspace_ids" {
  description = "Map of Log Analytics Workspace IDs"
  value = {
    for key, workspace in azurerm_log_analytics_workspace.log_analytics :
    key => workspace.id
  }
}

output "app_insights_instrumentation_keys" {
  description = "Map of Application Insights Instrumentation Keys"
  value = {
    for key, ai in azurerm_application_insights.app_insights :
    key => ai.instrumentation_key
  }
}

output "app_insights_connection_strings" {
  description = "Map of Application Insights Connection Strings"
  value = {
    for key, ai in azurerm_application_insights.app_insights :
    key => ai.connection_string
  }
}
