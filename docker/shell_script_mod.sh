#!/bin/sh

rm -rf /scripts/my_scripts;mkdir /scripts/my_scripts;cd /scripts/my_scripts

git clone https://github.com/doyoman/my_jd.git

#wget https://github.com/nianyuguai/longzhuzhu/raw/main/qx/jd_super_redrain.js
#wget https://github.com/nianyuguai/longzhuzhu/raw/main/qx/jd_half_redrain.js

wait
#cp /scripts/my_scripts/*.js /scripts
cp /scripts/my_scripts/my_jd/scripts/*.* /scripts

cd /scripts/;pip3 install BeautifulSoup4

echo "
#财富岛提现
0 0 * * *  node /scripts/cfdtx.js >> /scripts/logs/cfdtx.log 2>&1

#零点红包雨防漏
5 0 * * * node /scripts/jd_super_redrain.js >> /scripts/logs/redrain.log 2>&1

#整点红包雨
0 0-23/1 * * * node /scripts/jd_super_redrain.js >> /scripts/logs/redrain.log 2>&1

#618主会场红包雨
1 20 1-18 6 * node /scripts/long_hby_lottery.js >> /scripts/logs/redrain.log 2>&1

#半点红包雨
30 16-23/1 * * * node /scripts/jd_half_redrain.js >> /scripts/logs/redrain.log 2>&1

#EUserv续费
20 13 8,16 * * /usr/bin/python3 /scripts/main.py >> /scripts/logs/main.log

#京享值PK
15 8,13,18 17-31 5 * node /scripts/adolf_pk.js >> /scripts/logs/adolf_pk.log
" >> /scripts/docker/merged_list_file.sh
