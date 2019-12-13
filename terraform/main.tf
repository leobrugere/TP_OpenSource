terraform { 
  backend "azurerm" { 
    storage_account_name = "tfstate29056" 
    container_name       = "tfstate" 
    key                  = "terraform-tp.tfstate" 
    resource_group_name  = "admin-ci" 
  } 

}
module "vm_bdd1" {
  source = "vm_bdd1/"
  subnet = "${azurerm_subnet.subnet.id}"
  rsg-name = "${azurerm_resource_group.rsg-vm.name}"
}
module "vm_bdd2" {
  source = "vm_bdd2/"
  subnet = "${azurerm_subnet.subnet.id}"
  rsg-name = "${azurerm_resource_group.rsg-vm.name}"
}
module "vm_keepAliveD1" {
  source = "vm_keepAliveD1/"
  subnet = "${azurerm_subnet.subnet.id}"
  rsg-name = "${azurerm_resource_group.rsg-vm.name}"
}
module "vm_keepAliveD2" {
  source = "vm_keepAliveD2/"
  subnet = "${azurerm_subnet.subnet.id}"
  rsg-name = "${azurerm_resource_group.rsg-vm.name}"
}
module "vm_opSo1" {
  source = "vm_opSo1/"
  subnet = "${azurerm_subnet.subnet.id}"
  rsg-name = "${azurerm_resource_group.rsg-vm.name}"
}
module "vm_opSo2" {
  source = "vm_opSo2/"
  subnet = "${azurerm_subnet.subnet.id}"
  rsg-name = "${azurerm_resource_group.rsg-vm.name}"
}
module "vm_opSo3" {
  source = "vm_opSo3/"
  subnet = "${azurerm_subnet.subnet.id}"
  rsg-name = "${azurerm_resource_group.rsg-vm.name}"
}
module "vm_opSo4" {
  source = "vm_opSo4/"
  subnet = "${azurerm_subnet.subnet.id}"
  rsg-name = "${azurerm_resource_group.rsg-vm.name}"
}
