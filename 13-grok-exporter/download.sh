#!/bin/bash
set -x

GITHUB="https://github.com/fstab/grok_exporter/releases/download"
MACHINE_ARCH="${3:-amd64}"
OS_FAMILY="${2:-linux}"
VERSION="${1:-0.2.7}"

curl \
  -L \
  -o grok_exporter.zip \
  -z grok_exporter.zip \
  $GITHUB/v$VERSION/grok_exporter-$VERSION.$OS_FAMILY-$MACHINE_ARCH.zip

unzip \
  -d docker \
  -u grok_exporter.zip
