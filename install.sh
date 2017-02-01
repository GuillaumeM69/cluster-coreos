#!/bin/bash
#https://goo.gl/VP88QB
export myip=`ifconfig | awk '{ print $2}' | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" | awk NR==1`
wget  -O cloud-config.yaml https://raw.githubusercontent.com/GuillaumeM69/cluster-coreos/master/cloud-config.yaml
sed -i 's|$private_ipv4|'$myip'|g' cloud-config.yaml
coreos-install -d /dev/sda -C stable -c cloud-config.yaml
