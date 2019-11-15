FROM centos:6.9

MAINTAINER Zengs. <zingsono@gmail.com>

ENV CATALINA_HOME /opt/apache-tomcat-8.5.23

RUN yum -y install iproute nmap wget tar unzip

RUN yum -y install java-1.8.0

WORKDIR /opt
RUN curl -O http://www-eu.apache.org/dist/tomcat/tomcat-8/v8.5.23/bin/apache-tomcat-8.5.23.tar.gz

RUN tar -xvzf apache-tomcat-8.5.23.tar.gz

WORKDIR /opt/apache-tomcat-8.5.23

CMD ["/bin/bash"]


