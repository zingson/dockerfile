#!/bin/sh

# create gitlab-ce

# pull image ,基于gitlab官网提供的docker镜像构建，下载包较大，使用阿里云国内仓库
sudo docker pull registry.cn-hangzhou.aliyuncs.com/zengs/gitlab-ce:10.1.0-ce.0

# stop container
sudo docker stop gitlab-ce

# rm container
sudo docker rm gitlab-ce

# run container
sudo docker run \
 --hostname gitlab.example.com \
 --publish 443:443 --publish 80:80 --publish 221:22 \
 --name gitlab-ce \
 --restart always \
 --privileged=true \
 --volume /apps/gitlab/config:/etc/gitlab \
 --volume /apps/gitlab/logs:/var/log/gitlab \
 --volume /apps/gitlab/data:/var/opt/gitlab \
 --detach registry.cn-hangzhou.aliyuncs.com/zengs/gitlab-ce:10.1.0-ce.0 \

 # end



