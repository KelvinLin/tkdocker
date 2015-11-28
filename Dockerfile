FROM ubuntu:14.04
MAINTAINER tinklevin@gmail.com

# Set Env.
ENV USER_NAME="git" \
    DOCKER_BUILD_DIR="/root/docker-for-build"

# apt update
RUN apt-get update; \
    apt-get upgrade -y; \
    apt-get install -y vim git-core \
	build-essential zlib1g-dev libyaml-dev libssl-dev libgdbm-dev libreadline-dev \
	libncurses5-dev libffi-dev curl openssh-server redis-server checkinstall \
	libxml2-dev libxslt-dev libcurl4-openssl-dev libicu-dev logrotate python-docutils pkg-config \
	cmake libkrb5-dev nodejs

# install Ruby 
RUN mkdir /tmp/ruby && cd /tmp/ruby; \
	curl -L --progress http://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.5.tar.gz | tar xz; \
	cd ruby-2.1.5; \
	./configure --disable-install-rdoc; \
	make; \
	make install; \
	ruby --version;

# install bunlder gem
RUN gem install bundler --no-ri --no-rdoc

# Copy build shell script
COPY assets/build/ ${DOCKER_BUILD_DIR}/
# Copy ssh key for git access
COPY assets/ssh/ /root/.ssh/

RUN chmod 600 /root/.ssh/id_rsa; \
	ssh-keyscan github.com >> /root/.ssh/known_hosts


# Run shell script for build
RUN bash ${DOCKER_BUILD_DIR}/clone_install.sh




EXPOSE 22 80
