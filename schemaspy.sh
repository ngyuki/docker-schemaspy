#!/bin/sh

if [ $# -eq 0 ]; then
  exec java -cp '/*:/drivers_inc/*' org.springframework.boot.loader.JarLauncher "$@"
fi

case "$1" in
  -*) exec java -cp '/*:/drivers_inc/*' org.springframework.boot.loader.JarLauncher "$@"
esac

exec "$@"
