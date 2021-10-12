Vagrant.configure("2") do |config|

  config.vm.define "MySQL"
  config.vm.box = "ubuntu/trusty64"
  config.vm.network "private_network", ip: "192.168.1.50"
  config.vm.provision "shell", path: "mysql.sh"

  config.vm.provider "virtualbox" do |vb|
    vb.name = "MySQL"  
  end

end
