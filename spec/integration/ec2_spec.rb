# -*- coding: utf-8 -*-
# Author:: Chirag Jog (<chirag@clogeny.com>)
# Copyright:: Copyright (c) 2012 Opscode, Inc.
require File.expand_path(File.dirname(__FILE__) + '/ec2_factories')

require 'knife_cloud_tests'
require 'knife_cloud_tests/knifeutils'
require 'knife_cloud_tests/matchers'
require "securerandom"

RSpec.configure do |config|
  FactoryGirl.find_definitions
end

# Method to prepare ec2 create server command

def prepare_create_srv_cmd_ec2_cspec(server_create_factory)
  cmd = "#{cmds_ec2.cmd_create_server} " +
  prepare_knife_command(server_create_factory)
  return cmd
end

def prepare_list_srv_cmd_ec2_lspec(factory)
  cmd = "#{cmds_ec2.cmd_list_server} " +
  prepare_knife_command(factory)
  return cmd
end

# Common method to run create server test cases

def run_ec2_cspec(test_context, test_case_scene, test_run_expect, factory_to_be_exercised, run_list_cmd = true, run_del_cmd = true)
  context "" do
    instance_name = "instance_name"
    cmd_out = ""
    context "#{test_context}" do
      let(:server_create_factory){ FactoryGirl.build(factory_to_be_exercised) }
      # let(:instance_name){ strip_out_command_key("#{server_create_factory.node_name}") }
      let(:command) { prepare_create_srv_cmd_ec2_cspec(server_create_factory) }
      after(:each){instance_name = strip_out_command_key("#{server_create_factory.node_name}")}
      context "#{test_case_scene}" do
        it "#{test_run_expect[:status]}" do
          match_status(test_run_expect)
        end
      end
    end

    if run_list_cmd
      context "list server after #{test_context} " do
        let(:grep_cmd) { "| grep -e #{instance_name}" }
        let(:command) { prepare_list_srv_cmd_ec2_lspec(srv_list_base_fact_ec2)}
        after(:each){cmd_out = "#{cmd_stdout}"}
        it "should succeed" do
          match_status({:status => "should succeed"})
        end
      end
    end

    if run_del_cmd
      context "delete-purge server after #{test_context} #{test_case_scene}" do
        let(:command) { "#{cmds_ec2.cmd_delete_server}" + " " +
                        find_id(instance_name, "#{cmd_out}") +
                        " " +
                        prepare_knife_command(srv_del_base_fact_ec2) +
                        " -y" + " -N #{instance_name} -P"}
        it "should succeed" do
          match_status({:status => "should succeed"})
        end
      end
    end

  end
end

# Common method to run create server test cases

def run_ec2_lspec(test_context, test_case_scene, test_run_expect, factory_to_be_exercised)
  context "#{test_context}" do
    let(:server_list_factory){ FactoryGirl.build(factory_to_be_exercised) }
    let(:command) { prepare_list_srv_cmd_ec2_lspec(server_list_factory) }
    after(:each) {puts "Test case completed!"}
    context "#{test_case_scene}" do
      it "#{test_run_expect[:status]}" do
        match_status(test_run_expect)
      end
    end
  end
end

def create_srv_ec2_dspec(server_create_factory)
  cmd = "#{cmds_ec2.cmd_create_server} " +
  prepare_knife_command(server_create_factory)
  shell_out_command(cmd, "creating instance...")
end

def create_srvs_ec2_dspec(count)
  for server_count in 0..count
    name_of_the_node = "EC2-Node-#{SecureRandom.hex(4)}"
    tags_local       = "#{srv_create_params_fact_ec2.tags} Name=" + name_of_the_node
    node_name_local  = "#{srv_create_params_fact_ec2.node_name} " + name_of_the_node

    fact =  FactoryGirl.build(:ec2ServerCreateWithDefaults, node_name: node_name_local, tags: tags_local)
    instances.push fact
    create_srv_ec2_dspec(fact)
  end
  return instances
end


def list_srv_ec2_dspec()
  cmd = "#{cmds_ec2.cmd_list_server} " +
  prepare_knife_command(srv_list_base_fact_ec2)
  return shell_out_command(cmd, "listing instances...")
end

def find_inst_ids_ec2_dspec(instances)
  instance_ids = []
  file = list_srv_ec2_dspec.inspect
  puts "searching instance ids for instances created...."
  puts file
  instances.each do |instance|
    file.lines.each do |line|
      if line.include?(strip_out_command_key("#{instance.node_name}"))
        puts "#{line}"
        instance_ids.push "#{line}".split(' ').first
      end
    end
  end
  puts instance_ids.inspect
  return instance_ids
end

# Method to prepare ec2 create server command

