#!/bin/sh

if [ x"$PASSWORD" = x ]
then
    echo "\$PASSWORD is required.";
    exit
fi

if [ x"$HOST_DOMAIN" = x ]
then
    echo "\$HOST_DOMAN is required.";
    exit
fi

if [ x"$ENCRYPT_METHOD" = x ]
then
    ENCRYPT_METHOD=chacha20-ietf-poly1305
fi

if [ x"$HOST_PORT" = x ]
then
    HOST_PORT=443
fi

if [ x"$LISTEN_PORT" = x ]
then
    LISTEN_PORT=1080
fi

echo "Password is: $PASSWORD"
echo "Encrypt method is: $ENCRYPT_METHOD"
echo "Host is: $HOST_DOMAIN":"$HOST_PORT"

/shadowsocks/sslocal -b "[::]:$LISTEN_PORT" -s "$HOST_DOMAIN:$HOST_PORT" -m "$ENCRYPT_METHOD" -k "$PASSWORD" --plugin /v2ray/v2ray-plugin_linux_amd64 --plugin-opts "tls;host=$HOST_DOMAIN"


