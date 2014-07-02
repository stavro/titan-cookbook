include_recipe 'titan::rexster'

#
# 1. Create Directories
#

directory node.titan.directory do
  recursive true
  owner 'root'
  action :create
end

#
# 2. Download Titan Archive
#

remote_file "#{node.titan.directory}/#{node.titan.archive_name}.zip" do
  source node.titan.archive_url
  owner "root"
  group "root"
  mode "0644"
  action :create_if_missing
end

#
# 3. Extract Titan
#

bash "install_titan" do
  cwd node.titan.directory
  not_if { ::File.directory?('titan_server') }
  
  code <<-EOL
    unzip #{node.titan.archive_name}.zip
    ln -s #{node.titan.archive_name} 'titan_server'
  EOL
end

#
# 4. Extend Rexster with Titan
#

remote_file "#{node.rexster.server_directory}/lib/titan-rexster-#{node.titan.version}.jar" do
  source node.titan.rexster_extension_url
  owner "root"
  group "root"
  mode "0644"
  action :create_if_missing
end

bash "extend_rexster_with_titan" do
  code <<-EOL
    rm -f #{node.rexster.server_directory}/ext/titan
    ln -s #{node.titan.directory}/titan_server/lib #{node.rexster.server_directory}/ext/titan
  EOL
end
