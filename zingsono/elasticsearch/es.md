
## ES 应用经验记录
1. 不能以root用户运行

2. 警告: `max virtual memory areas vm.max_map_count [65530] is too low, increase to at least [262144]` ,解决方法：
   - 临时修改：宿主机使用`sysctl -w vm.max_map_count=262144`，`sysctl -a|grep vm.max_map_count`查看修改结果。
   - 永久修改：在宿主机`/etc/sysctl.conf`文件中追加一行：`vm.max_map_count = 262144` 执行命令应用变更：`sudo sysctl -p`
3.  配置文件建议修改节点名称、集群名称。