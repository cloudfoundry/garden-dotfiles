# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/zesty64"
  config.vm.provision 'ansible_local' do |ansible|
    ansible.tags = 'linux'
    ansible.playbook = 'playbook.yml'
  end
end
