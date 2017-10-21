## PHP 7.1 fpm

alpine3.4


1. 获取镜像    
       
       docker pull php:7.1.10-fpm-alpine3.4   
       
2. 启动

```
sudo docker run --name nginx -p 81:80 -v /apps/nginx/html:/usr/share/nginx/html --privileged=true -d nginx:1.12.1-alpine

```
       
       