FROM openjdk:8-jre-alpine

# 设置Alpine 系统时区
RUN apk update && apk add tzdata && cp -r -f /usr/share/zoneinfo/Hongkong /etc/localtime

# 安装常用基础包
RUN apk add wget curl bash tree tar

# 确保用户 `elasticsearch` 存在
RUN addgroup -S elasticsearch && adduser -S -G elasticsearch elasticsearch
USER elasticsearch

WORKDIR /es
RUN wget -O es.tar.gz "https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-6.2.4.tar.gz" \
    && tar -xf es.tar.gz --strip-components=1 && rm es.tar.gz  && chown -R elasticsearch:elasticsearch /es \
    &&/es/bin/elasticsearch --version

# 运行时，请创建数据卷  docker volume create elasticsearch ，备份数据直接备份此数据卷即可
VOLUME /es/

EXPOSE 9200 9300

CMD ["/es/bin/elasticsearch"]
