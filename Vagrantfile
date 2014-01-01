# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.define "queue01" do |box|
    box.vm.box = "saucy64"
    box.vm.hostname = "queue01"
    box.vm.network :private_network, ip: "192.168.33.31"
    box.vm.provider "virtualbox" do |vm|
      vm.customize [
        'modifyvm', :id,
        '--memory', '1024'
      ]
    end

    box.omnibus.chef_version = :latest
    box.berkshelf.enabled = true
    box.vm.provision :chef_solo do |chef|
      chef.cookbooks_path = "cookbooks"
      #chef.roles_path = "../crystals-cookbooks/roles"
      #chef.data_bags_path = "../crystals-cookbooks/data_bags"
      chef.run_list = %w[ recipe[rabbitmq] recipe[ccrabbitmq] ]

      chef.json = {
        rabbitmq: {
          cluster: true,
          cluster_disk_nodes: ["rabbit@queue01", "rabbit@queue02"]
        }
      }
    end
  end

  config.vm.define "queue02" do |box|
    box.vm.box = "saucy64"
    box.vm.hostname = "queue02"
    box.vm.network :private_network, ip: "192.168.33.32"
    box.omnibus.chef_version = :latest
    box.berkshelf.enabled = true
    box.vm.provider "virtualbox" do |vm|
      vm.customize [
        'modifyvm', :id,
        '--memory', '1024'
      ]
    end

    box.vm.provision :chef_solo do |chef|
      chef.cookbooks_path = "cookbooks"
      #chef.roles_path = "../crystals-cookbooks/roles"
      #chef.data_bags_path = "../crystals-cookbooks/data_bags"
      chef.run_list = %w[ recipe[rabbitmq] recipe[ccrabbitmq] ]

      chef.json = {
        rabbitmq: {
          cluster: true,
          cluster_disk_nodes: ["rabbit@queue01", "rabbit@queue02"]
        }
      }
    end
  end
end
