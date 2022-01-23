FROM golang:1.17-alpine3.14
RUN apk add curl tzdata && cp -r -f /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && echo "Asia/Shanghai" > /etc/timezone && apk del tzdata
RUN apk add gcc
