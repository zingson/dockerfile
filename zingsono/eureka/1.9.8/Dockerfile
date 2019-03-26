FROM zingsono/openjdk:1.8-jre
MAINTAINER Zengs.<zingsono@gmail.com>

LABEL Version="1.9.8" Description="spring-netflix-eureka-server"

WORKDIR /
COPY ./ /
RUN  curl -o eureka.jar http://jar.s.zingson.com/download/eureka/scloud-eureka-1.9.8.jar

EXPOSE 8761

CMD ["java","-jar","eureka.jar"]
