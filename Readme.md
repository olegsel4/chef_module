Task 1:

Install chef_client and chefDK on VM box

Create solo.rb and Runlist.json

Download chef_nginx and iptables 

Make cookbooks by berks install & berks package

install cookbooks by solo.rb

Task 2:

Download firewall from git

Make by berks

Ensure /firewall/recipes/default.rb by necessary ports

Ensure /firewall/attributes/default.rb by "true" in ssh

Ensure /chef_nginx/artributes/default.rb by "8083" port (4 row in classroom)

Ensure runlist.json by new "firewall" recipe

reinstsall cookbooks by solo.rb
