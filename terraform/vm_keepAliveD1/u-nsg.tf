
# Create Network Security Group and rule
resource "azurerm_network_security_group" "nsg" {
    name                = "${var.vn-net-ubuntu-nsg}"
    location            = "${var.location}"
    resource_group_name = "${var.rsg-name}"

    security_rule {
        name                       = "allowall"
        priority                   = 1005
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "*"
        source_port_range          = "*"
        destination_port_range     = "*"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
    }

    tags {
        environment = "${var.tag}"
    }
}
