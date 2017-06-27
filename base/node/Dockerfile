# start with a lightweight linux image
FROM alpine:3.6

# update package listings
RUN apk update
RUN apk upgrade

# add necessary packages
RUN apk add bash make gcc g++ 'nodejs<=6.10.3'

# create working directory
RUN mkdir /app

# copy the package.json and shinkwrap file to app location
COPY package.json /app
COPY npm-shrinkwrap.json /app
RUN cd /app && npm install

# set the working directory and copy source files
WORKDIR /app
COPY .. /app

# open a port and start the server
EXPOSE 3000
CMD ["npm", "start"]