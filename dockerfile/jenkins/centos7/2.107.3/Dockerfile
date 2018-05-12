FROM centos:7
MAINTAINER  zengs

# jenkins:2.107.3

ENV JKV=2.107.3
ENV TMV=8.5.31

ENV JENKINS_HOME=/var/jenkins_home/
ENV JENKINS_PATH=/var/jenkins_home/war/webapps/ROOT/
ENV JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk

WORKDIR /var/jenkins_home/
RUN wget http://mirror.bit.edu.cn/apache/tomcat/tomcat-8/v$TMV/bin/apache-tomcat-$TMV.zip \
    &&wget http://mirrors.jenkins.io/war-stable/$JKV/jenkins.war  \
    &&unzip apache-tomcat-$TMV.zip&&mv apache-tomcat-$TMV war  \
    &&rm -f war/bin/*.bat&&rm -rf  war/webapps/&&mkdir -p war/webapps  \
    &&cp jenkins.war ROOT&&cd ROOT&&jar -xvf jenkins.war&&rm -f jenkins.war&&cd .. \
    &&mv ROOT war/webapps/  \
    &&rm -f jenkins.war apache-tomcat-$TMV.zip \
    &&chmod +x war/bin/*.sh

VOLUME /var/jenkins_home

EXPOSE 8080

CMD ["/var/jenkins_home/war/bin/catalina.sh","run"]