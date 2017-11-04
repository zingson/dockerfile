# Nginx 镜像构建
FROM centos:7

MAINTAINER Zengs. <zingsono@gmail.com>

###############################################
### Nginx build

# 设置nginx官方yum源
RUN echo '\
        [nginx]   \
        name=nginx repo  \
        baseurl=http://nginx.org/packages/centos/7/$basearch/   \
        gpgcheck=0  \
        enabled=1  \
        '>/etc/yum.repos.d/nginx.repo

# 使用yum安装nginx
RUN yum install nginx -yq
RUN systemctl start nginx.service

# 挂载点
VOLUME ["/tmp/data"]

# 切换目录，相当于cd命令
WORKDIR /

# 映射到主机的端口
EXPOSE 80

# 容器启动时执行
#CMD ["/etc/nginx/nginx.sh"]
