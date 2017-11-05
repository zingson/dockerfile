FROM registry.cn-hangzhou.aliyuncs.com/zengs/nginx:latest

MAINTAINER Zengs. <zingsono@gmail.com>

# 使用yum安装php-fpm
RUN yum install php-fpm -y

# 映射到主机的端口
EXPOSE 80

# 容器启动时执行
CMD ["php-fpm"]

### 数据目录
## nginx
# /usr/share/nginx/html
# /etc/nginx
# /var/log/nginx
