#!/bin/bash

apt-get -y update

# install guest additions
mount -o loop VBoxGuestAdditions.iso /media/cdrom
sh /media/cdrom/VBoxLinuxAdditions.run
umount /media/cdrom

# Installing vagrant keys
mkdir /home/vagrant/.ssh
chmod 700 /home/vagrant/.ssh
cd /home/vagrant/.ssh
wget --no-check-certificate 'https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub' -O authorized_keys
chmod 600 /home/vagrant/.ssh/authorized_keys
chown -R vagrant /home/vagrant/.ssh

# Setup sudo to allow no-password sudo for "vagrant"
groupadd -r vagrant
usermod -a -G vagrant vagrant
cp /etc/sudoers /etc/sudoers.orig
sed -i -e '/Defaults\s\+env_reset/a Defaults\texempt_group=vagrant' /etc/sudoers
sed -i -e 's/%vagrant ALL=(ALL) ALL/%vagrant ALL=NOPASSWD:ALL/g' /etc/sudoers

# Install necessary libraries for guest additions and Vagrant NFS Share
sudo apt-get -y -q install linux-headers-$(uname -r) build-essential dkms nfs-common

# install puppet3
#wget http://apt.puppetlabs.com/puppetlabs-release-precise.deb
#dpkg -i puppetlabs-release-precise.deb
#apt-get update

