#!/bin/bash

# Java gradle 项目自动部署示例

# 从git拉代码
git clone https://zingson:zx142857@code.aliyun.com/zingson/demo.git

git pull origin/master


# 编译代码打包
 gradle -p ./ war

# 关闭服务
./bin/stop.sh

# 复制打包文件到发布目录


# 启动服务
./bin/start.sh


