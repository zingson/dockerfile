FROM mszs/node:12

# tag: mszs/openjdk:1.8-jdk-node12
# JDK 1.8.0   OpenJDK Runtime Environment (build 1.8.0_171-b10)
# node 12

RUN npm i -g axios moment mongodb redis umq-node-desmd5 uuid ip && yum install -y java-1.8.0-openjdk.x86_64 java-1.8.0-openjdk-devel.x86_64 && yum clean all

ENV NODE_PATH=/usr/local/lib/node_modules
ENV JAVA_HOME=/usr/lib/jvm/java-1.8.0
ENV JRE_HOME=/usr/lib/jvm/jre-1.8.0
