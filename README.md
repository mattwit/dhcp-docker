# dhcp-docker
Lightweight vanilla dhcpd Docker container built on Alpine. Dhcpd runs as app in the container.

Notes:

    - dhcpd.conf must be copied to /etc/dhcp on the host (example dhcpd.conf included)
    
    - Edit the dhcpd.conf to match your environment
    
    - Edit run.sh to match your local copy of dhcpd.conf

Usage:

    run.sh - build and run container (must be run initially)
    stop.sh - stop the container
    start.sh - restart the container
    leases.sh - view active leases in running container
    kill.sh to completely remove the container 
    WARNING: kill.sh requires running install.sh to start container again
