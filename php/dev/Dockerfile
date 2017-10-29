# 构建PHP环境镜像：centos7/php7/nginx1.12.1/git2.9/
# 执行指定请求调用脚本，自动获取git代码部署php应用


# 基础镜像
FROM centos:7

# 创建者
MAINTAINER Zengs. <zingsono@gmail.com>

# ENV环境变量
ENV DEV_VERSION 1.0-centos7-php7-nginx-git
ENV CENTOS_VERSION 7
ENV PHPFPM_VERSION 7
ENV NGINX_VERSION 1.12.1
ENV GIT_VERSION 2.9

# 使用yum安装git
RUN yum install git -yq

# 使用yum安装php-fpm
RUN yum install php-fpm -yq

# 使用yum安装nginx
RUN yum install nginx -yq

# 挂载点
VOLUME ["/tmp/data"]

# 切换目录，相当于cd命令
WORKDIR /

# 映射到主机的端口
EXPOSE 80
