## CentOS7

基于官方镜像`FROM centos:7` 做自定义更新。 


### Simple Tags

[`7`,`latest` (centos/7/Dockerfile)](https://github.com/zingsono/Docker/tree/master/zingsono/centos/7/Dockerfile)

### Example

> docker pull zingsono/centos:7

> docker run -it zingsono/centos:7 /bin/bash

### Change log

[ 2018-06-12 ]  
- 设置时区 `RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime` ,使系统时间与中国时间同步；