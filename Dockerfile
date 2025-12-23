# docker_mpd
FROM alpine:edge

LABEL version="4.0.6-r5"
LABEL maintainers="[John Sing Dao Siu](https://github.com/J-Siu)"
LABEL name="transmission-daemon"
LABEL usage="https://github.com/J-Siu/docker_transmission/blob/master/README.md"
LABEL description="Docker - transmission with UID/GID handling"

COPY docker-compose.yml env start.sh /
RUN apk --no-cache add \
	transmission-daemon=4.0.6-r5 \
	ca-certificates \
	ca-certificates-bundle \
	tzdata \
	&& mkdir -p /transmission \
	&& chmod +x /start.sh

ENTRYPOINT ["/start.sh"]
