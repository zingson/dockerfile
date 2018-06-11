FROM zingsono/gradle:4.7
MAINTAINER Zengs.<zingsono@gmail.com>

LABEL name="eureka" version="2.0.0.RC1" description="spring-netflix-eureka-server"

WORKDIR /
COPY ./  /
RUN cd scloud-eureka \
    && gradle clean build bootJar \
    && mv build/libs/scloud-eureka-2.0.0.RC1.jar ../eureka.jar && cd .. \
    && rm -rf /eureka/scloud-eureka \
    && rm -rf /gradle && rm -rf /root/.gradle

EXPOSE 8761

ENTRYPOINT ["docker-entrypoint.sh"]

# docker build -t test/eureka:latest ./