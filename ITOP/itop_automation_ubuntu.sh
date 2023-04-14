echo 'UPDATE & UPGRADE PACKAGES'
echo '--------------------'
sudo apt -qq update && sudo apt -qq upgrade -y

echo 'INSTALLING LAMPSTACK'
echo '--------------------'
echo 'Installing Apache 2...'
sudo apt -qq install apache2 -y && systemctl enable apache2 && systemctl start apache2
echo 'Done.'
echo
echo 'Installing PHP 8.2 and its extensions...'
sudo add-apt-repository ppa:ondrej/php -y
sudo apt -qq install php php-mysql php-ldap php-mcrypt php-cli php-soap php-json graphviz -y
sudo apt -qq install php-xml php-gd php-zip php-mbstring php-curl libapache2-mod-php -y
sudo apt -qq install php-bz2 php-sqlite3 -y
echo 'Done.'
echo
echo 'Installing MySQL...'
sudo apt -qq install mysql-server mysql-client -y
echo 'Done.'
systemctl restart apache2

echo 'Setup Database'
sudo mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'SetRootPasswordHere';"
mysql -u root -pSetRootPasswordHere -e "create database itop character set utf8 collate utf8_bin;"
mysql -u root -pSetRootPasswordHere -e "create user 'itop'@'%' identified by 'P@ssword123';"
mysql -u root -pSetRootPasswordHere -e "grant all privileges on itop.* to 'itop'@'%';"
mysql -u root -pSetRootPasswordHere -e "GRANT RELOAD,PROCESS ON *.* TO 'itop'@'%';"
mysql -u root -pSetRootPasswordHere -e "flush privileges;"

echo 'Setup Database completely.'
echo

echo 'Setup Web Directory'
sudo apt -qq install unzip wget -y
cd /var/www/html/
rm * -rf
wget https://onboardcloud.dl.sourceforge.net/project/itop/itop/3.0.3/iTop-3.0.3-10998.zip
unzip iTop-3.0.3-10998.zip
mv web/* .
chown -R www-data:www-data .
chmod 755 .

echo 'Done'
echo '---------------'
echo
echo 'Go to http://<your machine IP> for continuing setup processing.'
echo 'Credential for database connection:'
echo 'Address: localhost'
echo 'Username: itop'
echo 'Password: P@ssword123'
echo 'Database: itop'
