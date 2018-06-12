FROM alpine:3.7

# 修改 Alpine 时区为中国时间

# Install base packages
RUN apk update && apk add curl bash tree tzdata && cp -r -f /usr/share/zoneinfo/Hongkong /etc/localtime


