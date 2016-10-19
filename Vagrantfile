# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure("2") do |config|
  config.vm.define "java" do |java|
    java.vm.box = "bento/ubuntu-16.04"
    java.vm.hostname = "Java"
    java.vm.synced_folder "~/sparta/challenges/java", "/home/vagrant/synced/java"
    java.vm.synced_folder "cookbooks/.", "/home/vagrant/cookbooks"
    java.vm.synced_folder "shell/.", "/home/vagrant/synced/shell"
    java.vm.network "forwarded_port", guest:80, host:80
    java.vm.network "forwarded_port", guest:443, host:443
    java.vm.network "forwarded_port", guest:8080, host:8080
    java.vm.network "forwarded_port", guest:8443, host:8443
    java.vm.network "forwarded_port", guest:9990, host:9990
    java.vm.provision "shell", inline: "sudo usermod -a -G www-data vagrant"
    java.vm.provision "shell", inline: "sudo apt-get install curl"
    java.vm.provision "shell", inline: "curl https://omnitruck.chef.io/install.sh | sudo bash -s -- -P chefdk -c stable -v 0.16.28"
    java.vm.provision "shell", inline: "sudo chef-client --local-mode --runlist 'recipe[webserver]'"
    #java.vm.provision "shell", path: "shell/java-prov.sh"
  end
  config.vm.provider "virtualbox" do |v|
    v.memory = 2048
    v.name = "Docker"
end
end
