resource "azurerm_resource_group" "resource-group" {
  for_each = var.rg
  name     = each.value.rgname
  location = each.value.location
}
