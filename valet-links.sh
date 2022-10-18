#!/bin/sh

# RITE
cd ~/dev/code/work/rite-v3
valet link horizon.rite
valet link rite-v3
valet link resi-rite
valet secure horizon.rite
valet secure rite-v3
valet secure resi-rite

cd ~/dev/code/personal/randallwilk.dev
valet link
valet secure