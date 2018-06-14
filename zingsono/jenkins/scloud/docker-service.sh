#!/bin/bash

# Jenkins 自动部署 Spring boot 服务，当前脚本需要在jenkins容器中使用gradle触发执行

# 参数： 服务名、版本号
S_NAME=$1
S_VERSION=$2
JAR_NAME=$S_NAME-$S_VERSION.jar

# `jenkins.down.sc`为容器名称
JAR_URL="http://jenkins.down.sc/workspace/scloud/$S_NAME/build/libs/$JAR_NAME"
echo "> $JAR_URL"

JAR_BOOT="java -jar $JAR_NAME \
--spring.profiles.active=dev \
--spring.cloud.config.enabled=true \
--spring.cloud.config.discovery.enabled=true \
--eureka.client.fetch-registry=true  \
--eureka.client.register-with-eureka=true \
--eureka.client.service-url.defaultZone=http://10.18.222.15:8761/eureka/,http://10.18.222.16:8761/eureka/ "
echo "> $JAR_BOOT"

ARGS="sh -c 'curl -s -O $JAR_URL && $JAR_BOOT'"

# 判断服务是否存在，存在更新镜像，不存在创建
SID=$(docker service ls -qf name=$S_NAME)
if [ ""x == "$SID"x ] ; then
    echo "> Service Create: docker service create --name $S_NAME --network cluster --replicas 1 -d zingsono/openjdk:1.8-jre $ARGS"
    docker service create --name $S_NAME --network cluster --replicas 1 -d zingsono/openjdk:1.8-jre $ARGS
else
    echo "> Service Update: docker service update --force --update-parallelism 1 --update-delay 120s --args \"$ARGS\" $S_NAME"
    docker service update --force --update-parallelism 1 --update-delay 120s --args "$ARGS" $S_NAME
fi