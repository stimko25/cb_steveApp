#
# Cookbook Name:: steveApp
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.


node.default['nginx']['default_root']= '/usr/share/nginx/html2'

yum_package "git" do
  action :install
end

include_recipe "nginx"

directory "/usr/share/nginx/html" do
  recursive true
  action :delete
end

git "/usr/share/nginx/html" do
  repository "https://github.com/stimko25/function4.git"
  reference "master"
  action :sync
end
