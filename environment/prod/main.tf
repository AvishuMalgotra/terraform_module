module "rg" {
  source = "../../resources/rg"
  rg     = var.rg
}

module "vnet" {
  depends_on = [module.rg]
  source     = "../../resources/vnet"
  vnet       = var.vnet
}

module "azurerm_subnet" {
  depends_on = [module.vnet]
  source     = "../../resources/subnet"
  snet       = var.snet
}

module "azurerm_public_ip" {
  depends_on = [module.azurerm_subnet]
  source     = "../../resources/publicip"
  pip        = var.pip
}

module "azurerm_linux_virtual_machine" {
  depends_on = [module.azurerm_public_ip]
  source     = "../../resources/vm"
  vm         = var.vm
}
