FROM centos:6.9

MAINTAINER Zengs. <zingsono@gmail.com>

#******************************************************
# 安装日常使用的程序包，用于开发测试。
#******************************************************

RUN yum -y install iproute nmap wget

#******************************************************
### Git Client
RUN yum -y install git

#******************************************************
### nginx
RUN echo -e "[nginx] \n\
name=nginx repo \n\
baseurl=http://nginx.org/packages/centos/6/\$basearch/ \n\
gpgcheck=0 \n\
enabled=1 \n\
">/etc/yum.repos.d/nginx.repo
RUN yum -y install nginx


#******************************************************
# php-fpm remi
RUN echo -e "[php-remi] \n\
name=Remi's RPM repository for Enterprise Linux 6 \n\
baseurl=http://rpms.remirepo.net/enterprise/6/remi/\$basearch/ \n\
enabled=1 \n\
gpgcheck=0 \n\
#gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-remi \n\
">/etc/yum.repos.d/php-remi.repo
#  php71 版本号，服务器名相同
RUN yum -y install php71 php71-php-fpm


#******************************************************
### Mysql-5.7
RUN echo -e "[mysql-5.7] \n\
name=MySQL 5.7 Community Server \n\
baseurl=http://repo.mysql.com/yum/mysql-5.7-community/el/6/\$basearch/ \n\
enabled=1 \n\
gpgcheck=0 \n\
#gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-mysql \n\
">/etc/yum.repos.d/mysql-community.repo
RUN yum -y install mysql-community-server


WORKDIR /

# 感叹号用双引号echo输出会出错，启动时需要分配终端，也可通过守护进程启动
RUN echo -e '#!/bin/bash \n'>/docker-entrypoint.sh
RUN echo -e "\
service php71-php-fpm start \n\
service nginx start \n\
service mysqld start \n\
tail -f /tmp/yum.log \n\
">>/docker-entrypoint.sh
RUN chmod u+x /docker-entrypoint.sh

# 数据卷
VOLUME ["/etc/nginx/","/usr/share/nginx/html/","/var/log/nginx/"]
#"/etc/my.cnf"   "/var/log/mysqld.log"
VOLUME ["/var/lib/mysql/"]
VOLUME ["/etc/opt/remi/php71/","/var/opt/remi/php71/log/"]



EXPOSE 21 22 80 3306 443 8080 9000

# 容器启动时执行
CMD ["/docker-entrypoint.sh"]

