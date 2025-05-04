################################################################################
#   ██████╗  ██████╗        ██████╗ ██████╗  ██████╗                           
#  ██╔════╝ ██╔═══██╗      ██╔════╝ ██╔══██╗██╔═══██╗                          
#  ██║  ███╗██║   ██║█████╗██║  ███╗██████╔╝██║   ██║                          
#  ██║   ██║██║   ██║╚════╝██║   ██║██╔═══╝ ██║   ██║                          
#  ╚██████╔╝╚██████╔╝      ╚██████╔╝██║     ╚██████╔╝                          
#   ╚═════╝  ╚═════╝        ╚═════╝ ╚═╝      ╚═════╝                           
################################################################################
module "rg_modules" {
  source      = "git::https://github.com/emifgarcia/terraform-modules.git//modules/rg?ref=v1.0.0"
  rg_name     = "rg-modules"
  rg_location = "East US"
  rg_tags = {
    environment = "test"
    owner       = "hugtec"
  }
}

################################################################################
#  ██╗   ██╗███╗   ██╗███████╗████████╗                                        
#  ██║   ██║████╗  ██║██╔════╝╚══██╔══╝                                        
#  ██║   ██║██╔██╗ ██║█████╗     ██║                                           
#  ██║   ██║██║╚██╗██║██╔══╝     ██║                                           
#  ╚██████╔╝██║ ╚████║███████╗   ██║                                           
#   ╚═════╝ ╚═╝  ╚═══╝╚══════╝   ╚═╝                                           
################################################################################
module "vnet_modules" {
  source             = "git::https://github.com/emifgarcia/terraform-modules.git//modules/vnet?ref=v1.0.0"
  rg_name            = module.rg_modules.rg_name
  rg_location        = module.rg_modules.rg_location
  vnet_name          = "vnet-modules"
  vnet_address_space = ["10.20.0.0/16"]
  vnet_tags = {
    environment = "test"
    owner       = "hugtec"
  }

}

################################################################################
#   ███████╗███╗   ██╗███████╗████████╗                                        
#   ██╔════╝████╗  ██║██╔════╝╚══██╔══╝                                        
#   █████╗  ██╔██╗ ██║█████╗     ██║                                           
#   ██╔══╝  ██║╚██╗██║██╔══╝     ██║                                           
#   ███████╗██║ ╚████║███████╗   ██║                                           
#   ╚══════╝╚═╝  ╚═══╝╚══════╝   ╚═╝                                           
################################################################################
module "snet_modules" {
  source              = "git::https://github.com/emifgarcia/terraform-modules.git//modules/snet?ref=v1.0.0"
  rg_name             = module.rg_modules.rg_name
  vnet_name           = module.vnet_modules.vnet_name
  snet_name           = "snet-modules"
  snet_address_prefix = ["10.20.0.0/24"]

}

################################################################################
#   ███╗   ██╗██╗ ██████╗                                                  
#   ████╗  ██║██║██╔════╝                                                  
#   ██╔██╗ ██║██║██║                                                      
#   ██║╚██╗██║██║██║                                                      
#   ██║ ╚████║██║╚██████╗                                                  
#   ╚═╝  ╚═══╝╚═╝ ╚═════╝                                                  
################################################################################
module "nic_modules" {
  source      = "git::https://github.com/emifgarcia/terraform-modules.git//modules/nic?ref=v1.0.0"
  nic_name    = "nic-modules"
  rg_name     = module.rg_modules.rg_name
  rg_location = module.rg_modules.rg_location
  snet_id     = module.snet_modules.snet_id

  nic_tags = {
    environment = "test"
    owner       = "hugtec"
  }

}
################################################################################
#  ██╗   ██╗███╗   ███╗                                                   
#  ██║   ██║████╗ ████║                                                   
#  ██║   ██║██╔████╔██║                                                   
#  ██║   ██║██║╚██╔╝██║                                                   
#  ╚██████╔╝██║ ╚═╝ ██║                                                   
#   ╚═════╝ ╚═╝     ╚═╝                                                   
################################################################################
module "vm_modules" {
  source      = "git::https://github.com/emifgarcia/terraform-modules.git//modules/vm?ref=v1.0.0"
  vm_name     = "vm-modules"
  rg_name     = module.rg_modules.rg_name
  rg_location = module.rg_modules.rg_location
  nic_id      = module.nic_modules.nic_id
  vm_tags = {
    environment = "test"
    owner       = "hugtec"
  }

}


################################################################################
#  ██████╗  ██████╗ ███████╗████████╗ ██████╗ ██████╗ ███████╗              
#  ██╔══██╗██╔═══██╗██╔════╝╚══██╔══╝██╔════╝ ██╔══██╗██╔════╝              
#  ██████╔╝██║   ██║███████╗   ██║   ██║  ███╗██████╔╝█████╗                
#  ██╔═══╝ ██║   ██║╚════██║   ██║   ██║   ██║██╔═══╝ ██╔══╝                
#  ██║     ╚██████╔╝███████║   ██║   ╚██████╔╝██║     ███████╗              
#  ╚═╝      ╚═════╝ ╚══════╝   ╚═╝    ╚═════╝ ╚═╝     ╚══════╝              
################################################################################
module "psql_modules" {
  source      = "git::https://github.com/emifgarcia/terraform-modules.git//modules/db?ref=v1.0.0"
  server_name = "psql-modules"
  rg_name     = module.rg_modules.rg_name
  rg_location = module.rg_modules.rg_location
  psql_tags = {
    environment = "test"
    owner       = "hugtec"
  }

}