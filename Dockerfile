# docker_mpd
FROM alpine:edge

LABEL version="4.0.6-r0"
LABEL maintainers="[John Sing Dao Siu](https://github.com/J-Siu)"
LABEL name="transmission"
LABEL usage="https://github.com/J-Siu/docker_transmission/blob/master/README.md"
LABEL description="Docker - transmission with UID/GID handling"

RUN apk --no-cache add ca-certificates ca-certificates-bundle tzdata
RUN apk --no-cache add transmission-daemon=4.0.6-r0 \
&& mkdir -p /transmission

COPY docker-compose.yml env start.sh /
RUN chmod +x /start.sh

ENTRYPOINT ["/start.sh"]