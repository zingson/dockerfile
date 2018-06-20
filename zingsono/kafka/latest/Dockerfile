FROM zingsono/openjdk:8-jre
MAINTAINER Zengs.<zingsono@gmail.com>
LABEL name="kafka" version="1.1.0" description="kafka images"

WORKDIR /kafka

RUN curl -o kafka.tgz http://mirrors.hust.edu.cn/apache/kafka/1.1.0/kafka_2.12-1.1.0.tgz && tar -xf ./kafka.tgz --strip-components=1 && rm -f kafka.tgz

VOLUME /kafka
EXPOSE 9092

CMD ["bin/zookeeper-server-start.sh","config/server.properties"]
