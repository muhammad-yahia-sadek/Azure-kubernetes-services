provider "azurerm" {
  features {}
}

terraform {
  backend "azurerm" {
    storage_account_name = "demoterraformstatest"
    container_name       = "terraform-state"
    key                  = "demo-azure-web-azure.terraform.tfstate"
    # Can also be set via `ARM_ACCESS_KEY` environment variable.
    # access_key           = "abcdefghijklmnopqrstuvwxyz0123456789..."  
  }
}

# STORAGE_ACCOUNT_ACCESS_KEY
# variable "storage_account_access_key" {
#   description = "The public SSH key to use for the virtual machine."
#   type        = string
# }
