FROM openjdk:8-jre-alpine

# 设置Alpine 系统时区
RUN apk update && apk add tzdata && cp -r -f /usr/share/zoneinfo/Hongkong /etc/localtime

# 安装常用基础包
RUN apk add wget curl bash tree tar

# 确保用户 `elasticsearch` 存在
RUN addgroup -S elasticsearch && adduser -S -G elasticsearch elasticsearch

WORKDIR /es

# Elasticsearch 压缩包下载地址
ENV ELASTICSEARCH_TARBALL="https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-6.2.4.tar.gz"

RUN wget -O es.tar.gz "$ELASTICSEARCH_TARBALL" \
     &&tar -xf es.tar.gz --strip-components=1 \
     &&rm es.tar.gz \
     &&chown -R elasticsearch:elasticsearch /es

USER elasticsearch

RUN ./bin/elasticsearch --version

# 运行时，请创建数据卷  docker volume create elasticsearch ，备份数据直接备份此数据卷即可
VOLUME /es/

EXPOSE 9200 9300

CMD ["./bin/elasticsearch"]
