#!/usr/bin/env bash
while true
do


total=2048
# echo -e "total memory $total M"
time=$(date "+%Y-%m-%d %H:%M:%S")
echo $time >> monitor.log
used=$(free -m | awk '{if(NR==2){print $3}}')
echo "内存使用率为 `expr $used \* 100 \/ $total` %" >> monitor.log

cpu_total=100.0
cpu_free=$(top -b -n 2 | grep Cpu | tail -n 1 | awk '{print $8}')
cpu_used=$(echo "$cpu_total - $cpu_free"|bc)

echo "cpu使用率为 $cpu_used %" >> monitor.log
sleep 5
find -mtime +3 -type f -name "monitor.log" | xargs rm -f
done

