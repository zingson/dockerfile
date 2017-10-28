#!/bin/sh

# Mysql8容器创建脚本

# pull image
sudo docker pull mysql:8.0.3

# stop container
sudo docker stop mysql8

# rm container
sudo docker rm mysql8

# 运行容器
sudo docker run \
    --name mysql8 \
    -e MYSQL_ROOT_PASSWORD=root \
    -p 3306:3306 \
    -v /apps/mysql/data:/var/lib/mysql \
    --privileged=true \
    -d mysql:8.0.3

# 完成


