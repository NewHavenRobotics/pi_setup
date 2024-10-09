name=robot
ip=192.168.1.101

usermod -l $name -d /home/$name -m robot
groupmod -n $name robot
hostnamectl set-hostname $name
touch /etc/network/interfaces.d/eth0
printf "allow-hotplug eth0\niface eth0 inet static\naddress %s\nnetwork 192.168.1.0\nnetmask 255.255.255.0\ngateway 192.168.1.1" "$ip" >> /etc/network/interfaces.d/eth0
exit
