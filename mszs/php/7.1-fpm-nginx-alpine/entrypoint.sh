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
chmod -R 777 /var/www/html/
nginx
php-fpm
