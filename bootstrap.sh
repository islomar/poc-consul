#!/usr/bin/env bash

# Do not exit if something fails
set +e

apt-get update

echo Installing curl...
sudo apt-get -y install curl

echo Installing dependencies...
sudo apt-get install -y unzip curl

echo Fetching Consul...
cd /tmp/
wget -N https://dl.bintray.com/mitchellh/consul/0.4.1_linux_amd64.zip -O consul.zip

echo Installing Consul...
unzip -o consul.zip
sudo chmod +x consul
sudo mv consul /usr/bin/consul

echo Registering service by providing a service definition...
sudo su
mkdir /etc/consul.d
sudo echo '{"service": {"name": "web", "tags": ["rails"], "port": 80}, "service": {"name": "carriers", "tags": ["java"], "port": 80}}' > /etc/consul.d/web.json
consul agent -server -bootstrap-expect 1 -data-dir /tmp/consul -config-dir /etc/consul.d

# Reenable exiting if something fails	
set -e