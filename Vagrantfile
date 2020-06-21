Vagrant.configure("2") do |config|
  config.vm.box = "hashicorp/bionic64"
  config.vm.provision "shell", path: "bootstrap.sh"
  config.vm.synced_folder "k3s/", "/etc/rancher/k3s"
end