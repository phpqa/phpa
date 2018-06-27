#!/usr/bin/env sh
set -e

if [ "$(printf %c "$1")" = '-' ]; then
  set -- /sbin/tini -- php /composer/vendor/bin/phpa "$@"
elif [ "$1" = "/composer/vendor/bin/phpa" ]; then
  set -- /sbin/tini -- php "$@"
elif [ "$1" = "phpa" ]; then
  set -- /sbin/tini -- php /composer/vendor/bin/"$@"
elif [ -d "$1" ]; then
  set -- /sbin/tini -- php /composer/vendor/bin/phpa "$@"
fi

exec "$@"
