
Vagrant.configure("2") do |config|
 config.vm.define "chef_server" do |tom|
  tom.vm.hostname = "chefserver"
  tom.vm.box = "sbeliakou-vagrant-centos-6.8-x86_64.box"
  tom.vm.network "private_network", ip:"192.168.100.20"
  tom.vm.provider :virtualbox do |vb|
          vb.customize ["modifyvm", :id, "--memory", "4096"]
          vb.customize ["modifyvm", :id, "--cpus", "2"]
end
end
end

