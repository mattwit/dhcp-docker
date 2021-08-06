# dhcp-docker
Lightweight vanilla dhcpd Docker container built on Alpine. Dhcpd runs as app in the container.

Notes:

    - dhcpd.conf must be copied to /etc/dhcp on the host (example dhcpd.conf included)
    
    - Edit the dhcpd.conf to match your environment
    
    - Edit run.sh to match your local copy of dhcpd.conf
    
    - Choose run.sh to run as an app
    
    - Choose install.sh to run as a service
    

Usage:

    install.sh - build and run container as a service (will start at boot up as a cron job)
    
    run.sh - build and run container as an app
    
    stop.sh - stop the container
    
    start.sh - restart the container
    
    leases.sh - view active leases in running container
    
    kill.sh to completely remove the container 
    WARNING: kill.sh requires running run.sh or install.sh to start container again
    
    
