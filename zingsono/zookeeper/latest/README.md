## zookeeper

默认端口：2181
默认目录：/zookeeper/

### Simple Tags

[`latest` (zookeeper/latest/Dockerfile)](https://github.com/zingsono/Docker/tree/master/zingsono/zookeeper/latest/Dockerfile)  
[`3.4.12` (zookeeper/3.4.12/Dockerfile)](https://github.com/zingsono/Docker/tree/master/zingsono/zookeeper/3.4.12/Dockerfile)     


### Example

```
docker pull zingsono/zookeeper:latest

docker volume create zookeeper 
docker run --name zookeeper.sc -v zookeeper:/zookeeper/ -p 2181:2181  -it zingsono/zookeeper:latest

```

单实例或者集群运行，根据需要修改数据卷`zookeeper`中配置文件，重启容器`docker restart zookeeper.sc`使配置生效。


### Build

```
docker build -t zingsono/zookeeper:latest ./
```