## node 11

设置中国时区的 Nodejs.11 

```dockerfile
FROM node:11-alpine
RUN apk update && apk add curl bash tree tzdata && cp -r -f /usr/share/zoneinfo/Hongkong /etc/localtime
```
