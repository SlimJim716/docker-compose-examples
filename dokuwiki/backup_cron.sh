#!/bin/bash

#stop container
docker-compose -f <PATH>/docker-compose.yaml stop

#backup the container
docker run --rm -v <PATH>/dokuwiki-backups:/backups --volumes-from dokuwiki busybox \
  cp -a /bitnami/dokuwiki /backups/latest

#restart the container
docker-compose -f <PATH>/docker-compose.yaml start
