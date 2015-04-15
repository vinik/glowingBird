VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "ubuntu/trusty64"

  config.vm.network :forwarded_port, guest: 80, host: 8123
  config.vm.network :forwarded_port, guest: 3306, host: 33069

  config.vm.synced_folder ".", "/vagrant", mount_options: ['dmode=777','fmode=666']

  config.vm.provider "virtualbox" do |v|
  v.memory = 512
    v.cpus = 1
  end

  config.vm.provision :shell, path: "vagrant/bootstrap.sh"
  
end