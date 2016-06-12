#!/bin/bash
if [ $projecturl ];then
  source root/.bashrc
  export dirurl=${projecturl%.*}
  cd /var/www
  git clone ${projecturl}
  cd ${dirurl##*/}
  if [ $autoupdate ];then
    nohup mydeploy start &
  fi
  npm install ; nohup npm start &
fi
