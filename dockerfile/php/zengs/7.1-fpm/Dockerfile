FROM centos:6.9

MAINTAINER Zengs. <zingsono@gmail.com>

# php-fpm remi
RUN echo -e "[php-remi] \n\
name=Remi's RPM repository for Enterprise Linux 6 \n\
baseurl=http://rpms.remirepo.net/enterprise/6/remi/\$basearch/ \n\
enabled=1 \n\
gpgcheck=0 \n\
#gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-remi \n\
">/etc/yum.repos.d/php-remi.repo
#  php71 版本号，服务名相同
RUN yum -y install php71-php-fpm

#VOLUME ["/etc/opt/remi/php71/","/var/opt/remi/php71/log/"]

EXPOSE 9000

# 容器启动时执行
CMD ["php71-php-fpm"]

