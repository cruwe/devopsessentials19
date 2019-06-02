#!/bin/bash
set -x

NOW=$1
DOCKERREG=$2
FROM=$3
GID=$(id -g)
UID=$(id -g)

for base in stretch buster
do
  imagename=${base}-systemd
  docker build \
    --build-arg=FROM=${FROM}/debian-${base} \
    --build-arg=UID=${UID} \
    --build-arg=GID=${GID} \
    -t ${DOCKERREG}/${imagename}:${NOW} \
    -f docker/Dockerfile \
    . \
  && docker tag \
     ${DOCKERREG}/${imagename}:${NOW} \
     ${DOCKERREG}/${imagename}:latest
done
