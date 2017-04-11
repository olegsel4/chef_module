#
# Cookbook:: apache
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

node.override['java']['jdk_version'] = '7'
include_recipe "java::default"

yum_package 'unzip' do
  action :install
end

yum_package 'httpd' do
  action :install
end

template '/etc/httpd/conf.d/proxy_tomcat.conf' do
  source 'proxy_tomcat.erb'
end

execute 'install_tomcat' do
command "yum install -y tomcat tomcat-admin-webapps tomcat-native log4j tomcat-webapps"
end

execute 'unzip_app' do
  command "unzip /vagrant/testweb.zip -d /usr/share/tomcat/webapps"
  not_if { ::File.directory?("/usr/share/tomcat/webapps/testweb")}
end
 
execute 'kost' do
  command "mv /usr/share/tomcat/webapps/testweb/testweb.* /usr/share/tomcat/webapps"
  not_if { ::File.directory?("/usr/share/tomcat/webapps/")}
end

service "httpd" do
  supports :start => true, :stop => true, :restart => true
  action [:enable, :start]
end

service "tomcat" do
  supports :start => true, :stop => true, :restart => true
  action [:enable, :start]
end


