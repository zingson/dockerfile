# Jenkins:latest

FROM zingsono/gradle:4.7

官网：[https://jenkins.io](https://jenkins.io)


### 示例

运行
> docker run zingsono/jenkins:2.121


数据卷
> docker volume create jenkins_data

运行容器
> docker run --name jenkins.s -v jenkins_data:/var/jenkins_home --network cluster --hostname jenkins.s -p 8080:8080 -d zingsono/jenkins:2.121

