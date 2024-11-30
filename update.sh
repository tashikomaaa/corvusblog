#!/bin/bash
dt=$(date '+%d/%m/%Y %H:%M:%S');
rsync -av --delete "/home/corvus/corvusblog/corvusblog-obsidian/posts" "/home/corvus/corvusblog/content/"
python3 images.py
git add .
git commit -m "update new version - $dt"
git push
