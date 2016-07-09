#
# Cookbook Name:: capistrano
# Recipe:: deploy
#
# Copyright 2014, bageljp
#
# All rights reserved - Do Not Redistribute
#

template "#{node['capistrano']['root_dir']}/config/deploy.rb" do
  owner "#{node['capistrano']['user']}"
  group "#{node['capistrano']['group']}"
  mode 00644
end

%w(
  production.rb
  staging.rb
  development.rb
).each do |t|
  template "#{node['capistrano']['root_dir']}/config/deploy/#{t}" do
    owner "#{node['capistrano']['user']}"
    group "#{node['capistrano']['group']}"
    mode 00644
    source "deploy_#{t}.erb"
  end
end

%w(
  none.rb
).each do |t|
  template "#{node['capistrano']['root_dir']}/lib/capistrano/#{t}" do
    owner "#{node['capistrano']['user']}"
    group "#{node['capistrano']['group']}"
    mode 00644
    source "lib_#{t}.erb"
  end
end

%w(
  none.rake
  tomcat.rake
  elb.rake
).each do |t|
  template "#{node['capistrano']['root_dir']}/lib/capistrano/tasks/#{t}" do
    owner "#{node['capistrano']['user']}"
    group "#{node['capistrano']['group']}"
    mode 00644
    source "tasks_#{t}.erb"
  end
end

