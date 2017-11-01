docker network 
=======================================

```
[root@localhost php]# docker network --help
Usage:	docker network COMMAND
Manage Docker networks
Options:
      --help   Print usage
Commands:
  connect     Connect a container to a network
  create      Create a network
  disconnect  Disconnect a container from a network
  inspect     Display detailed information on one or more networks
  ls          List networks    
  rm          Remove one or more networks

Run 'docker network COMMAND --help' for more information on a command.

```

# 网络配置  

Docker网络模式分为：bridge模式(默认)、host模式、container模式、none模式；

## Bridge模式
 
这是dokcer网络的默认设置。安装完docker，系统会自动添加一个供docker使用的网桥docker0，我们创建一个新的容器时，容器通过DHCP获取一个与docker0同网段的IP地址。并默认连接到docker0网桥，以此实现容器与宿主机的网络互通。

## macvlan 实现跨主机通讯

实现容器与宿主机在同一网段。       
MACVLAN的原理是在宿主机物理网卡上虚拟出多个子网卡，通过不同的MAC地址在数据链路层（Data Link Layer）进行网络数据转发的，它是比较新的网络虚拟化技术，需要较新的内核支持（Linux kernel v3.9–3.19 and 4.0+）。

使用macvlan创建网络
```
    docker network create -d macvlan \
        --subnet=192.168.1.0/24 \
        --gateway=192.168.1.1  \
        --opt parent=enp4s0 macnet  
        
    docker network create -d macvlan --subnet=192.168.1.0/24 --gateway=192.168.1.120 --opt parent=eth0 macnet    
    docker network rm macnet
        
    # 运行两个容器进行连通性测试    
    docker  run --net=mcv --ip=192.168.1.99 -itd alpine /bin/sh    
    docker  run --net=mcv --ip=192.168.1.98 -itd alpine /bin/sh    
    ping 192.168.1.99
    ping 192.168.1.98
```
解释：
1. 创建macvlan网络，使用macvlan网络驱动；
2. --subnet 指定要桥接的网络地址；
3. --gateway 指定网关；
4. -o parent=enp4s0 设置要在宿主机上那块网卡上建立虚拟子网卡,enp4s0是宿主机网卡名；
5. mcv是新建的网络名，可自行定义；
6. 如果不指定IP，会通过IPAM分配IP。注意，分配时并不会判断地址冲突，可以通过docker network命令去指定分配方式。
7. 另外，macvlan还支持802.1q trunk等更为复杂的网络拓扑结构

### 测试网络

docker run --name cos161 --net=macnet --ip=192.168.1.161 -itd centos:7 /bin/bash
docker run --name cos162 --net=macnet --ip=192.168.1.162 -itd centos:7 /bin/bash



容器暴露IP参考：http://blog.csdn.net/lvshaorong/article/details/69950694