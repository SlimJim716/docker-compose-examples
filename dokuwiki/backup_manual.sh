#!/bin/bash

printf "Backing up DOKUWIKI...\n"

read -r -p "Have you stopped the container? [y/n] " response
case "$response" in
    [yY][eE][sS]|[yY]) 
        docker run --rm -v <PATH>/dokuwiki-backups:/backups --volumes-from dokuwiki busybox \
  cp -a /bitnami/dokuwiki /backups/latest
        printf "Complete. Use *docker-compose start* to restart the container\n"
        ;;
    *)
        printf "Stop the continer before running this script. Use *docker-compose stop* to do so.\n"
        ;;
esac
