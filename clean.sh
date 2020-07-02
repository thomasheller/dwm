#!/bin/sh
git checkout build
git checkout config.def.h config.mk drw.c dwm.c dwm.1
rm -f movestack.c *.rej
git branch -D tmp || true
