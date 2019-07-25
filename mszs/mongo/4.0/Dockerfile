FROM mongo:4.0
# https://github.com/docker-library/mongo/blob/c93d83e50413651ab3960e96cbedbb47e2397562/4.0/Dockerfile

# 设置时区
RUN cp /usr/share/zoneinfo/Asia/Shanghai  /etc/localtime

# 创建默认的KeyFile文件，如果不使用默认KefyFile，可挂载本地文件覆盖，注意文件权限设置
RUN echo 'YFey4AITXoKBMOE7O9Yw65sQ9UDf4y7MnwjwNrnOcFXYtv70QHdzsYyoUVZMOnSB'>/mongo.key & chmod 600 /mongo.key
