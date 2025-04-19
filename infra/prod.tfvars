networkin = {
  netnic1 = {
    name                 = "nicvik1"
    resource_group_name  = "tumtumrg"
    subname              = "vksub1"
    virtual_network_name = "Jhulelal"

  }

}
nsggroup = {
  ns1 = {
    name                = "vknsgv1"
    resource_group_name = "tumtumrg"
    location= "westus"
    virtual_network_name= "jhulelal"
    subname="vksub1"
  }
  
}
publicip={
    pub1={
name         = "publicvk"
resource_group_name = "tumtumrg"
sku                 = "Standard"
}
}
vivekRG = {
  vk = {
    name     = "tumtumrg"
    location = "westus"
  }

}
vkst = {
  vktri = {
     name                  = "vkstroage1"
  resource_group_name      = "tumtumrg"
  location                 = "westus"
  account_tier             = "Standard"
  account_replication_type = "LRS"
  }

}

subnetv = {
  vk1 = {
    name                 = "vksub1"
    resource_group_name  = "tumtumrg"
    virtual_network_name = "Jhulelal"
    address_prefixes     = ["10.0.1.0/24"]
    location ="westus"
    
  }
}

vmsetup ={
    vm1={
    virtual_machine_name="vivekvm135" 
    location ="westus"
    resource_group_name="tumtumrg"
    resource_group_namekv="transinfra"
    network_interface_name="nicvik1"
    keyval_name ="vivekkeyvaultinfra"
    keypassname         = "vivekkeyvaultinfrapass"
    keypassuser     = "vivekkeyvaultinfrauser"
   
       }
}

VMVnet = {
  vnet = {
    name = "Jhulelal"
    resource_group_name = "tumtumrg"
    address_space = ["10.0.0.0/16"]
    }
  }
loganylytics = {
 logg = {
    resource_group_name  = "tumtumrg"
    location             = "westus"
    workspace_name       = "my-loganalytics"
    la_sku               = "PerGB2018"
    retention_in_days    = 30
    app_insights_name    = "my-appinsights"
    application_type     = "web"

}

}
