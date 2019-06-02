#!/bin/bash
set -x

NOW=$1
DOCKERREG=$2
FROM=$3
SERVERSPECVERSION="${4:-2.41.4}"
GEMSOURCE="${5:-https://rubygems.org}"
GID=$(id -g)
UID=$(id -g)

for base in buster
do
  imagename=${base}
  docker build \
    --build-arg=FROM=${FROM}/debian-${base} \
    --build-arg=SERVERSPECVERSION=${SERVERSPECVERSION} \
    --build-arg=GEMSOURCE=${GEMSOURCE} \
    --build-arg=UID=${UID} \
    --build-arg=GID=${GID} \
    -t ${DOCKERREG}/${imagename}:${NOW} \
    -f docker/Dockerfile \
    docker \
  && docker tag \
     ${DOCKERREG}/${imagename}:${NOW} \
     ${DOCKERREG}/${imagename}:latest
done
