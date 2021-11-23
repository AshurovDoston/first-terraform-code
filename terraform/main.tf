terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.46.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}

}
resource "azurerm_resource_group" "example" {
  name     = "TerraRG"
  location = "east us"
}

resource "azurerm_network_security_group" "network_security" {
  name                = "network_security"
  location            = "East US"
  resource_group_name = "TerraRG"
}

resource "azurerm_network_ddos_protection_plan" "ddos" {
  name                = "TerraDDOSplan"
  location            = "East US"
  resource_group_name = "TerraRG"
}

resource "azurerm_virtual_network" "VNet" {
  name                = "TerraVNet"
  location            = "East US"
  resource_group_name = "TerraRG"
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

#   ddos_protection_plan {
#     id     = azurerm_network_ddos_protection_plan.example.id
#     enable = true
#   }

  subnet {
    name           = "TerraSubnet1"
    address_prefix = "10.0.1.0/24"
  }

  subnet {
    name           = "TerraSubnet2"
    address_prefix = "10.0.2.0/24"
  }

#   subnet {
#     name           = "subnet3"
#     address_prefix = "10.0.3.0/24"
#     security_group = azurerm_network_security_group.example.id
#   }

#   tags = {
#     environment = "Production"
#   }
}
