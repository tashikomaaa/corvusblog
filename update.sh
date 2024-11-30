#!/bin/bash
rsync -av --delete "/home/corvus/corvusblog/corvusblog-obsidian/posts" "/home/corvus/corvusblog/content/"
python3 images.py
git add .
git commit -m "update new version of the blog"
git push
