# Jenkins 

已安装 Gradle、Git ，时区为中国时间。
- CentOS7
- Gradle4.7
- Gti


默认端口：8080   
数据目录：var/jenkins_home 


### Simple Tags

[`latest` (jenkins/latest/Dockerfile)](https://github.com/zingsono/Docker/tree/master/zingsono/jenkins/latest/Dockerfile)      
[`2.121` (jenkins/2.121/Dockerfile)](https://github.com/zingsono/Docker/tree/master/zingsono/jenkins/2.121/Dockerfile)

### Example

1. 最简单运行方式
> docker run zingsono/jenkins:latest

2. 挂载目录的方式
> docker run --name jenkins.s -v /data:/var/jenkins_home -d zingsono/jenkins:latest

3. 使用数据卷的方式，设置网络与端口（建议）
> docker volume create jenkins_data
> docker run --name jenkins.s -v jenkins_data:/var/jenkins_home --network cluster --hostname jenkins.s -p 8080:8080 -d zingsono/jenkins:latest



### Change log

[ 2.121 ]   `2018-06-12 `
- Create

