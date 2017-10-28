
首先讲一下docker的网络模式：   
我们使用docker run创建容器时，可以使用--net选项指定容器的网络模式，docker一共有4中网络模式：    
1：bridge模式，--net=bridge(默认)。    
这是dokcer网络的默认设置。安装完docker，系统会自动添加一个供docker使用的网桥docker0，我们创建一个新的容器时，容器通过DHCP获取一个与docker0同网段的IP地址。并默认连接到docker0网桥，以此实现容器与宿主机的网络互通。如下：
 
2：host模式，--net=host。   
  这个模式下创建出来的容器，将不拥有自己独立的Network Namespace，即没有独立的网络环境。它使用宿主机的ip和端口。
  
3：container模式，--net=container:NAME_or_ID。   

这个模式就是指定一个已有的容器，共享该容器的IP和端口。除了网络方面两个容器共享，其他的如文件系统，进程等还是隔离开的。

4：none模式，--net=none。    
这个模式下，dokcer不为容器进行任何网络配置。需要我们自己为容器添加网卡，配置IP。    
因此，若想使用pipework配置docker容器的ip地址，必须要在none模式下才可以    



参考：http://blog.csdn.net/wangdaoge/article/details/52703890