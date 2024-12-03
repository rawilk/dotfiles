#!/bin/sh

# RITE
cd ~/dev/code/work/rite
herd link rite
herd link resi.rite
herd secure rite
herd secure resi.rite

cd ~/dev/code/personal/randallwilk.dev
herd link
herd secure
