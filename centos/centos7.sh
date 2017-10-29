#!/usr/bin/env bash



sudo docker stop centos7
sudo docker rm centos7
sudo docker run --name centos7 --detach centos:7