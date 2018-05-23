FROM zingsono/openjdk:8-jre
# openjdk:8-jre-alpine

ENV SYSTEM=Alpine
ENV VERSION=netflix-eureka-server-2.0.0.RC1
ENV NAME=eureka
ENV TAG=2.0.0.RC1

WORKDIR /eureka
COPY eureka.jar ./
EXPOSE 8761

CMD ["java","-jar","/eureka/eureka.jar"]

