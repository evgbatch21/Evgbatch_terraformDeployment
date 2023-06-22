#section-01



terraform{
 backend "azurerm" {
    resource_group_name  = "statefiles_storage"
    storage_account_name = "statefilestporageevg"
    container_name       = "evgbatchstatefile"
    key                  = "mystatefileone"
  }
}
provider "azurerm" {
  subscription_id = "1aa9e9b7-cb63-4f44-9677-d38184590405"
  features {}
}
#section -02 (rg details)
resource "azurerm_resource_group" "ResourceGroup" {
  name = "Resourcegroupone"
  location = "eastus"
}


resource "azurerm_storage_account" "usecaseone" {
  name                     = "storageactestone"
  resource_group_name      = azurerm_resource_group.ResourceGroup.name
  location                 = azurerm_resource_group.ResourceGroup.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_account" "usecasetwo" {
  name                     = "storageactesttwo"
  resource_group_name      = azurerm_resource_group.ResourceGroup.name
  location                 = azurerm_resource_group.ResourceGroup.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}