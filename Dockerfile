FROM debian:bookworm-slim
LABEL Maintainer="sbw <sbw@sbw.so>" \
      Description="Shadowsocks server with v2ray plugin"

RUN apt-get update && apt-get install -y ca-certificates openssl xz-utils wget && rm -rf /var/lib/apt/lists/*

ARG SHADOWSOCKS_VERSION=v1.20.2
ARG V2RAY_VERSION=v1.3.2

RUN wget https://github.com/shadowsocks/shadowsocks-rust/releases/download/$SHADOWSOCKS_VERSION/shadowsocks-$SHADOWSOCKS_VERSION.x86_64-unknown-linux-gnu.tar.xz \
    && wget https://github.com/shadowsocks/v2ray-plugin/releases/download/$V2RAY_VERSION/v2ray-plugin-linux-amd64-$V2RAY_VERSION.tar.gz \
    && tar xf v2ray-plugin-linux-amd64-$V2RAY_VERSION.tar.gz -C / \
    && tar xf shadowsocks-$SHADOWSOCKS_VERSION.x86_64-unknown-linux-gnu.tar.xz -C / \
    && rm *.tar.xz *.tar.gz

CMD ["/ssserver", "-c", "/shadowsocks.json"]
