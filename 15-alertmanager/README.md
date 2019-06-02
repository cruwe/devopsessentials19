# Run it
```bash
docker run \
  --name prometheus_inspec_exporter  \
  --rm \
  -p 9207:9207 \
  -ti \
  -v $PWD:/usr/local/etc/inspec-reports \
  -v $PWD:/usr/local/etc/inspec-results \
  geekdave/prometheus_inspec_exporter
```
