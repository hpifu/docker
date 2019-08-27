#!/bin/bash

lastip=$(cat whatismyip.txt)
ip=$(curl -s http://whatismyip.akamai.com/)

if [[ $lastip == $ip ]]; then
    exit 0
fi

echo $ip > whatismyip.txt

ssh -i /home/hatlonely/.ssh/hatlonely_id_rsa root@39.106.229.136 "sed -i 's/server.*:6000;/server $ip:6000;/g' /etc/nginx/conf.d/upstream.conf"
ssh -i /home/hatlonely/.ssh/hatlonely_id_rsa root@39.106.229.136 "nginx -s reload"
