
Vagrant.configure("2") do |config|
 config.vm.define "chef" do |tom|
  tom.vm.hostname = "chef"
  tom.vm.box = "sbeliakou-vagrant-centos-6.8-x86_64.box"
  tom.vm.network "private_network", ip:"192.168.100.50"
  tom.vm.provider :virtualbox do |vb|
          vb.customize ["modifyvm", :id, "--memory", "1512"]
end
end
end

