#!/usr/bin/env bash

# Note: This won't do anything if we are already deployed
echo "Initializing Deployment"
minikube kubectl -- apply -f /tmp/modified_deployment.yml

echo "Rolling update!"
minikube kubectl -- rollout restart deployments/hello-world-server

# Debug information
minikube kubectl -- get deployments

# Open up port 8000 for Kubernetes
if $(ps -A | grep -q kubectl)
then
echo "Killing forwarding service!"
kill -9 $(ps -A | grep kubectl | cut -d " " -f 3)
fi

echo "Port forwarding kubernetes"
# This has to be done after re-deploying
nohup minikube kubectl -- port-forward deployment/hello-world-server 8000:8000 >> /tmp/forward_logs &

# Run socat to forward port 80 to port 8000
if $(ps -A | grep -q socat)
then
echo "Port 80 is already forwarded to 8000"
else
echo "Forwarding port 80 to 8000"
sudo nohup socat TCP-LISTEN:80,fork TCP:localhost:8000 >> /tmp/socat_logs &
fi
