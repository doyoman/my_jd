#!/bin/sh

#手机狂欢城助力码导出

zlm1=`cat logs/jd_carnivalcity.log | grep '好友互助码' | tail -4`

zlm2=`cat logs/jd_carnivalcity.log | grep '好友互助码' | tail -4 | cut -d' ' -f 4 | sed 's/】/:/g' | cut -d':' -f 2 | tr '\n' '&' | sed 's/.$//'`

ml="/submit_activity_codes carnivalcity "

if [ $1 == 1 ];then
  echo "$zlm1"
  sleep 3s
elif [ $1 == 2 ];then
  echo "$ml$zlm2"
elif [ $1 == 3 ];then
  echo "$zlm1
  "
  echo "$ml$zlm2"
  sleep 3s
fi
