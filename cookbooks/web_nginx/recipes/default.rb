#
# Cookbook Name:: web_nginx
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

web 'web_nginx' do 
  action [:install, :setup, :start]
  provider 'web_nginx'
end
