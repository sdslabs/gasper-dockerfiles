#!/bin/sh

# short circuit if first arg is not 'mongod'
[ "$1" = "mongod" ] || exec "$@" || exit $?

: ${MONGO_INITDB_ROOT_USERNAME}
: ${MONGO_INITDB_ROOT_PASSWORD}

exec /usr/bin/weed mount -filer=127.0.0.1:8888 -dir=/data/db -filer.path=/mongodb/ &

sleep 5

# Database owned by mongodb
[ "$(stat -c %U /data/db)" = mongodb ] || chown -R mongodb /data/db

if ! [ -f /data/db/.passwords_set ]; then

    eval su -s /bin/sh -c "mongod" mongodb &

    RET=1
    while [ $RET -ne 0 ]; do
        sleep 3
        mongo admin --eval "help" >/dev/null 2>&1
        RET=$?
    done

    # set root user
    mongo admin --eval \
        "db.createUser({user: '$MONGO_INITDB_ROOT_USERNAME',
            pwd: '$MONGO_INITDB_ROOT_PASSWORD',
            roles: [{role: 'root', db: 'admin'}]
        });"

    echo "Used by mongo-alpine docker container." > /data/db/.passwords_set
    echo "DO NOT DELETE" >> /data/db/.passwords_set
    mongod --shutdown
fi

cmd="$@"

# Drop root privilege (no way back), exec provided command as user mongodb
#cmd=exec; for i; do cmd="$cmd '$i'"; done

exec su -s /bin/sh -c "$cmd -f /etc/mongod.conf" mongodb