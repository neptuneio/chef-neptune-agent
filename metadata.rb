name             'chef-neptune-agent'
maintainer       'Neptune.io Inc.'
maintainer_email 'team@neptune.io'
license          'All rights reserved'
description      'Installs/Configures Neptune agent'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

%w(
  amazon
  centos
  debian
  redhat
  scientific
  ubuntu
  windows
  darwin
).each do |os|
  supports os
end

recipe 'chef-neptune-agent::default', 'Default'