def prepare_del_srv_cmd_ec2_dspec(factory, instances)
  cmd ="#{cmds_ec2.cmd_delete_server}" + " " +
  "#{prepare_list_inst_ids_ec2_dspec(instances)}" + " " + prepare_knife_command(factory) + " -y"
  return cmd
end

def prepare_del_srv_cmd_purge_ec2_dspec(factory, instances)
  node_names = "-N"
  instances.each do |instance|
    node_names = node_names + " " + strip_out_command_key("#{instance.node_name}")
  end

  cmd ="#{cmds_ec2.cmd_delete_server}" + " " +
  "#{prepare_list_inst_ids_ec2_dspec(instances)}" + " " +  node_names + " " + prepare_knife_command(factory) + " -y"
  return cmd
end

def prepare_del_srv_cmd_non_exist_ec2_dspec(factory)
  cmd ="#{cmds_ec2.cmd_delete_server}" + " " +
  "1234567890" + " " + prepare_knife_command(factory) + " -y"
  return cmd
end

def prepare_list_inst_ids_ec2_dspec(instances)
  instances_to_be_deleted = ""
  instance_ids = find_inst_ids_ec2_dspec(instances)
  instance_ids.each do |instance|
    instances_to_be_deleted = instances_to_be_deleted + " " + "#{instance}"
  end
  puts "to be deleted" + instances_to_be_deleted
  return instances_to_be_deleted
end

# Common method to run create server test cases

def run_ec2_dspec(test_context, test_case_scene, test_run_expect, factory_to_be_exercised, test_case_type="")
  case test_case_type
      when "delete"
        srv_del_ec2_dspec(test_context, test_case_scene, test_run_expect, factory_to_be_exercised)
      when "delete_multiple"
        srv_del_mult_ec2_dspec(test_context, test_case_scene, test_run_expect, factory_to_be_exercised)
      when "delete_non_existent"
        srv_del_non_exist_ec2_dspec(test_context, test_case_scene, test_run_expect, factory_to_be_exercised)
      else
  end
end

def srv_del_ec2_dspec(test_context, test_case_scene, test_run_expect, factory_to_be_exercised)
  context "#{test_context}" do
    let(:instances) { [] }
    before(:each) {create_srvs_ec2_dspec(0)}
    let(:server_delete_factory){ FactoryGirl.build(factory_to_be_exercised) }
    let(:command) { prepare_del_srv_cmd_ec2_dspec(server_delete_factory, instances) }
    after(:each) {puts "Test case completed!"}
    context "#{test_case_scene}" do
      it "#{test_run_expect[:status]}" do
        match_status(test_run_expect)
      end
    end
  end
end

def srv_del_mult_ec2_dspec(test_context, test_case_scene, test_run_expect, factory_to_be_exercised)
  context "#{test_context}" do
    let(:instances) { [] }
    before(:each) {create_srvs_ec2_dspec(1)}
    let(:server_delete_factory){ FactoryGirl.build(factory_to_be_exercised) }
    let(:command) { prepare_del_srv_cmd_purge_ec2_dspec(server_delete_factory, instances) }
    after(:each) {puts "Test case completed!"}
    context "#{test_case_scene}" do
      it "#{test_run_expect[:status]}" do
        match_status(test_run_expect)
      end
    end
  end
end

def srv_del_non_exist_ec2_dspec(test_context, test_case_scene, test_run_expect, factory_to_be_exercised)
  context "#{test_context}" do
    let(:server_delete_factory){ FactoryGirl.build(factory_to_be_exercised) }
    let(:command) { prepare_del_srv_cmd_non_exist_ec2_dspec(server_delete_factory) }
    after(:each) {puts "Test case completed!"}
    context "#{test_case_scene}" do
      it "#{test_run_expect[:status]}" do
        match_status(test_run_expect)
      end
    end
  end
end


