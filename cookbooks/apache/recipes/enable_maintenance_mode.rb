execute 'remove_conf' do
command "rm -rf /etc/httpd/conf.d/proxy_tomcat.conf"
end

template '/var/www/html/maintenance.html' do
 source 'maintenance.erb'
end

template '/etc/httpd/conf.d/enablemain.conf' do
 source 'enablemain.erb'
end

service "httpd" do
  supports :start => true, :stop => true, :restart => true
  action [:enable, :start]
end

