# Building own hacking machine and hacking tools

OS: Ubuntu Server 20.04 and upper

## Table of contents
- [Golang](#Golang)
- [Wordlist](#Wordlist)
- [Host Reconnaissance](#Host-Reconnaissance)
  - [Nmap](#Nmap)
  - [Rustscan](#Rustscan)
- [Web Reconnaissance](#Web-Reconnaissance)
  - [Whatweb](#Whatweb)
  - [Nikto](#Nikto)
  - [TestSSL](#WTestSSL)
  - [FFUF](#FFUF)
  - [Gobuster](#Gobuster)
- [Exploitation](#Exploitation)
  - [Searchsploit](#Searchsploit)

## Golang

```console
hacker@ubuntu:~$ wget https://go.dev/dl/go1.20.1.linux-amd64.tar.gz
hacker@ubuntu:~$ sudo tar -C /usr/local -xzf go1.20.1.linux-amd64.tar.gz
hacker@ubuntu:~$ rm go1.20.1.linux-amd64.tar.gz
hacker@ubuntu:~$ echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.profile
hacker@ubuntu:~$ source ~/.profile
```

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

### Rustscan
```console
hacker@ubuntu:~$ wget https://github.com/RustScan/RustScan/releases/download/2.0.1/rustscan_2.0.1_amd64.deb
hacker@ubuntu:~$ sudo dpkg -i rustscan_2.0.1_amd64.deb
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

### Gobuster
```console
hacker@ubuntu:~$ go install github.com/OJ/gobuster/v3@latest
hacker@ubuntu:~$ echo 'export PATH=$PATH:~/go/bin' >> ~/.profile
hacker@ubuntu:~$ source ~/.profile
```

## Exploitation
### Searchsploit
```console
hacker@ubuntu:~/tools$ sudo snap install searchsploit
```
