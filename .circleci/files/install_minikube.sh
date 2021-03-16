#!/usr/bin/env bash

if $(which minikube | grep -q /usr/bin/)
then
echo Minikube installed!
else 

# Install minikube
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube_latest_amd64.deb
sudo dpkg -i minikube_latest_amd64.deb
sudo minikube start

fi
