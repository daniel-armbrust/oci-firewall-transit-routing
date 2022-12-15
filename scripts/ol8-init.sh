#!/bin/sh

# Disable ssh login until next reboot.
/usr/bin/systemctl stop sshd 

/usr/bin/timedatectl set-timezone America/Sao_Paulo

/usr/bin/dnf -y update
/usr/bin/dnf -y install dnf-automatic

/usr/bin/sed -i 's/^upgrade_type =.*/upgrade_type = default/g' /etc/dnf/automatic.conf
/usr/bin/sed -i 's/^download_updates =.*/download_updates = yes/g' /etc/dnf/automatic.conf
/usr/bin/sed -i 's/^apply_updates =.*/apply_updates = yes/g' /etc/dnf/automatic.conf

/usr/bin/systemctl enable --now dnf-automatic.timer

/usr/bin/sed -i 's/^autoinstall =.*/autoinstall = yes/g' /etc/uptrack/uptrack.conf

/usr/bin/sed -i 's/^SELINUX=enforcing/SELINUX=permissive/' /etc/selinux/config

/usr/bin/systemctl disable firewalld

/usr/sbin/reboot -f

exit 0