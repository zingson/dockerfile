#!/bin/sh

# Mysql8容器创建脚本,mysql8支持动态修改配置，所以无需映射配置文件目录

# pull image
sudo docker pull mysql:8.0.3

# stop container
sudo docker stop mysql8

# rm container
sudo docker rm mysql8

# run container
sudo docker run \
    --name mysql8 \
    -e MYSQL_ROOT_PASSWORD=root \
    --publish  3306:3306 \
    --volume /apps/mysql/data:/var/lib/mysql \
    --restart always \
    --privileged=true \
    --detach  mysql:8.0.3

# ENDex


