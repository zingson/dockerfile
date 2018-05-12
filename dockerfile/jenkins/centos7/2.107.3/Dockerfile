FROM centos:7
MAINTAINER  zengs

# jenkins:2.107
WORKDIR /var/jenkins_home/
COPY build.sh .
RUN sh ./build.sh
VOLUME /var/jenkins_home

EXPOSE 8080

CMD ["/var/jenkins_home/war/bin/catalina.sh","run"]