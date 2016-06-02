#!/bin/bash
if [ $projecturl ];then
  source root/.bashrc
  export dirurl=${projecturl%.*}
  cd /var/www
  git clone ${projecturl}
  cd ${dirurl##*/}
  npm install ;npm run pm2
fi
