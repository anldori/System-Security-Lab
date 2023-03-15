# ITOP ITSM CMDB

Server: CentOS 7

## Table of Contents
- [Chuẩn bị](#Chuẩn-bị)
- [LAMP Stack](#LAMP-Stack)

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




