#!/bin/bash
# Script builds the docker image, runs the containers, and starts the dhcpd service on the container

# build dhcpd docker image from Dockerfile
dockerBuild(){

    sudo docker build -t opengear:dhcpd .

}

# Create the dhcp docker container
dockerRun(){

    docker run \
        --name dhcp \
        -itd \
        --rm \
        --net host \
        opengear:dhcpd \
        /bin/sh

}

# Start the dhcp docker container
dhcpStart(){

    # Create dhcpd.leases file
    docker exec dhcp touch /var/lib/dhcp/dhcpd.leases

    # Edit and copy dhcpd.conf from host to container (change to /home/user to where your dhcpd.conf is saved locally)
    docker cp /home/user/om-dhcp/dhcpd.conf dhcp:/etc/dhcp

    # Start the dhcpd container
    docker start dhcp

    # Start the dhcpd service within the container
    docker exec dhcp dhcpd

}

dockerBuild

dockerRun

dhcpStart
