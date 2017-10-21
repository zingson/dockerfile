## Docker nginx

    version: 1.12.1-alpine

基于官方镜像构建。



构建步骤:

1. 获取指定版本镜像

    pull nginx:1.12.1-alpine

   
2. 运行容器，配置端口与映射路径等配置信息(参数前面是本机路径，后面是容器路径)
    
    sudo docker run --name nginx -p 81:80 -v /apps/nginx/html:/usr/share/nginx/html --privileged=true -d nginx:1.12.1-alpine 
    
    
### 问题记录

- Docker挂载主机目录，访问相应的文件出现Premission denied的权限访问问题 

解决方案可参考:http://blog.csdn.net/rznice/article/details/52170085
问题原因及解决办法
原因是CentOS7中的安全模块selinux把权限禁掉了，至少有以下三种方式解决挂载的目录没有权限的问题：    
1. 在运行容器的时候，给容器加特权，及加上 --privileged=true 参数：   
    docker run -i -t -v /soft:/soft --privileged=true 686672a1d0cc /bin/bash
2. 临时关闭selinux：
   setenforce 0
3. 添加selinux规则，改变要挂载的目录的安全性文本


    