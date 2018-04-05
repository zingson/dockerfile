# docker-compose.yml

```
默认的模板文件是 docker-compose.yml，其中定义的每个服务都必须通过 image 指令指定镜像或 build 指令（需要 Dockerfile）来自动构建。
其它大部分指令都跟 docker run 中的类似。
如果使用 build 指令，在 Dockerfile 中设置的选项(例如：CMD, EXPOSE, VOLUME, ENV 等) 将会自动被获取，无需在 docker-compose.yml 中再次设置。
image指定为镜像名称或镜像 ID。如果镜像在本地不存在，Compose 将会尝试拉去这个镜像。
```

- container_name 自定义容器名称
- build  指定 Dockerfile 所在文件夹的路径。 Compose 将会利用它自动构建这个镜像，然后使用这个镜像。如：build: /path/to/build/dir
- command 覆盖容器启动后默认执行的命令。
- links  链接到其它服务中的容器。使用服务名称（同时作为别名）或服务名称
- external_links  链接到 docker-compose.yml 外部的容器，甚至 并非 Compose 管理的容器
- ports 暴露端口信息，使用宿主：容器 （HOST:CONTAINER）格式或者仅仅指定容器的端口（宿主将会随机选择端口）都可以。
- expose 暴露端口，但不映射到宿主机，只被连接的服务访问
- volumes 卷挂载路径设置。可以设置宿主机路径 （HOST:CONTAINER） 或加上访问模式 （HOST:CONTAINER:ro）。
- volumes_from 从另一个服务或容器挂载它的所有卷。
- environment 设置环境变量。你可以使用数组或字典两种格式。
- env_file 从文件中获取环境变量，可以为单独的文件路径或列表。如果有变量名称与 environment 指令冲突，则以后者为准。
- extends 基于已有的服务进行扩展。例如我们已经有了一个 webapp 服务，模板文件为 common.yml
- net 设置网络模式。使用和 docker client 的 --net 参数一样的值。
- pid  跟主机系统共享进程命名空间。打开该选项的容器可以相互通过进程 ID 来访问和操作。
- dns 配置 DNS 服务器。可以是一个值，也可以是一个列表。
- cap_add, cap_drop 添加或放弃容器的 Linux 能力（Capabiliity）。
- dns_search 配置 DNS 搜索域。可以是一个值，也可以是一个列表。


## 配置示例
````yaml
version: '2'
services:
  nginx:
    image: "nginx:1.12.2"
    ports:
      - "80:80"

```


```text
PS C:\Users\zengs\WebstormProjects\Dockerfile\nginx\compose\1.12.2> docker-compose --help
Define and run multi-container applications with Docker.

Usage:
  docker-compose [-f <arg>...] [options] [COMMAND] [ARGS...]
  docker-compose -h|--help

Options:
  -f, --file FILE             Specify an alternate compose file (default: docker-compose.yml)
  -p, --project-name NAME     Specify an alternate project name (default: directory name)
  --verbose                   Show more output
  --no-ansi                   Do not print ANSI control characters
  -v, --version               Print version and exit
  -H, --host HOST             Daemon socket to connect to

  --tls                       Use TLS; implied by --tlsverify
  --tlscacert CA_PATH         Trust certs signed only by this CA
  --tlscert CLIENT_CERT_PATH  Path to TLS certificate file
  --tlskey TLS_KEY_PATH       Path to TLS key file
  --tlsverify                 Use TLS and verify the remote
  --skip-hostname-check       Don't check the daemon's hostname against the name specified
                              in the client certificate (for example if your docker host
                              is an IP address)
  --project-directory PATH    Specify an alternate working directory
                              (default: the path of the Compose file)

Commands:
  build              Build or rebuild services
  bundle             Generate a Docker bundle from the Compose file
  config             Validate and view the Compose file
  create             Create services
  down               Stop and remove containers, networks, images, and volumes
  events             Receive real time events from containers
  exec               Execute a command in a running container
  help               Get help on a command
  images             List images
  kill               Kill containers
  logs               View output from containers
  pause              Pause services
  port               Print the public port for a port binding
  ps                 List containers
  pull               Pull service images
  push               Push service images
  restart            Restart services
  rm                 Remove stopped containers
  run                Run a one-off command
  scale              Set number of containers for a service
  start              Start services
  stop               Stop services
  top                Display the running processes
  unpause            Unpause services
  up                 Create and start containers
  version            Show the Docker-Compose version information
```
