#!/bin/bash
# Script puts the OM back to a pre docker image state

# Kill the docker container 
docker kill dhcp

# Delete the docker images
docker rmi opengear:dhcpd
docker rmi alpine:latest

# Verify the container and images are deleted
echo
docker ps -a
echo
docker images -a
echo