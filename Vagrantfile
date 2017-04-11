Vagrant.configure("2") do |config|
config.vm.box="/home/student/Desktop/CM_Vagrant/sbeliakou-vagrant-centos-6.8-x86_64.box"
config.vm.network "public_network", bridge: "eno1",use_dhcp_assigned_default_route: true  
  config.vm.define "VM1" do |vm1|
  vm1.vm.hostname ="Node1"
  vm1.vm.network "private_network", ip:"192.168.100.30"
  vm1.vm.provider :virtualbox do |vb|
          vb.customize ["modifyvm", :id, "--memory", "2048"]
  end
end
    config.vm.define "VM2" do |vm2|
  vm2.vm.hostname ="Node2"
  vm2.vm.network "private_network", ip:"192.168.100.31"
  vm2.vm.provider :virtualbox do |vb|
          vb.customize ["modifyvm", :id, "--memory", "2048"]
  end     
end
end
