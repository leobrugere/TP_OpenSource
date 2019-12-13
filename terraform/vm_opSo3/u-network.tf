# Create public IPs
resource "azurerm_public_ip" "publicip_vm_opSo3" {
    count                        = "${var.count}"
    name                         = "${var.ip-pub-ubuntu}_vm_opSo3"
    location                     = "${var.location}"
    resource_group_name          = "${var.rsg-name}"
    allocation_method            = "Static"

    tags {
        environment = "${var.tag}"
    }
}
# Create network interface
resource "azurerm_network_interface" "nic_vm_opSo3" {
    count                     = "${var.count}"
    name                      = "${var.nic-ubuntu}_vm_opSo3"
    location                  = "${var.location}"
    resource_group_name       = "${var.rsg-name}"
    network_security_group_id = "${azurerm_network_security_group.nsg.id}"

    ip_configuration {
        name                          = "myNicConfiguration"
        subnet_id                     = "${var.subnet}"
        private_ip_address_allocation = "dynamic"
        public_ip_address_id          = "${length(azurerm_public_ip.publicip_vm_opSo3.*.id) > 0 ? element(concat(azurerm_public_ip.publicip_vm_opSo3.*.id, list("")), count.index) : ""}"

    }

    tags {
        environment = "${var.tag}"
    }
}