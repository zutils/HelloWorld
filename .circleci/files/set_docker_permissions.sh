#!/usr/bin/env bash

if $(id | grep -q docker)
then
echo Docker Permissions set properly!
else 

# Initialize Docker to not use sudo
sudo usermod -aG docker $USER

fi