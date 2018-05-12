#!/bin/bash
# centos7  jenkins.2.107.3  tomcat.8.5.31

JKV=2.107.3
TMV=8.5.31

yum install -y wget unzip java-1.8.0-openjdk*

JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk
cat >>/etc/profile <<EOF
JAVA_HOME=$JAVA_HOME
PATH=$PATH:$JAVA_HOME/bin
CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
JENKINS_HOME=/var/jenkins_home
JENKINS_PATH=/var/jenkins_home/war/webapps/ROOT/
export JENKINS_HOME JENKINS_PATH JAVA_HOME  CLASSPATH  PATH
EOF
source /etc/profile

wget http://mirror.bit.edu.cn/apache/tomcat/tomcat-8/v$TMV/bin/apache-tomcat-$TMV.zip
wget http://mirrors.jenkins.io/war-stable/$JKV/jenkins.war
unzip apache-tomcat-$TMV.zip&&mv apache-tomcat-$TMV war
rm -rf  war/webapps/ROOT
mkdir ROOT&&cp jenkins.war ROOT&&cd ROOT&&jar -xvf jenkins.war&&rm -f jenkins.war&&cd ..
mv ROOT war/webapps/
rm -f jenkins.war apache-tomcat-$TMV.zip

chmod +x war/bin/*.sh

echo " ^_^ ^_^ "









