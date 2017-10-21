## PHP 7.1 fpm

alpine3.4


1. 获取镜像    
       
       docker pull php:7.1.10-fpm-alpine3.4   
       
2. 启动

```
sudo docker run --name php -p 9000:9000 -d php:7.1.10-fpm-alpine3.4

```
       
       