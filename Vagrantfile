Vagrant.configure("2") do |config|
  config.vm.box = "hashicorp/bionic64"
  config.vm.provision "shell", path: "bootstrap.sh"
  config.vm.synced_folder "k3s/", "/etc/rancher/k3s"

  # === Port Forwards ===
  
  # kubernetes
  config.vm.network "forwarded_port", guest: 6443, host: 6443

  # http/https
  config.vm.network "forwarded_port", guest: 80, host: 80
  config.vm.network "forwarded_port", guest: 443, host: 443
end