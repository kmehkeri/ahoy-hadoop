# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  MASTERS = 1
  SLAVES = 2

  config.vm.box = "bento/centos-7.1"
  config.vm.provision "ansible" do |a|
    a.playbook = "playbook.yml"
    a.groups = { masters: MASTERS.times.collect { |i| "master#{i}" },
                 slaves: SLAVES.times.collect { |i| "slave#{i}" } }
  end


  if Vagrant.has_plugin?('vagrant-cachier')
    config.cache.scope = :box
    config.cache.enable :yum
  end

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

