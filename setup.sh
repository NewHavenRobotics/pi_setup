name=robot

#set username and device name to $name
usermod -l $name -d /home/$name -m robot
groupmod -n $name robot
hostnamectl set-hostname $name

#simplify prompt
echo "#Ryan's Simple Prompt" >> /home/$name/.bashrc
echo "PS1=\"\[\e[1;32m\]\u\[\e[0m\]:\[\e[1;36m\]\w\[\e[0m\] \"" >> /home/$name/.bashrc

#static IP via netplan
mv 00-installer-config.yaml /etc/netplan
chmod +600 /etc/netplan/00-installer-config.yaml
systemctl disable NetworkManager
systemctl enable systemd-networkd
systemctl start systemd-networkd
netplan apply

reboot
