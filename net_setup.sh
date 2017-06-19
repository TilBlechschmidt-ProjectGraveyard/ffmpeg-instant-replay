IF=enp8s0
ip link set up dev $IF
ip addr add 192.168.111.49/24 dev $IF
dnsmasq -d
