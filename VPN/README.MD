# Xây dựng hệ thống VPN đơn giản để truy cập từ nhà đến văn phòng

## Table of Contents
  - [Chuẩn bị](#Chuẩn-bị)
  - [Các bước thực hiện](#Các-bước-thực-hiện)
    - [Cài đặt Ngrok](#Cài-đặt-Ngrok)
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
ngrok                                                                      (Ctrl+C to quit)
Session Status                online                                                                                                
Account                       An Duy Le (Plan: Free)                                                                                
Update                        update available (version 3.3.5, Ctrl-U to update)                                                    
Version                       3.3.4                                                                                                 
Region                        Asia Pacific (ap)                                                                                     
Latency                       21ms                                                                                                  
Web Interface                 http://127.0.0.1:4040                                                                                 
Forwarding                    tcp://0.tcp.ap.ngrok.io:19032 -> localhost:1999                                                       
                                                                                                                                    
Connections                   ttl     opn     rt1     rt5     p50     p90                                                           
                              64      0       0.00    0.00    1.77    24.82 
```

### Cài đặt OpenVPN Server
