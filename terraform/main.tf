terraform { 
  backend "azurerm" { 
    storage_account_name = "tfstate29056" 
    container_name       = "tfstate" 
    key                  = "terraform-tp.tfstate" 
    resource_group_name  = "admin-ci" 
  }
}
/* resource "null_resource" "ansible_playbook"{
    provisioner "local-exec" {
      command = "ansible-playbook -u user01 ../ansible/plays/site.yml -i ../ansible/inventory.ini" 
    }
    depends_on = [
      "azurerm_virtual_machine.vm4",
  ]
} */
resource "random_id" "randomId" {
    keepers = {
        # Generate a new ID only when a new resource group is defined
        resource_group = "${azurerm_resource_group.rsg-vm.name}"
    }

    byte_length = 8
}
# Create storage account for boot diagnostics
resource "azurerm_storage_account" "mystorageaccount" {
    name                        = "diag${random_id.randomId.hex}"
    resource_group_name         = "${azurerm_resource_group.rsg-vm.name}"
    location                    = "${var.location}"
    account_tier                = "Standard"
    account_replication_type    = "LRS"

    tags {
        environment = "${var.tag}"
    }
}
