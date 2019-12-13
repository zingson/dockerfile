FROM golang:1.13-alpine
RUN apk add gcc
RUN apk update && apk add curl bash tree tzdata gcc g++ && gcc -v && g++ -v && go version && cp -r -f /usr/share/zoneinfo/Hongkong /etc/localtime

# golang项目alpine编译环境
# golang 1.13
# alpine 3.10

