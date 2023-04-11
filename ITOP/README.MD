# ITOP ITSM CMDB

Sever: Ubuntu Server 20.04

# LAMP Stack


```console
root@ubuntuserver:~# sudo apt install apache2 -y && systemctl enable apache2 && systemctl start apache2
root@ubuntuserver:~# sudo add-apt-repository ppa:ondrej/php -y
root@ubuntuserver:~# sudo apt-get install php php-mysql php-ldap php-mcrypt php-cli php-soap php-json graphviz -y
root@ubuntuserver:~# sudo apt-get install php-xml php-gd php-zip php-mbstring php-curl libapache2-mod-php -y
root@ubuntuserver:~# sudo apt-get install mysql-server mysql-client -y
root@ubuntuserver:~# systemctl restart apache2
```

Setup MySQL:
```
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

mysql> flush privileges;
Query OK, 0 rows affected (0.00 sec)

mysql> quit;
Bye

root@ubuntuserver:~# nano /etc/mysql/mysql.conf.d/mysqld.cnf\

[mysqld]
max_allowed_packet = 50M 
innodb_buffer_pool_size = 512M 

root@ubuntuserver:~# systemctl restart mysql.service
```






