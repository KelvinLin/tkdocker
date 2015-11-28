#!/bin/bash
mkdir /tmp/ruby && cd /tmp/ruby
curl -L --progress http://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.5.tar.gz | tar xz
cd ruby-2.1.5
./configure --disable-install-rdoc
make
make install

ruby --version

adduser --disabled-login --gecos 'GitLab' ${USER_NAME}
