# Jenkins 2.204.1-centos

Jenkins 2.204.1-centos

### Example

1. 最简单运行方式  
```
> docker run mszs/jenkins:latest
```

2. 挂载目录的方式
```
> docker run --name jenkins.s -v /data:/var/jenkins_home -d zingsono/jenkins:latest
```

3. 使用数据卷的方式，设置网络与端口（建议）
```
> docker volume create jenkins_data
> docker run --name jenkins.s -v jenkins_data:/var/jenkins_home --network cluster --hostname jenkins.s -p 8080:8080 -d mszs/jenkins:latest
```

4. 使Jenkins可以运行docker命令,此方法适用于宿主机为Centos7系统  
```
> docker volume create jenkins_data
> docker run --name jenkins.s  \
    -v jenkins_data:/var/jenkins_home  \
    -v /usr/lib64/libltdl.so.7:/usr/lib64/libltdl.so.7  \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v /usr/bin/docker:/usr/bin/docker \
    --network cluster  \
    --hostname jenkins.s  \
    -p 8080:8080  \
    --restart always  \
    -d mszs/jenkins:lts

```
