# start with a lightweight linux image
FROM alpine:3.6

# update package listings
RUN apk update
RUN apk upgrade

# add necessary packages
RUN apk add bash curl nginx

# create working directory
RUN mkdir /app

# copy data to app location
COPY static /app
COPY nginx.conf /etc/nginx

# set the working directory and copy source files
WORKDIR /app

# open a port and start the server
EXPOSE 3000
CMD ["nginx", "-g", "daemon off;"]