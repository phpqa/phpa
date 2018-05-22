#!/bin/sh
set -e

if [ "${1:0:1}" = "-" ]; then
  set -- /sbin/tini -- php /vendor/bin/phpa "$@"
elif [ "$1" = "/vendor/bin/phpa" ]; then
  set -- /sbin/tini -- php "$@"
elif [ "$1" = "phpa" ]; then
  set -- /sbin/tini -- php /vendor/bin/"$@"
fi

exec "$@"
