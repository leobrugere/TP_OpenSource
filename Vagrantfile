
Vagrant.configure("2") do |config|


  config.vm.box = "centos/7"
  config.vm.box_check_update = false

  config.vm.define "h1" do |host1|
    host1.vm.network "private_network", ip: "192.168.56.10"
  end
  config.vm.define "h2" do |host2|
    host2.vm.network "private_network", ip: "192.168.56.11"
  end
  config.vm.provision "shell", inline: <<-SHELL
    yum -q -y install epel-release
    yum -q -y install keepalived
  SHELL
end
