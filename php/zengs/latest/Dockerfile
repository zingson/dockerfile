FROM centos:6.9

MAINTAINER Zengs. <zingsono@gmail.com>

#OK******************************************************
# php-fpm remi
RUN echo -e "[php-remi] \n\
name=Remi's RPM repository for Enterprise Linux 6 \n\
baseurl=http://rpms.remirepo.net/enterprise/6/remi/\$basearch/ \n\
enabled=1 \n\
gpgcheck=0 \n\
#gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-remi \n\
">/etc/yum.repos.d/php-remi.repo
#  php71 版本号，服务器名相同
RUN yum -y install php71-php-fpm

VOLUME ["/etc/opt/remi/php71/","/var/opt/remi/php71/log/"]

WORKDIR /

# 感叹号用双引号echo输出会出错，启动时需要分配终端，也可通过守护进程启动
RUN echo -e '#!/bin/bash \n'>/docker-entrypoint.sh \
&& echo -e "\
service php71-php-fpm start \n\
tail -f /tmp/yum.log \n\
">>/docker-entrypoint.sh  \
&& chmod u+x /docker-entrypoint.sh


EXPOSE 80

# 容器启动时执行
CMD ["/docker-entrypoint.sh"]

