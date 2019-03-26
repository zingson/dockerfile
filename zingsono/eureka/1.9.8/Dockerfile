FROM zingsono/openjdk:1.8-jre
MAINTAINER Zengs.<zingsono@gmail.com>

LABEL Version="1.9.8" Description="spring-netflix-eureka-server"

WORKDIR /
COPY ./ /
RUN  curl -o eureka.jar http://zingson.com/download/eureka/scloud-eureka-1.9.8.jar

EXPOSE 8761

ENTRYPOINT ["java","-jar","eureka.jar"]
