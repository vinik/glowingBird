sudo apt-get update
sudo apt-get install -y --force-yes apache2 
sudo apt-get install -y --force-yes php5

debconf-set-selections <<< 'mysql-server mysql-server/root_password password vsadmin'
debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password vsadmin'
sudo apt-get install -y --force-yes mysql-server

sudo sed -i "s/bind-address.*/bind-address = 0.0.0.0/" /etc/mysql/my.cnf
sudo /etc/init.d/mysql restart


echo "CREATE USER 'root'@'%' IDENTIFIED BY 'vsadmin';" | mysql -uroot -pvsadmin
echo "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;" | mysql -uroot -pvsadmin

if ! [ -L /var/www/html ]; then
  rm -rf /var/www/html
  ln -fs /vagrant /var/www/html
fi