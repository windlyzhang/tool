#创建一个叫SOCKS的链

iptables -t nat -N SOCKS

iptables -t nat -A SOCKS -d myss-server-ip/32 -j RETURN

iptables -t nat -A SOCKS -d 0.0.0.0/8 -j RETURN
iptables -t nat -A SOCKS -d 10.0.0.0/8 -j RETURN
iptables -t nat -A SOCKS -d 127.0.0.0/8 -j RETURN
iptables -t nat -A SOCKS -d 169.254.0.0/16 -j RETURN
iptables -t nat -A SOCKS -d 172.16.0.0/12 -j RETURN
iptables -t nat -A SOCKS -d 192.168.0.0/16 -j RETURN
iptables -t nat -A SOCKS -d 224.0.0.0/4 -j RETURN
iptables -t nat -A SOCKS -d 240.0.0.0/4 -j RETURN

iptables -t nat -A SOCKS -p tcp -j REDIRECT --to-ports 1080
iptables -t nat -A OUTPUT -p tcp -j SOCKS


librehat-shadowsocks-epel-6.repo
[librehat-shadowsocks]
name=Copr repo for shadowsocks owned by librehat
baseurl=https://copr-be.cloud.fedoraproject.org/results/librehat/shadowsocks/epel-6-$basearch/
type=rpm-md
skip_if_unavailable=True
gpgcheck=1
gpgkey=https://copr-be.cloud.fedoraproject.org/results/librehat/shadowsocks/pubkey.gpg
repo_gpgcheck=0
enabled=1
enabled_metadata=1


librehat-shadowsocks-epel-7.repo
[librehat-shadowsocks]
name=Copr repo for shadowsocks owned by librehat
baseurl=https://copr-be.cloud.fedoraproject.org/results/librehat/shadowsocks/epel-7-$basearch/
type=rpm-md
skip_if_unavailable=True
gpgcheck=1
gpgkey=https://copr-be.cloud.fedoraproject.org/results/librehat/shadowsocks/pubkey.gpg
repo_gpgcheck=0
enabled=1
enabled_metadata=1
