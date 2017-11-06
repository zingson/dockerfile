Docker常用命令操作
=======================

## 基础命令

````
镜像（Image）
容器（Container）
仓库（Repository） 

Docker常用命令
--------------------------------------------------------------------------------
docker images                            显示本地已有的镜像
docker search  centos:7                  查找官方仓库中的镜像，可不用登录    
docker search -s 100 centos              查找100星以上的镜像             
docker pull  ubuntu:12.04                从ubuntu仓库下载标记为12.04的镜像
docker pull dl.dockerpool.com:5000/ubuntu:12.04   指定仓库注册服务器，不指定默认是registry.hub.docker.com
docker pull centos                       下载官方centos镜像，不指定标记，默认下载最新latest
docker info                              显示运行信息
docker inspect centos                    显示容器详细信息
docker run ubuntu:14.04  /bin/echo 'Hello world'      输出一个命令之后终止容器
docker run -t -i ubuntu:14.04 /bin/bash               启动容器保持输入
    -t    让Docker分配一个伪终端（pseudo-tty）并绑定到容器的标准输入上 
    -i    让容器的标准输入保持打开   
    -d   容器后台运行
    -v   挂载数据券
    -volume-from  挂载数据券容器
    --name   指定运行的容器名称，便于记忆与区别
    --restart=always   自动重启，跟run后面
docker run --name centos -d centos        启动一个name为centos的centos容器后台运行
docker rename <old> <news>                重命名
docker start <name>                       将一个已经终止的容器启动运行，后面跟ID或者NAME
docker stop  <name>                       终止一个运行中的容器
docker restart <name>                     运行状态的容器重新启动
docker logs <name>                        查看容器的输出信息
docker logs -ft <name>                    带时间查看日志，实时输出
docker ps                                 查看正在运行的容器
docker ps -a                              查看所有容器（包括运行中与停止的）
docker ps -a -q                           显示所有容器ID
docker attach                             Docker自带命令，-d后台运行时，进入容器操作，多个终端会同步
                                          在容器中退出，使用ctrl+p+q,使用exit会导致stop容器 
docker exec -it NAMES cmd                 进入容器中执行命令返回结果
 docker exec -it 容器名或ID /bin/bash     进入容器操作，退出使用ctrl+p+q,直接exit会stop容器
nsenter                                   需要安装，在util-linux包2.23版本后包含。
docker export  [ID]  > centos.tar         导出本地某个容器到本地文件
docker import                             从容器快照文件中导入为镜像
--也可通过指定URL或者某个目录来导入，如：
docker import http://example.com/eximage.tgz  example/imagerepo 
docker load                               基本同import，区别在于保存容器时的快照状态
docker rm trusting_newton                 删除一个处于终止状态的容器
docker rm -f tn                           加-f删除一个运行中的容器，会发送SIGKILL信号给容器
--*注意：这个命令会试图删除还在运行中的容器，但docker rm 默认不删运行中的容器。
docker rm $(docker ps -a -q)              清理所有处于终止状态的容器
    -q  只显示容器ID
docker rmi                               删除镜像
docker top name                          查看容器运行的进程 
docker stats  name                       监控容器CPU内存使用情况 
docker tag 
docker cp  宿主机路径  容器名:容器路径   拷贝文件到容器
docker cp  容器名:容器路径  宿主机路径    拷贝文件到宿主机

将镜像推送到registry：
  $ sudo docker login --username=916931772@qq.com registry.cn-hangzhou.aliyuncs.com
  $ sudo docker tag [ImageId] registry.cn-hangzhou.aliyuncs.com/pine/alpine:[镜像版本号]
  $ sudo docker push registry.cn-hangzhou.aliyuncs.com/pine/alpine:[镜像版本号]

其中[ImageId],[镜像版本号]请你根据自己的镜像信息进行填写。

docker commit -m='A new image' --author='Aomine' 614122c0aabb aoct/apache2

docker build  ./                          执行Dockerfile文件，build后面需要带一个路径 
docker build -t zengs/nginx:1.12.2 ./
                         

docker login                              输入用户名密码邮箱来完成注册登录

#配置私有仓库

docker run -d -p 5000:5000 registry     通过获取官方 registry 镜像来运行

Docker Hub
官方维护的公共仓库：https://hub.docker.com/


数据卷



数据容器




````

## 命令收集

```
# 停止所有正在运行的容器
docker stop $(docker ps -a -q) 
# 删除所有tag为<none>的镜像
docker images |grep none|awk '{print $3}'|xargs docker rmi

```







