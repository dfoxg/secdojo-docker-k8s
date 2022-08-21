#!/bin/bash

echo "glückwunsch! docker-flag gefunden" > /opt/flag.txt
docker run -d -v /:/tmp/rootfs alpine sh -c 'while sleep 3600; do :; done'

#create k3s cluster
k3d cluster delete sec
k3d cluster create sec -a 3 -s 1

# create flag on the node
SERVER_ID=$(docker ps -aqf "name=k3d-sec-server-0")
echo "use $SERVER_ID as master node"
docker exec $SERVER_ID sh -c 'mkdir /opt && echo "Glückwunsch. K8s-Flag gefunden!" > /opt/flag.txt'
docker exec $SERVER_ID cat /opt/flag.txt

clear