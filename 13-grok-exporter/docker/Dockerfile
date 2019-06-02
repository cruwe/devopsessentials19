FROM gcr.io/distroless/base
ARG VERSION=0.2.7
ARG OS_FAMILY=linux
ARG MACHINE_ARCH=amd64

COPY grok_exporter-$VERSION.$OS_FAMILY-$MACHINE_ARCH /grok_exporter

ENTRYPOINT ["/grok_exporter/grok_exporter"]
CMD ["-config", "/grok_exporter/grok_exporter.yaml"]
