# -*- coding: utf-8 -*-
# Author:: Chirag Jog (<chirag@clogeny.com>)
# Copyright:: Copyright (c) 2012 Opscode, Inc.


class EC2KnifeServerCommands
    attr_accessor :cmd_list_flavor                 # "knife ec2 flavor list"                     # Knife command for flavor list
    attr_accessor :cmd_instance_data               # "knife ec2 instance data"                   # Knife command to get instance date
    attr_accessor :cmd_create_server               # "knife ec2 server create"                   # Knife command for creating a server
    attr_accessor :cmd_delete_server               # "knife ec2 server delete"                   # Knife command for deleting a server
    attr_accessor :cmd_list_server                 # "knife ec2 server list"                     # Knife command for listing servers
end

class EC2KnifeServerCreateParameters
    attr_accessor :availability_zone                # "-Z"                                      # The Availability Zone
    attr_accessor :availability_zone_l              # "--availability-zone"                     # The Availability Zone
    attr_accessor :aws_access_key                   # "-A"                                      # Your AWS Access Key ID
    attr_accessor :aws_access_key_l                 # "--aws-access-key-id"                     # Your AWS Access Key ID
    attr_accessor :aws_secret_access_key            # "-K"                                      # Your AWS API Secret Access Key
    attr_accessor :aws_secret_access_key_l          # "--aws-secret-access-key"                 # Your AWS API Secret Access Key
    attr_accessor :user_data                        # "--user-data"                             # The EC2 User Data file to provision the instance with
    attr_accessor :bootstrap_version                # "--bootstrap-version"                     # The version of Chef to install
    attr_accessor :node_name                        # "-N"                                      # The Chef node name for your new node
    attr_accessor :node_name_l                      # "--node-name"                             # The Chef node name for your new node
    attr_accessor :server_url                       # "--server-url"                            # Chef Server URL
    attr_accessor :api_client_key                   # "-k"                                      # API Client Key
    attr_accessor :api_client_key_l                 # "--key"                                   # API Client Key
    attr_accessor :colored_optput                   # "--[no-]color"                            # Use colored output, defaults to enabled
    attr_accessor :config_file                      # "-c"                                      # The configuration file to use
    attr_accessor :defaults                         # "--defaults"                              # Accept default values for all questions
    attr_accessor :disable_editing                  # "--disable-editing"                       # Do not open EDITOR, just accept the data as is
    attr_accessor :distro                           # "-d"                                      # Bootstrap a distro using a template; default is 'chef-full'
    attr_accessor :distro_l                         # "--distro"                                # Bootstrap a distro using a template; default is 'chef-full'
    attr_accessor :ebs_no_delete_on_termination     # "--ebs-no-delete-on-term"                 # Do not delete EBS volume on instance termination
    attr_accessor :ebs_optimized                    # "--ebs-optimized"                         # Enabled optimized EBS I/O
    attr_accessor :ebs_size                         # "--ebs-size SIZE"                         # The size of the EBS volume in GB, for EBS-backed instances
    attr_accessor :editor                           # "-e"                                      # Set the editor to use for interactive commands
    attr_accessor :editor_l                         # "--editor"                                # Set the editor to use for interactive commands
    attr_accessor :environment                      # "-E"                                      # Set the Chef environment
    attr_accessor :environment_l                    # "--environment"                           # Set the Chef environment
    attr_accessor :ephemeral_devices                # "--ephemeral"                             # Comma separated list of device locations (eg - /dev/sdb) to map ephemeral devices
    attr_accessor :flavor                           # "-f"                                      # The flavor of server (m1.small, m1.medium,etc)
    attr_accessor :flavor_l                         # "--flavor"                                # The flavor of server (m1.small, m1.medium,etc)
    attr_accessor :format                           # "-F"                                      # Which format to use for output
    attr_accessor :format_l                         # "--format"                                # Which format to use for output
    attr_accessor :hint                             # "--hint"                                  # Specify Ohai Hint to be set on the bootstrap target. Use multiple --hint options to specify multiple hints.
    attr_accessor :host_key                         # "--[no-]host-key-verify"                  # Verify host key, enabled by default.
    attr_accessor :identity_file                    # "-i"                                      # The SSH identity file used for authentication
    attr_accessor :identity_file_l                  # "--identity-file"                         # The SSH identity file used for authentication
    attr_accessor :image                            # "-I"                                      # The AMI for the server
    attr_accessor :image_l                          # "--image"                                 # The AMI for the server
    attr_accessor :json_attributes                  # "-j"                                      # A JSON string to be added to the first runof chef-client
    attr_accessor :json_attributes_l                # "--json-attributes"                       # A JSON string to be added to the first runof chef-client
    attr_accessor :user                             # "-u"                                      # API Client Username
    attr_accessor :user_l                           # "--user"                                  # API Client Username
    attr_accessor :pre_release                      # "--prerelease"                            # Install the pre-release chef gems
    attr_accessor :print_after                      # "--print-after"                           # Show the data after a destructive operation
    attr_accessor :region                           # "--region"                                # Your AWS region
    attr_accessor :run_list                         # "-r"                                      # Comma separated list of roles/recipes to apply
    attr_accessor :run_list_l                       # "--run-list"                              # Comma separated list of roles/recipes to apply
    attr_accessor :security_group_ids               # "-g"                                      # The security group ids for this server; required when using VPC
    attr_accessor :security_group_ids_l             # "--security-group-ids"                    # The security group ids for this server; required when using VPC
    attr_accessor :security_groups                  # "-G"                                      # The security groups for this server; not allowed when using VPC
    attr_accessor :security_groups_l                # "--groups"                                # The security groups for this server; not allowed when using VPC
    attr_accessor :attribute                        # "-a"                                      # The EC2 server attribute to use for SSH connection
    attr_accessor :server_connect_attribute         # "--server-connect-attribute"              #
    attr_accessor :ssh_gateway_server               # "-w"                                      # The ssh gateway server
    attr_accessor :ssh_gateway_server_l             # "--ssh-gateway"                           # The ssh gateway server
    attr_accessor :ssh_key_id                       # "-S"                                      # The AWS SSH key id
    attr_accessor :ssh_key_id_l                     # "--ssh-key"                               # The AWS SSH key id
    attr_accessor :ssh_password                     # "-P"                                      # The ssh password
    attr_accessor :ssh_password_l                   # "--ssh-password"                          # The ssh password
    attr_accessor :ssh_port                         # "-p"                                      # The ssh port
    attr_accessor :ssh_port_l                       # "--ssh-port"                              # The ssh port
    attr_accessor :ssh_username                     # "-x"                                      # The ssh username
    attr_accessor :ssh_username_l                   # "--ssh-user"                              # The ssh username
    attr_accessor :subnet                           # "-s"                                      # create node in this Virtual Private Cloud Subnet ID (implies VPC mode)
    attr_accessor :subnet_l                         # "--subnet"                                # create node in this Virtual Private Cloud Subnet ID (implies VPC mode)
    attr_accessor :tags                             # "-T"                                      # The tags for this server
    attr_accessor :tags_l                           # "--tags"                                  # The tags for this server
    attr_accessor :template_file                    # "--template-file"                         # Full path to location of template to use
    attr_accessor :verbose                          # "-V"                                      # More verbose output. Use twice for max verbosity
    attr_accessor :verbose_l                        # "--verbose"                               # More verbose output. Use twice for max verbosity
    attr_accessor :version_chef                     # "-v"                                      # Show chef version
    attr_accessor :version_chef_l                   # "--version"                               # Show chef version
    attr_accessor :say_yes_to_all_prompts           # "-y"                                      # Say yes to all prompts for confirmation
    attr_accessor :say_yes_to_all_prompts_l         # "--yes"                                   # Say yes to all prompts for confirmation
    attr_accessor :help                             # "-h"                                      # Show help
    attr_accessor :help_l                           # "--help"                                  # Show help

    def user_ssh_dir
      @_user_ssh_dir ||= Dir.mktmpdir
    end

    def user_ssh_pem_path(filename)
        "#{user_ssh_dir}/#{filename}.pem"
    end

    def  create_user_ssh_key_path(filename, data)
      filepath=user_ssh_pem_path(filename)
      File.open(filepath, 'w') {|f| f.write(data)}
      puts "Creating user ec2 ssh key file at: "+"#{filepath}"
      return filepath
    end
