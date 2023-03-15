# ITOP ITSM CMDB

Server: CentOS 7

## Table of Contents
- [Chuẩn bị](#Chuẩn-bị)
- [LAMP Stack](#LAMP-Stack)
- [Cấu hình và cài đặt](#Cấu-hình-và-cài-đặt)

### Chuẩn bị
Tắt Firewall và disable Selinux:
```console
[root@localhost ~]# systemctl stop firewalld
[root@localhost ~]# systemctl disable firewalld
[root@localhost ~]# vi /etc/selinux/config
SELINUX=disabled
[root@localhost ~]# reboot
```

### LAMP Stack
Cài đặt Apache HTTP:
```console
[root@localhost ~]# yum install httpd -y
[root@localhost ~]# systemctl start httpd
[root@localhost ~]# systemctl enable httpd
```

Cài đặt MySQL Server:

```console
[root@localhost ~]# wget http://repo.mysql.com/mysql-community-release-el7-5.noarch.rpm
[root@localhost ~]# rpm -ivh mysql-community-release-el7-5.noarch.rpm
[root@localhost ~]# yum install mysql-server -y
[root@localhost ~]# systemctl start mysqld
[root@localhost ~]# systemctl enable mysqld
[root@localhost ~]# mysql_secure_installation
```

Cài đặt PHP 7.3:
```console
[root@localhost ~]# yum install http://rpms.remirepo.net/enterprise/remi-release-7.rpm
[root@localhost ~]# yum install yum-utils
[root@localhost ~]# yum-config-manager ––enable remi–php73
[root@localhost ~]# yum install php php-mcrypt php-cli php-gd php-curl php-mysql php-ldap php-zip php-fileinfo -y
[root@localhost ~]# php -v
PHP 7.3.33 (cli) (built: Feb 14 2023 14:41:46) ( NTS )
```

## Cấu hình và cài đặt

Cấp quyền cho database:
```console
[root@localhost ~]# mysql -u root
mysql> GRANT ALL PRIVILEGES ON *.* TO 'iTop'@'%' IDENTIFIED BY 'some_password';
Query OK, 0 rows affected (0.00 sec)

mysql> FLUSH PRIVILEGES;
Query OK, 0 rows affected (0.00 sec)
```

Tạo thư mục `itop` trong web directory:
```console
[root@localhost ~]# cd /var/www/html/
[root@localhost html]# mkdir itop
```

Download itop: https://sourceforge.net/projects/itop/files/latest/download

Giải nén file zip vừa tải xuống, copy toàn bộ file trong thư mục `web` vào thư mục `itop` vừa tạo ở trên:
```console
[root@localhost itop]# pwd
/var/www/html/itop
[root@localhost itop]# ls -la
total 1100
drwxr-xr-x 23 root root    4096 Mar 15 04:06 .
drwxr-xr-x  3 root root      18 Mar 15 04:03 ..
drwxr-xr-x  3 root root      24 Mar 15 04:05 addons
drwxr-xr-x  4 root root    4096 Mar 15 04:05 application
-rw-r--r--  1 root root     952 Sep 12  2022 approot.inc.php
-rw-r--r--  1 root root    3308 Dec 20  2021 bootstrap.inc.php
drwxr-xr-x  2 root root      58 Mar 15 04:05 conf
drwxr-xr-x  3 root root    4096 Mar 15 04:05 core
drwxr-xr-x  8 root root    4096 Mar 15 04:05 css
drwxr-xr-x  2 root root      58 Mar 15 04:05 data
drwxr-xr-x  3 root root      52 Mar 15 04:06 datamodels
drwxr-xr-x  3 root root    4096 Mar 15 04:06 dictionaries
drwxr-xr-x  2 root root      59 Mar 15 04:06 extensions
drwxr-xr-x  9 root root    8192 Mar 15 04:06 images
-rw-r--r--  1 root root    1368 Dec 20  2021 index.php
drwxr-xr-x 12 root root    4096 Mar 15 04:06 js
drwxr-xr-x 24 root root    4096 Mar 15 04:06 lib
drwxr-xr-x  2 root root      58 Mar 15 04:06 log
-rw-r--r--  1 root root 1046438 Sep 12  2022 manifest.xml
drwxr-xr-x 14 root root    4096 Mar 15 04:06 node_modules
drwxr-xr-x  2 root root    4096 Mar 15 04:06 pages
drwxr-xr-x  2 root root      23 Mar 15 04:06 portal
drwxr-xr-x  6 root root    4096 Mar 15 04:06 setup
drwxr-xr-x  8 root root      99 Mar 15 04:06 sources
drwxr-xr-x  2 root root     141 Mar 15 04:06 synchro
drwxr-xr-x  5 root root      50 Mar 15 04:06 templates
-rw-r--r--  1 root root     615 Dec 20  2021 web.config
```

Cấp quyền cho user Apache:
```console
[root@localhost itop]# chown -R apache:apache .
[root@localhost itop]# chmod 775 .
```

Cài đặt các extensions cần thiết:

```console
[root@localhost itop]# yum install php-dom -y
[root@localhost itop]# yum install php-soap -y
[root@localhost itop]# yum install php-mbstring -y
```

Khởi động lại dịch vụ httpd:

```console
[root@localhost ~]# systemctl restart httpd
```

Truy cập địa chỉ web server với URI `itop`:

![image](https://user-images.githubusercontent.com/101538840/225247291-0c6466d0-7954-4f4a-a2d8-f5153c737e7a.png)





