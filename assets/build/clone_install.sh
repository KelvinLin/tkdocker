#!/bin/bash

adduser --disabled-login --gecos 'GitLab' ${USER_NAME}

cd /home/git
git clone git@github.com:KelvinLin/eat_tg_bot.git 

cd eat_tg_bot 
#sudo -HEu ${USER_NAME} bundle install
