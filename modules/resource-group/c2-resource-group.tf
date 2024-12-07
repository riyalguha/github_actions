# Resource-1: Azure Resource Group
resource "azurerm_resource_group" "myrg" {
  name = "myrg-1"
  location = "West Europe"
}

output "name" {
  value = azurerm_resource_group.myrg.name
}

output "resource_group_location" {
  value = azurerm_resource_group.myrg.location
}