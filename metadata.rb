name              "titan"
maintainer        "Sean Stavropoulos"
maintainer_email  "sean.stavro@gmail.com"
license           "Apache 2.0"
description       "Installs Various configurations of Titan + Rexster"
long_description  "Installs Various configurations of Titan + Rexster"
version           "0.0.1"

%w{
  ubuntu
}.each do |os|
  supports os
end
