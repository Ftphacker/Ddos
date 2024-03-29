#chmod 700 /vagrant/.ssh/
cat /vagrant/.ssh/id_rsa.pub >> /home/vagrant/.ssh/authorized_keys
chmod 700 /home/vagrant/.ssh
chmod 600 /home/vagrant/.ssh/*
chown -R vagrant:vagrant /home/vagrant/.ssh