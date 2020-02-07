FROM alpine:latest
LABEL Maintainer="sbw <sbw@sbw.so>" \
      Description="Shadowsocks server with v2ray plugin"

# change mirror
#RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories

RUN apk --update add \
        libsodium \
    && rm -rf /var/cache/apk/*

# Add shadowsocks & v2ray
RUN wget -qO- https://github.com/shadowsocks/shadowsocks-rust/releases/download/v1.8.8/shadowsocks-v1.8.8-stable.x86_64-unknown-linux-musl.tar.xz | tar xvz - -C /usr/bin \
    && wget -qO- https://github.com/shadowsocks/v2ray-plugin/releases/download/v1.3.0/v2ray-plugin-linux-amd64-v1.3.0.tar.gz | tar xvz - -C /usr/bin
#ADD shadowsocks-v1.8.8-stable.x86_64-unknown-linux-musl.tar.xz /usr/bin
#ADD v2ray-plugin-linux-amd64-v1.3.0.tar.gz /usr/bin

CMD ["ssserver", "-U", "-c", "/shadowsocks.json"]
