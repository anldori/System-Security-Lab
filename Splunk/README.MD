# Splunk

Splunk: CentOS 7 - 192.168.127.133

Tiến hành truy cập trang chủ Splunk để tải về file cài đặt hoặc tải về bằng câu lệnh sau:

```sh
[root@localhost ~]# wget -O splunk-9.0.3-dd0128b1f8cd-linux-2.6-x86_64.rpm "https://download.splunk.com/products/splunk/releases/9.0.3/linux/splunk-9.0.3-dd0128b1f8cd-linux-2.6-x86_64.rpm"

2023-02-14 01:35:52 (11.3 MB/s) - ‘splunk-9.0.3-dd0128b1f8cd-linux-2.6-x86_64.rpm’ saved [600844857/600844857]
```

Cài đặt Splunk:

```sh
[root@localhost ~]# rpm -i splunk-9.0.3-dd0128b1f8cd-linux-2.6-x86_64.rpm
warning: splunk-9.0.3-dd0128b1f8cd-linux-2.6-x86_64.rpm: Header V4 RSA/SHA256 Signature, key ID b3cd4420: NOKEY
useradd: cannot create directory /opt/splunk
complete
```

Thiết lập khởi chạy cùng với CentOS:

```sh
[root@localhost ~]# cd /opt/splunk/bin/
[root@localhost bin]# ./splunk enable boot-start

Moving '/opt/splunk/share/splunk/search_mrsparkle/modules.new' to '/opt/splunk/share/splunk/search_mrsparkle/modules'.
Init script installed at /etc/init.d/splunk.
Init script is configured to run at boot.
```

Khởi chạy lần đầu:

```sh
[root@localhost bin]# ./splunk start

The Splunk web interface is at http://127.0.0.1:8000
```

Mở port 8000 để truy cập giao diện Splunk thông qua portal:

```sh
[root@localhost bin]# firewall-cmd --zone=public --add-port=8000/tcp --permanent
success

[root@localhost bin]# firewall-cmd --reload
success
```

Truy cập địa chỉ portal Splunk với port 8000:
![image](https://user-images.githubusercontent.com/101538840/218659344-843a0d7c-60b7-495b-ac68-661024734be6.png)

Đăng nhập với tài khoản và mật khẩu đã tạo ở bước cài đặt. Giao diện trang chủ của Splunk:
![image](https://user-images.githubusercontent.com/101538840/218660247-f99303a6-9ca6-4385-b596-40c74e5acdd4.png)


