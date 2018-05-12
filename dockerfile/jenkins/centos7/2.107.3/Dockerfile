FROM centos:7
MAINTAINER  zengs

# jenkins:2.107

ENV JENKINS_HOME=/var/jenkins_home/
ENV JENKINS_PATH=/var/jenkins_home/war/webapps/ROOT/

WORKDIR /var/jenkins_home/
COPY build.sh .
RUN sh ./build.sh
RUN rm -f ./build.sh
VOLUME /var/jenkins_home

EXPOSE 8080

CMD ["/var/jenkins_home/war/bin/catalina.sh","run"]