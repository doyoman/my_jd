#/bin/env bash

Time=`date '+%Y年%m月%d日 %H:%M:%S'`

curl https://api.day.app/5xvZ3xBVpuMizhVg4R65za/定时更新开始/"`echo $Time`"脚本库更新开始!?sound=calypso

echo "---------当前时间为`date '+%Y%m%d %H:%M:%S'`-------"

cd /

if [ -d "/scripts" ];then
	cd /scripts
	git fetch --all
	git reset --hard origin/master
else
	git clone -b master https://gitee.com/lxk0301/jd_scripts.git /scripts
fi

if [ -d "/scripts/logs" ];then
	sleep 1s
	echo "logs目录已存在！"
else
	mkdir /scripts/logs
fi

sleep 2s

cp /root/sendNotify.js /scripts

cp /root/jdCookie.js /scripts

cp /root/jdJxncTokens.js /scripts

cd /scripts


npm install

sleep 2s

cd docker

tab="42 0-23/12 * * * bash /root/jdd >> /root/log 2>&1"

w=`sed -n '$p' crontab_list.sh`

if [[ $w != $tab ]];then
	sed -i '$a 42 */12 * * * bash /root/jdd >> /root/log 2>&1' crontab_list.sh
fi

sleep 2s

crontab crontab_list.sh

crontab -l

echo "-------------`date '+%Y-%m-%d %H:%M:%S'`----------"

echo "更新完成！"

curl https://api.day.app/5xvZ3xBVpuMizhVg4R65za/定时更新完成/"`echo $Time`"脚本库更新完毕!?sound=calypso
