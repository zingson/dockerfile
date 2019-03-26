# Eureka 1.9.8

Eureka Images 说明。

### 基础构建版本
  
>zingsono/centos:7  
 zingsono/openjdk:1.8-jre
 
### 使用示例


节点01：  
>docker run --name eureka_n1 --network cluster --restart always -d zingsono/eureka:1.9.8 --eureka.client.service-url.defaultZone=http://eureka_n2:8761/eureka

节点02：
>docker run --name eureka_n2 --network cluster --restart always -d zingsono/eureka:1.9.8 --eureka.client.service-url.defaultZone=http://eureka_n1:8761/eureka

