terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.5.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "terraform_state"
    storage_account_name = "maxterrastore"
    container_name       = "maxcontainer"
    key                  = "terraform.tfstate"
    access_key           = "730SvO7Rp697m4NABAaZdK+FZk4vAMP0GaMEPOUy2UpOGqcjsCfEcCo3F+5HJlsNKzXE0eCIq6Ys+AStOJCSSg=="
    
  }
}

provider "azurerm" {
  features {}
}


variable "imagebuild" {
  type        = string
  description = "Latest Image Build"
}



resource "azurerm_resource_group" "tf_test" {
  name     = "max-rg"
  location = "Central Us"
}

resource "azurerm_container_group" "tfcg_test" {
  name                = "weatherapi"
  location            = azurerm_resource_group.tf_test.location
  resource_group_name = azurerm_resource_group.tf_test.name

  ip_address_type = "Public"
  dns_name_label  = "maxcontainer"
  os_type         = "Linux"

  container {
    name   = "weatherapi"
    image  = "scorpionrevolver/weatherapi:${var.imagebuild}"
    cpu    = "1"
    memory = "1"

    ports {
      port     = 80
      protocol = "TCP"
    }
  }
}