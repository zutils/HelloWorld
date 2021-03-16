#!/usr/bin/env bash
# This script should run if 'minikube status' fails
if $(minikube status | grep -q Running)
then
echo Minikube Running!
else 
echo installing docker

# Install Docker
sudo apt-get -y install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update
sudo apt-get -y install docker-ce docker-ce-cli containerd.io

# Initialize Docker to not use sudo
sudo usermod -aG docker $USER
newgrp docker

# Install minikube
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube_latest_amd64.deb
sudo dpkg -i minikube_latest_amd64.deb
sudo minikube start

fi


# Do rolling update!
dockerpath=jzypo/udacity:hello_world_server
minikube kubectl -- run hello_world_server --image $dockerpath --port=80
minikube kubectl -- kubectl get pods

# Run in background - forward port 80 to the server's port 8000
#nohup minikube kubectl --  port-forward hello_world_server 80:8000