end


class EC2KnifeServerDeleteParameters
    attr_accessor :aws_access_key                   # "-A"                                      # Your AWS Access Key ID
    attr_accessor :aws_access_key_l                 # "--aws-access-key-id"                     # Your AWS Access Key ID
    attr_accessor :aws_secret_access_key            # "-K"                                      # Your AWS API Secret Access Key
    attr_accessor :aws_secret_access_key_l          # "--aws-secret-access-key"                 # Your AWS API Secret Access Key
    attr_accessor :node_name                        # "-N"                                      # The name of the node and client to delete, if it differs from the server name.  Only has meaning when used with the '--purge' option.
    attr_accessor :node_name_l                      # "--node-name"                             # The name of the node and client to delete, if it differs from the server name.  Only has meaning when used with the '--purge' option.
    attr_accessor :server_url                       # "--server-url"                            # Chef Server URL
    attr_accessor :api_client_key                   # "-k"                                      # API Client Key
    attr_accessor :api_client_key_l                 # "--key"                                   # API Client Key
    attr_accessor :colored_optput                   # "--[no-]color"                            # Use colored output, defaults to enabled
    attr_accessor :config_file                      # "-c"                                      # The configuration file to use
    attr_accessor :defaults                         # "--defaults"                              # Accept default values for all questions
    attr_accessor :disable_editing                  # "--disable-editing"                       # Do not open EDITOR, just accept the data as is
    attr_accessor :editor                           # "-e"                                      # Set the editor to use for interactive commands
    attr_accessor :editor_l                         # "--editor"                                # Set the editor to use for interactive commands
    attr_accessor :environment                      # "-E"                                      # Set the Chef environment
    attr_accessor :environment_l                    # "--environment"                           # Set the Chef environment
    attr_accessor :format                           # "-F"                                      # Which format to use for output
    attr_accessor :format_l                         # "--format"                                # Which format to use for output
    attr_accessor :user                             # "-u"                                      # API Client Username
    attr_accessor :user_l                           # "--user"                                  # API Client Username
    attr_accessor :print_after                      # "--print-after"                           # Show the data after a destructive operation
    attr_accessor :purge                            # "-P"                                      # Destroy corresponding node and client on the Chef Server, in addition to destroying the EC2 node itself.  Assumes node and client have the same name as the server (if not, add the '--node-name' option).
    attr_accessor :purge_l                          # "--purge"                                 # Destroy corresponding node and client on the Chef Server, in addition to destroying the EC2 node itself.  Assumes node and client have the same name as the server (if not, add the '--node-name' option).
    attr_accessor :region                           # "--region"                                # Your AWS region
    attr_accessor :verbose                          # "-V"                                      # More verbose output. Use twice for max verbosity
    attr_accessor :verbose_l                        # "--verbose"                               # More verbose output. Use twice for max verbosity
    attr_accessor :version_chef                     # "-v"                                      # Show chef version
    attr_accessor :version_chef_l                   # "--version"                               # Show chef version
    attr_accessor :say_yes_to_all_prompts           # "-y"                                      # Say yes to all prompts for confirmation
    attr_accessor :say_yes_to_all_prompts_l         # "--yes"                                   # Say yes to all prompts for confirmation
    attr_accessor :help                             # "-h"                                      # Show help
    attr_accessor :help_l                           # "--help"                                  # Show help
