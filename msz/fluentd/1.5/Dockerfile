FROM fluent/fluentd:v1.5

# 基于官方镜像，增加mongo插件

RUN apk add --update --virtual .build-deps \
        sudo build-base ruby-dev \
 && sudo gem install fluent-plugin-mongo \
 && sudo gem sources --clear-all \
 && sudo fluent-gem install fluent-plugin-mongo \
 && apk del .build-deps \
 && rm -rf /var/cache/apk/*
