$script2 = <<END
apt-get update
sudo apt-get install -y docker.io docker-compose
sudo sh /vagrant/command  
END

Vagrant.configure("2") do |config|
  # Настройка первой машины
  config.vbguest.auto_update = false
  config.vm.provider :virtualbox
  config.vm.box = "ubuntu/jammy64"
  config.vm.define "machine1" do |machine1|
    #machine1.vm.network "forwarded_port", guest: 8080, host: 8080  # Проброс порта 80 на хосте на порт 8080
    machine1.vm.network "forwarded_port", guest: 5432, host: 5432
    #machine1.vm.network "forwarded_port", guest: 80, host: 80
    machine1.vm.network "private_network", ip: "172.20.0.20" 
    # Добавление скрипта для обновления системы, установки iptables и настройки правил iptables
    machine1.vm.provision "shell", path: "Scripts/installation.sh"
    machine1.vm.provision "shell", path: "Scripts/ssh_operations1.sh"
    #machine1.vm.provision "shell", path: "Vagrant_scripts/iptables.sh"
    #machine1.vm.provision "shell", path: "Vagrant_scripts/start_docker.sh"
  end

  # Настройка второй машины
  config.vm.define "machine2" do |machine2|
    machine2.vm.provider "virtualbox" do |vb|
      vb.memory = "5000"
    end
    machine2.vm.box = "ubuntu/jammy64"
    machine2.vm.network "forwarded_port", guest: 5678, host: 5678
    machine2.vm.network "forwarded_port", guest: 80, host: 80
    machine2.vm.network "forwarded_port", guest: 9090, host: 9090
    machine2.vm.network "forwarded_port", guest: 3000, host: 3000
    machine2.vm.network "private_network", ip: "172.20.0.21"
    machine2.vm.provision "shell", path: "Scripts/ssh_operations2.sh"
    machine2.vm.provision "shell", path: "Scripts/installation2.sh"
    #machine2.vm.provision "shell", inline: $script2
  end

  config.vm.define "machine3" do |machine3|
    machine3.vm.provider "virtualbox" do |vb|
      vb.memory = "5000"
    end
    machine3.vm.box = "ubuntu/jammy64"
    machine3.vm.network "forwarded_port", guest: 8000, host: 8000
    machine3.vm.network "private_network", ip: "172.20.0.22"
    machine3.vm.provision "shell", path: "Scripts/ssh_operations2.sh"
    machine3.vm.provision "shell", path: "Scripts/installation2.sh"
    #machine2.vm.provision "shell", inline: $script2
  end
end
