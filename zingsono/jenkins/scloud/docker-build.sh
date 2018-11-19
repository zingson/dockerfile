#!/bin/bash
# Jenkins 自动部署 Spring boot 服务，当前脚本需要在jenkins容器中使用gradle触发执行
# ----------------------------------------------------------------------------------------------------------------------

# 参数： 服务名、版本号
S_NAME=$1
S_VERSION=$2
JAR_NAME=$S_NAME-$S_VERSION.jar

# 复制编译文件到docker目录
/bin/cp -rf ./build/libs/$JAR_NAME ./docker/

# ----------------------------------------------------------------------------------------------------------------------
# 推送镜像到仓库
S_HUB="hub.unionlive.com/$S_NAME:$S_VERSION"
docker build --tag $S_HUB ./docker/
docker push $S_HUB
echo "> docker push $S_HUB"

# ----------------------------------------------------------------------------------------------------------------------
# 启动命令
JAR_BOOT="java -Xms600m -Xmx600m -jar $JAR_NAME \
--spring.profiles.active=dev \
--spring.cloud.config.enabled=true \
--spring.cloud.config.discovery.enabled=true \
--eureka.client.fetch-registry=true  \
--eureka.client.register-with-eureka=true \
--eureka.client.service-url.defaultZone=http://eureka.sc1:8761/eureka/,http://eureka.sc2:8761/eureka/ "
echo "> $JAR_BOOT"

# 判断服务是否存在，存在更新镜像，不存在创建
SID=$(docker service ls -qf name=$S_NAME)
if [ "x" == "x$SID" ] ; then
    DOCKER_CREATE="docker service create --name $S_NAME --network cluster --replicas 1 -d $S_HUB  $JAR_BOOT"
    echo "> $DOCKER_CREATE"
    eval $DOCKER_CREATE
else
    DOCKER_UPDATE="docker service update --force --update-parallelism 1 --update-delay 60s --image $S_HUB --args \"$JAR_BOOT\" $S_NAME"
    echo "> $DOCKER_UPDATE"
    eval $DOCKER_UPDATE
fi

echo "SUCCESS ......"

