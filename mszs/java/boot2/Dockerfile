FROM centos:7

# 构建自动编译部署项目镜像, Jdk8 Git Gradle Node Nginx

# 编译项目、复制Dockerfile jar

MAINTAINER Zengs. <zingsono@gmail.com>

WORKDIR /opt

# 构建环境：JDK8 Git Gradle Node ，仅仅jre时gradle无法编译代码
# https://downloads.gradle.org/distributions/gradle-4.7-bin.zip
# https://nodejs.org/dist/v8.11.1/node-v8.11.1-linux-x64.tar.xz
RUN yum install -y unzip git  java-1.8.0-openjdk-*
RUN cd / && curl http://192.168.56.104/download/gradle-4.7-bin.zip -O \
    && unzip /gradle-4.7-bin.zip \
    && rm -f /gradle-4.7-bin.zip \
    && mv -f /gradle-4.7 /opt/gradle-4.7 \
    && curl http://192.168.56.104/download/node-v8.11.1-linux-x64.tar.xz -O \
    && tar -xvf /node-v8.11.1-linux-x64.tar.xz \
    && rm -f /node-v8.11.1-linux-x64.tar.xz \
    && mv -f /node-v8.11.1-linux-x64 /opt/node-v8.11.1 \
    && echo 'export PATH="$PATH:/opt/gradle-4.7/bin:/opt/node-v8.11.1/bin"'>>/etc/profile \
    && echo 'export JAVA_HOME="/usr"'>>/etc/profile \
    && source /etc/profile

COPY ./bootstrap.sh /opt/
COPY ./hook-server.js /opt/

RUN chmod +x /opt/bootstrap.sh

# 对外http端口，用于触发自动编译脚本
EXPOSE 39001

CMD ["node", "/opt/hook-server.js"]


