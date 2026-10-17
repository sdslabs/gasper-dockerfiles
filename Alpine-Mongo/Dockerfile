FROM mongo:8.3.13-noble

ENV MONGO_INITDB_ROOT_USERNAME "alphadose"
ENV MONGO_INITDB_ROOT_PASSWORD "alphadose"

COPY mongod.conf /etc/mongod.conf

VOLUME /data/db

EXPOSE 27017

CMD ["mongod", "--config", "/etc/mongod.conf", "--bind_ip", "0.0.0.0"]
