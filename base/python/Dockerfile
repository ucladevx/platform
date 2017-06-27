# start with a lightweight linux image
FROM alpine:3.6

# update package listings
RUN apk update
RUN apk upgrade

# add necessary packages
RUN apk add bash curl python

# create working directory
RUN mkdir /app

# copy the requirements.txt to app location and install
COPY requirements.txt /app
RUN cd /app && pip install

# set the working directory and copy source files
WORKDIR /app
COPY . /app

# open a port and start the server
EXPOSE 3000
CMD ["python", "index.py"]