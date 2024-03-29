ssh-keygen -t rsa
sudo cp /home/vagrant/.ssh/id_rsa.pub /vagrant/.ssh/id_rsa.pub
chmod 700 /home/vagrant/.ssh
chmod 600 /home/vagrant/.ssh/*
cat /vagrant/.ssh/id_rsa.pub >> /home/vagrant/.ssh/authorized_keys
chown -R vagrant:vagrant /home/vagrant/.ssh