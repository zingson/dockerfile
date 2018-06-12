FROM zingsono/gradle:4.7
MAINTAINER Zengs.<zingsono@gmail.com>
LABEL name="jenkins" version="2.121.1" description="Jenkins"

# Install Git Client
RUN yum install -y git && yum clean all

# 数据目录
ENV JENKINS_HOME=/var/jenkins_home
WORKDIR /

RUN curl -o jenkins.war http://mirrors.shu.edu.cn/jenkins/war-stable/2.121.1/jenkins.war

VOLUME /var/jenkins_home
EXPOSE 8080
CMD ["java","-jar","jenkins.war"]

