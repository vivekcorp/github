data "azurerm_resource_group" "datarg" {
  for_each = var.loganylytics
  name     = each.value.logresource_group_name
}
