FROM alpine:3.9
LABEL Version="1.5.1"

RUN apk update \
 && apk add --no-cache \
        ca-certificates \
        ruby ruby-irb ruby-etc ruby-webrick \
        tini \
 && apk add --no-cache --virtual .build-deps \
        build-base \
        ruby-dev gnupg \
 && echo 'gem: --no-document' >> /etc/gemrc \
 && gem install oj -v 3.3.10 \
 && gem install json -v 2.2.0 \
 && gem install fluentd -v 1.5.1 \
 && gem install bigdecimal -v 1.3.5 \
 && fluent-gem install fluent-plugin-mongo \
 && apk del .build-deps \
 && rm -rf /tmp/* /var/tmp/* /usr/lib/ruby/gems/*/cache/*.gem

RUN mkdir -p /fluentd/log \
    && mkdir -p /fluentd/etc /fluentd/plugins

COPY fluent.conf /fluentd/etc/

EXPOSE 24224 5140

CMD ["fluentd","-c","/fluentd/etc/fluent.conf"]

