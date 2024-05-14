# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.define :master do |master|
    master.vm.box = "bento/ubuntu-22.04"
    master.vm.network :private_network, ip: "192.168.60.3"
    master.vm.provision "shell", path: "./scripts/script_mysq.sh"
    master.vm.provision "shell", inline: "./scripts/script_mysq.sh"
    #master.vm.provision "shell", path: "script.sh"
    #master.vm.provision "file", source: "webapp", destination: "/home/vagrant/webapp"
    #master.vm.provision "file", source: "init.sql", destination: "/home/vagrant/init.sql"
    #master.vm.hostname = "servidorWeb"
  end
  
	config.vm.define :slave1 do |slave1|
		slave1.vm.box = "bento/ubuntu-22.04"
		slave1.vm.network :private_network, ip: "192.168.60.4"
		slave1.vm.hostname = "slave1"
    slave1.vm.provision "shell", path: "./scripts/script_mysq.sh"
	end
	config.vm.define :slave2 do |slave2|
		slave2.vm.box = "bento/ubuntu-22.04"
		slave2.vm.network :private_network, ip: "192.168.60.5"
		slave2.vm.hostname = "slave2"
    slave2.vm.provision "shell", path: "./scripts/script_mysq.sh"
	end
  config.vm.define :slave3 do |slave3|
		slave3.vm.box = "bento/ubuntu-22.04"
		slave3.vm.network :private_network, ip: "192.168.60.6"
		slave3.vm.hostname = "slave3"
    slave3.vm.provision "shell", path: "./scripts/script_mysq.sh"
  end
end
