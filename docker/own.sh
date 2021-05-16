#!/bin/sh

cd /scripts/my_scripts/longzhuzhu && git pull

wait;cp /scripts/my_scripts/longzhuzhu/qx/*.js /scripts

cd /scripts && cp /scripts/my_scripts/*.* /scripts

pip3 install BeautifulSoup4

echo "
#财富岛提现
0 0 * * *  node /scripts/cfdtx.js >> /scripts/logs/cfdtx.log 2>&1

#零点红包雨防漏
5 0 * * * node /scripts/jd_super_redrain.js >> /scripts/logs/redrain.log 2>&1

#整点红包雨
0 0-23/1 * * * node /scripts/jd_super_redrain.js >> /scripts/logs/redrain.log 2>&1

#半点红包雨
30 16-23/1 * * * node /scripts/jd_half_redrain.js >> /scripts/logs/redrain.log 2>&1

#EUserv续费
20 13 8,16 * * /usr/bin/python3 /scripts/main.py >> /scripts/logs/main.log
" >> /scripts/docker/merged_list_file.sh
