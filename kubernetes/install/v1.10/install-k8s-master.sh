#!/bin/bash
# kubenetes Master节点服务安装配置，安装前请确保当前机器没有旧版本存在。重复执行会直接覆盖配置。

# 可执行文件所在目录
KUBE_BIN="/opt/kubernetes/server/bin"

echo "*************************************************************************************************"
echo "***************************   k8s master install   **********************************************"
echo "* Release Notes: https://kubernetes.io/docs/imported/release/notes/"
echo "* Kubenetes Version:1.10"
echo "* "

if [ ! -d "$KUBE_BIN" ];then
    echo "* Error: '$KUBE_BIN' Directory does not exist"
    echo "* exit 0 "
    exit 0
fi
rm -f /usr/local/bin/kube-apiserver
rm -f /usr/local/bin/kube-controller-manager
rm -f /usr/local/bin/kube-scheduler
rm -f /usr/local/bin/kubectl
rm -f /usr/local/bin/kube-proxy
rm -f /usr/local/bin/kubelet
echo "* cp -r $KUBE_BIN/{kube-apiserver,kube-controller-manager,kube-scheduler,kubectl,kube-proxy,kubelet} /usr/local/bin/"
cp -r $KUBE_BIN/{kube-apiserver,kube-controller-manager,kube-scheduler,kubectl,kube-proxy,kubelet} /usr/local/bin/
echo "* "

echo "*************************************************************************************************"
echo "* master-config ......"
echo "* Start creating the master node profile..."
mkdir -p /etc/kubenetes
cat >/etc/kubenetes/master-config <<EOF
###
# kubernetes master config
#   kube-apiserver.service
#   kube-controller-manager.service
#   kube-scheduler.service
# KUBE_MASTER="--master=http://172.20.0.113:8080"
# kube-api-server
KUBE_API_ARGS="--etcd-servers=http://192.168.56.101:2379 --service-cluster-ip-range=172.17.0.0/16 --advertise-address=192.168.56.101 --insecure-port=8080 --insecure-bind-address=0.0.0.0 "
# kube-controller-manager
KUBE_CONTROLLER_MANAGER_ARGS="--master=192.168.56.101:8080"
# kube-scheduler
KUBE_SCHEDULER_ARGS="--master=192.168.56.101:8080"
EOF
echo "* cat /etc/kubenetes/master-config"
cat /etc/kubenetes/master-config
echo "* Create configuration '/etc/kubenetes/master-config' success."
echo "* "
echo "* "

echo "*************************************************************************************************"
echo "* kube-apiserver.service ...... "
cat >/usr/lib/systemd/system/kube-apiserver.service <<EOF
[Unit]
Description=Kubernetes API Server
Documentation=https://github.com/kubernetes/kubernetes
After=network.target
After=etcd.service

[Service]
EnvironmentFile=-/etc/kubenetes/master-config
ExecStart=/usr/local/bin/kube-apiserver \$KUBE_API_ARGS
Restart=on-failure
Type=notify
LimitNOFILE=65536

[Install]
WantedBy=multi-user.target
EOF
echo "* cat /usr/lib/systemd/system/kube-apiserver.service"
cat /usr/lib/systemd/system/kube-apiserver.service
systemctl daemon-reload
systemctl stop kube-apiserver.service
systemctl start kube-apiserver.service
echo "* systemctl status kube-apiserver.service"
systemctl status kube-apiserver.service
echo "* "
echo "* "

echo "*************************************************************************************************"
echo "* kube-controller-manager.service ...... "
cat >/usr/lib/systemd/system/kube-controller-manager.service <<EOF
[Unit]
Description=Kubernetes Controller Manager
Documentation=https://github.com/kubernetes/kubernetes
After=kube-apiserver.service

[Service]
EnvironmentFile=-/etc/kubenetes/master-config
ExecStart=/usr/local/bin/kube-controller-manager \$KUBE_CONTROLLER_MANAGER_ARGS
Restart=on-failure
Type=notify
LimitNOFILE=65536

[Install]
WantedBy=multi-user.target
EOF
echo "* cat /usr/lib/systemd/system/kube-controller-manager.service"
cat /usr/lib/systemd/system/kube-controller-manager.service
systemctl daemon-reload
systemctl stop kube-controller-manager.service
systemctl start kube-controller-manager.service
echo "* systemctl status kube-controller-manager.service"
systemctl status kube-controller-manager.service
echo "* "
echo "* "