end

class EC2KnifeServerListParameters
    attr_accessor :aws_access_key                   # "-A"                                      # Your AWS Access Key ID
    attr_accessor :aws_access_key_l                 # "--aws-access-key-id"                     # Your AWS Access Key ID
    attr_accessor :aws_secret_access_key            # "-K"                                      # Your AWS API Secret Access Key
    attr_accessor :aws_secret_access_key_l          # "--aws-secret-access-key"                 # Your AWS API Secret Access Key
    attr_accessor :server_url                       # "-s"                                      # Chef Server URL
    attr_accessor :server_url_l                     # "--server-url"                            # Chef Server URL
    attr_accessor :api_client_key                   # "-k"                                      # API Client Key
    attr_accessor :api_client_key_l                 # "--key"                                   # API Client Key
    attr_accessor :colored_optput                   # "--[no-]color"                            # Use colored output, defaults to enabled
    attr_accessor :config_file                      # "-c"                                      # The configuration file to use
    attr_accessor :config_file_l                    # "--config"                                # The configuration file to use
    attr_accessor :defaults                         # "--defaults"                              # Accept default values for all questions
    attr_accessor :disable_editing                  # "--disable-editing"                       # Do not open EDITOR, just accept the data as is
    attr_accessor :editor                           # "-e"                                      # Set the editor to use for interactive commands
    attr_accessor :editor_l                         # "--editor"                                # Set the editor to use for interactive commands
    attr_accessor :environment                      # "-E"                                      # Set the Chef environment
    attr_accessor :environment_l                    # "--environment"                           # Set the Chef environment
    attr_accessor :format                           # "-F"                                      # Which format to use for output
    attr_accessor :format_l                         # "--format"                                # Which format to use for output
    attr_accessor :no_name                          # "-n"                                      # Do not display name tag in output
    attr_accessor :no_name_l                        # "--no-name"                               # Do not display name tag in output
    attr_accessor :user                             # "-u"                                      # API Client Username
    attr_accessor :user_l                           # "--user"                                  # API Client Username
    attr_accessor :print_after                      # "--print-after"                           # Show the data after a destructive operation
    attr_accessor :region                           # "--region"                                # Your AWS region
    attr_accessor :tags                             # "-t"                                      # List of tags to output
    attr_accessor :tags_l                           # "--tags"                                  # List of tags to output
    attr_accessor :verbose                          # "-V"                                      # More verbose output. Use twice for max verbosity
    attr_accessor :verbose_l                        # "--verbose"                               # More verbose output. Use twice for max verbosity
    attr_accessor :version_chef                     # "-v"                                      # Show chef version
    attr_accessor :version_chef_l                   # "--version"                               # Show chef version
    attr_accessor :say_yes_to_all_prompts           # "-y"                                      # Say yes to all prompts for confirmation
    attr_accessor :say_yes_to_all_prompts_l         # "--yes"                                   # Say yes to all prompts for confirmation
    attr_accessor :help                             # "-h"                                      # Show help
    attr_accessor :help_l                           # "--help"                                  # Show help
end
