#!/bin/bash

# create tomcat

# pull image
sudo docker pull  tomcat:8.5.23-jre8

# stop container
sudo docker stop tomcat8.5

# rm container
sudo docker rm tomcat8.5

# run container
sudo docker run \
 --name tomcat8.5 \
 --publish 8080:8080 \
 --restart always \
 --privileged=true \
 --volume /apps/gitlab/config:/etc/gitlab \
 --volume /apps/gitlab/logs:/var/log/gitlab \
 --volume /apps/gitlab/data:/var/opt/gitlab \
 --detach tomcat:8.5.23-jre8 \

## run test
sudo docker run \
 --name tomcat8.5 \
 --publish 8080:8080 \
 --restart always \
 --privileged=true \
 --detach tomcat:8.5.23-jre8 \


 # end



