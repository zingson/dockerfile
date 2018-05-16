FROM openjdk:8-jre-alpine

# ensure elasticsearch user exists
RUN addgroup -S elasticsearch && adduser -S -G elasticsearch elasticsearch

WORKDIR /es

ENV ELASTICSEARCH_TARBALL="https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-6.2.4.tar.gz"

RUN set -ex;\
    \
    wget -O es.tar.gz "$ELASTICSEARCH_TARBALL"; \
    tar -xf es.tar.gz --strip-components=1; \
    rm es.tar.gz; \
    for path in \
		./data \
		./logs \
		./config \
		./config/scripts \
	; do \
		mkdir -p "$path"; \
		chown -R elasticsearch:elasticsearch "$path"; \
	done; \
	\
	elasticsearch --version; \

USER elasticsearch

# 运行时，需要设置数据卷  docker volume create elasticsearch
VOLUME /es/

EXPOSE 9200 9300

CMD ["/es/bin/elasticsearch"]
