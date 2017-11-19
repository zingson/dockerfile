FROM centos:6.9

MAINTAINER Zengs. <zingsono@gmail.com>

RUN yum -y install iproute nmap tar

#************************************************************************************
# node-v8.9.1
RUN groupadd --gid 1000 node \
  && useradd --uid 1000 --gid node --shell /bin/bash --create-home node

ENV NODE_VERSION 8.9.1

RUN ARCH='x64' \
  && cd /tmp/ \
  && curl -SLO "https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-$ARCH.tar.xz" \
  && tar -xJf "node-v$NODE_VERSION-linux-$ARCH.tar.xz" -C /usr/local --strip-components=1 --no-same-owner \
  && rm -f "node-v$NODE_VERSION-linux-$ARCH.tar.xz" \
  && ln -s /usr/local/bin/node /usr/local/bin/nodejs \
  && cd /


CMD ["node"]





