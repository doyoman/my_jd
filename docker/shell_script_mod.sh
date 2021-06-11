#!/bin/sh

rm -rf /scripts/my_scripts;mkdir /scripts/my_scripts;cd /scripts/my_scripts;mkdir /scripts/my_scripts/own

git clone https://github.com/doyoman/my_jd.git
git clone https://github.com/longzhuzhu/nianyu.git
wait
cp /scripts/my_scripts/my_jd/scripts/*.* /scripts
cp /scripts/my_scripts/nianyu/qx/*.* /scripts
cp /scripts/my_scripts/my_jd/scripts/*.* /scripts/my_scripts/own
cp /scripts/my_scripts/nianyu/qx/*.* /scripts/my_scripts/own
cd /scripts/;pip3 install BeautifulSoup4

for jsname in $(find /scripts/my_scripts/own/ -name "*.js"); do
        jsnamecron="$(cat $jsname | grep -oE "/?/?cron \".*\"" | cut -d\" -f2)"
	jsname="$(echo $jsname | cut -d/ -f5 | cut -d. -f1)"
        test -z "$jsnamecron" || test $jsname = "long_super_redrain" || echo "$jsnamecron node /scripts/${jsname}.js >> /scripts/logs/${jsname}.log 2>&1" >> /scripts/docker/merged_list_file.sh
done

echo "
#财富岛提现
0 0 * * *  node /scripts/cfdtx.js >> /scripts/logs/cfdtx.log 2>&1

#EUserv续费
20 13 8,16 * * /usr/bin/python3 /scripts/main.py >> /scripts/logs/main.log
" >> /scripts/docker/merged_list_file.sh
