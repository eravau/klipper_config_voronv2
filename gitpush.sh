#!/bin/bash
today=`date +%Y-%m-%d.%H:%M:%S`
backupdir="../backup/"

cd ~/klipper_config

git pull

for file in *[0-9].cfg; do
        if [ -f "$file" ] # does file exist?
        then
		   mv $file $backupdir$file
        fi
done

git add .
git commit -m "backup."$today
git push -u origin master --force
