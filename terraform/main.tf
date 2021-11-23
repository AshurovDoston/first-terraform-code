resource "azurerm_resource_group" "example1" {
  name     = "TerraRG"
  location = "East US"
}

resource "azurerm_kubernetes_cluster" "AKS" {
  name                = "TerraAKS"
  location            = "East US"
  resource_group_name = "TerraRG"
  dns_prefix          = "qwer123-k8s"

  default_node_pool {
    name       = "terrapool"
    node_count = 1
    vm_size    = "Standard_B2s"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Production"
  }
}

# output "client_certificate" {
#   value = azurerm_kubernetes_cluster.example.kube_config.0.client_certificate
# }

# output "kube_config" {
#   value = azurerm_kubernetes_cluster.example.kube_config_raw

#   sensitive = true
# }
