#!/bin/bash

# 接收参数 P1=GIT仓库 P2分支 P3 镜像仓库
GIT_URL=https://zingson:zx142857@gitee.com/zengs-cloud/cloud-eureka.git
GIT_BRANCH=master
REG_HUB=192.168.56.104:5000

# 截取项目名
PRO_NAME=${GIT_URL##*/}
PRO_NAME=${PRO_NAME%.*}

# 工作目录
WORKDIR=/opt/apps/
mkdir -p $WORKDIR
echo "工作目录：$WORKDIR"

# Git更新代码
if [ ! -d "$WORKDIR$PRO_NAME" ]
then
  cd $WORKDIR
  git clone -b $GIT_BRANCH $GIT_URL
else
 cd $WORKDIR$PRO_NAME
 git pull origin $GIT_BRANCH:$GIT_BRANCH
fi

# Gradle构建项目jar包
cd $WORKDIR$PRO_NAME
gradle clean
gradle build
gradle bootJar

# 获取Jar包名称与版本号用做镜像名称与标签
cd $WORKDIR$PRO_NAME/build/libs/
JAR_NAME=$(ls *.jar)
VERSION=${JAR_NAME##*-}
VERSION=${VERSION%.*}

# 创建Dockerfile
cat >Dockerfile <<EOF
FROM java:8-alpine
COPY $JAR_NAME /apps/
ENTRYPOINT java -jar /apps/$JAR_NAME
EOF
cat Dockerfile

# 创建tar包，用于构建镜像
tar -cvf ../build.tar ./*

# 构建镜像
curl --unix-socket /var/run/docker.sock -H "Content-Type: application/x-tar" --data-binary @../build.tar -X POST http://v1.37/build?t=$REG_HUB/$PRO_NAME:$VERSION

# 发布镜像,计算Base64需要去除换行与空格
REG_AUTH_JSON='{"username":"appadmin","password":"appadmin","email":"zengs@unionlive.com","serveraddress":"'$REG_HUB'"}'
echo "REG_AUTH_JSON=$REG_AUTH_JSON"
REG_AUTH_BASE64=`echo -n "$REG_AUTH_JSON" | base64`
REG_AUTH_BASE64=`echo $REG_AUTH_BASE64 | sed s/[[:space:]]//g`
echo "REG_AUTH_BASE64=$REG_AUTH_BASE64"
echo "API:http://v1.37/images/$REG_HUB/$PRO_NAME/push?tag=$VERSION"
curl --unix-socket /var/run/docker.sock -H "X-Registry-Auth: $REG_AUTH_BASE64" -X POST http://v1.37/images/$REG_HUB/$PRO_NAME/push?tag=$VERSION

# 启动服务
curl --unix-socket /var/run/docker.sock \
        -d '{"Name":"'$PRO_NAME'","TaskTemplate":{"ContainerSpec":{"Image":"'$REG_HUB/$PRO_NAME':'$VERSION'"}},"Mode":{"Replicated":{"Replicas":1}}}' \
        -X POST http://v1.37/services/create






