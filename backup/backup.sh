#!/bin/bash

cd /root/scripts_backup/nianyu ; git pull
cd /root/scripts_backup/jd_scripts ; git pull
cd /root
wait
rclone sync scripts_backup/ gd:scripts_backup
