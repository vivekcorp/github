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
