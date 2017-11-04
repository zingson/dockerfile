#!/bin/bash

sudo docker run \
    --name nginx \
    -v /apps/nginx/html:/usr/share/nginx/html \
    -v /apps/nginx/conf/nginx.conf:/etc/nginx/nginx.conf \
    -v /apps/nginx/conf/conf.d:/etc/nginx/conf.d \
    --privileged=true \
    -d nginx:1.12.1
