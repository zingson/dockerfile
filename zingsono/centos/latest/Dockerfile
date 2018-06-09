FROM centos:7

# 修改时区，默认时间差了8小时，改为与北京时间同步
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

# 安装常用工具包
RUN yum install -y wget curl tar iproute &&yum clean all
