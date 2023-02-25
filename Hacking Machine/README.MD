# Building own hacking machine and hacking tools

OS: Ubuntu Server 18.04

## Table of contents
- [Wordlist](#Wordlist)
- [Web Reconnaissance](#Web-Reconnaissance)
  - [FFUF](#FFUF)

## Wordlist

```console
hacker@ubuntu:~/wordlists$ git clone https://github.com/3ndG4me/KaliLists
hacker@ubuntu:~/wordlists$ mv KaliLists/* .
hacker@ubuntu:~/wordlists$ gunzip rockyou.txt.gz
```

## Web Reconnaissance

### FFUF

```console
hacker@ubuntu:~/tools/ffuf$ wget https://github.com/ffuf/ffuf/releases/download/v2.0.0/ffuf_2.0.0_linux_amd64.tar.gz
hacker@ubuntu:~/tools/ffuf$ tar -xf ffuf_2.0.0_linux_amd64.tar.gz
```
