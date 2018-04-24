FROM centos:6.9

# 构建自动编译部署Gradle项目镜像

MAINTAINER Zengs. <zingsono@gmail.com>

RUN yum install -y unzip git  java-1.8.0-openjdk
RUN curl https://downloads.gradle.org/distributions/gradle-4.7-bin.zip -O \
    && unzip ./gradle-4.7-bin.zip \
    && rm -f ./gradle-4.7-bin.zip \
    && mv -f ./gradle-4.7 /opt/gradle-4.7 \
    && curl https://nodejs.org/dist/v8.11.1/node-v8.11.1-linux-x64.tar.xz -O \
    && tar -xvf node-v8.11.1-linux-x64.tar.xz \
    && mv -f node-v8.11.1-linux-x64 /opt/node-v8.11.1 \
    && echo 'export PATH="$PATH:/opt/gradle-4.7/bin:/opt/node-v8.11.1/bin"'>>/etc/profile \
    && source /etc/profile

# 对外http端口，用于触发自动编译脚本
EXPOSE 39001

ENTRYPOINT ["node /opt/projects/bootstrap.js"]




