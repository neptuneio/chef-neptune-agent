# Attributes for neptune agent deployment and configuration

#### Change these variables below

# Neptune API key
default['nagent']['api_key'] ="Your Neptune API key here"

# Username for the agent to run as
default['nagent']['user_name'] ="neptune"

# Give sudo priveleges to the agent user. By default it's false
default['nagent']['require_sudo'] ="false"

# An assigned hostname to over-ride default server hostname
default['nagent']['assigned_hostname'] = nil

# Github API key to be used. This should be set only if you are using
# private Github for your runbooks.
default['nagent']['github_api_key'] = nil

# Neptune endpoint for agent to connect to
default['nagent']['end_point'] ="www.neptune.io"

# Don't change this agent fetch url
default['nagent']['download_url'] ="https://raw.githubusercontent.com/neptuneio/neptune-agent/prod"
