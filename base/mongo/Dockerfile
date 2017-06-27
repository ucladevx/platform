# start with a lightweight linux image
FROM alpine:3.6

# add redis user first for consistency
RUN adduser --system --group --no-create-home mongodb

# update package listings
RUN apk update
RUN apk upgrade

# add necessary packages
RUN apk add bash curl redis

# persist db data
RUN mkdir -p /data/db
VOLUME /data/db

# configure database container for security
RUN rm -rf /usr/bin/mongoperf
RUN chown -R mongodb:mongodb /data/db

# open ports
EXPOSE 27017 28017

# run the "mongod" command as the "mongodb" user (drop root privilege)
CMD ["su", "-s", "/bin/sh", "-c", "mongod", "mongodb"]