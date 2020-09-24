#!/bin/bash

# Setup nginx.conf
REDIRECT_PREFIX="${REDIRECT_PREFIX:-""}"
REDIRECT_PREFIX="${REDIRECT_PREFIX%/}"
IN_PREFIX="${IN_PREFIX:-lw-workspace/proxy/}"
IN_PREFIX="${IN_PREFIX#/}"
APP_PREFIX="${APP_PREFIX:-""}"
APP_PREFIX="${APP_PREFIX#/}"
APP_PORT="${APP_PORT:-80}"

sed -s "s@REDIRECT_PREFIX@$REDIRECT_PREFIX@g" /etc/nginx/nginx.conf.template \
   | sed -s "s@IN_PREFIX@$IN_PREFIX@g" \
   | sed -s "s@APP_PREFIX@$APP_PREFIX@g" \
   | sed -s "s@APP_PORT@$APP_PORT@g" \
   | tee /etc/nginx/nginx.conf

# launch!
nginx -g 'daemon off;'
