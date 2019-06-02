```bash
docker run \
    --name=prometheus \
    --rm \
    -p 9090:9090 \
    -ti \
    -v $PWD:/etc/prometheus prom/prometheus \
    --config.file=/etc/prometheus/prometheus-config.yaml
```
