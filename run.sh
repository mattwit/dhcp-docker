#!/bin/bash
# Script builds the docker image, runs the containers, and starts the dhcpd service on the container

# 

makeFiles(){

    sudo mkdir /var/lib/dhcp
    sudo touch /var/lib/dhcp/dhcpd.leases

}

# build dhcpd docker image from Dockerfile
dockerBuild(){

    sudo docker build -t opengear:dhcpd .

}

# Create the dhcp docker container
dockerRun(){

    sudo docker run \
        --name dhcp \
        -itd \
        --net host \
        -v /etc/dhcp:/etc/dhcp \
        -v /var/lib/dhcp:/var/lib/dhcp \
        opengear:dhcpd \
        /bin/sh

}

# Start the dhcp docker container
dhcpStart(){

    sudo docker exec dhcp dhcpd

}

makeFiles

dockerBuild

dockerRun

dhcpStart
