# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.provider :virtualbox do |box|
      box.linked_clone = true
      box.customize [ "modifyvm", :id, "--memory", "2048", "--cpus", "1" ]
  end
  
  config.vm.define :jenkins do |box|
      box.vm.hostname = "jenkins"
      box.vm.box = "ubuntu/xenial64"
      box.vm.network "private_network", ip: "192.168.33.55"
      box.vm.synced_folder ".", "/vagrant"
      box.vm.provision "jenkins_provision", type: "shell" do |j|
          j.path = "provision.sh"
      end
      box.vm.provision "file", source: "id_rsa", destination: "/home/vagrant/id_rsa"
      box.vm.provision "ssh provision", type: "shell", run: "always" do |s|
        s.inline = "sudo cp /home/vagrant/id_rsa /home/vagrant/.ssh/id_rsa; sudo chmod 600 /home/vagrant/.ssh/id_rsa; sudo chown vagrant:vagrant /home/vagrant/.ssh/id_rsa"
      end
    
       # box.vm.provision "shell", inline: "sudo cp /home/vagrant/id_rsa /home/vagrant/.ssh/id_rsa; sudo chmod 600 /home/vagrant/.ssh/id_rsa; sudo chown vagrant:vagrant /home/vagrant/.ssh/id_rsa"
      box.vm.provision "docker" do |d|
        d.run "registry:2",
        args: "-d -p 5000:5000 --restart=always --name registry"
      end
  end
  
    config.vm.define :dev do |box|
      box.vm.hostname = "dev"
      box.vm.box = "ubuntu/xenial64"
      box.vm.network "private_network", ip: "192.168.33.56"
      box.vm.synced_folder ".", "/vagrant"
      box.vm.provider :virtualbox do |vb|
         vb.customize ["modifyvm", :id, "--memory", "1024"]
         end
      box.vm.provision "file", source: "id_rsa.pub", destination: "/home/vagrant/id_rsa.pub"
      box.vm.provision "shell", inline: "sudo cat /home/vagrant/id_rsa.pub >> /home/vagrant/.ssh/authorized_keys"
      box.vm.provision :shell,
          :path => "provision-env.sh",
          :preserve_order => true
  end
  
      
      config.vm.define :qa do |box|
      box.vm.hostname = "qa"
      box.vm.box = "ubuntu/xenial64"
      box.vm.network "private_network", ip: "192.168.33.57"
      box.vm.synced_folder ".", "/vagrant"
      box.vm.provider :virtualbox do |vb|
         vb.customize ["modifyvm", :id, "--memory", "1024"]
         end
      box.vm.provision "file", source: "id_rsa.pub", destination: "/home/vagrant/id_rsa.pub"
      box.vm.provision "shell", inline: "sudo cat /home/vagrant/id_rsa.pub >> /home/vagrant/.ssh/authorized_keys"
      box.vm.provision :shell,
          :path => "provision-env.sh",
          :preserve_order => true
      end
end
