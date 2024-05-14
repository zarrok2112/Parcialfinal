# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure("2") do |config|
  
  # Configuración del servidor maestro
  config.vm.define :master do |master|
    master.vm.box = "bento/ubuntu-22.04"
    master.vm.network :private_network, ip: "192.168.50.10"
    master.vm.hostname = "master"
  end
  
  # Configuración de los servidores esclavos
  (1..3).each do |i|
    config.vm.define "slave#{i}" do |slave|
      slave.vm.box = "bento/ubuntu-22.04"
      slave.vm.network :private_network, ip: "192.168.50.#{i + 10}"
      slave.vm.hostname = "slave#{i}"
    end
  end
  
  # Configuración del cliente
  config.vm.define :cliente do |cliente|
    cliente.vm.box = "bento/ubuntu-22.04"
    cliente.vm.network :private_network, ip: "192.168.50.2"
    cliente.vm.hostname = "cliente"
  end
end
