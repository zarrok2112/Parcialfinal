# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.define :master do |master|
    master.vm.box = "bento/ubuntu-22.04"
    master.vm.network :private_network, ip: "192.168.60.3"
    master.vm.provision "shell", path: "./scripts/script_mysq.sh"
    #master.vm.provision "shell", path: "script.sh"
    #master.vm.provision "file", source: "webapp", destination: "/home/vagrant/webapp"
    #master.vm.provision "file", source: "init.sql", destination: "/home/vagrant/init.sql"
    #master.vm.hostname = "servidorWeb"
  end
  
	config.vm.define :slave1 do |slave_1|
		slave_1.vm.box = "bento/ubuntu-22.04"
		slave_1.vm.network :private_network, ip: "192.168.60.4"
		slave_1.vm.hostname = "slave_1"
	end
	config.vm.define :slave2 do |slave_2|
		slave_2.vm.box = "bento/ubuntu-22.04"
		slave_2.vm.network :private_network, ip: "192.168.60.5"
		slave_2.vm.hostname = "slave_2"
	end
  config.vm.define :slave3 do |slave_3|
		slave_3.vm.box = "bento/ubuntu-22.04"
		slave_3.vm.network :private_network, ip: "192.168.60.6"
		slave_3.vm.hostname = "slave_3"
  end
end
