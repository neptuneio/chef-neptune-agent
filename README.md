Neptune agent chef cookbook
========================
This cookbook helps you install Neptune agent on a host

Recipe details
------------------
1. Creates an user for agent to run as. By default it is 'neptuneio'
2. Creates a directory "agent" under the user's home directory for all files related to the agent
3. Downloads latest agent binary and config file, and update it with credentials specified in the attributes file
4. Installs agent as a daemon and starts it

Requirements
------------
None

How to use
----------

Setup
------

Step 1 : Clone or copy the chef-neptune-agent cookbook to your cookbooks directory

    git clone https://github.com/neptuneio/chef-neptune-agent.git  /etc/chef-repo/cookbooks/

Step 2 : Update your Neptune API key

    vim chef-neptune-agent/attributes/default.rb

    # Mandatory
    default['nagent']['api_key'] ="Your Neptune API key here"

Optional : Update non-mandatory fields in the attributes file.

    default['nagent']['user_name'] = "neptune"
    default['nagent']['assigned_hostname'] = nil
    default['nagent']['require_sudo'] = "false"
    default['nagent']['github_api_key'] = nil

1. Change the username if you want to run agent as a different user
2. Add an assigned hostname to over-ride default hostname of the host
3. If you are using runbooks from private Github repo, set the read-only Github API key here. 

Alternatively, if your chef version supports custom JSON, you can use the following
```json
{
  "nagent" : {
      "api_key": "2723723872323223",
      "user_name" : "neptune",
      "assigned_hostname" : "Your non-default hostname here",
      "github_api_key" : "Set read-only Github API key if you are using private Github runbooks only",
      "require_sudo" : "false"
  }
}
```

Run the recipe
--------------
Simply include `chef-neptune-agent` recipe in your node's `run_list`:

```json
{
    "name":"node1",
        "run_list": [
            "recipe[chef-neptune-agent]"
            ],
        "default" : {
            "nagent" : {
                "api_key": "2723723872323223",
                "user_name" : "neptune",
                "assigned_hostname" : "Your non-default hostname here",
                "github_api_key" : "Set read-only Github API key if you are using private Github runbooks only",
                "require_sudo" : "false"
            }
        }
}
```

Contributing
------------
Please clone, make changes and send in a pull request

License and Authors
-------------------
Copyright Neptune.io, Inc. 2016
