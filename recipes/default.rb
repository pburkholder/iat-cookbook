#
# Cookbook Name:: iat-cookbook
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

package 'unzip'
httpd_module 'php5'

remote_file '/root/master.zip' do
  source 'https://github.com/winteram/IAT/archive/master.zip'
end

execute 'unzip_iat' do
  command 'unzip /root/master.zip; chown -R www-data /var/www/IAT-master'
  cwd '/var/www'
  creates '/var/www/IAT-master'
end

# php test file
file '/var/www/IAT-master/test.php' do
  content '<?php phpinfo(); ?>'
  owner 'www-data'
end

httpd_config 'default' do
  source 'site.conf.erb'
  notifies :restart, 'httpd_service[default]'
  action :create
end

httpd_service 'default' do
  action [:create, :start]
  mpm 'prefork'
  subscribes :restart, 'execute[unzip_iat]'
end
