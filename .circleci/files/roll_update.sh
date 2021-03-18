#!/usr/bin/env bash

# Note: This won't do anything if we are already deployed
echo "Initializing Deployment and Service"
minikube kubectl -- apply -f ~/HelloWorld/.circleci/files/service.yml
minikube kubectl -- apply -f /tmp/modified_deployment.yml

echo "Rolling update!"
minikube kubectl -- rollout restart deployments/hello-world-server

# Run socat to forward port 80 to port 8000
if $(ps -A | grep -q socat)
then
echo "Port 80 is already forwarded to 8000"
else
echo "Forwarding localhost port 80 to the NodePort in Minikube server $(minikube service --url hello-world-server)"
sudo nohup socat TCP-LISTEN:80,fork TCP:$(minikube service --url hello-world-server | sed -s "s|http://||g") >> /tmp/socat_logs &
fi
