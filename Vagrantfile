# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  NODES = 5 # minimum 3
  GROUPS = {
    zookeepers: ['node0', 'node1', 'node2'],
    namenodes: ['node0'],
    secondary_namenodes: ['node1'],
    resource_managers: ['node0'],
    workers: NODES.times.collect { |i| "node#{i}" }
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
      node.vm.hostname = node_name
      node.vm.network "private_network", ip: node_ip
      node.vm.network "forwarded_port", guest_ip: node_ip, guest: 50070, host: 50070 if GROUPS[:namenodes].include?(node_name)
    end
  end

  config.vm.provision "ansible", playbook: "playbook.yml", groups: GROUPS
end

