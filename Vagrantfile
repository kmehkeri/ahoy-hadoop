# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  NODES = 5 # adjustable in range 3 .. 9
  ALL = NODES.times.collect { |i| "node#{i}" }
  GROUPS = {
    postgresql_servers: ['node0'],
    zookeepers: ['node0', 'node1', 'node2'],
    hdfs_namenodes: ['node0'],
    hdfs_secondary_namenodes: ['node1'],
    hdfs_datanodes: ALL,
    yarn_resource_managers: ['node0'],
    yarn_node_managers: ALL,
    mapred_job_history_servers: ['node0'],
    hbase_masters: ['node0'],
    hbase_thrift_servers: ['node0'],
    hbase_regionservers: ALL,
    hive_servers: ['node0'],
    hue_servers: ['node0'],
    spark_clients: ['node0'],
    sqoop_clients: ['node0']
  }

  config.vm.box = "bento/centos-7.1"

  if Vagrant.has_plugin?('vagrant-cachier')
    config.cache.scope = :box
    config.cache.enable :yum
  end
  
  NODES.times do |n|
    node_name = "node#{n}"
    node_ip = "192.168.33.1#{n}"
    node_primary = (n == 0)

    config.vm.define node_name, primary: node_primary do |node| 
      node.vm.provider :virtualbox do |vb|
        # Adjustable to host capabilities and number of nodes
        vb.memory = 2048
        vb.cpus = 1
      end

      node.vm.hostname = node_name
      node.vm.network "private_network", ip: node_ip
      node.vm.network "forwarded_port", guest_ip: node_ip, guest: 50070, host: 50070 if GROUPS[:hdfs_namenodes].include?(node_name)
      node.vm.network "forwarded_port", guest_ip: node_ip, guest: 8088, host: 8088 if GROUPS[:yarn_resource_managers].include?(node_name)
      node.vm.network "forwarded_port", guest_ip: node_ip, guest: 8888, host: 8888 if GROUPS[:hue_servers].include?(node_name)
    end
  end

  config.vm.provision "ansible", playbook: "playbook.yml", groups: GROUPS
end

