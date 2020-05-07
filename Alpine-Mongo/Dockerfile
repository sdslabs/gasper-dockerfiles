FROM alpine:3.11.6

ENV MONGO_INITDB_ROOT_USERNAME "alphadose"
ENV MONGO_INITDB_ROOT_PASSWORD "alphadose"

RUN echo 'http://dl-cdn.alpinelinux.org/alpine/v3.6/main' >> /etc/apk/repositories
RUN echo 'http://dl-cdn.alpinelinux.org/alpine/v3.6/community' >> /etc/apk/repositories
RUN apk update
RUN apk add --no-cache mongodb
RUN mongo --version

COPY entrypoint.sh /entrypoint.sh
COPY mongod.conf /etc/mongod.conf

VOLUME /data/db

EXPOSE 27017

ENTRYPOINT ["/entrypoint.sh"]
CMD ["mongod", "--bind_ip", "0.0.0.0"]
