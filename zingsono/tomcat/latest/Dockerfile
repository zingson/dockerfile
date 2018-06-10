FROM zingsono/openjdk:1.8-jre

WORKDIR /tomcat/

RUN curl -o tomcat.tar.gz http://xxxx.com && tar -xf tomcat.tar && rm -f tomcat.tar.gz

VOLUME /tomcat/

CMD ["/tomcat/bin/catalina.sh","run"]