#!/bin/bash

echo "--------------`date`------------------"
cd /root/scripts_backup/my_jd ; git pull
cd /root/scripts_backup/nianyu ; git pull
cd /root/scripts_backup/jd_scripts ; git pull
cd /root
wait
rclone sync scripts_backup/ gd:scripts_backup
wait
rclone sync scripts_backup/ od:scripts_backup
echo "-----------------------------------------"
