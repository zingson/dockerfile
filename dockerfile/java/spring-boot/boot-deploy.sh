#!/bin/bash

# 项目部署脚本
export PATH="$PATH:/opt/"

#cd /opt/projects/
#rm -rf ./cloud-eureka
# clone代码，用户名密码中符号需要URLEncoder编码
#git clone -b master https://zingson:zx142857@gitee.com/zengs-cloud/cloud-eureka.git
#cd ./cloud-eureka
#git pull origin master:master

# 从git获取代码
if [ ! -d "/opt/projects/zengs-cloud/cloud-eureka" ]
then
  mkdir -p /opt/projects/zengs-cloud
  cd /opt/projects/zengs-cloud
  git clone -b master https://zingson:zx142857@gitee.com/zengs-cloud/cloud-eureka.git
else
 cd /opt/projects/zengs-cloud/cloud-eureka
 git pull origin master:master
fi

# 使用Gradle编译打包
cd /opt/projects/zengs-cloud/cloud-eureka
gradle build
gradle bootJar


