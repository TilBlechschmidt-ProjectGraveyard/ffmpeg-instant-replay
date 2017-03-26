#!/bin/sh
sudo iptables -t raw -A PREROUTING -p udp -m length --length 28 -j DROP
