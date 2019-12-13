resource "azurerm_resource_group" "rsg-vm" {
  name     = "${var.rsg}"
  location = "${var.location}"
  tags {
      environment = "${var.tag}"
    }
}