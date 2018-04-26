

```bash

curl --unix-socket /var/run/docker.sock \
    -X POST http:/v1.37/build?dockerfile=.&&t=$PRO_NAME:$VERSION

# 使用API启动镜像


# 使用构建好的可执行jar包创建镜像
curl --unix-socket /var/run/docker.sock -H "Content-Type: application/json" \
    -X POST http:/v1.37/build?dockerfile=Dockerfile&&t=$PRO_NAME:$VERSION

# 运行镜像

# 容器发布项目
curl --unix-socket /var/run/docker.sock -H "Content-Type: application/json" \
  -d '{"Name":"eureka", "Mode":{"Replicated":{"Replicas":1}}, "TaskTemplate":{"ContainerSpec":{"Image":"java:8-alpine","Mounts":[{"ReadOnly":true,"Source":"$PRO_JAR","Target":"/opt/lib","Type":"volume"}]}},"EndpointSpec":{"Ports":[{"Protocol":"tcp","PublishedPort":8088,"TargetPort":8761}]} }' \
  -X POST http:/v1.37/services/create


### 在容器中编译代码，挂载jar包到容器中启动



```