#!/bin/bash
sudo su -
sudo mkdir -p /opt/bin
sudo curl -L https://github.com/docker/compose/releases/download/1.14.0/docker-compose-`uname -s`-`uname -m` > /opt/bin/docker-compose
sudo chmod +x /opt/bin/docker-compose
