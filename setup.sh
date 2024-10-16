name=robot
ip=192.168.1.101

#set username and device name to $name
usermod -l $name -d /home/$name -m robot
groupmod -n $name robot
hostnamectl set-hostname $name

#static IP to $ip
touch /etc/network/interfaces.d/eth0
printf "allow-hotplug eth0\niface eth0 inet static\naddress %s\nnetwork 192.168.1.0\nnetmask 255.255.255.0\ngateway 192.168.1.1" "$ip" >> /etc/network/interfaces.d/eth0
netplan apply
#simplify prompt
echo "#Ryan's Simple Prompt" >> /home/$name/.bashrc
echo "PS1=\"\e[1;32m\u\e[0m:\e[1;36m\w\e[0m \"" >> /home/$name/.bashrc
shudown now
