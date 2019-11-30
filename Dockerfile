FROM archlinux:latest

# update database
RUN pacman -Syy --noconfirm
# install dependencies
RUN pacman -S --noconfirm shadowsocks-v2ray-plugin libsodium

VOLUME /ssserver

CMD /ssserver/ssserver -m chacha20-ietf-poly1305 -s [::]:443 -k "123456" --plugin v2ray-plugin --plugin-opts server;tls;host=us.sbw.so;cert=/ssserver/fullchain.pem;key=/ssserver/privkey.pem
