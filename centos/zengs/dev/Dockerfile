FROM centos:latest

MAINTAINER Zengs. <zingsono@gmail.com>

# 安装全部日常使用的服务，用于开发测试。

RUN yum -y install iproute nmap wget php-fpm

WORKDIR /

# 感叹号用双引号echo输出会出错
RUN echo -e '#!/bin/bash \n'>./docker-entrypoint.sh
RUN echo -e "\
systemctl restart php-fpm   \
">>./docker-entrypoint.sh
RUN chmod u+x ./docker-entrypoint.sh

EXPOSE 22 80 9000

# 容器启动时执行
CMD ["/usr/sbin/init && ./docker-entrypoint.sh"]

