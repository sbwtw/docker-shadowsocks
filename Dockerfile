FROM archlinux:latest

# install dependencies
RUN pacman -Sy --noconfirm shadowsocks-v2ray-plugin libsodium pwgen procps

# Add shadowsocks
ADD https://github.com/shadowsocks/shadowsocks-rust/releases/download/v1.7.2/shadowsocks-v1.7.2-stable.x86_64-unknown-linux-musl.tar.xz /shadowsocks

VOLUME /ssserver

RUN echo "/shadowsocks/ssserver -m chacha20-ietf-poly1305 -s [::]:443 -k \"$(pwgen -r -s -1 11)\" --plugin v2ray-plugin --plugin-opts \"server;tls;host=\"\$HOST_DOMAIN\";cert=/ssserver/fullchain.pem;key=/ssserver/privkey.pem\"" > /server.sh; chmod +x /server.sh
