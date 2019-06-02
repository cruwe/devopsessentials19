ARG FROM
FROM $FROM

ENV container docker

# https://github.com/alehaa/docker-debian-systemd/
RUN \
  apt update \
  && apt install -y \
      curl \
      openssh-server \
      sudo \
      systemd \
      systemd-sysv \
  && apt clean \
  && apt autoremove \
  && rm -R /var/lib/apt/lists/* \
  && rm -R /var/cache/apt

RUN \
  rm -f \
    /etc/machine-id \
    /var/lib/dbus/machine-id

RUN \
  mkdir -p /var/run/sshd \
  && echo root:root \
  | chpasswd \
  && sed \
    --in-place \
    --regexp-extended \
    's/^#?PermitRootLogin .*/PermitRootLogin yes/' \
    /etc/ssh/sshd_config \
  && sed \
    --in-place \
    --regexp-extended \
    's/^#?PasswordAuthentication .*/PasswordAuthentication yes/' \
    /etc/ssh/sshd_config

EXPOSE 22

# https://github.com/CentOS/CentOS-Dockerfiles/tree/master/systemd/centos7

RUN \
  systemctl \
    mask \
      dev-hugepages.mount \
      dev-mqueue.mount \
      display-manager.service \
      sys-fs-fuse-connections.mount \
      sys-kernel-config.mount \
      sys-kernel-debug.mount \
      systemd-logind.service \
      systemd-remount-fs.service \
  && systemctl disable graphical.target \
  || true \
  && systemctl enable multi-user.target
VOLUME ["/sys/fs/cgroup"]

ARG UID
ARG GID

ENV \
  GID=$GID \
  UID=$UID

RUN \
  groupadd -g $GID testuser\
  && useradd \
    -g $GID \
    -m \
    -s /bin/bash \
    -u $UID \
    testuser \
  && mkdir /home/testuser/.ssh \
  && chown -R testuser:testuser /home/testuser

CMD  ["/sbin/init"]
