#
# Cookbook Name:: chef-neptune-agent
# Recipe:: default
# Copyright 2015, Neptune.io, Inc.
# All rights reserved
#

# Get the temp directory
temp=Chef::Config[:file_cache_path]

# Fetch and execute installer based on host's platform type

case node['platform']
when 'darwin', 'mac_os_x'
    # Install using darwin script
    remote_file "#{temp}/install_neptune_agent_darwin.sh" do
        source "#{node[:nagent][:download_url]}/scripts/darwin/install_neptune_agent_darwin.sh"
        mode 00755
    end
    execute 'install_neptune_agent_on_darwin' do
        command "#{temp}/install_neptune_agent_darwin.sh"
        # Set environment variables for installer script
        environment ({
            'API_KEY' => node[:nagent][:api_key] ,
            'AGENT_USER' => node[:nagent][:user_name] ,
            'REQUIRE_SUDO' => node[:nagent][:require_sudo],
            'ASSIGNED_HOST_NAME' => node[:nagent][:assigned_hostname],
            'END_POINT' => node[:nagent][:end_point]
        })
    end
when 'windows'
    # Install using windows script
    remote_file "#{temp}\\install_neptune_agent_windows.bat" do
        source "#{node[:nagent][:download_url]}/scripts/windows/install_neptune_agent_windows.bat"
        mode 00755
    end
    execute "install_neptune_agent_on_windows" do
        command "#{temp}\\install_neptune_agent_windows.bat"
    end
else
    log "Working on #{node['platform']}"
    log "Using a generic linux installer"
    # Install using linux script
    remote_file "#{temp}/install_neptune_agent_linux.sh" do
        source "#{node[:nagent][:download_url]}/scripts/linux/install_neptune_agent_linux.sh"
        mode 00755
    end
    execute 'install_neptune_agent_on_linux' do
        command "#{temp}/install_neptune_agent_linux.sh"
        # Set environment variables for installer script
        environment ({
            'API_KEY' => node[:nagent][:api_key] ,
            'AGENT_USER' => node[:nagent][:user_name] ,
            'REQUIRE_SUDO' => node[:nagent][:require_sudo],
            'ASSIGNED_HOST_NAME' => node[:nagent][:assigned_hostname],
            'END_POINT' => node[:nagent][:end_point]
        })
    end
end
