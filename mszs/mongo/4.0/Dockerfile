FROM mongo:4.0
# https://github.com/docker-library/mongo/blob/c93d83e50413651ab3960e96cbedbb47e2397562/4.0/Dockerfile

# 设置时区
RUN cp /usr/share/zoneinfo/Asia/Shanghai  /etc/localtime

# 创建默认的KeyFile文件
RUN echo 'YFey4AITXoKBMOE7O9Yw65sQ9UDf4y7MnwjwNrnOcFXYtv70QHdzsYyoUVZMOnSB'>/mongo.key & chmod 600 /mongo.key
