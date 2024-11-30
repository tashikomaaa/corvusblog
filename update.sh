#!/bin/bash
file="./versions"
VERSION=$(car "$file")
rsync -av --delete "/home/corvus/Documents/Obsidian Vault/posts" "/home/corvus/corvusblog/content/"
python3 images.py
git add .
git commit -m "update new version of the blog - ${VERSION}"
git push
