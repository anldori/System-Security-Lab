# Building own hacking machine and hacking tools

OS: Ubuntu Server 18.04

## Table of contents
- [Wordlist](#Wordlist)
- [Host Reconnaissance](#Host-Reconnaissance)
- [Web Reconnaissance](#Web-Reconnaissance)
  - [Whatweb](#Whatweb)
  - [Nikto](#Nikto)
  - [TestSSL](#WTestSSL)
  - [FFUF](#FFUF)
- [Exploitation](#Exploitation)
  - [Searchsploit](#Searchsploit)

## Wordlist

```console
hacker@ubuntu:~/wordlists$ git clone https://github.com/3ndG4me/KaliLists
hacker@ubuntu:~/wordlists$ mv KaliLists/* .
hacker@ubuntu:~/wordlists$ gunzip rockyou.txt.gz
```

## Host Reconnaissance

### Nmap
```console
hacker@ubuntu:~/tools/ffuf$ sudo apt install nmap
```

## Web Reconnaissance

### Whatweb

```console
hacker@ubuntu:~/tools/ffuf$ sudo apt install whatweb
```

### Nikto
```console
hacker@ubuntu:~/tools$ git clone https://github.com/sullo/nikto
```

### TestSSL
```console
hacker@ubuntu:~/tools$ sudo apt install testssl.sh
```

### FFUF
```console
hacker@ubuntu:~/tools/ffuf$ wget https://github.com/ffuf/ffuf/releases/download/v2.0.0/ffuf_2.0.0_linux_amd64.tar.gz
hacker@ubuntu:~/tools/ffuf$ tar -xf ffuf_2.0.0_linux_amd64.tar.gz
```

## Exploitation
### Searchsploit
```console
hacker@ubuntu:~/tools$ sudo snap install searchsploit
```
