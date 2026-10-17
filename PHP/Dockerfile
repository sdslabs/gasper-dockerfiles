FROM nginx:1.30.6-alpine3.24

RUN apk add --no-cache git curl composer \
    php85 php85-fpm php85-mysqli php85-openssl \
    php85-curl php85-zlib php85-xml php85-phar php85-intl php85-dom php85-xmlreader \
    php85-ctype php85-session php85-mbstring php85-gd php85-pdo php85-pdo_mysql \
    php85-pdo_sqlite php85-pdo_pgsql \
    && rm /etc/nginx/conf.d/default.conf

EXPOSE 80

STOPSIGNAL SIGTERM

CMD ["sh", "-c", "php-fpm85 -D && exec nginx -g 'daemon off;'"]
