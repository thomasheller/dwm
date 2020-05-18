#!/bin/bash
set -ex

git checkout master
git checkout -b tmp
git merge --no-edit config
git merge --no-edit build
# patch <dwm-attachbottom-6.2.diff
patch <dwm-warp-6.2.diff
# patch <dwm-zoomswap-6.2.diff
patch <dwm-remove-iscol-fix.diff
patch <dwm-movestack-6.1.diff
make
git checkout build
git branch -D tmp

