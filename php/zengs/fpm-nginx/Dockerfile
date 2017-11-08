FROM centos:6.9

MAINTAINER Zengs. <zingsono@gmail.com>


# Nginx Centos6 repo
RUN echo -e "[nginx] \n\
name=nginx repo \n\
baseurl=http://nginx.org/packages/centos/6/\$basearch/ \n\
gpgcheck=0 \n\
enabled=1 \n\
">/etc/yum.repos.d/nginx.repo
RUN yum -y install nginx

#"/etc/nginx/","/var/log/nginx/"
VOLUME ["/usr/share/nginx/html/"]

# 启动时检查如果存在/usr/share/nginx/html/conf目录，则覆盖/etc/nginx目录中文件来使用自定义配置


# php71-php-fpm remi
RUN echo -e "[php-remi] \n\
name=Remi's RPM repository for Enterprise Linux 6 \n\
baseurl=http://rpms.remirepo.net/enterprise/6/remi/\$basearch/ \n\
enabled=1 \n\
gpgcheck=0 \n\
#gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-remi \n\
">/etc/yum.repos.d/php-remi.repo
#  php71 版本号，服务名相同
RUN yum -y install php71-php-fpm


# 映射到主机的端口
EXPOSE 80

RUN echo -e '#!/bin/bash \n'>/docker-entrypoint.sh \
&& echo -e "\
#service php71-php-fpm start \n\
service nginx start \n\
">>/docker-entrypoint.sh  \
#&& echo "">/tmp/t
#&& echo -e "tail -f /tmp/t \n">>/docker-entrypoint.sh \
&& chmod u+x /docker-entrypoint.sh


EXPOSE 80

# 容器启动时执行
CMD ["/docker-entrypoint.sh && php71-php-fpm"]
