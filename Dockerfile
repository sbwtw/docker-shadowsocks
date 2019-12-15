FROM alpine:latest
LABEL Maintainer="sbw <sbw@sbw.so>" \
      Description="Shadowsocks with v2ray plugin"

RUN apk --update add \
        libsodium \
        pwgen \
    && rm -rf /var/cache/apk/*

# Add shadowsocks & v2ray
ADD https://github.com/shadowsocks/shadowsocks-rust/releases/download/v1.7.2/shadowsocks-v1.7.2-stable.x86_64-unknown-linux-musl.tar.xz /shadowsocks
ADD https://github.com/shadowsocks/v2ray-plugin/releases/download/v1.2.0/v2ray-plugin-linux-amd64-v1.2.0.tar.gz /v2ray
#ADD shadowsocks-v1.7.2-stable.x86_64-unknown-linux-musl.tar.xz /shadowsocks
#ADD v2ray-plugin-linux-amd64-v1.2.0.tar.gz /v2ray


# certs volume
VOLUME /etc/certs

COPY server.sh /server.sh
COPY client.sh /client.sh
