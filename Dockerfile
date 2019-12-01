FROM archlinux:latest

# update database
RUN pacman -Syy --noconfirm
# install dependencies
RUN pacman -S --noconfirm shadowsocks-v2ray-plugin libsodium pwgen procps

VOLUME /ssserver

RUN echo "/ssserver/ssserver -m chacha20-ietf-poly1305 -s [::]:443 -k \"$(pwgen -r -s -1 11)\" --plugin v2ray-plugin --plugin-opts server;tls;host=\"\$HOST_DOMAIN\";cert=/ssserver/fullchain.pem;key=/ssserver/privkey.pem" > /server.sh; chmod +x /server.sh
