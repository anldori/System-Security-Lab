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
