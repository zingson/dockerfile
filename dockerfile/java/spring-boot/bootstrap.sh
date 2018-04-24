#!/bin/bash

# 项目部署脚本

# GIT 项目地址
GIT_URL=https://zingson:zx142857@gitee.com/zengs-cloud/cloud-eureka.git
GIT_BRANCH=master
VERSION=1.0.1

PRO_NAME=${GIT_URL##*/}
PRO_NAME=${PRO_NAME%.*}
WORKDIR=/opt/projects/
mkdir -p $WORKDIR

# 从git获取代码
if [ ! -d "$WORKDIR$PRO_NAME" ]
then
  cd $WORKDIR
  git clone -b $GIT_BRANCH $GIT_URL
else
 cd $WORKDIR$PRO_NAME
 git pull origin $GIT_BRANCH:$GIT_BRANCH
fi

# 使用Gradle编译打包
cd $WORKDIR$PRO_NAME
gradle build
gradle bootJar

PRO_JAR=$WORKDIR$PRO_NAME/build/libs/$PRO_NAME-$VERSION.jar

# 构建spring boot 程序镜像
cd $WORKDIR$PRO_NAME/build/libs/
cat >Dockerfile <<EOF
FROM java:8-alpine
COPY ./$PRO_NAME-$VERSION.jar /opt/lib/
ENTRYPOINT java -jar /opt/lib/$PRO_NAME-$VERSION.jar
EOF
cat Dockerfile

# 使用API构建镜像

# 使用API启动镜像


# 使用构建好的可执行jar包创建镜像
curl --unix-socket /var/run/docker.sock -H "Content-Type: application/json" \
    -X POST http:/v1.37/build?dockerfile=Dockerfile&&t=$PRO_NAME:$VERSION

# 运行镜像

# 容器发布项目
curl --unix-socket /var/run/docker.sock -H "Content-Type: application/json" \
  -d '{"Name":"eureka", "Mode":{"Replicated":{"Replicas":1}}, "TaskTemplate":{"ContainerSpec":{"Image":"java:8-alpine","Mounts":[{"ReadOnly":true,"Source":"$PRO_JAR","Target":"/opt/lib","Type":"volume"}]}},"EndpointSpec":{"Ports":[{"Protocol":"tcp","PublishedPort":8088,"TargetPort":8761}]} }' \
  -X POST http:/v1.37/services/create





