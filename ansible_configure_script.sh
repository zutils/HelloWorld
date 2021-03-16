#!/usr/bin/env bash

# Install minikube
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube_latest_amd64.deb
sudo dpkg -i minikube_latest_amd64.deb

dockerpath=jzypo/udacity:hello_world_server
kubectl run hello_world_server --image $dockerpath --port=80
kubectl get pods

# Run in background - forward port 80 to the server's port 8000
nohup kubectl port-forward hello_world_server 80:8000


