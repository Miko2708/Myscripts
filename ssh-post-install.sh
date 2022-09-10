#!/bin/bash
if grep -iq PermitRootLogin /target/etc/ssh/sshd_config; then
	sed -i -e 's/^#\?Port 22/Port 7225/g' /target/etc/ssh/sshd_config
	else
	echo "Port 22" >>  /target/etc/ssh/sshd_config
fi
if grep -qi PasswordAuthentication /target/etc/ssh/sshd_config; then
	sed -i -e 's/^#\?PubkeyAuthentication.*/PubkeyAuthentication yes/g' /target/etc/ssh/sshd_config
else
	echo "PubkeyAuthentication yes" >>  /target/etc/ssh/sshd_config
fi
if grep -qi AllowUsers /target/etc/ssh/sshd_config; then
	sed -i '111i\AllowUsers admin'
fi
