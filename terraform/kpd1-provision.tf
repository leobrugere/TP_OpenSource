# Create virtual machine
resource "azurerm_virtual_machine" "vm_keepAliveD1" {
    count                 = "${var.count}"
    name                  = "vm_keepAliveD1"
    location              = "${var.location}"
    resource_group_name   = "${azurerm_resource_group.rsg-vm.name}"
    network_interface_ids = ["${element(azurerm_network_interface.nic_vm_keepAliveD1.*.id, count.index)}"] 
    vm_size               = "Standard_A2"


    storage_os_disk {
        name              = "${var.vm-osdisk}_vm_keepAliveD1"
        caching           = "ReadWrite"
        create_option     = "FromImage"
        managed_disk_type = "Standard_LRS"
    }

    storage_image_reference {
        publisher = "Canonical"
        offer     = "UbuntuServer"
        sku       = "18.04-LTS"
        version   = "latest"
    }

    os_profile {
        computer_name  = "vm-keepAliveD1"
        admin_username = "${var.user-name}"
    }

    os_profile_linux_config {
        disable_password_authentication = true
        ssh_keys {
            path     = "/home/user01/.ssh/authorized_keys"
            key_data = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDDojDa9lAK46TLwvbQqi5RWFZcLjHA96hTvNuRjdCUETg8dKx8S3UWIu6IBCmrIaIgMiPX17Vb+gorDnUQ741z9vFiy4G3LM+RzGLmrlhztnFrW5cwzwREn9ydFI0CCTGhiYMBbjBScHhgG++ZRqi99TG1VzPzignebECU56ETfalg2QEd4tg9MJEMOD5EvLxOA0DEEjGZFo2PVLszGafIRlyRc/RBM84ANhJd1hxIoHn6UhVc60SHRzjnU/lcKd1NsF956B6TF6YD8GTy56qCzD2CbxU0QzjMxAXRrbh63Yg3seqngtAT4DngdhOeCCk5Ny4hNjKOBnPflNN12HUp pichel@pichel-HP"
        }
    }
/*   provisioner "local-exec" {
    command = "ansible-playbook -u user01 ../ansibleKeep/plays/site.yml -i ../ansibleKeep/inventory.ini" 
  } */
    boot_diagnostics {
        enabled = "true"
        storage_uri = "${azurerm_storage_account.mystorageaccount.primary_blob_endpoint}"
    }

    tags {
        environment = "${var.tag}"
    }
    depends_on = [
      "azurerm_virtual_machine.vm_bdd2",
    ]
}
