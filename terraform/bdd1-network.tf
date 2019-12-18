# Create public IPs
resource "azurerm_public_ip" "publicip_vm_bdd1" {
    count                        = "${var.count}"
    name                         = "${var.ip-pub-ubuntu}_vm_bdd1"
    location                     = "${var.location}"
    resource_group_name          = "${azurerm_resource_group.rsg-vm.name}"
    allocation_method            = "Static"

    tags {
        environment = "${var.tag}"
    }
}
# Create network interface
resource "azurerm_network_interface" "nic_vm_bdd1" {
    count                     = "${var.count}"
    name                      = "${var.nic-ubuntu}_vm_bdd1"
    location                  = "${var.location}"
    resource_group_name       = "${azurerm_resource_group.rsg-vm.name}"
    network_security_group_id = "${azurerm_network_security_group.nsg.id}"

    ip_configuration {
        name                          = "myNicConfiguration"
        subnet_id                     = "${azurerm_subnet.subnet.id}"
        private_ip_address_allocation = "dynamic"
        public_ip_address_id          = "${length(azurerm_public_ip.publicip_vm_bdd1.*.id) > 0 ? element(concat(azurerm_public_ip.publicip_vm_bdd1.*.id, list("")), count.index) : ""}"

    }

    tags {
        environment = "${var.tag}"
    }
}