#!/bin/bash
echo Assembling...
rm -f smw.smc
./asar smw.asm smw.smc || exit
echo Assembly complete!

exit 0 # reset exit code from last cmp
