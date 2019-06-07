FROM debian:stretch-slim as build
RUN apt-get update && apt-get install zip curl -y

RUN curl  https://www.siberiancms.com/external/siberian_sae.install.zip -o /install.zip
RUN unzip /install.zip
RUN ls -lh

FROM php:7-apache
COPY --from=build /index.php /var/www/html/index.php
