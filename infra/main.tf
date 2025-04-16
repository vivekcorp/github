module "resource_group_name" {
    for_each = var.vivekRG
    source   = "./RG"
    vivekRG = var.vivekRG
}
module "nic" {
  for_each = var.networkin
  source   = "./nic"
}
