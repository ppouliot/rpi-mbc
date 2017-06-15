#!/bin/bash

OVPN_DATA="openvpn-data"
OVPN_CONTAINER_IMAGE="container4armhf/armhf-docker-openvpn"
OVPN_CLIENT_NAME="ppouliot"

docker volume create --name $OVPN_DATA
docker run -v $OVPN_DATA:/etc/openvpn --rm $OVPN_CONTAINER_IMAGE ovpn_genconfig -u udp://71.174.244.30
docker run -v $OVPN_DATA:/etc/openvpn --rm -it $OVPN_CONTAINER_IMAGE ovpn_initpki
docker run -v $OVPN_DATA:/etc/openvpn -d -p 1194:1194/udp --cap-add=NET_ADMIN $OVPN_CONTAINER_IMAGE
docker run -v $OVPN_DATA:/etc/openvpn -p 1194:1194/udp --privileged container4armhf/armhf-docker-openvpn
