#!/bin/sh

cd /var/www
git clone ${projecturl} ; cd ${projecturl}
npm start
