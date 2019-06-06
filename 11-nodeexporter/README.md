# Run it

```bash
docker run \
  --net="host" \
  --pid="host" \
  -ti \
  -v "/:/host:ro,rslave" \
  quay.io/prometheus/node-exporter \
  --path.rootfs /host
```
