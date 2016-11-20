# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  MASTERS = 1
  SLAVES = 3

  config.vm.box = "bento/centos-7.1"
  config.vm.provision "ansible", playbook: "playbook.yml"

  MASTERS.times do |n|
    config.vm.define "master#{n}" do |node| 
      node.vm.hostname = "master#{n}"
      node.vm.network "private_network", ip: "192.168.33.1#{n}"
    end
  end

  SLAVES.times do |n|
    config.vm.define "slave#{n}" do |node| 
      node.vm.hostname = "slave#{n}"
      node.vm.network "private_network", ip: "192.168.33.2#{n}"
    end
  end
end

