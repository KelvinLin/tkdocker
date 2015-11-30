#!/bin/bash

adduser --disabled-login --gecos 'GitLab' ${USER_NAME}

cd /home/${USER_NAME}
git clone git@github.com:KelvinLin/eat_tg_bot.git 

cd eat_tg_bot 

cp ${DOCKER_BUILD_DIR}/database.yml /home/${USER_NAME}/eat_tg_bot/config/

bundle install 
#sudo -HEu ${USER_NAME} bundle install
