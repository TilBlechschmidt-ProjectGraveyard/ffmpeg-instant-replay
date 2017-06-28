#!/bin/sh

echo 1 > /proc/sys/net/ipv4/ip_forward

# Flush all those previous rules
iptables -t raw -F
iptables -t mangle -F

# Drop all packages that don't contain anything
iptables -t raw -A PREROUTING -p udp -m length --length 28 -j DROP

# Redirect the data from localhost:5004 (depending on source) to a different port
function redirectTo {
    # iptables -t mangle -R PREROUTING 1 -s $1 -p udp -j TEE --gateway $2

    # Redirect to a different port
    iptables -t nat -A PREROUTING -p udp --dport 5004 -j REDIRECT --to-port 5005

    # Rewrite ethernet header to target the destination IP
    iptables -t mangle -A PREROUTING -s ${1} -j TEE --gateway ${2}
    # Rewrite the destination address so that it can be received

    # iptables -t nat -A PREROUTING -p udp --dport 5004 -j NETMAP --to ${2}
    iptables -t nat -A PREROUTING -p udp --dport 5004 -j DNAT --to ${2}:5005

    
}

redirectTo 10.0.0.60 10.0.0.38
