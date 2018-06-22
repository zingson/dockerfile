## Kafka

kafka: *:9200/tcp  

数据目录：/kafka/


### Simple Tags

[`latest` (kafka/latest/Dockerfile)](https://github.com/zingsono/Docker/tree/master/zingsono/kafka/latest/Dockerfile)      
[`1.1.0` (kafka/1.1.0/Dockerfile)](https://github.com/zingsono/Docker/tree/master/zingsono/kafka/1.1.0/Dockerfile)

### Example

```
docker pull zingsono/kafka

# 数据卷
docker volume create kafka_1  
# 启动zookeeper服务
docker run --name kafka.zookeeper.sc1 -v kafka_1:/kafka --network cluster  -p 2181:2181 --restart always -d zingsono/kafka:1.1.0 bin/zookeeper-server-start.sh config/zookeeper.properties
# 启动kafka服务
docker run --name kafka.sc1 -v kafka_1:/kafka --network cluster  -p 9092:9092  --restart always -d zingsono/kafka:1.1.0 bin/kafka-server-start.sh config/server.properties
```
使用kafka内置的zookeeper运行集群

### Build
```
docker build --rm -t zingsono/kafka:latest ./
```