describe 'knife ec2' do
  include RSpec::KnifeUtils
  # before(:all) { load_factory_girl }
  before(:all) { load_knife_config }
  let(:cmds_ec2){ FactoryGirl.build(:ec2ServerCommands) }
  let(:srv_del_base_fact_ec2){FactoryGirl.build(:ec2ServerDeleteBase)}
  let(:srv_list_base_fact_ec2){FactoryGirl.build(:ec2ServerListBase)}
  let(:srv_create_params_fact_ec2){FactoryGirl.build(:ec2ServerCreateParameters)}

 expected_params = {
                     :status => "should succeed",
                     :stdout => nil,
                     :stderr => nil
                   }
  # Test Case: OP_KEP_1, CreateServerWithDefaults
  run_ec2_cspec("server create", "with all default parameters", expected_params, :ec2ServerCreateWithDefaults)

  # Test Case: OP_KEP_2, CreateServerwithOneSecurityGroup
  run_ec2_cspec("server create", "with security group parameter", expected_params, :ec2ServerCreateOneSecurityGroup)

  # Test Case: OP_KEP_3, CreateServerwithMultipleSecurityGroup
  run_ec2_cspec("server create", "with multiple security group parameter", expected_params, :ec2ServerCreateMultipleSecurityGroup)

  # Test Case: OP_KEP_5, CreateServerwithExistingServerName
  run_ec2_cspec("server create", "with existing server name", expected_params, :ec2ServerCreateWithExistingServerName)

  # Test Case: OP_KEP_6, CreateServerWithoutSecurityGroup
  run_ec2_cspec("server create", "without security group", expected_params, :ec2ServerCreateWithoutSecurityGroup)

  # Test Case: OP_KEP_7, CreateServerInOtherAvailabilityZone
  run_ec2_cspec("server create", "in other availability zone", expected_params, :ec2ServerCreateInOtherAvailabilityZone)

  # Test Case: OP_KEP_8, CreateServerOfDifferentFlavor
  run_ec2_cspec("server create", "of different flavor", expected_params, :ec2ServerCreateOfDifferentFlavor)

  # Test Case: OP_KEP_11, CreateServerWithEBSBackedDisk
  run_ec2_cspec("server create", "with EBS backed disk", expected_params, :ec2ServerCreateWithEBSBackedDisk)

  # Test Case: OP_KEP_12, CreateServerWithSingleTag
  run_ec2_cspec("server create", "wth single tag", expected_params, :ec2ServerCreateWithSingleTag)

  # Test Case: OP_KEP_13, CreateServerWithMultipleTags
  run_ec2_cspec("server create", "wth multiple tag", expected_params, :ec2ServerCreateWithMultipleTags)

  # Test Case: OP_KEP_20, CreateServerWithRoleAndRecipe
  run_ec2_cspec("server create", "wth role and recipe", expected_params, :ec2ServerCreateWithRoleAndRecipe)

  # Test Case: OP_KEP_23, CreateWindowsServerWithWinRMBasicAuth
  run_ec2_cspec("windows server create", "wth win RM basic auth", expected_params, :ec2WindowsServerCreateWithWinRMBasicAuth)

  # Test Case: OP_KEP_24, CreateWindowsServerWithSSHAuth
  run_ec2_cspec("windows server create", "wth SSH auth", expected_params, :ec2WindowsServerCreateWithSSHAuth)

  # Test Case: OP_KEP_15, DeleteServerDontPurge
  run_ec2_dspec("server delete", "with no purge option", expected_params, :ec2ServerDeleteDontPurge, "delete")

  # Test Case: OP_KEP_18, DeleteMutipleServers
  run_ec2_dspec("server delete", "command for multiple servers", expected_params, :ec2ServerDeleteMultiple, "delete_multiple")

 expected_params = {
                     :status => "should return empty list",
                     :stdout => nil,
                     :stderr => nil
                   }
  # Test Case: OP_KEP_16, ListServerEmpty
  run_ec2_lspec("server list", "for no instances", expected_params, :ec2ServerListEmpty)

  expected_params = {
                     :status => "should fail",
                     :stdout => nil,
                     :stderr => nil
                   }
  # Test Case: OP_KEP_4, CreateServerWithWrongKeyCombination
  run_ec2_cspec("server create", "with wrong key combination", expected_params, :ec2ServerCreateWrongKeyCombination, false, false)

  # Test Case: OP_KEP_9, CreateServerWithIncorrectSecurityGroup
  run_ec2_cspec("server create", "with incorrect security group", expected_params, :ec2ServerCreateWithIncorrectSecurityGroup, false, false)

  # Test Case: OP_KEP_10, CreateServerInNonExistentZone
  run_ec2_cspec("server create", "in non existent zone", expected_params, :ec2ServerCreateInNonExistentZone, false, false)

  # Test Case: OP_KEP_21, CreateServerwithInvalidRole
  # FIXME need to write a custom matcher to validate invalid role
  run_ec2_cspec("server create", "wth invalid role", expected_params, :ec2ServerCreateWithInvalidRole)

  # Test Case: OP_KEP_22, CreateServerWithInvalidRecipe
  # FIXME need to write a custom matcher to validate invalid recipe
  run_ec2_cspec("server create", "wth invalid recipe", expected_params, :ec2ServerCreateWithInvalidRecipe)

  # Test Case: OP_KEP_25, CreateLinuxServerWithWinRM
  run_ec2_cspec("linux server create", "with win RM ", expected_params, :ec2LinuxServerCreateWithWinRM)

  # Test Case: OP_KEP_19, DeleteServerThatDoesNotExist
  run_ec2_dspec("server list", "with non existent server", expected_params, :ec2ServerDeleteNonExistent, "delete_non_existent")

end
