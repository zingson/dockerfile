#!/bin/sh

# 环境变量参数
#GIT_URL=https://zingson:******@gitee.com/wangxie_139/rui_dian_project.git
#GIT_TAG=v1.0.1

_substr=${GIT_URL##*/}
pname=${_substr%.git}
echo "pname : $pname"
if [ $GIT_URL ]; then
  echo "#>git clone $GIT_URL"
  git clone $GIT_URL
  if [ $GIT_TAG ]; then
    cd $pname
    echo "#>git checkout -b $GIT_TAG"
    git checkout -b $GIT_TAG
  fi
fi

# Nginx配置文件
cat > /etc/nginx/nginx.conf << EOF
user nginx;
worker_processes auto;
pid       /var/run/nginx.pid;
events {
    worker_connections  1024;
}
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
        include        fastcgi_params;
        fastcgi_param  SCRIPT_FILENAME  \$document_root\$fastcgi_script_name;
    }
  }
}
EOF

nginx
php-fpm
