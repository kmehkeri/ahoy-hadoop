# Network config
echo "*** NETWORK CONFIG ***"
cp /vagrant/hosts /etc/hosts
systemctl restart NetworkManager
systemctl restart network

