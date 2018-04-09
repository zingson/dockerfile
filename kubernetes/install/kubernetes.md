## CentOS7 

    关机：systemctl  halt,  systemctl poweroff
    重启：systemctl  reboot
    挂起：systemctl  suspend
    快照：systemctl  hibernate
    快照并挂起：systemctl  hybrid-sleep

## Master安装步骤
1. 禁用SELINUX   
/etc/selinux/config 修改 SELINUX=disabled ,重启生效， 查看状态/usr/sbin/sestatus -v ，如果SELinux status参数为enabled即为开启状态   
2. 关闭防火墙    
   >systemctl stop firewalld    
    systemctl disable firewalld     
3. 安装docker etcd flanneld    
   >yum install -y docker etcd flannel  
   systemctl enable docker   
   systemctl enable etcd      
   systemctl enable flanneld  
4. 修改配置etcd    
    设置 etcdctl mk /atomic.io/network/config '{"Network": "172.17.0.0/16"}'  ,IP必须为docker的网段      
   >修改etcd配置vi /etc/etcd/etcd.conf    
    ETCD_LISTEN_CLIENT_URLS="http://0.0.0.0:2379"  
    重启 systemctl restart etcd       
5. 修改flanneld配置
    >修改flanneld配置vi /etc/sysconfig/flanneld    
    FLANNEL_ETCD_ENDPOINTS="http://k8s-master:2379"    
    重启 systemctl restart flanneld    
6. 检查Docker网络配置,确保docker0在flannel0网段中。
    >systemctl restart docker  
    ip route    
    default via 192.168.3.1 dev enp0s3 proto static metric 100   
    172.17.0.0/16 dev flannel0 proto kernel scope link src 172.17.19.0   
    172.17.19.0/24 dev docker0 proto kernel scope link src 172.17.19.1   
    192.168.3.0/24 dev enp0s3 proto kernel scope link src 192.168.3.64 metric 100   
    
    确保网络没问题，可进行后续的kubernetes安装。
7. Kubenetes-master节点需要安装服务：apiserver  

  
## Node安装步骤


Master节点安装部署：etcd/kube-apiserver/kube-controller-manager/kube-scheduler
使用kubectl作为客户端与master进行交互操作。

在工作Node上仅需要部署kubelet和kube-proxy服务进程。


## 步骤

查看防火墙状态firewalld
systemctl status firewalld.service
关闭防火墙
systemctl stop firewalld.service
systemctl disable firewalld.service

安全设置
setenforce 0 

查看iptables
systemctl status iptables.service
systemctl stop iptables.service

设置主机名
hostnamectl –static set-hostname centos-master

关闭Selinux
/etc/selinux/config
SELINUX=disabled

### 安装master
yum install docker
yum install etcd
yum install flannel
yum install kubernetes-master

#### 配置 etcd
所有的etcd都统一配置
/etc/etcd/etcd.conf
ETCD_NAME=default
ETCD_DATA_DIR="/var/lib/etcd/default.etcd"
默认是localhost:2379 ,改为0.0.0.0表示所有地址都可访问
ETCD_LISTEN_CLIENT_URLS="http://0.0.0.0:2379"
ETCD_ADVERTISE_CLIENT_URLS="http://192.168.163.148:2379" masterIP端口

运行
systemctl enable etcd
systemctl start etcd

etcdctl mk /coreos.com/network/config
'{"Network": "192.168.0.0/16"}'
etcdctl get /coreos.com/network/config

node节点需要运行etcdctl ls /coreos.com查看是否有返回值


#### 配置apiserver

/etc/kubernetes/apiserver
KUBE_ETCD_SERVERS="--etcd_servers=http://192.168.163.148:2379"
KUBE_SERVICE_ADDRESSES="--service-cluster-ip-range=192.168.0.0/16"
配置controller-manager
/etc/kubernetes/controller-manager
KUBE_CONTROLLER_MANAGER_ARGS="--node-monitor-grace-period=10s --pod-eviction-timeout=10s"


#### 配置config

/etc/kubernetes/config
KUBE_MASTER="--master=http://192.168.163.148:8080"

启动
systemctl enable 
systemctl start kube-apiserver
systemctl start kube-scheduler
systemctl start kube-controller-manager

因为没有关闭防火墙导致 kube-apiserve无法启动通过 systemctl status kube-apiserver.service查看 kube-apiserver状态和journalctl -xe查看日志







