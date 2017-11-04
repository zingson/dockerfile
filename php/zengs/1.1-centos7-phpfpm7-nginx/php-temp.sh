#!/usr/bin/env bash
# 临时记录安装命令

docker rm -f zengs-php
docker run --name zengs-php -itd registry.cn-hangzhou.aliyuncs.com/zengs/php:1.1-centos7-phpfpm7-nginx

docker exec -it zengs-php /bin/bash





