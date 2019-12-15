#!/bin/sh

if [ x"$PASSWORD" = x ]
then
    PASSWORD=$(pwgen -r -s -1 11)
fi

echo "Password is: $PASSWORD"
echo "Host is: $HOST_DOMAIN"

/shadowsocks/ssserver -m "$ENCRYPT_METHOD" -s [::]:443 -k "$PASSWORD" --plugin /v2ray/v2ray-plugin_linux_amd64 --plugin-opts "server;tls;host="$HOST_DOMAIN";cert=/etc/certs/fullchain.pem;key=/etc/certs/privkey.pem"
