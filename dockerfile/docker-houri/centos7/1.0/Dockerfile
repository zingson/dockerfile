FROM centos:7

ENV NODE_VERSION=8.11.1
WORKDIR var/lib/nodejs/
RUN yum install -y wget curl
RUN wget https://nodejs.org/dist/v${NODE_VERSION}/node-v${NODE_VERSION}-linux-x64.tar.xz \
    &&tar -xf node-v${NODE_VERSION}-linux-x64.tar.xz \
    &&cp node-v${NODE_VERSION}-linux-x64/bin/node /usr/local/bin/ \
    &&rm -rf node-v${NODE_VERSION}-linux-x64 \
    &&rm -f node-v${NODE_VERSION}-linux-x64.tar.xz
COPY docker.js .

CMD ["node","docker.js"]