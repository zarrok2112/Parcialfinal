Vagrant.configure("2") do |config|
  config.vm.define :master do |master|
    master.vm.box = "bento/ubuntu-22.04"
    master.vm.network :private_network, ip: "192.168.60.4"
    master.vm.hostname = "master"
    master.vm.provision "file", source: "./utils/mysql/master/init.sql", destination: "/home/vagrant/init.sql"
    master.vm.provision "file", source: "./utils/mysql/master/my.cnf", destination: "/home/vagrant/my.cnf"
    master.vm.provision "shell", path: "./scripts/script_mysq.sh"
    master.vm.provision "shell", path: "./scripts/script_master.sh"
  end

  config.vm.define :slave1 do |slave1|
    slave1.vm.box = "bento/ubuntu-22.04"
    slave1.vm.network :private_network, ip: "192.168.60.5"
    slave1.vm.hostname = "slave1"
    slave1.vm.provision "file", source: "./utils/mysql/init.sql", destination: "/home/vagrant/init.sql"
    slave1.vm.provision "file", source: "./utils/mysql/slave/slave_1/my.cnf", destination: "/home/vagrant/my.cnf"
    slave1.vm.provision "shell", path: "./scripts/script_mysq.sh"
    slave1.vm.provision "shell", path: "./scripts/script_slave.sh"
  end

  config.vm.define :slave2 do |slave2|
    slave2.vm.box = "bento/ubuntu-22.04"
    slave2.vm.network :private_network, ip: "192.168.60.6"
    slave2.vm.hostname = "slave2"
    slave2.vm.provision "file", source: "./utils/mysql/init.sql", destination: "/home/vagrant/init.sql"
    slave2.vm.provision "file", source: "./utils/mysql/slave/slave_2/my.cnf", destination: "/home/vagrant/my.cnf"
    slave2.vm.provision "shell", path: "./scripts/script_mysq.sh"
    slave2.vm.provision "shell", path: "./scripts/script_slave.sh"
  end

  config.vm.define :webserver do |webserver|
    webserver.vm.box = "bento/ubuntu-22.04"
    webserver.vm.network :private_network, ip: "192.168.60.3"
    webserver.vm.provision "shell", path: "./scripts/script_ngix.sh"
  end
end