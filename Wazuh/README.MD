# Wazuh

Thử nghiệm trên CentOS 7

## Cài đặt Wazuh

```sh
[root@localhost ~]# curl -sO https://packages.wazuh.com/4.3/wazuh-install.sh && sudo bash ./wazuh-install.sh -a -i

[...]
15/12/2022 04:56:56 INFO: --- Summary ---
15/12/2022 04:56:56 INFO: You can access the web interface https://<wazuh-dashboard-ip>
    User: admin
    Password: UaR.M0R92UbDXo84ap+RvGwRerti9Ion
15/12/2022 04:56:56 INFO: Installation finished.
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
