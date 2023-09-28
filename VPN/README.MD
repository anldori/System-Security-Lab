# Xây dựng hệ thống VPN đơn giản để truy cập từ nhà đến văn phòng

## Table of Contents
  - [Yêu cầu](#Yêu-cầu)
  - [Các bước thực hiện](#Các-bước-thực-hiện)
    - [Cài đặt Ngrok](#Cài-đặt-Ngrok)
    - [Cấu hình firewall và forwarding](#Cấu-hình-firewall-và-forwarding)
    - [Cài đặt OpenVPN Server](#Cài-đặt-OpenVPN-Server)

## Yêu cầu
  - Máy tính kết nối mạng ở văn phòng, chạy hệ điều hành Ubuntu

## Các bước thực hiện

### Cài đặt Ngrok
Mục đích của việc cài ngrok là để route kết nối public về mạng local thông qua máy tính ở công ty.

Truy cập https://ngrok.com/ để đăng ký tài khoản và tải về ngrok.

Thực hiện xác thực bằng token:
```
ngrok config add-authtoken <token>
```

Tiến hành public lớp mạng local với port tùy chọn, ở đây dùng port 1999:
```
ngrok tcp 1999
```

Kết quả sau khi public:
```
ngrok                                                (Ctrl+C to quit)
Session Status                online
Account                       An Duy Le (Plan: Free)
Version                       3.3.4
Region                        Asia Pacific (ap)
Latency                       21ms
Web Interface                 http://127.0.0.1:4040
Forwarding                    tcp://0.tcp.ap.ngrok.io:19032 -> localhost:1999
                                                                           
Connections                   ttl     opn     rt1     rt5     p50     p90
                              64      0       0.00    0.00    1.77    24.82
```

Như vậy, thông tin cấu hình cho OpenVPN server:
```
Host: 0.tcp.ap.ngrok.io
Port: 19032
```

### Cấu hình firewall và forwarding

Thực hiện enable firewall và allow port 1999:

```console
sudo ufw enable
sudo ufw allow 1999/tcp
```

Bật tính năng IP forward cho phép chuyển tiếp kết nối:

```
echo 1 > /proc/sys/net/ipv4/ip_forward
sysctl -p
```
### Cài đặt OpenVPN Server
