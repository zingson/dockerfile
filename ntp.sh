#!/bin/bash

# 安装ntp服务
yum install ntp
# 开机启动服务
systemctl enable ntpd
# 启动服务
systemctl start ntpd
# 设置亚洲时区
 timedatectl set-timezone Asia/Shanghai
# 启用NTP同步
 timedatectl set-ntp yes
# 重启ntp服务
 systemctl restart ntpd
# 手动同步时间
ntpq -p