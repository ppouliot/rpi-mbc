#!/bin/bash

OVPN_DATA="ovpn-data"
OVPN_CONTAINER_IMAGE="container4armhf/armhf-docker-openvpn"
OVPN_CLIENT_NAME=$1

docker run -v $OVPN_DATA:/etc/openvpn --rm -it $OVPN_CONTAINER_IMAGE easyrsa build-client-full $OVPN_CLIENT_NAME nopass
docker run -v $OVPN_DATA:/etc/openvpn --rm $OVPN_CONTAINER_IMAGE ovpn_getclient $OVPN_CLIENT_NAME > $OVPN_CLIENT_NAME.ovpn





