# -*- coding: utf-8 -*-
# Author:: Chirag Jog (<chirag@clogeny.com>)
# Copyright:: Copyright (c) 2012 Opscode, Inc.

require  File.expand_path(File.dirname(__FILE__) +'/ec2')
require "securerandom"

FactoryGirl.define do

  factory :ec2ServerCommands, class: EC2KnifeServerCommands do
    cmd_list_flavor                   "knife ec2 flavor list"                     # Knife command for flavor list
    cmd_instance_data                 "knife ec2 instance data"                   # Knife command to get instance date
    cmd_create_server                 "knife ec2 server create"                   # Knife command for creating a server
    cmd_delete_server                 "knife ec2 server delete"                   # Knife command for deleting a server
    cmd_list_server                   "knife ec2 server list"                     # Knife command for listing servers
  end


  factory :ec2ServerCreateParameters, class: EC2KnifeServerCreateParameters do
      availability_zone                 "-Z"                                      # The Availability Zone
      availability_zone_l               "--availability-zone"                     # The Availability Zone
      aws_access_key                    "-A"                                      # Your AWS Access Key ID
      aws_access_key_l                  "--aws-access-key-id"                     # Your AWS Access Key ID
      aws_secret_access_key             "-K"                                      # Your AWS API Secret Access Key
      aws_secret_access_key_l           "--aws-secret-access-key"                 # Your AWS API Secret Access Key
      user_data                         "--user-data"                             # The EC2 User Data file to provision the instance with
      bootstrap_version                 "--bootstrap-version"                     # The version of Chef to install
      node_name                         "-N"                                      # The Chef node name for your new node
      node_name_l                       "--node-name"                             # The Chef node name for your new node
      server_url                        "--server-url"                            # Chef Server URL
      api_client_key                    "-k"                                      # API Client Key
      api_client_key_l                  "--key"                                   # API Client Key
      colored_optput                    "--[no-]color"                            # Use colored output, defaults to enabled
      config_file                       "-c"                                      # The configuration file to use
      defaults                          "--defaults"                              # Accept default values for all questions
      disable_editing                   "--disable-editing"                       # Do not open EDITOR, just accept the data as is
      distro                            "-d"                                      # Bootstrap a distro using a template; default is 'chef-full'
      distro_l                          "--distro"                                # Bootstrap a distro using a template; default is 'chef-full'
      ebs_no_delete_on_termination      "--ebs-no-delete-on-term"                 # Do not delete EBS volume on instance termination
      ebs_optimized                     "--ebs-optimized"                         # Enabled optimized EBS I/O
      ebs_size                          "--ebs-size SIZE"                         # The size of the EBS volume in GB, for EBS-backed instances
      editor                            "-e"                                      # Set the editor to use for interactive commands
      editor_l                          "--editor"                                # Set the editor to use for interactive commands
      environment                       "-E"                                      # Set the Chef environment
      environment_l                     "--environment"                           # Set the Chef environment
      ephemeral_devices                 "--ephemeral"                             # Comma separated list of device locations (eg - /dev/sdb) to map ephemeral devices
      flavor                            "-f"                                      # The flavor of server (m1.small, m1.medium,etc)
      flavor_l                          "--flavor"                                # The flavor of server (m1.small, m1.medium,etc)
      format                            "-F"                                      # Which format to use for output
      format_l                          "--format"                                # Which format to use for output
      hint                              "--hint"                                  # Specify Ohai Hint to be set on the bootstrap target. Use multiple --hint options to specify multiple hints.
      host_key                          "--[no-]host-key-verify"                  # Verify host key, enabled by default.
      identity_file                     "-i"                                      # The SSH identity file used for authentication
      identity_file_l                   "--identity-file"                         # The SSH identity file used for authentication
      image                             "-I"                                      # The AMI for the server
      image_l                           "--image"                                 # The AMI for the server
      json_attributes                   "-j"                                      # A JSON string to be added to the first runof chef-client
      json_attributes_l                 "--json-attributes"                       # A JSON string to be added to the first runof chef-client
      user                              "-u"                                      # API Client Username
      user_l                            "--user"                                  # API Client Username
      pre_release                       "--prerelease"                            # Install the pre-release chef gems
      print_after                       "--print-after"                           # Show the data after a destructive operation
      region                            "--region"                                # Your AWS region
      run_list                          "-r"                                      # Comma separated list of roles/recipes to apply
      run_list_l                        "--run-list"                              # Comma separated list of roles/recipes to apply
      security_group_ids                "-g"                                      # The security group ids for this server; required when using VPC
      security_group_ids_l              "--security-group-ids"                    # The security group ids for this server; required when using VPC
      security_groups                   "-G"                                      # The security groups for this server; not allowed when using VPC
      security_groups_l                 "--groups"                                # The security groups for this server; not allowed when using VPC
      attribute                         "-a"                                      # The EC2 server attribute to use for SSH connection
      server_connect_attribute          "--server-connect-attribute"              #
      ssh_gateway_server                "-w"                                      # The ssh gateway server
      ssh_gateway_server_l              "--ssh-gateway"                           # The ssh gateway server
      ssh_key_id                        "-S"                                      # The AWS SSH key id
      ssh_key_id_l                      "--ssh-key"                               # The AWS SSH key id
      ssh_password                      "-P"                                      # The ssh password
      ssh_password_l                    "--ssh-password"                          # The ssh password
      ssh_port                          "-p"                                      # The ssh port
      ssh_port_l                        "--ssh-port"                              # The ssh port
      ssh_username                      "-x"                                      # The ssh username
      ssh_username_l                    "--ssh-user"                              # The ssh username
      subnet                            "-s"                                      # create node in this Virtual Private Cloud Subnet ID (implies VPC mode)
      subnet_l                          "--subnet"                                # create node in this Virtual Private Cloud Subnet ID (implies VPC mode)
      tags                              "-T"                                      # The tags for this server
      tags_l                            "--tags"                                  # The tags for this server
      template_file                     "--template-file"                         # Full path to location of template to use
      verbose                           "-V"                                      # More verbose output. Use twice for max verbosity
      verbose_l                         "--verbose"                               # More verbose output. Use twice for max verbosity
      version_chef                      "-v"                                      # Show chef version
      version_chef_l                    "--version"                               # Show chef version
      say_yes_to_all_prompts            "-y"                                      # Say yes to all prompts for confirmation
      say_yes_to_all_prompts_l          "--yes"                                   # Say yes to all prompts for confirmation
      help                              "-h"                                      # Show help
      help_l                            "--help"                                  # Show help
  end

  factory :ec2ServerDeleteParameters, class:  EC2KnifeServerDeleteParameters do
      aws_access_key                    "-A"                                      # Your AWS Access Key ID
      aws_access_key_l                  "--aws-access-key-id"                     # Your AWS Access Key ID
      aws_secret_access_key             "-K"                                      # Your AWS API Secret Access Key
      aws_secret_access_key_l           "--aws-secret-access-key"                 # Your AWS API Secret Access Key
      node_name                         "-N"                                      # The name of the node and client to delete, if it differs from the server name.  Only has meaning when used with the '--purge' option.
      node_name_l                       "--node-name"                             # The name of the node and client to delete, if it differs from the server name.  Only has meaning when used with the '--purge' option.
      server_url                        "--server-url"                            # Chef Server URL
      api_client_key                    "-k"                                      # API Client Key
      api_client_key_l                  "--key"                                   # API Client Key
      colored_optput                    "--[no-]color"                            # Use colored output, defaults to enabled
      config_file                       "-c"                                      # The configuration file to use
      defaults                          "--defaults"                              # Accept default values for all questions
      disable_editing                   "--disable-editing"                       # Do not open EDITOR, just accept the data as is
      editor                            "-e"                                      # Set the editor to use for interactive commands
      editor_l                          "--editor"                                # Set the editor to use for interactive commands
      environment                       "-E"                                      # Set the Chef environment
      environment_l                     "--environment"                           # Set the Chef environment
      format                            "-F"                                      # Which format to use for output
      format_l                          "--format"                                # Which format to use for output
      user                              "-u"                                      # API Client Username
      user_l                            "--user"                                  # API Client Username
      print_after                       "--print-after"                           # Show the data after a destructive operation
      purge                             "-P"                                      # Destroy corresponding node and client on the Chef Server, in addition to destroying the EC2 node itself.  Assumes node and client have the same name as the server (if not, add the '--node-name' option).
      purge_l                           "--purge"                                 # Destroy corresponding node and client on the Chef Server, in addition to destroying the EC2 node itself.  Assumes node and client have the same name as the server (if not, add the '--node-name' option).
      region                            "--region"                                # Your AWS region
      verbose                           "-V"                                      # More verbose output. Use twice for max verbosity
      verbose_l                         "--verbose"                               # More verbose output. Use twice for max verbosity
      version_chef                      "-v"                                      # Show chef version
      version_chef_l                    "--version"                               # Show chef version
      say_yes_to_all_prompts            "-y"                                      # Say yes to all prompts for confirmation
      say_yes_to_all_prompts_l          "--yes"                                   # Say yes to all prompts for confirmation
      help                              "-h"                                      # Show help
      help_l                            "--help"                                  # Show help
  end

  factory :ec2ServerListParameters, class:  EC2KnifeServerListParameters do
      aws_access_key                   "-A"                                      # Your AWS Access Key ID
      aws_access_key_l                 "--aws-access-key-id"                     # Your AWS Access Key ID
      aws_secret_access_key            "-K"                                      # Your AWS API Secret Access Key
      aws_secret_access_key_l          "--aws-secret-access-key"                 # Your AWS API Secret Access Key
      server_url                       "-s"                                      # Chef Server URL
      server_url_l                     "--server-url"                            # Chef Server URL
      api_client_key                   "-k"                                      # API Client Key
      api_client_key_l                 "--key"                                   # API Client Key
      colored_optput                   "--[no-]color"                            # Use colored output, defaults to enabled
      config_file                      "-c"                                      # The configuration file to use
      config_file_l                    "--config"                                # The configuration file to use
      defaults                         "--defaults"                              # Accept default values for all questions
      disable_editing                  "--disable-editing"                       # Do not open EDITOR, just accept the data as is
      editor                           "-e"                                      # Set the editor to use for interactive commands
      editor_l                         "--editor"                                # Set the editor to use for interactive commands
      environment                      "-E"                                      # Set the Chef environment
      environment_l                    "--environment"                           # Set the Chef environment
      format                           "-F"                                      # Which format to use for output
      format_l                         "--format"                                # Which format to use for output
      no_name                          "-n"                                      # Do not display name tag in output
      no_name_l                        "--no-name"                               # Do not display name tag in output
      user                             "-u"                                      # API Client Username
      user_l                           "--user"                                  # API Client Username
      print_after                      "--print-after"                           # Show the data after a destructive operation
      region                           "--region"                                # Your AWS region
      tags                             "-t"                                      # List of tags to output
      tags_l                           "--tags"                                  # List of tags to output
      verbose                          "-V"                                      # More verbose output. Use twice for max verbosity
      verbose_l                        "--verbose"                               # More verbose output. Use twice for max verbosity
      version_chef                     "-v"                                      # Show chef version
      version_chef_l                   "--version"                               # Show chef version
      say_yes_to_all_prompts           "-y"                                      # Say yes to all prompts for confirmation
      say_yes_to_all_prompts_l         "--yes"                                   # Say yes to all prompts for confirmation
      help                             "-h"                                      # Show help
      help_l                           "--help"                                  # Show help
  end

  ec2_server_create_params_factory = FactoryGirl.build(:ec2ServerCreateParameters)
  ec2_server_delete_params_factory = FactoryGirl.build(:ec2ServerDeleteParameters)
  ec2_server_list_params_factory = FactoryGirl.build(:ec2ServerListParameters)
  model_obj_server_create = EC2KnifeServerCreateParameters.new

  properties_file = File.expand_path(File.dirname(__FILE__) + "/properties/credentials.yml")
  properties = File.open(properties_file) { |yf| YAML::load(yf) }

  valid_aws_access_key = properties["credentials"]["aws_access_key"]
  valid_aws_secret_key = properties["credentials"]["aws_secret_key"]
  valid_ssh_keypair_id = properties["credentials"]["ssh_keypair_name"]
  valid_ssh_keypair_data = properties["credentials"]["ssh_keypair_data"]

  # Base Factory for create server
  factory :ec2ServerCreateBase, class: EC2KnifeServerCreateParameters do
    name_of_the_node =    "EC2-Node-#{SecureRandom.hex(4)}"
    identity_file         "#{ec2_server_create_params_factory.identity_file} " +
                                    model_obj_server_create.create_user_ssh_key_path(valid_ssh_keypair_id, valid_ssh_keypair_data)
    image                 "#{ec2_server_create_params_factory.image} "+ "ami-cdc072a4" #ubuntu-ami
    ssh_key_id            "#{ec2_server_create_params_factory.ssh_key_id} " + valid_ssh_keypair_id
    aws_access_key        "#{ec2_server_create_params_factory.aws_access_key} " + "#{valid_aws_access_key}"
    aws_secret_access_key "#{ec2_server_create_params_factory.aws_secret_access_key} " + "#{valid_aws_secret_key}"
    flavor                "#{ec2_server_create_params_factory.flavor} " + "t1.micro"
    tags                  "#{ec2_server_create_params_factory.tags} Name=" + name_of_the_node
    node_name             "#{ec2_server_create_params_factory.node_name} " + name_of_the_node
    ssh_username          "#{ec2_server_create_params_factory.ssh_username} " + "ubuntu"
  end

  # Base Factory for delete server
  factory :ec2ServerDeleteBase, class: EC2KnifeServerDeleteParameters do
    aws_access_key        "#{ec2_server_create_params_factory.aws_access_key} " + "#{valid_aws_access_key}"
    aws_secret_access_key "#{ec2_server_create_params_factory.aws_secret_access_key} " + "#{valid_aws_secret_key}"
  end

  # Base Factory for list server
  factory :ec2ServerListBase, class: EC2KnifeServerListParameters do
    aws_access_key        "#{ec2_server_create_params_factory.aws_access_key} " + "#{valid_aws_access_key}"
    aws_secret_access_key "#{ec2_server_create_params_factory.aws_secret_access_key} " + "#{valid_aws_secret_key}"
  end

  # Test Case: OP_KEP_1, CreateServerWithDefaults
  factory :ec2ServerCreateWithDefaults, parent: :ec2ServerCreateBase do
    name_of_the_node =    "EC2-Node-#{SecureRandom.hex(4)}"
    tags                  "#{ec2_server_create_params_factory.tags} Name=" + name_of_the_node
    node_name             "#{ec2_server_create_params_factory.node_name} " + name_of_the_node
    security_groups       "#{ec2_server_create_params_factory.security_groups} " + "default"
    region                "#{ec2_server_create_params_factory.region} " + "us-east-1"
  end

  # Test Case: OP_KEP_2, CreateServerwithOneSecurityGroup
  factory :ec2ServerCreateOneSecurityGroup, parent: :ec2ServerCreateBase do
    name_of_the_node =  "EC2-Node-#{SecureRandom.hex(4)}"
    security_groups     "#{ec2_server_create_params_factory.security_groups} " + "default"
    tags                "#{ec2_server_create_params_factory.tags} Name=" + name_of_the_node
    node_name           "#{ec2_server_create_params_factory.node_name} " + name_of_the_node
  end

  # Test Case: OP_KEP_3, CreateServerwithMultipleSecurityGroup
  factory :ec2ServerCreateMultipleSecurityGroup, parent: :ec2ServerCreateBase do
    name_of_the_node =  "EC2-Node-#{SecureRandom.hex(4)}"
    security_groups     "#{ec2_server_create_params_factory.security_groups} " + "default1, default2, default3"
    tags                "#{ec2_server_create_params_factory.tags} Name=" + name_of_the_node
    node_name           "#{ec2_server_create_params_factory.node_name} " + name_of_the_node
  end

  # Test Case: OP_KEP_4, CreateServerWithWrongKeyCombination
  factory :ec2ServerCreateWrongKeyCombination, parent: :ec2ServerCreateBase do
    name_of_the_node =    "EC2-Node-#{SecureRandom.hex(4)}"
    ssh_key_id            "#{ec2_server_create_params_factory.ssh_key_id} " + "its_a_wrong_key.pem"
    tags                  "#{ec2_server_create_params_factory.tags} Name=" + name_of_the_node
    node_name             "#{ec2_server_create_params_factory.node_name} " + name_of_the_node
  end

  # Test Case: OP_KEP_5, CreateServerwithExistingServerName
  factory :ec2ServerCreateWithExistingServerName, parent: :ec2ServerCreateBase do
    name_of_the_node =  "EC2-Node-#{SecureRandom.hex(4)}"
    tags                "#{ec2_server_create_params_factory.tags} Name=" + name_of_the_node
    node_name           "#{ec2_server_create_params_factory.node_name} " + name_of_the_node
  end

  # Test Case: OP_KEP_6, CreateServerWithoutSecurityGroup
  factory :ec2ServerCreateWithoutSecurityGroup, parent: :ec2ServerCreateBase do
    name_of_the_node =  "EC2-Node-#{SecureRandom.hex(4)}"
    tags                "#{ec2_server_create_params_factory.tags} Name=" + name_of_the_node
    node_name           "#{ec2_server_create_params_factory.node_name} " + name_of_the_node
  end

  # Test Case: OP_KEP_7, CreateServerInOtherAvailabilityZone
  factory :ec2ServerCreateInOtherAvailabilityZone, parent: :ec2ServerCreateBase do
    name_of_the_node =  "EC2-Node-#{SecureRandom.hex(4)}"
    availability_zone   "#{ec2_server_create_params_factory.availability_zone} " + "us-east-1d"
    tags                "#{ec2_server_create_params_factory.tags} Name=" + name_of_the_node
    node_name           "#{ec2_server_create_params_factory.node_name} " + name_of_the_node
  end

  # Test Case: OP_KEP_8, CreateServerOfDifferentFlavor
  factory :ec2ServerCreateOfDifferentFlavor, parent: :ec2ServerCreateBase do
    name_of_the_node =  "EC2-Node-m1-small-#{SecureRandom.hex(4)}"
    tags                "#{ec2_server_create_params_factory.tags} Name=" + name_of_the_node
    node_name           "#{ec2_server_create_params_factory.node_name} " + name_of_the_node
    image               "#{ec2_server_create_params_factory.image} " + "ami-50c06739"
    flavor              "#{ec2_server_create_params_factory.flavor} " + "m1.small"
  end

  # Test Case: OP_KEP_9, CreateServerWithIncorrectSecurityGroup
  factory :ec2ServerCreateWithIncorrectSecurityGroup, parent: :ec2ServerCreateBase do
    name_of_the_node =  "EC2-Node-#{SecureRandom.hex(4)}"
    security_groups     "#{ec2_server_create_params_factory.security_groups} " + "InvalidSecurityGroup"
    tags                "#{ec2_server_create_params_factory.tags} Name=" + name_of_the_node
    node_name           "#{ec2_server_create_params_factory.node_name} " + name_of_the_node
  end

  # Test Case: OP_KEP_10, CreateServerInNonExistentZone
  factory :ec2ServerCreateInNonExistentZone, parent: :ec2ServerCreateBase do
    name_of_the_node =  "EC2-Node-#{SecureRandom.hex(4)}"
    availability_zone   "#{ec2_server_create_params_factory.availability_zone} " + "NonExistentZone"
    tags                "#{ec2_server_create_params_factory.tags} Name=" + name_of_the_node
    node_name           "#{ec2_server_create_params_factory.node_name} " + name_of_the_node
  end

  # Test Case: OP_KEP_11, CreateServerWithEBSBackedDisk
  factory :ec2ServerCreateWithEBSBackedDisk, parent: :ec2ServerCreateBase do
    name_of_the_node =  "EC2-Node-#{SecureRandom.hex(4)}"
    tags                "#{ec2_server_create_params_factory.tags} Name=" + name_of_the_node
    node_name           "#{ec2_server_create_params_factory.node_name} " + name_of_the_node
  end

  # Test Case: OP_KEP_12, CreateServerWithSingleTag
  factory :ec2ServerCreateWithSingleTag, parent: :ec2ServerCreateBase do
    name_of_the_node =  "EC2-Node-#{SecureRandom.hex(4)}"
    tags                "#{ec2_server_create_params_factory.tags} Name=" + name_of_the_node
    node_name           "#{ec2_server_create_params_factory.node_name} " + name_of_the_node
  end

  # Test Case: OP_KEP_13, CreateServerWithMultipleTags
  factory :ec2ServerCreateWithMultipleTags, parent: :ec2ServerCreateBase do
    name_of_the_node =  "EC2-Node-#{SecureRandom.hex(4)}"
    tags                "#{ec2_server_create_params_factory.tags} Name=" + name_of_the_node + " ,TestId=" + name_of_the_node
    node_name           "#{ec2_server_create_params_factory.node_name} " + name_of_the_node
  end

  # Test Case: OP_KEP_14, DeleteServerPurge
  factory :ec2ServerDeletePurge, parent: :ec2ServerDeleteBase do
    purge              "#{ec2_server_delete_params_factory.purge}"
  end

  # Test Case: OP_KEP_15, DeleteServerDontPurge
  factory :ec2ServerDeleteDontPurge, parent: :ec2ServerDeleteBase do
  end

  # Test Case: OP_KEP_16, ListServerEmpty
  factory :ec2ServerListEmpty, parent: :ec2ServerListBase do
  end

  # Test Case: OP_KEP_17, ListServerNonEmpty
  factory :ec2ServerListNonEmpty, parent: :ec2ServerListBase do
  end

  # Test Case: OP_KEP_18, DeleteMutipleServers
  factory :ec2ServerDeleteMultiple, parent: :ec2ServerDeleteBase do
      purge              "#{ec2_server_delete_params_factory.purge}"
  end

  # Test Case: OP_KEP_19, DeleteServerThatDoesNotExist
  factory :ec2ServerDeleteNonExistent, parent: :ec2ServerDeleteBase do
    node_name           "#{ec2_server_create_params_factory.node_name} " + "nonextistentsrv"
  end

  # Test Case: OP_KEP_20, CreateServerWithRoleAndRecipe
  factory :ec2ServerCreateWithRoleAndRecipe, parent: :ec2ServerCreateBase do
    name_of_the_node =  "EC2-Node-#{SecureRandom.hex(4)}"
    tags                "#{ec2_server_create_params_factory.tags} Name=" + name_of_the_node
    node_name           "#{ec2_server_create_params_factory.node_name} " + name_of_the_node
    # FIXME here we are assuming requied roles/recipes are available with the test account.
    # Eventually this process will also be automated.
    run_list            "#{ec2_server_create_params_factory.run_list} "  + "recipe[build-essential], role[webserver]"
  end

  # Test Case: OP_KEP_21, CreateServerwithInvalidRole
  factory :ec2ServerCreateWithInvalidRole, parent: :ec2ServerCreateBase do
    name_of_the_node =  "EC2-Node-#{SecureRandom.hex(4)}"
    tags                "#{ec2_server_create_params_factory.tags} Name=" + name_of_the_node
    node_name           "#{ec2_server_create_params_factory.node_name} " + name_of_the_node
    # FIXME here we are assuming requied roles/recipes are available with the test account.
    # Eventually this process will also be automated.
    run_list            "#{ec2_server_create_params_factory.run_list} "  + "recipe[build-essential], role[invalid-role]"
  end

  # Test Case: OP_KEP_22, CreateServerWithInvalidRecipe
  factory :ec2ServerCreateWithInvalidRecipe, parent: :ec2ServerCreateBase do
    name_of_the_node =  "EC2-Node-#{SecureRandom.hex(4)}"
    tags                "#{ec2_server_create_params_factory.tags} Name=" + name_of_the_node
    node_name           "#{ec2_server_create_params_factory.node_name} " + name_of_the_node
    # FIXME here we are assuming requied roles/recipes are available with the test account.
    # Eventually this process will also be automated.
    run_list            "#{ec2_server_create_params_factory.run_list} "  + "recipe[invalid-recipe]"
  end

  # Test Case: OP_KEP_23, CreateWindowsServerWithWinRMBasicAuth
  factory :ec2WindowsServerCreateWithWinRMBasicAuth, parent: :ec2ServerCreateBase do
    name_of_the_node =  "EC2-Win-Node-#{SecureRandom.hex(4)}"
    tags                "#{ec2_server_create_params_factory.tags} Name="  + name_of_the_node
    node_name           "#{ec2_server_create_params_factory.node_name} "  + name_of_the_node
    image               "#{ec2_server_create_params_factory.image} "      + "ami-c941efa0"
    flavor              "#{ec2_server_create_params_factory.flavor} "     + "t1.micro"
    ssh_username        "#{ec2_server_create_params_factory.ssh_username} "     + "Administrator"
    ssh_password        "#{ec2_server_create_params_factory.ssh_password} "     + "ssh!Passw0rd"
  end

  # Test Case: OP_KEP_24, CreateWindowsServerWithSSHAuth
  factory :ec2WindowsServerCreateWithSSHAuth, parent: :ec2ServerCreateBase do
    name_of_the_node =  "EC2-Node-#{SecureRandom.hex(4)}"
    tags                "#{ec2_server_create_params_factory.tags} Name="        + name_of_the_node
    node_name           "#{ec2_server_create_params_factory.node_name} "        + name_of_the_node
    image               "#{ec2_server_create_params_factory.image} "            + "ami-c941efa0"
    flavor              "#{ec2_server_create_params_factory.flavor} "           + "t1.micro"
    ssh_username        "#{ec2_server_create_params_factory.ssh_username} "     + "Administrator"
    ssh_password        "#{ec2_server_create_params_factory.ssh_password} "     + "ssh!Passw0rd"
  end

  # Test Case: OP_KEP_24, CreateLinuxServerWithWinRM
  factory :ec2LinuxServerCreateWithWinRM, parent: :ec2ServerCreateBase do
    name_of_the_node =  "EC2-Node-#{SecureRandom.hex(4)}"
    tags                "#{ec2_server_create_params_factory.tags} Name="        + name_of_the_node
    node_name           "#{ec2_server_create_params_factory.node_name} "        + name_of_the_node
    ssh_username        "#{ec2_server_create_params_factory.ssh_username} "     + "ubuntu"
    ssh_password        "#{ec2_server_create_params_factory.ssh_password} "     + "ssh!Passw0rd"
  end
end
