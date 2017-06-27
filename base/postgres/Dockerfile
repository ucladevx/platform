# start with a lightweight linux image
FROM alpine:3.6

# add redis user first for consistency
# RUN adduser --system --group --no-create-home postgres

# update package listings
RUN apk update
RUN apk upgrade

# add necessary packages
RUN apk add bash curl postgresql

# persist db data
RUN mkdir -p /data/db
ENV PGDATA /data/db
VOLUME /data/db

# configure database container for security
RUN chown -R postgres:postgres /data/db

# open ports
EXPOSE 5432

# run the "mongod" command as the "mongodb" user (drop root privilege)
CMD ["postgres"]