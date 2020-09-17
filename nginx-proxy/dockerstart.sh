#!/bin/bash

# Setup nginx.conf
IN_PREFIX="${IN_PREFIX:-/lw-workspace/proxy/}"
APP_PREFIX="${APP_PREFIX:-/}"
APP_PORT="${APP_PORT:-80}"

sed -s "s@IN_PREFIX@$IN_PREFIX@g" /etc/nginx/nginx.conf.template \
   | sed -s "s@APP_PREFIX@$APP_PREFIX@g" \
   | sed -s "s@APP_PORT@$APP_PORT@g" \
   | tee /etc/nginx/nginx.conf

# launch!
nginx -g 'daemon off;'
