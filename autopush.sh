#!/bin/bash
LOGFILE=~/Documents/Claude/Projects/HR/daily-routine/autopush.log

echo "[$(date '+%Y-%m-%d %H:%M:%S')] 시작" >> "$LOGFILE"

cd ~/Documents/Claude/Projects/HR/daily-routine
git add .

if git commit -m "daily report $(date +%Y%m%d)" >> "$LOGFILE" 2>&1; then
    git push origin master >> "$LOGFILE" 2>&1
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] 완료 (push 성공)" >> "$LOGFILE"
else
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] 완료 (커밋할 변경사항 없음)" >> "$LOGFILE"
fi
