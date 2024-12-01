#!/bin/bash
dt=$(date '+%d/%m/%Y %H:%M:%S');
python3 images.py
git add .
git commit -m "update new version - $dt"
git push
