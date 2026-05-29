
resource "azurerm_resource_group" "gawar" {
  for_each = var.veeru
  name     = each.value.resource_group_name
  location = each.value.location

}


resource "azurerm_storage_account" "basanti" {
  for_each = var.veeru

  name                     = each.value.name
  location                 = azurerm_resource_group.gawar[each.key].location
  resource_group_name      = azurerm_resource_group.gawar[each.key].name
  account_tier             = each.value.account_tier
  account_replication_type = each.value.account_replication_type

}