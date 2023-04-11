# ITOP ITSM CMDB

Sever: Ubuntu Server 20.04

Ip address: 172.10.1.79

# Table of Contents
- [Install LAMP Stack](#Install-LAMP-Stack)
- [Setup web directory](#Setup-web-directory)
- [Setup iTop](#Setup-iTop)

# Install LAMP Stack


```console
root@ubuntuserver:~# sudo apt install apache2 -y && systemctl enable apache2 && systemctl start apache2
root@ubuntuserver:~# sudo add-apt-repository ppa:ondrej/php -y
root@ubuntuserver:~# sudo apt-get install php php-mysql php-ldap php-mcrypt php-cli php-soap php-json graphviz -y
root@ubuntuserver:~# sudo apt-get install php-xml php-gd php-zip php-mbstring php-curl libapache2-mod-php -y
root@ubuntuserver:~# sudo apt install php-bz2 php-sqlite3 -y
root@ubuntuserver:~# sudo apt-get install mysql-server mysql-client -y
root@ubuntuserver:~# systemctl restart apache2
```

Setup MySQL:
```console
root@ubuntuserver:~# sudo mysql

mysql> ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'SetRootPasswordHere';
Query OK, 0 rows affected (0.00 sec)

mysql> exit;

root@ubuntuserver:~# mysql_secure_installation
root@ubuntuserver:~# mysql -u root -p

mysql> create database itop character set utf8 collate utf8_bin;
Query OK, 1 row affected, 2 warnings (0.00 sec)

mysql> create user 'itop'@'%' identified by 'P@ssword123';
Query OK, 0 rows affected (0.13 sec)

mysql> grant all privileges on itop.* to 'itop'@'%';
Query OK, 0 rows affected (0.00 sec)

mysql> GRANT RELOAD,PROCESS ON *.* TO 'itop'@'%';
Query OK, 0 rows affected (0.00 sec)

mysql> flush privileges;
Query OK, 0 rows affected (0.00 sec)

mysql> quit;
Bye

root@ubuntuserver:~# nano /etc/mysql/mysql.conf.d/mysqld.cnf

[mysqld]
max_allowed_packet = 50M 
innodb_buffer_pool_size = 512M 

root@ubuntuserver:~# systemctl restart mysql.service
```

Configure PHP:

```console
root@ubuntuserver:~# nano /etc/php/8.2/cli/php.ini

file_uploads = On 
upload_max_filesize = 20M
max_execution_time = 300 
memory_limit = 256M 
post_max_size = 32M 
max_input_time = 90 
max_input_vars = 5000 
date.timezone = Asia/Ho_Chi_minh
```

# Setup web directory

```console
root@ubuntuserver:~# cd /var/www/html/
root@ubuntuserver:/var/www/html# rm *
root@ubuntuserver:/var/www/html# wget https://onboardcloud.dl.sourceforge.net/project/itop/itop/3.0.2-1/iTop-3.0.2-1-9957.zip
root@ubuntuserver:/var/www/html# unzip iTop-3.0.2-1-9957.zip
root@ubuntuserver:/var/www/html# mv web/* .
root@ubuntuserver:/var/www/html# chown -R www-data:www-data .
root@ubuntuserver:/var/www/html# chmod 755 .
```

# Setup iTop

Go to homepage: http://172.10.1.79/

![image](https://user-images.githubusercontent.com/101538840/231047122-9bcc8494-53cb-46a0-835f-d837babe3381.png)

Set the credential to database connection:

![image](https://user-images.githubusercontent.com/101538840/231047924-8ebb84a5-dc99-43db-9a70-941ed38b4576.png)
