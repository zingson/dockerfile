#!/binbash

# Centos7 安装shadowsocks Server

# 安装
 yum install python-setuptools -y && easy_install pip
 pip install shadowsocks
 # 启停：
 ssserver -p 8000 -k yourpassword  -d start
 ssserver -d stop

