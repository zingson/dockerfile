FROM zingsono/gradle:4.7
MAINTAINER Zengs.<zingsono@gmail.com>

LABEL version="2.0.0.RC1" description="spring-netflix-eureka-server"

WORKDIR /eureka
COPY scloud-eureka ./
RUN cd scloud-eureka \
        && gradle clean bootJar \
        && mv build/libs/scloud-eureka-2.0.0.RC1.jar ../eureka.jar \
        && cd .. \
        && rm -rf scloud-eureka \
        && rm -rf /gradle && rm -rf /root/.gradle \
        && yum -y remove wget curl  uzip tar

WORKDIR /
ENTRYPOINT ["java","-jar","eureka.jar"]

# 使用示例
# docker run --name eureka_n1 --network cluster --hostname eureka_n1 --restart always -d zingsono/eureka:2.0.0.RC1 --eureka.client.service-url.defaultZone=http://eureka_n2:8761/eureka