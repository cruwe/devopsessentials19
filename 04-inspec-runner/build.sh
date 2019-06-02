#!/bin/bash
set -x

NOW=$1
DOCKERREG=$2
FROM=$3
INSPECVERSION="${4:-4.0.0}"
GEMSOURCE="${5:-https://rubygems.org}"
GID=$(id -g)
UID=$(id -g)
DOCKERGID=$( getent group docker | awk -F: '{ print $3}' )

# WARNING: inspec requires train by indirection and train requires ruby >+ 2.4.0

for base in buster
do
  imagename=${base}
  docker build \
    --build-arg=FROM=${FROM}/debian-${base} \
    --build-arg=INSPECVERSION=${INSPECVERSION} \
    --build-arg=GEMSOURCE=${GEMSOURCE} \
    --build-arg=UID=${UID} \
    --build-arg=GID=${GID} \
    --build-arg=DOCKERGID=${DOCKERGID} \
    -t ${DOCKERREG}/${imagename}:${NOW} \
    -f docker/Dockerfile \
    docker \
  && docker tag \
     ${DOCKERREG}/${imagename}:${NOW} \
     ${DOCKERREG}/${imagename}:latest
done
