FROM openjdk:8-jre-alpine

# 设置Alpine 系统时区
RUN apk update && apk add curl bash tree tzdata && cp -r -f /usr/share/zoneinfo/Hongkong /etc/localtime
