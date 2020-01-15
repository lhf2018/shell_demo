#!/usr/bin/env bash
while true
do


total=2048
# echo -e "total memory $total M"
time=$(date "+%Y-%m-%d %H:%M:%S")
echo $time >> monitor.log
used=$(free -m | awk '{if(NR==2){print $3}}')
echo "内存使用率为 `expr $used \* 100 \/ $total` %" >> monitor.log

cpu_used=$(top -b| head -n 3 | awk  '{if(NR==3){print $2}}')

echo "cpu使用率为 $cpu_used %" >> monitor.log
sleep 5
find -mtime +3 -type f -name "monitor.log" | xargs rm -f
done
