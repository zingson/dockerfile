#!/bin/bash
# 脚本输出记入日志文件
# ./install-kubernetes-master-v1.10.sh >>install-k8s-master.log 2>&1


# install Kubernetes-master
echo "*******************************************************************************"
echo "*** kubernetes-master"

etcd_server="192.168.56.101:2379"



####### 1. docker
if [ `rpm -qa | grep docker |wc -l` -ne 0 ];then
    echo -e "yes"
else
    echo "no"
    yum install -y docker
fi


# 设置国内镜像仓库


####### 2. etcd
yum install -y etcd
# 设置网络

####### 3. flannle
yum install -y flannle


####### 4. kubernetes

# 下载安装包

# 解压

# api-server

# controller


####### 5. 安装UI界面

