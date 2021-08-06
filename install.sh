#!/bin/bash
# Install script for om-dhcp Docker container

echo
echo Installing dhcp Docker container...
echo

# Add start.sh to crond to start at reboot
echo "Adding to crond..."
sudo echo "@reboot bash /home/docker/om-dhcp/start.sh" >> cronDhcp
sudo crontab cronDhcp
sudo rm cronDhcp

# Check if dhcpd.conf exists
dhcpConf=/etc/dhcp/dhcpd.conf
if [ ! -f "$dhcpConf" ]; then
    echo
    echo "Script stopped!"
    echo "Cannot find file /etc/dhcp/dhcpd.conf. Copy your dhcpd.conf to /etc/dhcp and re-run install.sh" >&2
    echo 
    exit 1
fi

# Create directory and files for dhcpd leases
leases=/var/lib/dhcp
if [ ! -d "$leases" ]; then
    echo "Creating /var/lib/dhcp/dhcpd.leases..."
    sudo mkdir /var/lib/dhcp && sudo touch /var/lib/dhcp/dhcpd.leases
fi

# Build image "opengear:dhcpd" from Dockerfile
echo "Docker build..."
sudo docker build -t opengear:dhcpd .

# Build container named "dhcp" from image "opengear:dhcpd"
echo "Docker run..."
sudo docker run \
    --name dhcp \
    -itd \
    --net host \
    -v /etc/dhcp:/etc/dhcp \
    -v /var/lib/dhcp:/var/lib/dhcp \
    opengear:dhcpd

# Run start script to start dhcpd service in the container
echo "Running startup script..."
sudo bash start.sh
echo
echo bash stop.sh to stop the container
echo bash start.sh to restart the container
echo bash kill.sh to completely remove the container 
echo WARNING: kill.sh requires running install.sh to start container again
echo
