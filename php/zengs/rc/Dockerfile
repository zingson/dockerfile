FROM centos:6.9

MAINTAINER Zengs. <zingsono@gmail.com>

# 实现功能：通过git自动发布项目
# install phpfpm
# install nginx
# install git
# git pull code

# - install git
RUN yum -y install git

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

#VOLUME ["/etc/opt/remi/php71/","/var/opt/remi/php71/log/"]


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

# 如果存在/usr/share/nginx/html/conf目录，则覆盖/etc/nginx目录中文件来使用自定义配置




EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]

