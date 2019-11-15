FROM zingsono/openjdk:8-jre
MAINTAINER Zengs.<zingsono@gmail.com>
LABEL name="zookeeper" version="3.4.12" description="Zookeeper images"

WORKDIR /zookeeper/
# https://mirrors.tuna.tsinghua.edu.cn/apache/zookeeper/zookeeper-3.4.12/zookeeper-3.4.12.tar.gz
RUN curl -o zookeeper.tgz https://mirrors.tuna.tsinghua.edu.cn/apache/zookeeper/zookeeper-3.4.12/zookeeper-3.4.12.tar.gz \
    && tar -xf ./zookeeper.tgz --strip-components=1 \
    && rm -f zookeeper.tgz \
    && cp conf/zoo_sample.cfg  conf/zoo.cfg

VOLUME /zookeeper/
EXPOSE 2181

CMD ["bin/zkServer.sh","start-foreground","conf/zoo.cfg"]