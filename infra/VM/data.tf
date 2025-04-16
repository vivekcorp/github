data "azurerm_key_vault_secret" "keyvaultuser" {
  for_each = var.vmsetup
   name         = "vivekkeyvaultinfrauser"
  key_vault_id = data.azurerm_key_vault.keyvault[each.key].id

}

data "azurerm_key_vault_secret" "keyvaultpass" {
  for_each = var.vmsetup
  name         = "vivekkeyvaultinfrapass"
  key_vault_id = data.azurerm_key_vault.keyvault[each.key].id

}

data "azurerm_key_vault" "keyvault" {
  for_each = var.vmsetup
  name                = each.value.keyval_name
  resource_group_name = each.value.resource_group_namekv
}

data "azurerm_network_interface" "datanic" {
  for_each = var.vmsetup
  name                = each.value.network_interface_name
  resource_group_name = each.value.resource_group_name
}
