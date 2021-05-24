#!/bin/sh

#助力码导出
#sh zlm.sh log名 不需前后缀
log_name=jd_$1.log

zlm1=`cat logs/$log_name | grep '好友互助码' | tail -4`

zlm2=`cat logs/$log_name | grep '好友互助码' | tail -4 | cut -d' ' -f 4 | sed 's/】/:/g' | cut -d':' -f 2 | tr '\n' '&' | sed 's/.$//'`

ml="/submit_activity_codes $1 "

#if [ $2 == 1 ];then
#  echo "$zlm1"
#  sleep 3s
#elif [ $2 == 2 ];then
#  echo "$ml$zlm2"
#elif [ $2 == 3 ];then
#  echo "$zlm1
#  "
#  echo "$ml$zlm2"
#  sleep 3s
#fi

text="
$zlm1

$ml$zlm2
"

curl -s -o /dev/null -d "chat_id=$TG_USER_ID" --data-urlencode "$text" "https://api.telegram.org/bot$TG_BOT_TOKEN/sendMessage"

