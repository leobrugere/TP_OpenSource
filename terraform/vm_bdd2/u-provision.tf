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
resource "azurerm_virtual_machine" "vm_bdd2" {
    count                 = "${var.count}"
    name                  = "vm_bdd2"
    location              = "${var.location}"
    resource_group_name   = "${var.rsg-name}"
    network_interface_ids = ["${element(azurerm_network_interface.nic_vm_bdd2.*.id, count.index)}"] 
    vm_size               = "Standard_A2"


    storage_os_disk {
        name              = "${var.vm-osdisk}_vm_bdd2"
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
        computer_name  = "vm-bdd2"
        admin_username = "${var.user-name}"
    }

    os_profile_linux_config {
        disable_password_authentication = true
        ssh_keys {
            path     = "/home/user01/.ssh/authorized_keys"
            key_data = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC6bKD+NFTGQTWKy7M+kb+jgcZwVutP6FksQjN5uFBe7XI0E2EWl61bBkjYugt4XHWuUOA25b6mDpUe6pOrTuPXKHaAx2PjgPfCotCi2DUB/5n39yGouoWLRLOD9U6mkSoqFkEKfp+NCOUmPifpkEn6Su5h50RV72Iiz6IcVzpFj5XDFUeWl5R1dbgX26jowCu/Z0kus7auV6R2s3j6jmz5toWd1ODK2rsO9fsTLor96+BPhfys6dKOEyMO+Sj8xPKX6NfBROaO0VINOAsB8u6VKK2AqTIAwsLjaeQ/GKVcwrO7leZi2eu9Y504HHRTttTwN39sENTnSktf8+HBRZRr"
        }
    }

/*     provisioner "remote-exec" {
    inline = 

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
