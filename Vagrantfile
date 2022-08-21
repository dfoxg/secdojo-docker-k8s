# encoding: utf-8
# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
    config.vm.box = "generic/debian11"
    config.vm.provider "hyperv"
    
    # Actual machine name
    config.vm.hostname = "secdojo-test"

    config.vm.provision "shell", 
        path: "setup.sh", privileged: true
    
    config.vm.provision "shell", 
        path: "setup-exercise.sh", privileged: true

  end