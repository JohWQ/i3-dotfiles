systemctl start virtstoraged.service; systemctl start virtqemud.service; systemctl start virtnetworkd.service; systemctl start libvirtd.service
sudo /usr/bin/virt-manager && systemctl stop libvirtd.service; systemctl stop libvirtd-ro.socket; systemctl stop libvirtd-admin.socket; systemctl stop libvirtd.socket; systemctl stop virtnetworkd.service
echo test
sudo pkill dnsmasq
