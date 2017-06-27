# start with a lightweight linux image
FROM alpine:3.6

# add apache users first for consistency
RUN adduser --system --group --no-create-home www-data

# update package listings
RUN apk update
RUN apk upgrade

# add necessary packages
RUN apk add bash curl php-apache2 php-cli php-json php-openssl 
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# configure container
RUN sed -i 's#^DocumentRoot ".*#DocumentRoot "/app"#g' /etc/apache2/httpd.conf
RUN sed -i 's#AllowOverride none#AllowOverride All#' /etc/apache2/httpd.conf
RUN sed -i 's#Listen 80#Listen 3000#' /etc/apache2/httpd.conf

# copy data
RUN mkdir /app
COPY www/* /app
RUN chown -R apache:apache /app

# open ports
EXPOSE 3000

# run the httpd server
CMD ["httpd", "-D", "FOREGROUND"]