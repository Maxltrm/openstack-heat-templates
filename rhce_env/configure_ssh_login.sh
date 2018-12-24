#!/bin/bash
echo "[*] CONFIGURE SSH LOGIN"
echo "sshd: All" >> /etc/hosts.deny
echo "sshd: $ALLOWED_CIDR" >> /etc/hosts.allow
sed -i s/"PermitRootLogin no"/"PermitRootLogin yes"/g /etc/ssh/sshd_config
systemctl restart sshd
echo "$ROOT_PWD" | passwd --stding root
