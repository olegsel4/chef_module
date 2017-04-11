execute 'remove_conf' do
command "rm -rf /etc/httpd/conf.d/enablemain.conf"
end

template '/etc/httpd/conf.d/proxy_tomcat.conf' do
 source 'proxy_tomcat.erb'
end

service "httpd" do
  supports :start => true, :stop => true, :restart => true
  action [:enable, :start]
end

