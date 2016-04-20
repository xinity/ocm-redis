#
# Redis Dockerfile
#

# Pull base image.
FROM python:2-alpine

RUN apk --update add wget make gcc supervisor musl-dev redis

# create log directories
RUN mkdir -p /var/log/redis /var/redis

# tweak redis configuration
COPY conf/redis.conf /etc/redis.conf
# Define mountable directories.
VOLUME ["/data"]

# Define working directory.
WORKDIR /data

# Expose ports.
EXPOSE 6379

# Define default command.
CMD ["/bin/sh"]
ENTRYPOINT ["/usr/local/bin/redis-server","/etc/redis.conf"]
