# start with a lightweight linux image
FROM alpine:3.6

# add redis user first for consistency
RUN adduser --system --group --no-create-home redis

# update package listings
RUN apk update
RUN apk upgrade

# add necessary packages
RUN apk add bash curl redis

# persist db data
RUN mkdir -p /data/db
VOLUME /data/db
WORKDIR /data/db

# copy configuration
RUN mkdir /etc/redis
COPY redis.conf /etc/redis

# configure database container for security
RUN chown -R redis:redis /data/db
RUN chmod 770 /data/db

# open ports
EXPOSE 6379

# run the redis server
CMD ["redis-server"]