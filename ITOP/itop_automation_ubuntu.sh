echo 'UPDATE & UPGRADE PACKAGES'
echo '--------------------'
sudo apt -qq update && sudo apt -qq upgrade -y

clear

echo 'INSTALLING LAMPSTACK'
echo '--------------------'
echo 'Installing Apache 2...'
sudo apt -qq install apache2 -y && systemctl enable apache2 && systemctl start apache2
echo 'Done.'
echo

clear

echo 'Installing PHP 8.2 and its extensions...'
sudo add-apt-repository ppa:ondrej/php -y
sudo apt install php8.0 php8.0-mysql php8.0-ldap php8.0-mcrypt php8.0-cli php8.0-soap graphviz -y
sudo apt install php8.0-xml php8.0-gd php8.0-zip php8.0-mbstring php8.0-curl libapache2-mod-php -y
sudo apt install php8.0-bz2 php8.0-sqlite3 php8.0-bcmath -y
echo 'Done.'
echo

clear

echo 'Installing MySQL...'
sudo apt -qq install mysql-server mysql-client -y
echo 'Done.'
systemctl restart apache2

clear

echo 'Setup Database'
sudo mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'sxDQjNk9W9Wa';"
mysql -u root -pSetRootPasswordHere -e "create database itop character set utf8 collate utf8_bin;"
mysql -u root -pSetRootPasswordHere -e "create user 'itop'@'%' identified by 'E2MhRcx4yBG2';"
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
echo 'Password: E2MhRcx4yBG2'
echo 'Database: itop'
