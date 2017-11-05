FROM centos:latest

MAINTAINER Zengs. <zingsono@gmail.com>


# 使用yum安装php-fpm
RUN yum install php-fpm -y

###############################################
### Nginx build

# 设置nginx官方yum源
RUN echo -e "[nginx] \n\
name=nginx repo \n\
baseurl=http://nginx.org/packages/centos/7/\$basearch/ \n\
gpgcheck=0 \n\
enabled=1 \n\
">/etc/yum.repos.d/nginx.repo

# 使用yum安装nginx
RUN yum install nginx -y

# 备份配置文件目录
RUN cp -rf /etc/nginx/ /tmp/

# 挂载点,用于持久化数据需求，否则重启数据都丢失
#VOLUME ["/tmp/data"]

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

# 映射到主机的端口
EXPOSE 80

# 容器启动时执行
CMD [ "./nginx-entrypoint.sh"]

### 数据目录
# /usr/share/nginx/html
# /etc/nginx
# /var/log/nginx



# 映射到主机的端口
EXPOSE 80

# 容器启动时执行
CMD ["php-fpm"]

### 数据目录
## nginx
# /usr/share/nginx/html
# /etc/nginx
# /var/log/nginx



# 容器启动时执行
CMD [ "/bin/bash"]

