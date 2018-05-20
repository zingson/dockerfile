FROM openjdk:8-jre-alpine

WORKDIR /es

ENV ELASTICSEARCH_TARBALL="https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-6.2.4.tar.gz"

RUN wget -O es.tar.gz "$ELASTICSEARCH_TARBALL" \
     &&tar -xf es.tar.gz --strip-components=1 \
     &&rm es.tar.gz \
     &&chown -R elasticsearch:elasticsearch /es

# ensure elasticsearch user exists
RUN addgroup -S elasticsearch && adduser -S -G elasticsearch elasticsearch
USER elasticsearch

RUN ./bin/elasticsearch --version

# 运行时，需要设置数据卷  docker volume create elasticsearch
VOLUME /es/

EXPOSE 9200 9300

CMD ["./bin/elasticsearch"]
