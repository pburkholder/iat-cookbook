#
# Cookbook Name:: iat-cookbook
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.


remote_file '/root/master.zip' do
  source 'https://github.com/winteram/IAT/archive/master.zip'
end
