#!/usr/bin/env bash


## 安装Docker
yum install -y docker
systemctl enable docker && systemctl restart docker


## 安装etcd 与 flannel


