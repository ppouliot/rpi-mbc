#!/bin/bash

OVPN_DATA="ovpn-data"
OVPN_CONTAINER_IMAGE="container4armhf/armhf-docker-openvpn"
OVPN_CLIENT_NAME="ppouliot"
# docker run -v $OVPN_DATA:/etc/openvpn -p 1194:1194/udp --privileged -e DEBUG=1 container4armhf/armhf-docker-openvpn
docker run --volumes-from ovpn-data --rm -p 1194:1194/udp --cap-add=NET_ADMIN container4armhf/armhf-docker-openvpn
