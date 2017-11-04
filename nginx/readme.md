## docker-nginx

官网：[http://nginx.org](http://nginx.org)  

CentOS7 源配置：

/etc/yum.repos.d/nginx.repo
```text
[nginx]
name=nginx repo
baseurl=http://nginx.org/packages/centos/7/$basearch/
gpgcheck=0
enabled=1
```

Replace “OS” with “rhel” or “centos”, depending on the distribution used, and “OSRELEASE” with “6” or “7”, for 6.x or 7.x versions, respectively.


 


