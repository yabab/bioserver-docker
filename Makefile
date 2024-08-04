disable-systemd-resolved:
	sudo mv /etc/resolv.conf /etc/.resolv.conf
	sudo systemctl disable systemd-resolved
	sudo systemctl stop systemd-resolved

enable-systemd-resolved:
	sudo mv /etc/.resolv.conf /etc/resolv.conf
	sudo systemctl enable systemd-resolved
	sudo systemctl start systemd-resolved
