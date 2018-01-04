FROM centos:6.9

MAINTAINER Zengs. <zingsono@gmail.com>

# 测试中


# 编译环境
RUN yum install -y gcc gcc-c++ wget tar

# nginx依赖
RUN yum install -y pcre pcre-devel openssl openssl-devel zlib zlib-devel

# 创建用户nginx，以该用户的身份执行nginx
RUN useradd -s /bin/false -M nginx

# 下载nginx源码包解压
RUN cd / \
    && wget http://nginx.org/download/nginx-1.12.2.tar.gz \
    && tar -zxf nginx-1.12.2.tar.gz

## 编译安装

# 生成Makefile文件，自定义添加需要的模块进行编译
RUN cd nginx-1.12.2 \
     && CONFIG="\
     		--prefix=/apps/nginx \
     		--user=nginx \
     		--group=nginx \
     		--with-http_v2_module \
     		--with-http_ssl_module \
     		--with-http_realip_module \
     		--with-http_addition_module \
     		--with-http_sub_module \
     		--with-http_dav_module \
     		--with-http_flv_module \
     		--with-http_mp4_module \
     		--with-http_gunzip_module \
     		--with-http_gzip_static_module \
     		--with-http_random_index_module \
     		--with-http_secure_link_module \
     		--with-http_stub_status_module \
     		--with-http_auth_request_module \
     		--with-threads \
     		--with-stream \
     		--with-stream_ssl_module \
     		--with-stream_ssl_preread_module \
     		--with-stream_realip_module \
     		--with-http_slice_module \
     		--with-compat \
     		--with-file-aio \
     	" \
     && ./configure $CONFIG --with-debug \


# 编译源码并安装
RUN make && make install


## 修改conf文件


EXPOSE 80

# 启动执行
CMD ["/apps/nginx/sbin/nginx", "-g", "daemon off;"]


