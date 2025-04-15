module "resource_group_name" {
    for_each = var.vivekRG
    source   = "./RG"
    name     = each.value.name
    location = each.value.location
  
}
