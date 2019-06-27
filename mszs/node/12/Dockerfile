FROM mszs/centos:7
ENV NODE_VERSION 12.5.0
# https://nodejs.org/dist/v12.5.0/node-v12.5.0-linux-x64.tar.xz
RUN curl -fsSLO --compressed "https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-x64.tar.xz"  \
    && tar -xJf "node-v$NODE_VERSION-linux-x64.tar.xz" -C /usr/local --strip-components=1  \
    && rm "node-v$NODE_VERSION-linux-x64.tar.xz"
CMD ["node"]
