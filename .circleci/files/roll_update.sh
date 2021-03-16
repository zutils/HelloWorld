#!/usr/bin/env bash

# Do rolling update!
dockerpath=jzypo/udacity:hello_world_server

if $(minikube kubectl -- get deployments | grep -q "No Resources")
then
minikube kubectl -- create deployment hello-world-server --image $dockerpath --port=8000
else
echo "Found Pod!"
fi

minikube kubectl -- get pods

echo "Rolling update!"
minikube kubectl -- set image deployments/hello-world-server udacity=jzypo/udacity:latest

# Run socat to forward port 80 to port 8000
if $(ps -A | grep -q kubectl)
then
echo "Kubernetes may already be port forwarding"
else
echo "Port forwarding kubernetes"
nohup minikube kubectl --  port-forward deployment/hello-world-server 8000:8000 &
fi

# Run socat to forward port 80 to port 8000
if $(ps -A | grep -q socat)
then
echo "Port 80 is already forwarded to 8000"
else
echo "Forwarding port 80 to 8000"
nohup sudo socat TCP-LISTEN:80,fork TCP:localhost:8000 &
fi
