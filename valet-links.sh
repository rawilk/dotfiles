#!/bin/sh

# RITE
cd ~/dev/code/work/rite
valet link horizon.rite
valet link rite
valet link resi-rite
valet secure horizon.rite
valet secure rite
valet secure resi-rite

cd ~/dev/code/personal/randallwilk.dev
valet link
valet secure
