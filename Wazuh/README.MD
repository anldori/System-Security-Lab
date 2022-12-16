# Wazuh

Wazuh Manager + Dashboard: CentOS 7 - 192.168.182.142

Splunk: Ubuntu 18.04 Server - 192.168.182.143

Agent: Windows 10 - 192.168.182.1

## Table of Contents

* [Cài đặt Wazuh](#installation)
* [Thêm agents vào Wazuh](#agent_adding)

<a name="installation"></a>
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

<a name="agent_adding"></a>
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

