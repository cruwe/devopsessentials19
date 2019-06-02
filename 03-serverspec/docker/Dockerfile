ARG FROM
FROM ${FROM} AS builder

ARG SERVERSPECVERSION
ARG GEMSOURCE
ARG UID
ARG GID

ENV \
  GID=$GID \
  UID=$UID

RUN \
  apt update \
  && apt install \
    --no-install-recommends \
    --yes \
    build-essential \
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
      rake \
      serverspec:${SERVERSPECVERSION}

FROM $FROM

ARG UID
ARG GID

ENV \
  GID=$GID \
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
  groupadd -g $GID inspector \
  && useradd -g $GID -u $UID -m inspector

USER inspector

COPY --from=builder /home/inspector/.gem /home/inspector/.gem

ENV PATH=$PATH:/home/inspector/.gem/ruby/2.5.0/bin

ENTRYPOINT ["rake"]
CMD ["help"]
WORKDIR /home/inspector/hostpwd
