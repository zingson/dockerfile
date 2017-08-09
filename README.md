# Dockerfile

Github: https://github.com/zingson/Dockerfile.git

本项目用于收集常用镜像资源，通过Dockerfile快速构建镜像。

关于Docker安装，请参考官网 https://www.docker.com/


没有注释说明registry地址的镜像是基于官方源构建，对于私有registry镜像，请查看具体Dockerfile文件中注释说明。


官方默认镜像源：https://registry.hub.docker.com
国内官方镜像源：https://www.docker-cn.com/registry-mirror
阿里云专属镜像源：https://xxxxxx.mirror.aliyuncs.com


## 项目目录
- 一级目录为程序镜像名
- 二级目录为基于官方源的版本或者运行环境程序版本
- 版本下包含Dockerfile文件与docker-compose.yml文件来构建镜像和容器




推荐项目部署路径

```
data
  projectName
     log
     app
     Dockerfile
     compose.yml
     build.sh
```


<br><br><br>
---------------------------------------------------------------------------

Author: Zengs

Email: zingsono@gmail.com

QQ/WX: 916931772

业余时间整理，如有错误或者建议，欢迎指正。

目前还有很多不完善，努力中......

<br><br><br>


