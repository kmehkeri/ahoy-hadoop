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
    config.vm.define "node#{n}", primary: (n == 0) do |node| 
      node.vm.hostname = "node#{n}"
      node.vm.network "private_network", ip: "192.168.33.1#{n}"
    end
  end

  config.vm.provision "ansible", playbook: "playbook.yml", groups: GROUPS
end

