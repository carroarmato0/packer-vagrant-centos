# Installing the virtualbox guest additions
VBOX_VERSION=$(cat /home/vagrant/.vbox_version)

yum -y install bzip2 gcc kernel-devel kernel-headers make perl dkms
cd /tmp
mount -o loop /home/vagrant/VBoxGuestAdditions_$VBOX_VERSION.iso /mnt
export KERN_DIR=/usr/src/kernels/`uname -r`
sh /mnt/VBoxLinuxAdditions.run
cat /var/log/VBoxGuestAdditions.log
cat /var/log/vboxadd-install.log
umount /mnt
rm -rf /home/vagrant/VBoxGuestAdditions_*.iso
