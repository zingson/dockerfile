FROM golang:1.17-alpine3.14
RUN apk add curl tzdata && cp -r -f /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && echo "Asia/Shanghai" > /etc/timezone && apk del tzdata
# build-base is a meta-package that will install the GCC, libc-dev and binutils packages (amongst others).
# For a smaller install you may install just gcc but will also need at least musl-dev or libc-dev.
RUN apk add build-base
