# Run it
```bash
docker run \
    --rm \
    -p 3000:3000 \
    -ti \
    -v $PWD:/etc/grafana/provisioning \
    grafana/grafana
```
