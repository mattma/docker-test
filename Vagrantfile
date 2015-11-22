# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'fileutils'

VAGRANTFILE_API_VERSION="2"
BOX="holms/vagrant-centos7-box"
BOX_URL="https://github.com/holms/vagrant-centos7-box/releases/download/7.1.1503.001/CentOS-7.1.1503-x86_64-netboot.box"
MEMORY=2048
CPU=1

shared_path = "shared/"

CLOUD_CONFIG_PATH = File.join(File.dirname(__FILE__), "user-data")

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box=BOX
  config.vm.box_url=BOX_URL

  hostname="kube"

  config.vm.define vm_name = hostname do |c|
    c.vm.hostname=vm_name

    c.vm.provider :virtualbox do |vb|
      # Boot with headless mode or GUI mode
      vb.gui=false
      vb.memory=MEMORY
      vb.cpus=CPU
    end

    c.vm.synced_folder shared_path, "/home/vagrant/shared/"

    c.vm.provision :file, :source => "#{CLOUD_CONFIG_PATH}", :destination => "/tmp/user-data"
    c.vm.provision :shell, :path => "cloud-init.sh", :privileged => true
  end
end
