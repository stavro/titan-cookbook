#
# Actions performed when an instance comes online or goes offline should be performed here
#

include_recipe 'titan::templates'
include_recipe 'titan::services'

execute "start rexster" do
  command "echo perform configure operation"

  notifies :create, "template[rexster_xml]", :immediately
  notifies :start, "service[rexster]", :delayed
end
