ARG FROM
FROM ${FROM} AS builder

ARG INSPECVERSION
ARG GEMSOURCE
ARG UID
ARG GID

ENV \
  GID=$GID \
  UID=$UID

COPY dockerpgp.pem /var/tmp/dockerpgp.pem

RUN \
  apt-key add /var/tmp/dockerpgp.pem \
  && echo \
      "deb [arch=amd64] https://download.docker.com/linux/debian stretch stable" \
  >> /etc/apt/sources.list \
  && apt update \
  && apt install \
    --no-install-recommends \
    --yes \
    build-essential \
    docker-ce-cli \
    ruby \
    ruby-dev \
  && apt clean \
  && apt clean \
  && apt autoremove \
  && rm -R /var/lib/apt/lists/* \
  && rm -R /var/cache/apt

RUN \
  groupadd -g $GID inspector \
  && useradd -g $GID -u $UID -m inspector

USER inspector

RUN \
  gem install \
    --no-document \
    --source ${GEMSOURCE} \
    --user-install \
    inspec:${INSPECVERSION}
#    \    inspec-bin:${INSPECVERSION}

FROM $FROM

ARG UID
ARG GID
ARG DOCKERGID

ENV \
  GID=$GID \
  DOCKERGID=$DOCKERGID \
  UID=$UID

RUN \
  apt update \
  && apt install \
    --no-install-recommends \
    --yes \
    openssh-client \
    ruby \
  && apt clean \
  && apt clean \
  && apt autoremove \
  && rm -R /var/lib/apt/lists/* \
  && rm -R /var/cache/apt

RUN \
  groupadd -g $DOCKERGID docker \
  && groupadd -g $GID inspector \
  && useradd -g $GID -G docker -u $UID -m inspector

USER inspector

COPY --from=builder /usr/bin/docker /usr/bin/docker
COPY --from=builder /home/inspector/.gem /home/inspector/.gem

ENV PATH=$PATH:/home/inspector/.gem/ruby/2.5.0/bin

WORKDIR /home/inspector/hostpwd
ENTRYPOINT ["inspec"]
CMD ["help"]
