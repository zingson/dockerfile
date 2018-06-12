# Jenkins:latest

FROM zingsono/gradle:4.7

### 示例

数据卷
> docker volume create jenkins_data

运行容器
> docker run --name jenkins.s -v jenkins_data:/var/jenkins_home --network cluster --hostname jenkins.s -p 8080:8080 -d zingsono/jenkins:latest

