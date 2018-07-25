#! /usr/bin/env bash
echo "Macking SSH povosion by adding keypairs to the home directories and ssh-add\`ing"
cp /vagrant/.vagrant/machines/qa/virtualbox/private_key /home/vagrant/.ssh/private_key_qa
cp /vagrant/.vagrant/machines/dev/virtualbox/private_key /home/vagrant/.ssh/private_key_dev
sudo chmod 700 -- /home/vagrant/.ssh/private_key_dev /home/vagrant/.ssh/private_key_qa
eval $(ssh-agent)
ssh-add /home/vagrant/.ssh/private_key_qa /home/vagrant/.ssh/private_key_dev
if [[ $? -eq 0 ]]; then echo "SSH keys successfully added"
else echo "There were some problem"
fi

