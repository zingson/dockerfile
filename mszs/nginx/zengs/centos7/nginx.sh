#!/bin/bash

# 运行容器
sudo docker run \
    --name zengs_nginx \
    -p 80:80 \
    -v /apps/zengs/nginx/html:/usr/share/nginx/html \
    -v /apps/zengs/nginx/conf:/etc/nginx \
    -v /apps/zengs/nginx/logs:/var/log/nginx \
    --privileged=true \
    -d registry.cn-hangzhou.aliyuncs.com/zengs/nginx



