resource "azurerm_resource_group" "myrg" {

  for_each = var.resource_groups

  name     = each.key
  location = each.value.location
}

