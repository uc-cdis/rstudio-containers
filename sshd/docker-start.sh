#!/bin/bash
# 
# Little startup script - adds some docker runtime environment
# to /etc/profile, so ssh login users pick it up
#

for name in http_proxy https_proxy no_proxy HOSTNAME NAMESPACE; do
  value="${!name}"
  if [[ -n "$value" ]]; then
    echo "export $name=\"$value\"" >> /etc/profile
  fi
done

exec /usr/sbin/sshd -D -e
