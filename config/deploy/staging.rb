# server-based syntax
# ======================
# Defines a single server with a list of roles and multiple properties.
# You can define all roles on a single server, or split them:

server "ec2-54-233-229-82.sa-east-1.compute.amazonaws.com", user: "ubuntu", roles: %w{app db web}, my_property: :my_value
# server "ubuntu@ec2-54-233-229-82.sa-east-1.compute.amazonaws.com", user: "ubuntu", roles: %w{app web}, other_property: :other_value
# server "ubuntu@ec2-54-233-229-82.sa-east-1.compute.amazonaws.com", user: "ubuntu", roles: %w{db}



# role-based syntax
# ==================

# Defines a role with one or multiple servers. The primary server in each
# group is considered to be the first unless any hosts have the primary
# property set. Specify the username and a domain or IP for the server.
# Don't use `:all`, it's a meta role.

role :app, %w{ubuntu@ec2-54-233-229-82.sa-east-1.compute.amazonaws.com"}, my_property: :my_value
role :web, %w{ubuntu@ec2-54-233-229-82.sa-east-1.compute.amazonaws.com"}, other_property: :other_value
role :db,  %w{ubuntu@ec2-54-233-229-82.sa-east-1.compute.amazonaws.com"}



# Configuration
# =============
# You can set any configuration variable like in config/deploy.rb
# These variables are then only loaded and set in this stage.
# For available Capistrano configuration variables see the documentation page.
# http://capistranorb.com/documentation/getting-started/configuration/
# Feel free to add new variables to customise your setup.



# Custom SSH Options
# ==================
# You may pass any option but keep in mind that net/ssh understands a
# limited set of options, consult the Net::SSH documentation.
# http://net-ssh.github.io/net-ssh/classes/Net/SSH.html#method-c-start
#
# Global options
# --------------
 set :ssh_options, {
   keys: %w(/home/smoothcookie/.ssh/bytanques.pem),
   forward_agent: false,
   auth_methods: %w(password)
 }
#
# The server-based syntax can be used to override options:
# ------------------------------------
server "ec2-54-233-229-82.sa-east-1.compute.amazonaws.com",
  user: "ubuntu",
  roles: %w{web app},
  ssh_options: {
    user: "ubuntu", # overrides user setting above
    keys: %w(/home/smoothcookie/.ssh/bytanques.pem),
    forward_agent: false,
    auth_methods: %w(publickey password)
    # password: "please use keys"
  }
