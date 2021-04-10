#!/usr/bin/bash
for IP in 23.26.110.2 161.98.255.1 206.223.191.1 37.60.63.2 27.113.239.2 42.97.255.1 132.247.255.2 14.192.95.1 37.16.63.1 49.213.31.2 41.67.128.1 27.97.1.2
do
    ip a add $IP/30 dev eth0
done
 
tc qdisc add dev eth0 handle 1: root htb
 
tc class add dev eth0 parent 1: classid 1:1 htb rate 1000Mbps
 
tc class add dev eth0 parent 1:1 classid 1:11 htb rate 100Mbps
 
tc qdisc add dev eth0 parent 1:11 handle 10: netem delay 700ms 100ms 25%
 
tc filter add dev eth0 protocol ip prio 1 u32 match ip src 27.97.1.2 flowid 1:11
 
tc class add dev eth0 parent 1:1 classid 1:12 htb rate 100Mbps
 
tc qdisc add dev eth0 parent 1:12 handle 20: netem delay 50ms  45ms 25%
 
tc filter add dev eth0 protocol ip prio 1 u32 match ip src 0.0.0.0/0 flowid 1:12
