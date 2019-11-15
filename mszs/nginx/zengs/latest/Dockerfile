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

# 如果存在/usr/share/nginx/html/conf目录，则覆盖/etc/nginx目录中文件来使用自定义配置


EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]

