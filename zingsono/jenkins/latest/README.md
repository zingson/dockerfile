# Jenkins 



### Images

- CentOS7
- Gradle4.7
- Gti

镜像已配置好Gradle、Git。

默认端口：8080   
数据目录：var/jenkins_home 


### Example

1. 最简单运行方式
> docker run zingsono/jenkins:latest

2. 挂载目录的方式
> docker run --name jenkins.s -v /data:/var/jenkins_home -d zingsono/jenkins:latest

3. 使用数据卷的方式，设置网络与端口（建议）
> docker volume create jenkins_data
> docker run --name jenkins.s -v jenkins_data:/var/jenkins_home --network cluster --hostname jenkins.s -p 8080:8080 -d zingsono/jenkins:latest

