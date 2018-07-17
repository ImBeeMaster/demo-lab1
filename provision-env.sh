#!/bin/bash


# Docker

echo "Installing Docker"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update > /dev/null 2>&1
sudo apt-get -y install docker-ce > /dev/null 2>&1
sudo systemctl enable docker
sudo usermod -aG docker ${USER}


#Install Java
<<<<<<< HEAD
sudo apt-get -y install openjdk-8-jdk > /dev/null 2>&1
=======
sudo apt-get install openjdk-8-jdk > /dev/null 2>&1
>>>>>>> 2d97a0bccf4f74433d00100816b3a071a88ab5ac

# Docker Compose

echo "Installing Docker Compose"
sudo wget \
        --output-document=/usr/local/bin/docker-compose \
        https://github.com/docker/compose/releases/download/1.21.2/run.sh \
    && sudo chmod +x /usr/local/bin/docker-compose \
    && sudo wget \
        --output-document=/etc/bash_completion.d/docker-compose \
        "https://raw.githubusercontent.com/docker/compose/$(docker-compose version --short)/contrib/completion/bash/docker-compose" \
    && printf '\nDocker Compose installed successfully\n\n'
	
echo "Success"