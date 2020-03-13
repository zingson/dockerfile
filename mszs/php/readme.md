
Centos yum配置：http://www.cnblogs.com/insoleis/p/5587691.html

```text
 

然后对里面内容进行以下修改：
[remi]
name=Remi's RPM repository for Enterprise Linux 6 - $basearch
#baseurl=http://rpms.remirepo.net/enterprise/6/remi/$basearch/
mirrorlist=http://rpms.remirepo.net/enterprise/6/remi/mirror
enabled=1
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-remi
 

还有以下： 
[remi-php56]
name=Remi's PHP 5.6 RPM repository for Enterprise Linux 6 - $basearch
#baseurl=http://rpms.remirepo.net/enterprise/6/php56/$basearch/
mirrorlist=http://rpms.remirepo.net/enterprise/6/php56/mirror
# WARNING: If you enable this repository, you must also enable "remi"
enabled=1
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-remi
```


## PHP项目部署说明
