include_recipe 'titan::templates'
include_recipe 'titan::services'

#
# 1. Create Directories
#

[node.rexster.directory, node.rexster.log_dir, node.rexster.pid_dir].each do |dir|
  directory dir do
    recursive true
    owner 'root'
    group 'root'
    action :create
  end
end

#
# 2. Extract Rexster Console
#

remote_file "#{node.rexster.directory}/#{node.rexster.console_archive}.zip" do
  source node.rexster.console_archive_url
  owner "root"
  group "root"
  mode "0644"
  action :create_if_missing
end

bash "unzip_rexster_console" do
  cwd node.rexster.directory
  not_if { ::File.directory?(node.rexster.console_directory) }
  
  code <<-EOL
    unzip #{node.rexster.console_archive}.zip
    ln -s #{node.rexster.console_archive} #{node.rexster.console_directory}
  EOL
end

#
# 3. Extract Rexster Server
#

remote_file "#{node.rexster.directory}/#{node.rexster.server_archive}.zip" do
  source node.rexster.server_archive_url
  owner "root"
  group "root"
  mode "0644"
  action :create_if_missing
end

bash "extract_rexster_server" do
  cwd node.rexster.directory
  not_if { ::File.directory?(node.rexster.server_directory) }
  
  code <<-EOL
    unzip #{node.rexster.server_archive}.zip
    ln -s #{node.rexster.server_archive} #{node.rexster.server_directory}
  EOL

  notifies :create, "template[log4j_properties]", :immediately
  notifies :create, "template[rexster_xml]", :immediately
  notifies :create, "template[rexster_initd]", :immediately
end

#
# 4. Fix Lucene Conflict (Optional).. ToDo: Integrate with search
#

# NOTE – For those using ElasticSearch, Rexster includes lucene-core-x.y.z.jar (a neo4j dependency). 
# Assuming Neo4j is not being utilized in the Rexster instance, simply delete that file from the 
# rexster lib directory. Removing it will eliminate a conflict with Titan and allow ElasticSearch 
# to start.

bash "remove_lucene" do
  code <<-EOL
    mkdir #{node.rexster.directory}/lucene-conflict
    mv #{node.rexster.server_directory}/lib/*lucene* #{node.rexster.directory}/lucene-conflict
  EOL
end
