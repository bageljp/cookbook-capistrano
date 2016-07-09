#
# Cookbook Name:: capistrano
# Recipe:: default
#
# Copyright 2014, bageljp
#
# All rights reserved - Do Not Redistribute
#

%w(
  capistrano
  aws-sdk
).each do |pkg|
  gem_package pkg
end

node['capistrano']['plugins'].each do |pkg|
  gem_package pkg
end

directory "#{node['capistrano']['root_dir']}" do
  owner "#{node['capistrano']['user']}"
  group "#{node['capistrano']['group']}"
  mode 00755
end

bash "init setup" do
  user "#{node['capistrano']['user']}"
  group "#{node['capistrano']['group']}"
  cwd "#{node['capistrano']['root_dir']}"
  code <<-EOC
    cap install
  EOC
  creates "#{node['capistrano']['root_dir']}/Capfile"
end

