@echo off
echo Assembling...
echo. 2>smw.smc
asar -wno1009 -wno1018 --fix-checksum=off --symbols=nocash --define _VER=!__VER_U smw.asm SMW_U.smc
del smw.smc
echo Assembly complete!
del smw.smc
pause