# Wazuh

Wazuh Manager + Dashboard: CentOS 7 - 192.168.182.142

Splunk: Ubuntu 18.04 Server - 192.168.182.143

Agent: Windows 10 - 192.168.182.1

Wazuh Architecture: https://documentation.wazuh.com/current/getting-started/architecture.html

## Table of Contents

  - [Cài đặt Wazuh](#Cài-đặt-Wazuh)
  - [Thêm agents vào Wazuh](#Thêm-agents-vào-Wazuh)
  - [Cấu hình Wazuh đổ log về Splunk](#Cấu-hình-Wazuh-đổ-log-về-Splunk)

## Cài đặt Wazuh

```sh
[root@localhost ~]# curl -sO https://packages.wazuh.com/4.3/wazuh-install.sh && sudo bash ./wazuh-install.sh -a -i

[...]
15/12/2022 04:56:56 INFO: --- Summary ---
15/12/2022 04:56:56 INFO: You can access the web interface https://<wazuh-dashboard-ip>
    User: admin
    Password: 5hF7G0adjFcHbmSC14HqYm7sA6rohi+q
15/12/2022 04:56:56 INFO: Installation finished.
```

Lấy các username và password cần thiết:

```sh
[root@localhost ~]# sudo tar -O -xvf wazuh-install-files.tar wazuh-install-files/wazuh-passwords.txt
```

Mở port 80 và 443:

```sh
[root@localhost ~]# firewall-cmd --zone=public --add-port=80/tcp --permanent
success
[root@localhost ~]# firewall-cmd --zone=public --add-port=443/tcp --permanent
success
[root@localhost ~]# firewall-cmd --reload
success
```

Truy cập trang dashboard của Wazuh và đăng nhập với username, password đã cho:

![image](https://user-images.githubusercontent.com/101538840/207830677-342b485c-3712-4035-a3cc-e239ebfbf2c8.png)

## Thêm agents vào Wazuh

Mở các port cần thiết cho Wazuh Manager:

```sh
[root@localhost bin]# firewall-cmd --zone=public --add-port=1514/tcp --permanent
[root@localhost bin]# firewall-cmd --zone=public --add-port=1514/udp --permanent
[root@localhost bin]# firewall-cmd --zone=public --add-port=1515/tcp --permanent
[root@localhost bin]# firewall-cmd --zone=public --add-port=1516/tcp --permanent
[root@localhost bin]# firewall-cmd --reload
success
```
Tiến hành thêm agent bằng cách nhấn dấu xổ xuống và chọn Agents:

![image](https://user-images.githubusercontent.com/101538840/207831404-7c5fe66d-6d6c-4d54-9a27-944d329331b3.png)

Đối với Windows, cấu hình như bên dưới, lưu ý sử dụng IP của máy đang chạy Wazuh Manager:

![image](https://user-images.githubusercontent.com/101538840/207831695-737a6a9b-3b3f-420c-88ca-25b68fc5cc37.png)

Làm theo hướng dẫn ở bước 4 và bước 5.

Quay trở lại menu Agents, ta thấy đã thêm agent mới thành công:

![image](https://user-images.githubusercontent.com/101538840/207864082-f2e2f41f-e9b0-49f3-bedf-fbc4dd359f49.png)


## Cấu hình Wazuh đổ log về Splunk

Reference: 

https://documentation.wazuh.com/current/deployment-options/splunk/splunk-basic.html

https://documentation.wazuh.com/current/deployment-options/splunk/splunk-app.html

----------------------------------------------------------------------------------

Mở port Wazuh API trên Wazuh Manager: 

```sh
[root@localhost bin]# firewall-cmd --zone=public --add-port=55000/tcp --permanent
[root@localhost bin]# firewall-cmd --reload
success
```

Trên máy cài đặt Splunk, tiến hành tải các file cấu hình:

```
curl -so /opt/splunk/etc/system/local/indexes.conf https://raw.githubusercontent.com/wazuh/wazuh-splunk/v4.3.10-8.2.8/setup/indexer/indexes.conf
curl -so /opt/splunk/etc/system/local/inputs.conf https://raw.githubusercontent.com/wazuh/wazuh-splunk/v4.3.10-8.2.8/setup/indexer/inputs.conf
```

Sửa file cấu hình, thêm các dòng sau:

```
nano /opt/splunk/etc/system/local/inputs.conf

[SSL]
serverCert = $SPLUNK_HOME/etc/auth/server.pem
sslPassword = password
```

Khởi động lại Splunk:

```
/opt/splunk/bin/splunk restart
```

Trên máy Wazuh Manager, tiến hành tải và cài đặt Splunk Forwarder từ trang chủ.

Tải các file cấu hình và cấu hình chúng:

```
curl -so /opt/splunkforwarder/etc/system/local/props.conf https://raw.githubusercontent.com/wazuh/wazuh-splunk/v4.3.10-8.2.8/setup/forwarder/props.conf
curl -so /opt/splunkforwarder/etc/system/local/inputs.conf https://raw.githubusercontent.com/wazuh/wazuh-splunk/v4.3.10-8.2.8/setup/forwarder/inputs.conf
sed -i "s:MANAGER_HOSTNAME:$(hostname):g" /opt/splunkforwarder/etc/system/local/inputs.conf
```

Tạo file cấu hình để chuyển log về Splunk có nội dung sau, với `192.168.182.143` là IP của máy Splunk:

```
nano /opt/splunkforwarder/etc/system/local/outputs.conf

[tcpout]
defaultGroup = default-autolb-group

[tcpout:default-autolb-group]
server = 192.168.182.143:9997
clientCert = /opt/splunkforwarder/etc/auth/server.pem
sslRootCAPath = /opt/splunkforwarder/etc/auth/ca.pem
sslPassword = password

[tcpout-server://192.168.182.143:9997]
```

Khởi động lại Splunk Forwarder:

```
/opt/splunkforwarder/bin/splunk start
```

Trên máy Splunk, tiến hành cài đặt app Wazuh:

```
curl -o SplunkAppForWazuh.tar.gz https://packages.wazuh.com/4.x/ui/splunk/wazuh_splunk-4.3.10_8.2.8-1.tar.gz
/opt/splunk/bin/splunk install app SplunkAppForWazuh.tar.gz
```

Khởi động lại Splunk và Splunk Forwarder trên 2 thiết bị.

Truy cập địa chỉ máy Splunk với port 8000, nhấn vào app Wazuh.

![image](https://user-images.githubusercontent.com/101538840/208015597-488bbcb5-5b70-40db-bf77-df2b2d724653.png)


Tiến hành thêm các thông tin để kết nối với Wazuh API:

![image](https://user-images.githubusercontent.com/101538840/208015874-a1aecb15-0582-4934-aa11-d401dfa24f6c.png)

Trong đó:

    - Username, Password: Sử dụng user wazuh-wui để đăng nhập.
    - Url: https://192.168.182.142
    - Port: 55000
    
Nhấn Save.    

Chuyển qua tab Agent, ta thấy Splunk đã nhận log từ Wazuh:

![image](https://user-images.githubusercontent.com/101538840/208013273-cc061f1b-1a9a-4e89-a51d-ef12b31e79dc.png)
