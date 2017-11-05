FROM centos:6.9

MAINTAINER Zengs. <zingsono@gmail.com>

#******************************************************
# 安装日常使用的程序包，用于开发测试。
#******************************************************

RUN yum -y install iproute nmap wget tar unzip

#******************************************************
### Git Client
RUN yum -y install git

#OK******************************************************
### java-1.8.0-openjdk
RUN yum -y install java-1.8.0-openjdk

#OK******************************************************
### Tomcat-8.5.23
RUN rm -rf /opt/apache-tomcat-8.5.23/  \
    && wget -P /tmp/ http://mirrors.tuna.tsinghua.edu.cn/apache/tomcat/tomcat-8/v8.5.23/bin/apache-tomcat-8.5.23.tar.gz \
    && tar -zxf /tmp/apache-tomcat-8.5.23.tar.gz -C  /opt/  \
    && chmod u+x  /opt/apache-tomcat-8.5.23/bin/*.sh \
    && rm -f /tmp/apache-tomcat-8.5.23.tar.gz
VOLUME ["/opt/tomcat-8.5.23/conf/","/opt/tomcat-8.5.23/webapps/","/opt/tomcat-8.5.23/logs/"]


#******************************************************
### gradle-4.3-bin
#RUN rm -rf /opt/gradle-4.3/  \
#    && wget -P /tmp/ https://services.gradle.org/distributions/gradle-4.3-bin.zip \
#    && unzip /tmp/gradle-4.3-bin.zip -d  /opt/





#******************************************************
### Maven





#******************************************************
### Nodejs




#OK******************************************************
### nginx
RUN echo -e "[nginx] \n\
name=nginx repo \n\
baseurl=http://nginx.org/packages/centos/6/\$basearch/ \n\
gpgcheck=0 \n\
enabled=1 \n\
">/etc/yum.repos.d/nginx.repo
RUN yum -y install nginx

VOLUME ["/etc/nginx/","/usr/share/nginx/html/","/var/log/nginx/"]


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
RUN yum -y install php71 php71-php-fpm

VOLUME ["/etc/opt/remi/php71/","/var/opt/remi/php71/log/"]

#OK******************************************************
### Mysql-5.7
RUN echo -e "[mysql-5.7] \n\
name=MySQL 5.7 Community Server \n\
baseurl=http://repo.mysql.com/yum/mysql-5.7-community/el/6/\$basearch/ \n\
enabled=1 \n\
gpgcheck=0 \n\
#gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-mysql \n\
">/etc/yum.repos.d/mysql-community.repo
RUN yum -y install mysql-community-server

#"/etc/my.cnf"   "/var/log/mysqld.log"
VOLUME ["/var/lib/mysql/"]

WORKDIR /

# 感叹号用双引号echo输出会出错，启动时需要分配终端，也可通过守护进程启动
RUN echo -e '#!/bin/bash \n'>/docker-entrypoint.sh \
&& echo -e "\
service php71-php-fpm start \n\
service nginx start \n\
service mysqld start \n\
tail -f /tmp/yum.log \n\
">>/docker-entrypoint.sh  \
&& chmod u+x /docker-entrypoint.sh

# 数据卷






EXPOSE 21 22 80 3306 443 8080 9000

# 容器启动时执行
CMD ["/docker-entrypoint.sh"]

