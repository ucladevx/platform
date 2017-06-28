# start with a lightweight linux image
FROM alpine:3.6

# add necessary packages
RUN apk update && \
    apk upgrade && \
    apk add bash 'nodejs-npm<=6.11' && \
    rm -rf /var/cache/apk/*

# create working directory
RUN mkdir /app

# copy the package.json and shinkwrap file to app location
COPY package.json /app
COPY npm-shrinkwrap.json /app
RUN cd /app && npm install

# set the working directory and copy source files
COPY . /app/
WORKDIR /app

# open a port and start the server
EXPOSE 3000
CMD ["npm", "start"]