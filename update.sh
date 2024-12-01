#!/bin/bash
dt=$(date '+%d/%m/%Y %H:%M:%S');
python3 images.py
git add . > /dev/null 2>&1
git commit -m "update new version - $dt" > /dev/null 2>&1
git push > /dev/null 2>&1
