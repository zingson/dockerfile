使用Docker的macvlan为容器提供桥接网络及跨主机通讯
=============================================================

## 什么是 macvlan？

VM中的NAT对应Docker中的bridge，虽然叫bridge，但和VM的bridged网络却不一样，其原理是在宿主机上虚出一块网卡bridge0，然后所有容器会桥接在这块网卡的网段上。
默认情况下容器能访问外部网络，但外部网络无法访问容器，因此需要通过暴露容器端口的方式（docker run -p）让外部网络访问容器内的服务。
此时docker会在宿主机上建立一条NAT路由规则，将子网中容器内的服务通过端口转发（port forwarding）的方式暴露给外部网络。
当bridge网络下不去暴露任何端口，那么基本上等同于VM的Host-only网络。

## Bridged

桥接网络带来的好处是，不需要通过NAT的端口映射即可实现容器内服务的暴露，当容器桥接到物理网络时，容器就是物理网络中的一台主机，使得容器间及容器与物理主机间实现互通。   
上面提到Docker中默认的bridge并不是真正的桥接网络，而Docker的网络是可以灵活自定义的，可以通过多种方式实现真正的桥接。   
其中可以通过overlay网络驱动实现，多主机多容器的桥接，但需要依赖额外的key-value服务来保存网络拓扑信息。   
另外一些第三方工具也能够实现桥接模式，如pipework等。   
桥接网络可以使容器网络部署简单化，因此Docker官方在1.12版本之后引入了macvlan网络驱动，这样我们可以更简单的为容器配置桥接网络。   



## Macvlan

顾名思义，macvlan的原理是在宿主机物理网卡上虚拟出多个子网卡，通过不同的MAC地址在数据链路层（Data Link Layer）进行网络数据转发的，它是比较新的网络虚拟化技术，需要较新的内核支持（Linux kernel v3.9–3.19 and 4.0+）。

## Using macvlan

### 创建网络

    docker network create -d macvlan \
        --subnet=192.168.1.0/24 \
        --gateway=192.168.1.1  \
        -o parent=enp4s0 mcv
解释：
1. 创建macvlan网络，使用macvlan网络驱动
2. 指定要桥接的网络地址
3. 指定网关
4. 设置要在宿主机上那块网卡上建立虚拟子网卡


### 测试

    docker  run --net=mcv --ip=192.168.1.99 -itd alpine /bin/sh
 运行容器，指定刚建好的macvlan网络，并制定IP地址。  
 如果不指定IP，会通过IPAM分配IP，默认是从192.168.1.2开始分配。  
 注意，分配时并不会判断地址冲突，可以通过docker的network命令去指定分配方式，这里不做赘述。  

    docker  run --net=mcv -it --rm alpine /bin/sh
    运行另外一个容器，进行连通性测试
    ping 192.168.1.99
    ping 192.168.1.1

另外，macvlan还支持802.1q trunk等更为复杂的网络拓扑结构