resource "random_string" "myrandom" {
  length  = 8
  special = true
  upper = false
}

# Create Virtual Network
resource "azurerm_virtual_network" "myvnet" {
  name                = "myvnet-1"
  address_space       = ["10.0.0.0/16"]
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
}

# Create Subnet
resource "azurerm_subnet" "mysubnet" {
  name                 = "mysubnet-1"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.myvnet.name
  address_prefixes     = ["10.0.2.0/24"]
}

# Create Public IP Address
resource "azurerm_public_ip" "mypublicip" {
  name                = "mypublicip-1"
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  allocation_method   = "Static"
  domain_name_label = "app1-vm-${random_string.myrandom.result}"
  tags = {
    environment = "Dev"
  }
}


variable "resource_group_name" {
  
}

variable "resource_group_location" {
  
}

output "subnet_id" {
  description = "The VM-NIC ID"
  value = azurerm_subnet.mysubnet.id
}
output "mypublicip_id" {
  description = "Public IP ID for the Vnet"
  value = azurerm_public_ip.mypublicip.id
}