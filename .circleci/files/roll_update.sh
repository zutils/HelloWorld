#!/usr/bin/env bash

# Do rolling update!
dockerpath=jzypo/udacity:hello-world-server
minikube kubectl -- run hello-world-server --image $dockerpath --port=80
minikube kubectl -- get pods

# Run in background - forward port 80 to the server's port 8000
#nohup minikube kubectl --  port-forward hello-world-server 80:8000