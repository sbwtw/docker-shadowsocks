FROM debian:bullseye-slim
LABEL Maintainer="sbw <sbw@sbw.so>" \
      Description="Shadowsocks server with v2ray plugin"

RUN apt-get update && apt-get install -y ca-certificates openssl xz-utils wget && rm -rf /var/lib/apt/lists/*

RUN wget https://github.com/shadowsocks/shadowsocks-rust/releases/download/v1.14.3/shadowsocks-v1.14.3.x86_64-unknown-linux-gnu.tar.xz \
    && wget https://github.com/shadowsocks/v2ray-plugin/releases/download/v1.3.2/v2ray-plugin-linux-amd64-v1.3.2.tar.gz \
    && tar xf v2ray-plugin-linux-amd64-v1.3.2.tar.gz -C / \
    && tar xf shadowsocks-v1.14.3.x86_64-unknown-linux-gnu.tar.xz -C / \
    && rm *.tar.xz *.tar.gz

CMD ["/ssserver", "-c", "/shadowsocks.json"]
