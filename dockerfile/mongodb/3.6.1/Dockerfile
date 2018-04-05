FROM centos:6.9

MAINTAINER Zengs. <zingsono@gmail.com>

# RUN yum -y install iproute nmap wget tar unzip


RUN export _V=mongodb-linux-x86_64-3.6.1
RUN cd /  && curl -O https://fastdl.mongodb.org/linux/$_V \
    && tar -zxvf $_V.tgz \
    && cp -n /$_V/bin/* /usr/local/bin/ \
    && rm -rf /$_V/  \
    && rm -f /$_V.tgz \
    && echo ''>>/etc/mongodb.conf

# 数据目录 /dada/mongodb/db
# 日志目录 /dada/mongodb/logs
# 配置文件 /dada/mongodb/mongodb.conf
VOLUME /data/mongodb/
VOLUME /etc/mongodb.conf

EXPOSE 27017 28017

# 启动执行
CMD ["mongod -f /etc/mongodb.conf"]


