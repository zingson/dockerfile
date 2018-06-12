FROM openjdk:8-jre-alpine

# 设置 Alpine 系统时区为中国时间

# Install base packages
RUN apk update && apk add curl bash tree tzdata && cp -r -f /usr/share/zoneinfo/Hongkong /etc/localtime