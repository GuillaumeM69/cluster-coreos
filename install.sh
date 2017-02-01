export myip=`ifconfig | awk '{ print $2}' | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" | awk NR==1`
wget  -O cloud-config.yaml http://goo.gl/l7br8P
sed -i 's|$private_ipv4|'$myip'|g' cloud-config.yaml
coreos-install -d /dev/sda -C stable -c cloud-config.yaml
