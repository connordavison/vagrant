VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # Core configurations
  # -------------------
  config.vm.box = "ubuntu/trusty64"
  config.ssh.forward_agent = true
  config.vm.network :private_network, ip: "192.168.100.10"

  config.vm.provider :virtualbox do |v|
    v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    v.customize ["modifyvm", :id, "--memory", 1024]
    v.customize ["modifyvm", :id, "--name", "LAMP"]
  end
  
  # Running bootstrap
  # -----------------
  config.vm.provision :shell, :path => "bootstrap.sh"
  
  # Synced folders
  # --------------
  # Share your SSH key (you must execute commands (like "git clone") in "sudo su", because the key will be in the root folder, otherwise put it in vagrant folder)
  config.vm.synced_folder "~/.ssh", "/root/.ssh"

  # Forwarding ports
  # ----------------
  config.vm.network :forwarded_port, guest: 80, host: 8000
  config.vm.network :forwarded_port, guest: 8000, host: 4567
  config.vm.network :forwarded_port, guest: 3306, host: 3306
end
