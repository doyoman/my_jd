#!/bin/bash

echo "--------------`date`------------------"
cd /root/scripts_backup/my_jd ; git pull
cd /root/scripts_backup/nianyu ; git pull
cd /root/scripts_backup/jd_scripts ; git pull
cd /root
wait
echo "备份到Google云盘进行中..."
rclone sync scripts_backup/ gd:scripts_backup
echo "备份到Google云盘完成！"
wait
echo "备份到Onedrive进行中..."
rclone sync scripts_backup/ od:scripts_backup
echo "备份到Onedrive完成！"
echo "-----------------------------------------"
