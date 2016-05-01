require 'json'

if File.exists? './config.json'
  settings = JSON.parse(File.read('./config.json'))
end

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # Configure the box
  config.vm.box = "ubuntu/trusty64"
  config.ssh.forward_agent = true
  config.vm.network :private_network, ip: "192.168.100.10"

  config.vm.provider :virtualbox do |v|
    v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    v.customize ["modifyvm", :id, "--memory", 1024]
    v.customize ["modifyvm", :id, "--name", "PHP Vagrantbox"]
  end
  
  # Run provisions
  config.vm.provision :shell, :path => "bootstrap.sh"
  
  # Sync folders
  settings['synced_folders'].each do |m|
    config.vm.synced_folder m['host'], m['guest']
  end

  # Forward ports
  settings['forwarded_ports'].each do |m|
    config.vm.network :forwarded_port, guest: m['guest'], host: m['host']
  end
end
