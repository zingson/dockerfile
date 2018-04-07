#!/usr/bin/env bash

# kubernetes master install

# 1.关闭CentOS 自带的防火墙服务
systemctl disable  firewalld
systemctl stop firewalld

# 2.安装etcd 和Kubernetes软件（会自动安装Docker）
yum install -y etcd kubernetes

# 3.修改两个配置，其它使用系统默认
# 1>Docker配置文件为/etc/sysconfig/docker,其中OPTIONS的内容设置为：OPTIONS='--selinux-enabled=false --insecure-registry gcr.io'
# 2>Kubernetes apiserver 配置文件为/etc/kubernetes/apiserver，把--admission_control参数中的ServiceAccount删除

# 4.按顺序启动所有服务：
systemctl start etcd
systemctl start docker
systemctl start kube-apiserver
systemctl start kube-controller-manager
systemctl start kube-scheduler
systemctl start kubelet
systemctl start kube-proxy







