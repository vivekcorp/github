# ─────────────────────────────────────────────
# Load Existing Managed Disks
# ─────────────────────────────────────────────
data "azurerm_managed_disk" "existing_datadisk" {
  for_each            = var.vmsetup
  name                = "${each.value.virtual_machine_name}-datadisk"
  resource_group_name = each.value.resource_group_name
}

# ─────────────────────────────────────────────
# Manage the Existing Disk - Only to Update Network Access
# ─────────────────────────────────────────────
resource "azurerm_managed_disk" "datadisk" {
  for_each              = var.vmsetup
  name                  = data.azurerm_managed_disk.existing_datadisk[each.key].name
  resource_group_name   = data.azurerm_managed_disk.existing_datadisk[each.key].resource_group_name
  location              = each.value.location  # Use location from the input variable
  storage_account_type  = "Standard_LRS" # Correct attribute for storage type
  create_option         = "Empty"
  disk_size_gb          = data.azurerm_managed_disk.existing_datadisk[each.key].disk_size_gb

  # Update the network access policy
  network_access_policy = "DenyAll"

  lifecycle {
    ignore_changes = [
      disk_size_gb,
      storage_account_type,
      create_option,
    ]
  }
}

# ─────────────────────────────────────────────
# Create Windows VMs
# ─────────────────────────────────────────────
resource "azurerm_windows_virtual_machine" "vmcode" {
  for_each = var.vmsetup
  name                = each.value.virtual_machine_name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  size                = "Standard_F2"
  admin_username      = data.azurerm_key_vault_secret.keyvaultuser[each.key].value
  admin_password      = data.azurerm_key_vault_secret.keyvaultpass[each.key].value
  network_interface_ids = [data.azurerm_network_interface.datanic[each.key].id]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
}

# ─────────────────────────────────────────────
# Attach Existing Disk to VM
# ─────────────────────────────────────────────
resource "azurerm_virtual_machine_data_disk_attachment" "datadisk_attachment" {
  for_each            = var.vmsetup
  managed_disk_id     = azurerm_managed_disk.datadisk[each.key].id
  virtual_machine_id  = azurerm_windows_virtual_machine.vmcode[each.key].id
  lun                 = 0
  caching             = "ReadWrite"
}
