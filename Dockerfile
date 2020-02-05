FROM pistacks/alpine AS builder
ADD https://github.com/lukasmalkmus/rpi_exporter/releases/download/v0.6.0/rpi_exporter-0.6.0.linux-armv7.tar.gz /rpi_exporter-0.6.0.linux-armv7.tar.gz
RUN tar -xf rpi_exporter-0.6.0.linux-armv7.tar.gz && mv rpi_exporter-0.6.0.linux-armv7/rpi_exporter /bin/rpi_exporter

FROM scratch
COPY --from=builder /bin/rpi_exporter /bin/rpi_exporter
CMD ["/bin/rpi_exporter"]
