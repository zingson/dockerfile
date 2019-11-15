#!/bin/sh

# Nginx容器创建脚本

# 停止容器删除容器
sudo docker stop nginx
sudo docker rm nginx

# 运行nginx容器,依赖php7
sudo docker run \
    --name nginx \
    -p 81:80 \
    --link php7:php7alias \
    -v /apps/nginx/html:/usr/share/nginx/html \
    -v /apps/nginx/conf/nginx.conf:/etc/nginx/nginx.conf \
    -v /apps/nginx/conf/conf.d:/etc/nginx/conf.d \
    --privileged=true \
    -d nginx:1.12.1-alpine \

# run 容器，使用host网络，和宿主机同一网段且共享端口
sudo docker run \
    --name nginx \
    --net host \
    --publish  80:80 \
    -v /apps/nginx/html:/usr/share/nginx/html \
    -v /apps/nginx/conf/nginx.conf:/etc/nginx/nginx.conf \
    -v /apps/nginx/conf/conf.d:/etc/nginx/conf.d \
    --privileged=true \
    -d nginx:1.12.1-alpine


 docker run --name nginx --net="host" --detach nginx:1.12.1-alpine



# END


