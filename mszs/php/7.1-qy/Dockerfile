FROM php:7.1.5-fpm-alpine
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
    && apk update \
    && apk add libpng-dev freetype-dev libjpeg-turbo-dev libwebp libwebp-dev libpng libpng-dev git nginx curl tzdata \
    &&  cp -r -f /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && echo "Asia/Shanghai" > /etc/timezone && apk del tzdata \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ --with-png-dir=/usr/include/  \
    && docker-php-ext-install gd ctype mysqli pdo pdo_mysql session sockets exif iconv

# RUN apk update && apk add freetype libjpeg libwebp libwebp-dev libpng libpng-dev git nginx curl tzdata && cp -r -f /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && echo "Asia/Shanghai" > /etc/timezone && apk del tzdata
# bcmath bz2 calendar ctype curl dba dom enchant exif fileinfo filter ftp gd gettext gmp hash iconv imap interbase intl
# json ldap mbstring mcrypt mysqli oci8 odbc opcache pcntl pdo pdo_dblib pdo_firebird pdo_mysql pdo_oci pdo_odbc pdo_pgsql
# pdo_sqlite pgsql phar posix pspell readline recode reflection session shmop simplexml snmp soap sockets spl standard
# sysvmsg sysvsem sysvshm tidy tokenizer wddx xml xmlreader xmlrpc xmlwriter xsl zip
#RUN docker-php-ext-install ctype mysqli pdo pdo_mysql session sockets exif iconv gd
# /var/www/html/

COPY tz.php ./
COPY nginx.conf /etc/nginx/nginx.conf
COPY entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

# docker run --name phptest -p 9009:80 -itd registry.cn-hangzhou.aliyuncs.com/mszs/php:7.4-fpm-nginx-alpine
