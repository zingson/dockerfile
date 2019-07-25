
## ES 应用经验记录
1. 不能以root用户运行

2. 警告: `max virtual memory areas vm.max_map_count [65530] is too low, increase to at least [262144]` ,解决方法：
   - 临时修改：宿主机使用`sysctl -w vm.max_map_count=262144`，`sysctl -a|grep vm.max_map_count`查看修改结果。
   - 永久修改：在宿主机`/etc/sysctl.conf`文件中追加一行：`vm.max_map_count = 262144` 执行命令应用变更：`sudo sysctl -p`
3.  配置文件建议修改节点名称、集群名称。
4. 运行示例：(-v需要使用数据卷，包含数据目录、配置目录、日志目录、插件目录等)
    >docker run --name es -v es_data:/es  -it zingsono/elasticsearch:6.2.4 






## 配置文件介绍 

config/elasticsearch.yml
```text
cluster.name:elasticsearch #集群的名称，同一个集群该值必须设置成相同的

node.name:"es2" #该节点的名字

node.master:true #该节点有机会成为master节点

node.data:true #该节点可以存储数据

node.rack:rack2 #该节点所属的机架

index.number_of_shards:5 #shard的数目

index.number_of_replicas:3 #数据副本的数目

network.bind_host:0.0.0.0 #设置绑定的IP地址，可以是IPV4或者IPV6

network.publish_host:10.0.0.209 #设置其他节点与该节点交互的IP地址

network.host:10.0.0.209 #该参数用于同时设置bind_host和publish_host

transport.tcp.port:9300 #设置节点之间交互的端口号

transport.tcp.compress:true #设置是否压缩tcp上交互传输的数据

http.port:9200 #设置对外服务的http端口号

http.max_content_length:100mb #设置http内容的最大大小

http.enabled:true #是否开启http服务对外提供服务

discovery.zen.minimum_master_nodes:2 #设置这个参数来保证集群中的节点可以知道其它N个有master资格的节点。默认为1，对于大的集群来说，可以设置大一点的值（2-4）

discovery.zen.ping.timeout:120s #设置集群中自动发现其他节点时ping连接的超时时间

discovery.zen.ping.multicast.enabled:true #设置是否打开多播发现节点

discovery.zen.ping.unicast.hosts:["10.0.0.209:9300","10.0.0.206:9300","10.0.0.208:9300"] #设置集群中的Master节点的初始列表，可以通过这些节点来自动发现其他新加入集群的节点

```

    