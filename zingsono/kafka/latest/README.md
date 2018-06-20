## Kafka

kafka: *:9200/tcp  

数据目录：/kafka/


### Simple Tags

[`latest` (kafka/latest/Dockerfile)](https://github.com/zingsono/Docker/tree/master/zingsono/kafka/latest/Dockerfile)      
[`1.1.0` (kafka/1.1.0/Dockerfile)](https://github.com/zingsono/Docker/tree/master/zingsono/kafka/1.1.0/Dockerfile)

### Example

```
docker pull zingsono/kafka

docker run --name kafka.sc1 -d zingsono/kafka:1.1.0
```


### Build
```

docker build -t zingsono/kafka:latest ./
```

