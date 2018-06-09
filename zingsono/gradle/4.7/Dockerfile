FROM zingsono/openjdk:1.8-jdk
MAINTAINER Zengs.<zingsono@gmail.com>

LABEL version="4.7" description="Gradle 4.7"

ENV VERSION="gradle-4.7"
ENV GRADLE=/gradle/$VERSION/bin
ENV PATH=$PATH:$GRADLE

WORKDIR /gradle/
RUN yum install -y unzip && curl -o gradle.zip https://downloads.gradle.org/distributions/$VERSION-bin.zip && unzip ./gradle.zip && rm -f gradle.zip
