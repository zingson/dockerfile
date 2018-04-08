#!/usr/bin/env bash

# Kubernetes集群主机节点IP映射
# hostnamectl set-hostname xxx

--------------------------------------
cat <<EOF > /etc/hosts
127.0.0.1           localhost
192.168.3.51        k8s-client
192.168.3.64        k8s-master
192.168.3.63        k8s-node01
192.168.3.65        k8s-node02
192.168.3.66        k8s-node03
EOF


--------------------------------------
cat <<EOF > /etc/hosts
127.0.0.1           localhost
192.168.1.51        k8s-client
192.168.1.64        k8s-master
192.168.1.63        k8s-node01
192.168.1.65        k8s-node02
192.168.1.66        k8s-node03
EOF

--------------------------------------



