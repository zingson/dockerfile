## docker-nginx

官网：[http://nginx.org](http://nginx.org)  

CentOS7 源配置：

/etc/yum.repos.d/nginx.repo
```text
[nginx]
name=nginx repo
baseurl=http://nginx.org/packages/centos/7/$basearch/
gpgcheck=0
enabled=1
```

Replace “OS” with “rhel” or “centos”, depending on the distribution used, and “OSRELEASE” with “6” or “7”, for 6.x or 7.x versions, respectively.


 
 ```text

# 备份配置文件目录
RUN cp -rf /etc/nginx/ /tmp/


# 切换目录，相当于cd命令
WORKDIR /usr/share/nginx

# 感叹号用双引号echo输出会出错
RUN echo -e '#!/bin/bash \n'>./nginx-entrypoint.sh
# 1.Nginx配置文件不存在时使用默认配置；2.启动Nginx；
RUN echo -e "\
if [ ! -f '/etc/nginx/nginx.conf' ]; then \n\
    cp -r /tmp/nginx/ /etc/ \n\
fi  \n\
systemctl restart nginx  \n\
systemctl restart php-fpm  \n\
">>.//nginx-entrypoint.sh
RUN chmod u+x ./nginx-entrypoint.sh

```


