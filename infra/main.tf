module "resource_group_name" {
    for_each = var.vivekRG
    source   = "./RG"
    vivekRG = var.vivekRG
  
}
module "nic" {
  for_each = var.networkin
  depends_on = [ module.Vnet ]
  source   = "./nic"
    networkin = var.networkin

}
module "nsg" {
  for_each = var.nsggroup
  depends_on = [ module.resource_group_name ]
  source   = "./nsg"
  nsggroup = var.nsggroup
  
}
module "Vnet" {
    for_each = var.VMVnet
    depends_on = [ module.resource_group_name ]
    source   = "./Vnet"
    VMVnet = var.VMVnet
  
}

module "vmsetup" {
  for_each = var.vmsetup
  depends_on = [ module.nic ]
  source   = "./VM"
  vmsetup = var.vmsetup
   
}
module "Publicip" {
  for_each = var.publicip
  depends_on = [ module.resource_group_name ]
  source   = "./Publicip"
  publicip = var.publicip
  
}
module "Subnet" {
  for_each = var.subnetv
  depends_on = [ module.VMVnet]
  source   = "./subnet"
  subnetv = var.subnetv
  
}
