#!/bin/bash
#sysctl optimize kernel
echo "kernel.core_uses_pid = 1
kernel.msgmax = 65536
kernel.msgmnb = 65536
kernel.shmall = 134217728
kernel.shmmax = 68719476736
kernel.sysrq = 0
net.core.netdev_max_backlog = 30000
net.core.rmem_max = 16777216
#net.core.somaxconn = 262144
net.core.wmem_max = 16777216
net.ipv4.conf.default.accept_source_route = 0
net.ipv4.conf.default.rp_filter = 1
net.ipv4.ip_forward = 1
net.ipv4.ip_local_port_range = 10000 65000
net.ipv4.tcp_fin_timeout = 10
net.ipv4.tcp_keepalive_time = 1200
net.ipv4.tcp_max_orphans = 262144
net.ipv4.tcp_max_syn_backlog = 262144
net.ipv4.tcp_max_tw_buckets = 5000
net.ipv4.tcp_no_metrics_save = 1
net.ipv4.tcp_rmem = 4096 87380 16777216
net.ipv4.tcp_synack_retries = 2
net.ipv4.tcp_syncookies = 1
net.ipv4.tcp_syn_retries = 2
net.ipv4.tcp_tw_recycle = 1
net.ipv4.tcp_tw_reuse = 1
net.ipv4.tcp_wmem = 4096 65536 16777216
vm.swappiness = 6
fs.file-max=65535" > /etc/sysctl.conf
echo "optimizited kernel configure was done!"
/sbin/sysctl -p /etc/sysctl.conf
/sbin/sysctl -w net.ipv4.route.flush=1
echo "finish all init,just work!"

