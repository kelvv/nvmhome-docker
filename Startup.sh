#!/bin/bash
if [ $projecturl ];then
  source root/.bashrc
  export dirurl=${projecturl%.*}
  cd /var/www
  git clone ${projecturl}
  cd ${dirurl##*/}
  npm install --registry=https://registry.npm.taobao.org;npm start
fi
