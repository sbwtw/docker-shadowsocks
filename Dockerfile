FROM archlinux:latest

# install dependencies
RUN pacman -Sy --noconfirm shadowsocks-v2ray-plugin libsodium pwgen procps

# Add shadowsocks
ADD https://github.com/shadowsocks/shadowsocks-rust/releases/download/v1.7.2/shadowsocks-v1.7.2-stable.x86_64-unknown-linux-musl.tar.xz /shadowsocks
#ADD shadowsocks-v1.7.2-stable.x86_64-unknown-linux-musl.tar.xz /shadowsocks

# certs volume
VOLUME /etc/certs

RUN echo "/shadowsocks/ssserver -m \"\$ENCRYPT_METHOD\" -s [::]:443 -k \"$(pwgen -r -s -1 11)\" --plugin v2ray-plugin --plugin-opts \"server;tls;host=\"\$HOST_DOMAIN\";cert=/etc/certs/fullchain.pem;key=/etc/certs/privkey.pem\"" > /server.sh; chmod +x /server.sh; \
    echo "/shadowsocks/sslocal -m \"\$ENCRYPT_METHOD\" -b [::]:8081 -k \"\$PASSWORD\" --plugin v2ray-plugin --plugin-opts \"server;tls;host=\"\$HOST_DOMAIN\";cert=/etc/certs/fullchain.pem;key=/etc/certs/privkey.pem\"" > /client.sh; chmod +x /client.sh
