#!/bin/bash
echo > reno /proc/sys/net/ipv4/tcp_congestion_control
cat /proc/sys/net/ipv4/tcp_congestion_control
ethtool -K ens4f3 gro off
ethtool -K ens4f3 lro off
ethtool -K ens4f3 gso off
ethtool -K ens4f3 tso off
sysctl net.ipv4.tcp_congestion_control=reno
sysctl net.ipv4.tcp_sack=0
ip route change 172.16.0.0/24 dev ens4f3  proto kernel  scope link  src 172.16.0.1  metric 100  initcwnd 1
ethtool -k ens4f3 | grep generic-receive-offload:
ethtool -k ens4f3 | grep large-receive-offload:
ethtool -k ens4f3 | grep tcp-segmentation-offload:
ethtool -k ens4f3 | grep generic-segmentation-offload:
