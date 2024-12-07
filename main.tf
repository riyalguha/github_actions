module "resource_group" {
  source = "./modules/c2-resource-group"
}

module "virtual_network" {
  source               = "./modules/c3-virtual-network"
  resource_group_name  = module.resource_group.name
  resource_group_location = module.resource_group.location
}

module "virtual_machine" {
  source = "./modules/c4-virtual-machine"
  resource_group_name  = module.resource_group.name
  resource_group_location = module.resource_group.location
}
