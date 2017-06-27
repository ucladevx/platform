# start with a lightweight linux image
FROM alpine:3.6

# update package listings
RUN apk update
RUN apk upgrade

# add necessary packages
RUN apk add bash curl go glide

# setup go env variables
ENV GOPATH /app
ENV PATH $GOPATH/bin:$PATH

# create directory structure and copy the glide files
RUN mkdir -p /app/bin && \
    mkdir -p /app/src/app && \
    mkdir -p /app/pkg
COPY src/app/glide.yaml /app/src/app/
COPY src/app/glide.lock /app/src/app/

# now install
RUN glide install

# copy remaining source files
COPY src/app/* /app/src/app

# build the app
RUN go build /app/src/app -o /app/bin/app

# set the working directory
WORKDIR /app

# open a port and start the server
EXPOSE 3000
CMD ["/app/bin/app"]