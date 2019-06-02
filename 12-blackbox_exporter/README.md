# Run it
```
docker run \
    --name blackbox_exporter \
    --rm \
    -p 9115:9115 \
    -ti \
    -v $PWD/bb-config.yaml:/etc/blackbox_exporter/config.yml \
    prom/blackbox-exporter
```
