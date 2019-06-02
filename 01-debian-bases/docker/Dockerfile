ARG FROMVAR
FROM debian:$FROMVAR

ARG VARIANT
ENV VARIANT=$VARIANT
ARG DEBSOURCE
ENV DEBSOURCE=$DEBSOURCE

# NOTICE: note that debian packages come signed, so strictly speaking, https
# NOTICE: is not necessary

RUN \
  apt update \
  && apt install \
    --no-install-recommends \
    --yes \
      apt-transport-https \
      ca-certificates \
      gnupg

RUN \
  echo "deb $DEBSOURCE $VARIANT main" \
  > /etc/apt/sources.list \
  && echo "deb $DEBSOURCE $VARIANT-updates main" \
  >> etc/apt/sources.list \
  && echo "deb $DEBSOURCE-security $VARIANT/updates main" \
  >> /etc/apt/sources.list

RUN \
  apt update \
  && apt upgrade -y \
  && apt clean \
  && apt autoremove \
  && rm -R /var/lib/apt/lists/* \
  && rm -R /var/cache/apt
