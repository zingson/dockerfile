FROM zingsono/openjdk:1.8-jre
MAINTAINER Zengs.<zingsono@gmail.com>
LABEL Description="FORM zingsono/openjdk:1.8-jre . logstash"

WORKDIR /logstash

ENV LOGSTASH_VERSION=6.2.4
RUN curl -o logstash.tar.gz "https://artifacts.elastic.co/downloads/logstash/logstash-$LOGSTASH_VERSION.tar.gz" &&  tar -xf logstash.tar.gz --strip-components=1 && rm -f logstash.tar.gz
ENV PATH=$PATH:/logstash/bin/

CMD ["logstash"]