IF=enp8s0

ip link set up dev ${IF}
ip addr add 10.0.0.1/24 broadcast 10.0.0.255 dev ${IF}
ip route add 239.0.0.0/8 dev ${IF}
dnsmasq -d
