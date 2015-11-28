FROM ubuntu:14.04
MAINTAINER tinklevin@gmail.com

ENV USER_NAME="git" \
    DOCKER_BUILD_DIR="/root/docker-for-build"


RUN apt-get update;
RUN apt-get upgrade -y;
RUN apt-get install -y vim git-core \
build-essential zlib1g-dev libyaml-dev libssl-dev libgdbm-dev libreadline-dev \
libncurses5-dev libffi-dev curl openssh-server redis-server checkinstall \
libxml2-dev libxslt-dev libcurl4-openssl-dev libicu-dev logrotate python-docutils pkg-config cmake libkrb5-dev \
nodejs

COPY assets/build/ ${DOCKER_BUILD_DIR}/
COPY assets/ssh/ /root/.ssh/
RUN chmod 600 /root/.ssh/id_rsa
RUN ssh-keyscan github.com >> /root/.ssh/known_hosts

RUN bash ${DOCKER_BUILD_DIR}/ruby_install.sh

RUN bash ${DOCKER_BUILD_DIR}/clone_install.sh



EXPOSE 22 80
