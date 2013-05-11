# IP Tables / Linux Kernel
## IP NATing

## Enable IP Masquerading

    # echo 1 > /proc/sys/net/ipv4/ip_forward
    # iptables -A FORWARD -i wlan0 -o em1 -m state --state ESTABLISHED,RELATED -j ACCEPT
    # iptables -A FORWARD -i wlan0 -o em1 -j ACCEPT
    # iptables -t nat -A POSTROUTING -o em1 -j MASQUERADE
    # iptables -L
