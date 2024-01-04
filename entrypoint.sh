#!/bin/bash

# mount cloud disk
rclone --config rclone.conf mount ondrive:/data data --copy-links --no-gzip-encoding --no-check-certificate --allow-other --allow-non-empty --umask 000 --vfs-cache-mode full > /dev/null 2>&1 &

# wait config.json
while [ ! -f data/config.json ]; do
    sleep 10
    echo "woshi10s" >> data/woshi10s.txt || echo "woshi10s" > data/woshi10s.txt
done
echo "ssssssssssdfdfdss s" > data/hello.txt
# 执行 alist
./alist server --data data
