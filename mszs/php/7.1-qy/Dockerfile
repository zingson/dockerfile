FROM php:7.1.5-fpm-alpine
RUN apk update && apk add git nginx curl tzdata && cp -r -f /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && echo "Asia/Shanghai" > /etc/timezone && apk del tzdata
# bcmath bz2 calendar ctype curl dba dom enchant exif fileinfo filter ftp gd gettext gmp hash iconv imap interbase intl
# json ldap mbstring mcrypt mysqli oci8 odbc opcache pcntl pdo pdo_dblib pdo_firebird pdo_mysql pdo_oci pdo_odbc pdo_pgsql
# pdo_sqlite pgsql phar posix pspell readline recode reflection session shmop simplexml snmp soap sockets spl standard
# sysvmsg sysvsem sysvshm tidy tokenizer wddx xml xmlreader xmlrpc xmlwriter xsl zip
RUN docker-php-ext-install ctype mysqli pdo pdo_mysql session sockets exif iconv
# /var/www/html/

COPY tz.php ./
COPY nginx.conf /etc/nginx/nginx.conf
COPY entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

# docker run --name phptest -p 9009:80 -itd registry.cn-hangzhou.aliyuncs.com/mszs/php:7.4-fpm-nginx-alpine
