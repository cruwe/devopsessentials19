#!/bin/bash
set -x

NOW=$1
DOCKERREG=$2
DEBSOURCE="${3:-https://deb.debian.org/debian}"

for variant in stretch buster
do

  docker build \
    --build-arg=FROMVAR="$variant" \
    --build-arg=VARIANT="$variant" \
    --build-arg=DEBSOURCE="${DEBSOURCE}" \
    --tag="${DOCKERREG}/debian-$variant:$NOW" \
    ./docker

  docker tag \
    ${DOCKERREG}/debian-${variant}:${NOW} \
    ${DOCKERREG}/debian-${variant}:latest

done



