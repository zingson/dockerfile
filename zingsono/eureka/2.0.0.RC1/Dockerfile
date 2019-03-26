FROM zingsono/openjdk:1.8-jre
MAINTAINER Zengs.<zingsono@gmail.com>

LABEL Version="2.0.0.RC1" Description="spring-netflix-eureka-server"

WORKDIR /
COPY ./ /
RUN  curl -o eureka.jar http://jar.s.zingson.com/download/eureka/scloud-eureka-2.0.0.RC1.jar

EXPOSE 8761

ENTRYPOINT ["java","-jar","eureka.jar"]
