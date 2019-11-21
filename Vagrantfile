# Require the Azure provider plugin
require 'vagrant-azure'

# Create and configure the Azure VMs
Vagrant.configure('2') do |config|

  # Use dummy Azure box
  config.vm.box = 'azure-dummy'

  # Specify SSH key
  config.ssh.private_key_path = '~/.ssh/id_rsa'

  # Configure the Azure provider
  config.vm.provider 'azure' do |az, override|
    # Pull Azure AD service principal information from environment variables
    az.tenant_id = '87bf3584-6de5-4095-931c-233c8ca91305'
    az.client_id = '566a5d26-92d4-4d19-ba6d-04ca36e8f165'
    az.client_secret ='84e4626b-dac3-43f7-9a62-7b9a7ee32bb0'
    az.subscription_id = 'e60e9098-2f98-4ea4-bd32-a6ae88c2af33'

    # Specify VM parameters
    az.vm_name = 'aztest'
    az.vm_size = 'Standard_B1s'
    az.vm_image_urn = 'Canonical:UbuntuServer:16.04-LTS:latest'
    az.resource_group_name = 'vagrant'
  end # config.vm.provider 'azure'
end # Vagrant.configure