#!/bin/sh

# PHP7容器创建脚本

# 停止容器
sudo docker stop php7
# 删除容器
sudo docker rm php7

# 运行nginx容器
sudo docker run \
    --name php7 \
    -p 9000:9000 \
    --link mysql8:mysql8alias \
    -v /apps/nginx/html:/var/www/html \
    --privileged=true \
    -d php:7.1.10-fpm-alpine3.4 \

# 完成

