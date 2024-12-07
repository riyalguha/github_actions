module "resource_group" {
  source = "./modules/resource-group"
}

module "virtual_network" {
  source               = "./modules/virtual-network"
  resource_group_name  = module.resource_group.name
  resource_group_location = module.resource_group.location
}

module "virtual_machine" {
  source = "./modules/virtual-machine"
  resource_group_name  = module.resource_group.name
  resource_group_location = module.resource_group.location
}
