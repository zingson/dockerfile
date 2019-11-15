FROM zingsono/openjdk:1.8-jre
LABEL name="tomcat" version="8.5.31" description="Apache Tomcat"
WORKDIR /tomcat/

ENV TOMCAT_VERSION=8.5.31

# Download
RUN curl -o tomcat.tar.gz http://mirrors.hust.edu.cn/apache/tomcat/tomcat-8/v$TOMCAT_VERSION/bin/apache-tomcat-$TOMCAT_VERSION.tar.gz
    && tar -xf tomcat.tar
    && rm -f tomcat.tar.gz

ENV PATH=$PATH:/tomcat/bin/

VOLUME /tomcat/
#EXPOSE 8080

CMD ["catalina.sh","run"]