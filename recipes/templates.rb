template "log4j_properties" do
  path "#{node.rexster.server_directory}/log4j.properties"
  source "log4j_properties.erb"
  owner 'root'
  mode 0644
  action :nothing
end

template "rexster_xml" do
  path "#{node.rexster.server_directory}/config/rexster.xml"
  source "rexster_xml.erb"
  owner 'root'
  mode 0644
  action :nothing
end

template "rexster_initd" do
  path "/etc/init.d/rexster"
  source "rexster_service_init.erb"
  owner 'root'
  mode 0755
  action :nothing
end
