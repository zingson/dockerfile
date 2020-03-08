#!/bin/sh

if [ $GIT_URL ] then
  if [ $GIT_TAG ] then
    git clone -b $GIT_TAG &GIT_URL
  else
    git clone &GIT_URL
  fi
fi

cat > /etc/nginx/nginx.conf << EOF
user nginx;
worker_processes auto;
pid       /var/run/nginx.pid;
http {
  include /etc/nginx/mime.types;
  default_type application/octet-stream;
  client_max_body_size 10m;
  keepalive_timeout 65;
  server {
    listen       80;
    server_name  localhost;
    root         /var/www/html/;

    #charset koi8-r;
    #access_log  /var/log/nginx/host.access.log  main;

    location / {
        index  index.html index.htm;
    }
    location ~ \.php$ {
        fastcgi_pass   127.0.0.1:9000;
        fastcgi_index  index.php;
        fastcgi_param  SCRIPT_FILENAME  $document_root$fastcgi_script_name;
        include        fastcgi_params;
    }
  }
}
EOF

nginx -s reopen
docker-php-entrypoint php -a
