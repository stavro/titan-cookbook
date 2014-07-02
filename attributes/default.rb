#
# Rexster Server Configuration
#

default[:rexster][:version]       = '2.4.0'
default[:rexster][:env]           = 'production'
default[:rexster][:directory]     = '/opt/rexster'
default[:rexster][:pid_dir]       = '/var/pid/rexster'
default[:rexster][:java_options]  = '-Xms64m -Xmx512m'
default[:rexster][:start_delay]   = 0
default[:rexster][:log_dir]       = '/var/log/rexster'
default[:rexster][:log_level]     = 'INFO'

#
# Http Server
#

default[:rexster][:http][:server_port]  = 8182
default[:rexster][:http][:server_host]  = "0.0.0.0"
default[:rexster][:http][:base_uri]     = "http://#{node.opsworks.instance.ip}"
default[:rexster][:http][:web_root]     = "public"
default[:rexster][:http][:enable_doghouse] = true

#
# RexPro Server
#

default[:rexster][:rexpro][:server_port]  = 8184
default[:rexster][:rexpro][:server_host]  = "0.0.0.0"

#
# Security
#

default[:rexster][:security][:authentication][:type] = "none"
default[:rexster][:security][:authentication][:configuration][:users] = [{
  username: "rexster",
  password: "rexster"
}]

#
# Graph Configurations
#

default[:rexster][:graphs] = [{
  name: 'database',
  backend: 'persistit',
  type: 'com.thinkaurelius.titan.tinkerpop.rexster.TitanGraphConfiguration',
  readonly: false,
  storage_directory: '/tmp/database'
}]

#
# Rexster Server
#

normal[:rexster][:server_archive]     = "rexster-server-#{node.rexster.version}"
normal[:rexster][:server_archive_url] = "http://tinkerpop.com/downloads/rexster/#{node.rexster.server_archive}.zip"
normal[:rexster][:server_directory]   = "#{node.rexster.directory}/rexster_server"

#
# Rexster Console
#
normal[:rexster][:console_archive] = "rexster-console-#{node.rexster.version}"
normal[:rexster][:console_archive_url] = "http://tinkerpop.com/downloads/rexster/#{node.rexster.console_archive}.zip"
normal[:rexster][:console_directory] = "#{node.rexster.directory}/rexster_console"


#
# Titan Configuration
#

default['titan']['version']   = '0.4.4'
default['titan']['directory'] = '/opt/titan'

#
# Titan Archive Attributes
#

default[:titan][:archive_name] = "titan-all-#{node.titan.version}"
default[:titan][:archive_url] = "http://s3.thinkaurelius.com/downloads/titan/#{node.titan.archive_name}.zip"
default[:titan][:rexster_extension_url] = "http://central.maven.org/maven2/com/thinkaurelius/titan/titan-rexster/#{node.titan.version}/titan-rexster-#{node.titan.version}.jar"

