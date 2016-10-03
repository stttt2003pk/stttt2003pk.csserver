#!/bin/bash
# configure open file limit
cat >/etc/security/limits.conf<<eof
* soft nproc 65535
* hard nproc 65535
* soft nofile 65535
* hard nofile 65535
eof
echo ulimit -HSn 65536 >> /etc/rc.local
echo ulimit -HSn 65536 >> /root/.bash_profile
ulimit -HSn 65536
