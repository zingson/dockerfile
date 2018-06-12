FROM zingsono/openjdk:8-jre

# 从指定服务自动下载jar包部署项目
COPY ./ /
ENTRYPOINT ["/entrypoint.sh"]
CMD ["project-name-version.jar"]