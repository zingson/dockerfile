FROM redis:5.0-rc-alpine
MAINTAINER Zengs.<zingsono@gmail.com>
LABEL name="redis" version="5.0" description="redis 5.0 alpine "

RUN apk update && apk add curl bash tree tzdata && cp -r -f /usr/share/zoneinfo/Hongkong /etc/localtime
