resource "azurerm_virtual_network" "vnet-ubuntu" {
    name                = "${var.vn-ubuntu}"
    address_space       = ["${var.vn-net-ubuntu}"]
    location            = "${var.location}"
    resource_group_name = "${var.rsg}"

    tags {
        environment = "${var.tag}"
    }
}

# Create subnet
resource "azurerm_subnet" "subnet" {
    name                 = "${var.vn-sub-ubuntu}"
    resource_group_name  = "${var.rsg}"
    virtual_network_name = "${azurerm_virtual_network.vnet-ubuntu.name}"
    address_prefix       = "${var.vn-sub-net-ubuntu}"
}