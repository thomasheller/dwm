#!/bin/bash
set -ex

git branch | grep -Fw config || git fetch origin config
git checkout master
git branch | grep -Fw tmp && git branch -D tmp
git checkout -b tmp
git merge --no-edit config
git merge --no-edit build
# patch <dwm-scratchpad-6.2.diff
# patch <dwm-attachbottom-6.2.diff
patch <dwm-warp-6.2.diff
# patch <dwm-zoomswap-6.2.diff
patch <dwm-remove-iscol-fix.diff
patch <dwm-movestack-6.1.diff
patch <dwm-swallow-20200522-7accbcf.diff
patch <dwm-restartsig-20180523-6.2.diff
patch <dwm-pertag-6.2.diff
patch <dwm-bartabgroups-6.2.diff
patch -F3 <dwm-extrabar-6.2.diff
make
git checkout build
git branch -D tmp

