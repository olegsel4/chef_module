#
# Cookbook:: jboss
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

node.override['java']['jdk_version'] = '7'

include_recipe "java::default"

yum_package 'unzip' do
  action :install
end

execute 'untar_jboss' do
  cwd node['jboss']['install_folder']
  command 'tar -xf /vagrant/jboss-as-7.1.1.Final.tar.gz'
  not_if { ::File.directory?("#{node[:jboss][:jboss_home]}")}
end

#execute 'change_owner_to_jboss' do
#  command "chown -R #{node['jboss']['user']}:#{node['jboss']['user']} #{node['jboss']['jboss_home']}"
#end

execute 'unzip_app' do
  command "unzip /vagrant/hudson.zip -d #{node['jboss']['deploy_folder']}"
  not_if { ::File.directory?("#{node[:jboss][:deploy_folder]}/hudson")}
end
 
 template "/etc/init.d/jboss" do
  source "jboss_init_script.erb"
  mode "0755"
  owner "root"
  group "root"
 variables({
    :home => node[:jboss][:jboss_home]
})
notifies :restart, 'service[jboss]', :immediately
end

template "#{node['jboss']['deploy_folder']}/hudson/hudson.xml" do
  source "hudson.erb"
  variables ({
  'engine' => data_bag_item('databag', 'hudson')['engine']
})
end

service "jboss" do
  supports :start => true, :stop => true, :restart => true
  action [:enable, :start]
end
