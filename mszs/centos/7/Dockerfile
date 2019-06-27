FROM centos:7
MAINTAINER Zengs.<zingsono@gmail.com>
LABEL name="centos" version="7" description="基于官方镜像自定义更新"

# 修改时区，默认时间差了8小时
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

# 设置语言环境变量
ENV LANG en_US.UTF-8
