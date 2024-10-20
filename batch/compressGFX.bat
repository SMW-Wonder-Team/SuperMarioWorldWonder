@echo off
setlocal


set inputDir=gfx\wonder
set outputDir=gfx\wonder_comp

set offset=0
set format=2
set format2=1000

if not exist "%outputDir%" mkdir "%outputDir%"

for %%f in ("%inputDir%\*.bin") do (
    echo Processing %%~nxf
    :: Run recomp.exe with input file, output path, offset, and formats
    recomp.exe "%%f" "%outputDir%\%%~nxf" %offset% %format% %format2%
)

echo Compressed GFX Files
pause
