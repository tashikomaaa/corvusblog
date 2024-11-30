#!/bin/bash

rsync -av --delete "/home/corvus/Documents/Obsidian Vault/posts" "/home/corvus/corvusblog/content/"
python3 images.py
git add .
git commit -m "update new version of the blog"
git push