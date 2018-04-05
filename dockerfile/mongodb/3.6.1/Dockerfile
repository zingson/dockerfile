FROM centos:6.9

MAINTAINER Zengs. <zingsono@gmail.com>

# 测试中
# http://download.s.zingson.com/download/mongodb-linux-x86_64-3.6.1.tgz
# https://fastdl.mongodb.org/linux/mongodb-linux-x86_64-3.6.1.tgz

RUN export VER=mongodb-linux-x86_64-3.6.1 \
    && yum -y install wget tar \
    && cd / \
    && wget http://download.s.zingson.com/download/$VER.tgz \
    && tar -zxvf $VER.tgz \
    && cp -n /$VER/bin/* /usr/local/bin/ \
    && rm -rf /$VER/  \
    && rm -f /$VER.tgz \
    && echo ''>>/etc/mongodb.conf

# 启动容器时需要挂在的目录与文件
# 数据目录 /dada/mongodb/db
# 日志目录 /dada/mongodb/logs
# 配置文件 /dada/mongodb/mongodb.conf

EXPOSE 27017 28017

# 启动执行
CMD ["mongod -f /etc/mongodb.conf"]


