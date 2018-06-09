# scloud-eureka

# 项目介绍

Spring cloud Eureka 


# Docker Images

[zingsono/eureka](https://hub.docker.com/r/zingsono/eureka/)

使用示例：
> docker run --name eureka_n1 --network cluster --hostname eureka_n1 --restart always -d zingsono/eureka:2.0.0.RC1 --eureka.client.service-url.defaultZone=http://eureka_n2:8761/eureka

集群使用时，请配置启动参数，参数等同设置application.yml文件。



# Change Log

## v2.0.0.RC1
    [ Release Date : 2018-05-22] 
- [Feature] 初始构建