# Eureka 2.0.0.RC1 

Eureka Images 说明。

### 基础构建版本
  
>zingsono/centos:7  
 zingsono/openjdk:1.8-jre
 
### 使用示例

集群部署，集群使用hostname通信。  

节点01：  
>docker run --name eureka_n1 --network cluster --hostname eureka_n1 --restart always -itd zingsono/eureka:2.0.0.RC1 --eureka.client.service-url.defaultZone=http://eureka_n2:8761/eureka

节点02：
>docker run --name eureka_n2 --network cluster --hostname eureka_n2 --restart always -d zingsono/eureka:2.0.0.RC1 --eureka.client.service-url.defaultZone=http://eureka_n1:8761/eureka

