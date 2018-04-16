#!/bin/bash

# CentOS7 安装 shadowsocks 客户端
sudo yum -y install epel-release
sudo yum -y install python-pip

sudo pip install shadowsocks

# 配置文件
sudo mkdir /etc/shadowsocks/
sudo cat >/etc/shadowsocks/shadowsocks.json <<EOF
{
    "server":"hinet.loseyourip.com",
    "server_port":58862,
    "local_address": "127.0.0.1",
    "local_port":1080,
    "password":"1uLzZ2b05i",
    "timeout":300,
    "method":"aes-256-cfb",
    "fast_open": false,
    "workers": 1
}
EOF

# 创建服务
sudo cat >/usr/lib/systemd/system/shadowsocks.service <<EOF
[Unit]
Description=Shadowsocks

[Service]
TimeoutStartSec=0
ExecStart=/usr/bin/sslocal -c /etc/shadowsocks/shadowsocks.json
Restart=on-failure
Type=notify

[Install]
WantedBy=multi-user.target
EOF

# 启动服务
sudo systemctl enable shadowsocks.service
sudo systemctl start shadowsocks.service
sudo systemctl status shadowsocks.service


# 验证服务，正常会显示代理服务IP地址
curl --socks5 127.0.0.1:1080 http://httpbin.org/ip
