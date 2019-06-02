# Installation

Just run
```bash
mvn install
```
in this directory to install the parent `pom.xml` used for docker builds.

You may want to experiment with the profile to use local proxies.

The image may be started calling
```bash
docker run \
    --privileged \
    -ti  \
    -v $HOME/.ssh/id_rsa.pub:/home/testuser/.ssh/authorized_keys:ro \
    -v /sys/fs/cgroup:/sys/fs/cgroup:ro \
    nullregistry/demoimages/buster-systemd:latest 
```

**WARNING:** Note that generally speaking, running systemd init inside of a container is a bad idea™.
