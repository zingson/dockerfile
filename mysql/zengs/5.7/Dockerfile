FROM centos:6.9

MAINTAINER Zengs. <zingsono@gmail.com>

## 未完成 171107

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
# 挂载数据目录，可以用-v修改
VOLUME ["/var/lib/mysql/"]


WORKDIR /

RUN echo ''>/tmp/t \
&& echo -e '#!/bin/bash \nservice mysqld start \ntail -f /tmp/t \n'>/docker-entrypoint.sh \
&& chmod u+x /docker-entrypoint.sh \
&& chmod 777 /var/run/mysqld \

EXPOSE 3306
CMD ["/docker-entrypoint.sh"]

# docker run --name mysql5.7 -itd zengs/mysql:5.7
# 默认root密码为空
#
