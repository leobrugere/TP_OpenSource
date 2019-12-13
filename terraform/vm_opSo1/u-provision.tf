locals {
  admin_username       = "user01"
  admin_password       = "theadminp@ssw0rd"
}

# Generate random text for a unique storage account name
resource "random_id" "randomId" {
    keepers = {
        # Generate a new ID only when a new resource group is defined
        resource_group = "${var.rsg-name}"
    }

    byte_length = 8
}

# Create storage account for boot diagnostics
resource "azurerm_storage_account" "mystorageaccount" {
    name                        = "diag${random_id.randomId.hex}"
    resource_group_name         = "${var.rsg-name}"
    location                    = "${var.location}"
    account_tier                = "Standard"
    account_replication_type    = "LRS"

    tags {
        environment = "${var.tag}"
    }
}

# Create virtual machine
resource "azurerm_virtual_machine" "vm" {
    count                 = "${var.count}"
    name                  = "vm-opSo1"
    location              = "${var.location}"
    resource_group_name   = "${var.rsg-name}"
    network_interface_ids = ["${element(azurerm_network_interface.nic_vm_opSo1.*.id, count.index)}"] 
    vm_size               = "Standard_A2"


    storage_os_disk {
        name              = "${var.vm-osdisk}_vm_opSo1"
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
        computer_name  = "vm-opSo${format("%02d", count.index)}"
        admin_username = "${var.user-name}"
    }

    os_profile_linux_config {
        disable_password_authentication = true
        ssh_keys {
            path     = "/home/user01/.ssh/authorized_keys"
            key_data = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDWSCsgVj3tavYnrk7IRETQt2nhI2KdAVkqm6tAdI0CwJE5R6mO39MqwJKOpeG8tXlrusDiPZmZHJL4PYoeMef1rmtPdB1k2imBjugjP0uPA4ddp+hzsitZyCah2ehCOopMtOAbP5Bg0TVpG8DPF5wMOcwMRFE058qmorJ5Ng1rukGsgwxP9YcgvmtWfirBWN2mg7WPWElhOLDZMhouf7uIt06GvbuaYYoh53HwkFg9emHKpANHqVfxlRIE7JN6M+1qq53lHgM06hUxVMVIoTGmNYEH04FFv2EhK5mYIPgRDevArnh/pDymXvO1Rprql/XmYy5oYmhFUWs8Rlu5oHLN raph@raph"
        }
    }

/*     provisioner "remote-exec" {
    inline = []
    connection {
      type        = "ssh"
      user        = "user01"
      private_key = "${file("~/.ssh/id_rsa")}"
    }
    } */
    boot_diagnostics {
        enabled = "true"
        storage_uri = "${azurerm_storage_account.mystorageaccount.primary_blob_endpoint}"
    }

    tags {
        environment = "${var.tag}"
    }
}