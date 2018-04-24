#!/bin/bash

# 项目部署脚本

# GIT 项目地址
GIT_URL=https://zingson:zx142857@gitee.com/zengs-cloud/cloud-eureka.git
GIT_BRANCH=master

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
gradle clean
gradle build
gradle bootJar

cd $WORKDIR$PRO_NAME/build/libs/
JAR_NAME=$(ls *.jar)
VERSION=${JAR_NAME##*-}
VERSION=${VERSION%.*}

# 构建spring boot 程序镜像
cat >Dockerfile <<EOF
FROM java:8-alpine
COPY ./$JAR_NAME /opt/lib/
ENTRYPOINT java -jar /opt/lib/$JAR_NAME
EOF
cat Dockerfile

# 构建镜像
docker rmi -f $PRO_NAME:$VERSION
docker build -t $PRO_NAME:$VERSION ./

# 启动服务
docker service rm $PRO_NAME
docker service create --name $PRO_NAME  -p 8761:8761 $PRO_NAME:$VERSION
