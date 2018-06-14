#!/bin/bash

# Jenkins 自动部署 Spring boot 服务，当前脚本需要在jenkins容器中执行

# 参数： 服务名、版本号
S_NMAE=$1
S_VERSION=$2
JAR_NAME=$1-$2.jar

JAR_URL="http://jenkins.down/workspace/scloud/$NAME/build/libs/$JAR_NAME"
echo ">$JAR_URL"

JAR_BOOT="java -jar $JAR_NAME \
--spring.profiles.active=dev \
--spring.cloud.config.enabled=true \
--spring.cloud.config.discovery.enabled=true \
--eureka.client.fetch-registry=true  \
--eureka.client.register-with-eureka=true \
--eureka.client.service-url.defaultZone=http://10.18.222.15:8761/eureka/,http://10.18.222.16:8761/eureka/ \
"
echo ">$JAR_BOOT"

ARGS="sh -c 'curl -s -O $JAR_URL && $JAR_BOOT'"

# 判断服务是否存在，存在更新镜像，不存在创建
SID=$(docker service ls -qf name=$S_NMAE)
if [ ""x == "$SID"x ] ; then
    D_CREATE="docker service create --name $S_NMAE --network cluster --replicas 1 -d zingsono/openjdk:1.8-jre $ARGS"
    echo $D_CREATE
    $D_CREATE
else
    D_UPDATE="docker service update --force --update-parallelism 1 --update-delay 120s --args '$ARGS' $S_NMAE"
    echo $D_UPDATE
    $D_UPDATE
fi