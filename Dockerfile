# docker_mpd
FROM alpine:edge
ARG VERSION="4.1.2-r0"
LABEL version=${VERSION}
LABEL maintainers="[John Sing Dao Siu](https://github.com/J-Siu)"
LABEL name="transmission-daemon"
LABEL usage="https://github.com/J-Siu/docker_transmission/blob/master/README.md"
LABEL description="Docker - transmission with UID/GID handling"

COPY docker-compose.yml env start.sh /
RUN apk --no-cache add \
transmission-daemon=${VERSION} \
	ca-certificates \
	ca-certificates-bundle \
	tzdata \
	&& mkdir -p /transmission \
	&& chmod +x /start.sh

ENTRYPOINT ["/start.sh"]
