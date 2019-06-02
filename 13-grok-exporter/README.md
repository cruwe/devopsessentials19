# Installation

Just run
```bash
mvn package
```
in this directory to install the parent `pom.xml` used for docker builds.

# Run It
```bash
docker run  \
    --name=grok_exporter \
    --rm \
    -p 9144:9144  \
    -ti \
    -v $PWD/grokexp-config.yaml:/grok_exporter/grok_exporter.yaml 
    -v /var/log:/grok_exporter/logs \
    nullregistry/grok_exporter:latest
```
