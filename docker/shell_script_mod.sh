#!/bin/sh

rm -rf /scripts/my_scripts;mkdir /scripts/my_scripts;cd /scripts/my_scripts

git clone https://github.com/doyoman/my_jd.git

wait
cp /scripts/my_scripts/my_jd/scripts/*.* /scripts
cd /scripts/;pip3 install BeautifulSoup4

for jsname in $(find /scripts/my_scripts/my_jd/scripts -name "*.js"); do
        jsnamecron="$(cat $jsname | grep -oE "/?/?cron \".*\"" | cut -d\" -f2)"
        test -z "$jsnamecron" || echo "$jsnamecron node /scripts/${jsname} >> /scripts/logs/${jsname}.log 2>&1" >> /scripts/docker/merged_list_file.sh
done

echo "
#财富岛提现
0 0 * * *  node /scripts/cfdtx.js >> /scripts/logs/cfdtx.log 2>&1

#EUserv续费
20 13 8,16 * * /usr/bin/python3 /scripts/main.py >> /scripts/logs/main.log
" >> /scripts/docker/merged_list_file.sh
