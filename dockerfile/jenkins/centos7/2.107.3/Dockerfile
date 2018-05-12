FROM centos:7
MAINTAINER  zengs

# jenkins:2.107

ENV JKV=2.107.3
ENV TMV=8.5.31

RUN yum install -y wget unzip java-1.8.0-openjdk*
RUN JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk&&cat >>/etc/profile <<EOF
JAVA_HOME=$JAVA_HOME
PATH=$PATH:$JAVA_HOME/bin
CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
JENKINS_HOME=/var/jenkins_home
JENKINS_PATH=/var/jenkins_home/war/webapps/ROOT/
export JENKINS_HOME JENKINS_PATH JAVA_HOME  CLASSPATH  PATH
EOF
WORKDIR /var/jenkins_home/
RUN source /etc/profile \
      &&wget http://mirror.bit.edu.cn/apache/tomcat/tomcat-8/v$TMV/bin/apache-tomcat-$TMV.zip \
      &&wget http://mirrors.jenkins.io/war-stable/$JKV/jenkins.war \
      &&unzip apache-tomcat-$TMV.zip&&mv apache-tomcat-$TMV war \
      &&rm -rf  war/webapps/ROOT \
      &&mkdir ROOT&&cp jenkins.war ROOT&&cd ROOT&&jar -xvf jenkins.war&&rm -f jenkins.war&&cd .. \
      &&mv ROOT war/webapps/ \
      &&rm -f jenkins.war apache-tomcat-$TMV.zip

VOLUME /var/jenkins_home

EXPOSE 8080

CMD ./war/bin/catalina.sh run