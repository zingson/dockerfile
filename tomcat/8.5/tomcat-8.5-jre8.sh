#!/bin/bash

# create tomcat

# pull image
sudo docker pull tomcat:8.5

# stop container
sudo docker stop tomcat8.5

# rm container
sudo docker rm tomcat8.5

## run test
sudo docker run --name tomcat8.5 -p 8080:8080  --restart always  --privileged=true  -d tomcat:8.5














