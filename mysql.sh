#!/usr/bin/env bash

#Alterar senha root
# Setting MySQL root user password root/root
debconf-set-selections <<< 'mysql-server mysql-server/root_password password root'
debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password root'
mysql -u root -proot -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'root'; FLUSH privileges;"

apt-get update && \
apt-get install -y mysql-server && \
mysql -e "create user 'app'@'%' identified by 'admin';"

#Permitir acesso externo
sudo sed -i -e 's/bind-addres/#bind-address/g' /etc/mysql/my.cnf
#sudo sed -i -e 's/skip-external-locking/#skip-external-locking/g' /etc/mysql/my.cnf

sudo service mysql restart