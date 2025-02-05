@echo off

:Begin
set hackname=Wonder_ScratchPad.smc
set header=$200

setlocal EnableDelayedExpansion
if exist Test.asm del Test.asm
goto :ExAll

set Input=0x%Input%
set hackname=Wonder_ScratchPad.smc
set ID=Wonder_
goto :Start


:Start
echo Extracting level %Input% from %hackname%...
set LvlNumber=%Input%
set LvlNumber2=$%Input:~2,5%
set Loopcounter=1
goto :Check

:ExAll
set hackname=Wonder_ScratchPad.smc
set ID=Wonder_
set LvlNumber=0
set LvlNumber2=0


:Start2
echo Extracting all levels from %hackname%. This will take a while...
set Loopcounter=512

:Check
echo:lorom>> Test.asm
echo:^^!hackname = %hackname% >> Test.asm
echo:org $008000>> Test.asm
echo:if readfile1("^!hackname", snestopc($05D8F5)+%header%) ^^!= $22 >> Test.asm
echo:print "Note: LM ASM Hijack 'Sprite Bank Pointer' is missing. No level sprite data will be extracted." >> Test.asm
echo:endif>> Test.asm
echo:if readfile1("^!hackname", snestopc($0583AD)+%header%) ^^!= $22 >> Test.asm
echo:print "Note: LM ASM Hijack 'Level Exanimations' is missing. No ExAnimation data will be extracted." >> Test.asm
echo:endif>> Test.asm

asar "Test.asm" Temp.bin

if exist Temp.bin del Temp.bin

:Loop1
call :ConvertDecToHex %LvlNumber% HexValue
set HexValue=%HexValue%
set LeadZeros=
if %LvlNumber% lss 256 set LeadZeros=0

if %LvlNumber% lss 16 set LeadZeros=00

echo:Lvl Num: %LeadZeros%%HexValue%

echo:lorom> Test.asm
echo:org $008000>> Test.asm
echo:^^!LvlNum = %LvlNumber2% >> Test.asm
echo:^^!hackname = %hackname% >> Test.asm
echo:if readfile1("^!hackname", snestopc($05E002+((^^!LvlNum^&$1FF)*3))+%header%) ^>= $10 >> Test.asm
echo:^^!offset = (readfile3("^!hackname", snestopc($05E000+((^^!LvlNum^&$1FF)*3))+%header%)) >> Test.asm
echo:^^!offset2 = ((readfile2("^!hackname", snestopc(^^!offset)+%header%-$4)+^^!offset+$1))^|$008000 >> Test.asm
echo:^^!offset3 #= snestopc(^^!offset)+%header% >> Test.asm
echo:^^!offset4 #= snestopc(^^!offset2)+%header% >> Test.asm
echo:incbin "%hackname%":(^^!offset3)-(^^!offset4) >> Test.asm
echo:print "Extracted 0x", hex(^^!offset2-^^!offset)," bytes from this level's Layer 1 Data at $",hex(^^!offset) >> Test.asm
echo:else>> Test.asm
echo:print "This level uses original SMW Layer 1 data. No Layer 1 Data will be extracted." >> Test.asm
echo:endif>> Test.asm

asar "Test.asm" lvl/layer1/%LeadZeros%%HexValue%_L1.bin

echo:lorom> Test.asm
echo:org $008000>> Test.asm
echo:^^!LvlNum = %LvlNumber2% >> Test.asm
echo:^^!hackname = %hackname% >> Test.asm
echo:if readfile1("^!hackname", snestopc($0EF310+(^^!LvlNum^&$1FF)+%header%)) == $FF >> Test.asm
echo:print "This level uses original SMW Layer 2 data. No Layer 2 Data will be extracted." >> Test.asm
echo:elseif readfile1("^!hackname", snestopc($05E602+((^^!LvlNum^&$1FF)*3))+%header%) == $FF >> Test.asm
echo:print "This level uses original SMW Layer 2 data. No Layer 2 Data will be extracted." >> Test.asm
echo:elseif readfile1("^!hackname", snestopc($05E602+((^^!LvlNum^&$1FF)*3))+%header%) ^>= $10 >> Test.asm
echo:^^!offset = (readfile3("^!hackname", snestopc($05E600+((^^!LvlNum^&$1FF)*3))+%header%)) >> Test.asm
echo:^^!offset2 = ((readfile2("^!hackname", snestopc(^^!offset)+%header%-$4)+^^!offset+$1))^|$008000 >> Test.asm
echo:^^!offset3 #= snestopc(^^!offset)+%header% >> Test.asm
echo:^^!offset4 #= snestopc(^^!offset2)+%header% >> Test.asm
echo:incbin "%hackname%":(^^!offset3)-(^^!offset4) >> Test.asm
echo:print "Extracted 0x", hex(^^!offset2-^^!offset)," bytes from this level's Layer 2 Data at $",hex(^^!offset) >> Test.asm
echo:else>> Test.asm
echo:print "This level uses original SMW Layer 2 data. No Layer 2 Data will be extracted." >> Test.asm
echo:endif>> Test.asm

asar "Test.asm" lvl/layer2/%LeadZeros%%HexValue%_L2.bin

echo:lorom> Test.asm
echo:org $008000>> Test.asm
echo:^^!LvlNum = %LvlNumber2% >> Test.asm
echo:^^!hackname = %hackname% >> Test.asm
echo:if readfile1("^!hackname", snestopc($05D8F5)+%header%) ^^!= $22 >> Test.asm
echo:elseif readfile1("^!hackname", snestopc($0EF100+(^^!LvlNum^&$1FF)+%header%)) ^>= $10 >> Test.asm
echo:^^!offset = readfile2("^!hackname", snestopc($05EC00+((^^!LvlNum^&$1FF)*2))+%header%)+(readfile1("^!hackname", snestopc($0EF100+(^^!LvlNum^&$1FF)+%header%))*$10000) >> Test.asm
echo:^^!offset2 = ((readfile2("^!hackname", snestopc(^^!offset)+%header%-$4)+^^!offset+$1))^|$008000 >> Test.asm
echo:^^!offset3 #= snestopc(^^!offset)+%header% >> Test.asm
echo:^^!offset4 #= snestopc(^^!offset2)+%header% >> Test.asm
echo:incbin "%hackname%":(^^!offset3)-(^^!offset4) >> Test.asm
echo:print "Extracted 0x", hex(^^!offset2-^^!offset)," bytes from this level's Sprite Data at $",hex(^^!offset) >> Test.asm
echo:else>> Test.asm
echo:print "This level uses original SMW sprite data. No Sprite Data will be extracted." >> Test.asm
echo:endif>> Test.asm

asar "Test.asm" lvl/sprites/%LeadZeros%%HexValue%_Spr.bin

echo:lorom> Test.asm
echo:org $008000>> Test.asm
echo:^^!LvlNum = %LvlNumber2% >> Test.asm
echo:^^!hackname = %hackname% >> Test.asm
echo:^^!offset = (readfile3("^!hackname", snestopc($0EF600+((^^!LvlNum^&$1FF)*3))+%header%)) >> Test.asm
echo:if ^^!offset^&$7FFFFF ^^!= $000000>> Test.asm
echo:^^!offset2 = ((readfile2("^!hackname", snestopc(^^!offset)+%header%-$4)+^^!offset+$1))^|$008000 >> Test.asm
echo:^^!offset3 #= snestopc(^^!offset)+%header% >> Test.asm
echo:^^!offset4 #= snestopc(^^!offset2)+%header% >> Test.asm
echo:incbin "%hackname%":(^^!offset3)-(^^!offset4) >> Test.asm
echo:print "Extracted 0x", hex(^^!offset2-^^!offset)," bytes from this level's Palette Data at $",hex(^^!offset) >> Test.asm
echo:else>> Test.asm
echo:print "This level has no custom palette.">> Test.asm
echo:endif>> Test.asm

asar "Test.asm" lvl/color/%LeadZeros%%HexValue%_Pal.bin

echo:lorom> Test.asm
echo:org $008000>> Test.asm
echo:^^!LvlNum = %LvlNumber2% >> Test.asm
echo:^^!hackname = %hackname% >> Test.asm
echo:^^!offset = readfile3("^!hackname", snestopc(readfile3("^!hackname", snestopc(readfile3("^!hackname", snestopc($0583AE)+%header%)+$EA)+%header%))+((^^!LvlNum^&$1FF)*3)+%header%)>> Test.asm
echo:if readfile1("^!hackname", snestopc($0583AD)+%header%) == $22 >> Test.asm
echo:if ^^!offset^&$7FFFFF ^^!= $0000FF>> Test.asm
echo:^^!offset2 = ((readfile2("^!hackname", snestopc(^^!offset)+%header%-$4)+^^!offset+$1))^|$008000 >> Test.asm
echo:^^!offset3 #= snestopc(^^!offset)+%header% >> Test.asm
echo:^^!offset4 #= snestopc(^^!offset2)+%header% >> Test.asm
echo:incbin "%hackname%":(^^!offset3)-(^^!offset4) >> Test.asm
echo:print "Extracted 0x", hex(^^!offset2-^^!offset)," bytes from this level's ExAnimation Data at $",hex(^^!offset) >> Test.asm
echo:else>> Test.asm
echo:print "This level has no ExAnimations." >> Test.asm
echo:endif>> Test.asm
echo:endif>> Test.asm

asar "Test.asm" lvl/exanimation/%LeadZeros%%HexValue%_ExA.bin

echo:lorom> Test.asm
echo:org $008000>> Test.asm
echo:^^!LvlNum = %LvlNumber2% >> Test.asm
echo:^^!hackname = %hackname% >> Test.asm
echo:^^!offset #= (readfile3("^!hackname", snestopc($0FF7FF)+%header%))+((^^!LvlNum^&$1FF)*32) >> Test.asm
echo:^^!offset2 #= (^^!offset+$20)^|$008000 >> Test.asm
echo:^^!offset3 #= snestopc(^^!offset)+%header% >> Test.asm
echo:^^!offset4 #= snestopc(^^!offset2)+%header% >> Test.asm
echo:incbin "%hackname%":(^^!offset3)-(^^!offset4) >> Test.asm
echo:print "Extracted 0x", hex(^^!offset2-^^!offset)," bytes from this level's SuperGFX Bypass Data at $",hex(^^!offset) >> Test.asm
echo:db readfile1("^!hackname", snestopc($0EF310)+(^^!LvlNum^&$1FF)+%header%)>> Test.asm
echo:db readfile1("^!hackname", snestopc($03FE00)+(^^!LvlNum^&$1FF)+%header%)>> Test.asm
echo:db readfile1("^!hackname", snestopc($05DE00)+(^^!LvlNum^&$1FF)+%header%)>> Test.asm
echo:db readfile1("^!hackname", snestopc($05F000)+(^^!LvlNum^&$1FF)+%header%)>> Test.asm
echo:db readfile1("^!hackname", snestopc($05F200)+(^^!LvlNum^&$1FF)+%header%)>> Test.asm
echo:db readfile1("^!hackname", snestopc($05F400)+(^^!LvlNum^&$1FF)+%header%)>> Test.asm
echo:db readfile1("^!hackname", snestopc($05F600)+(^^!LvlNum^&$1FF)+%header%)>> Test.asm
echo:if readfile1("^!hackname", snestopc($05D9E3)+%header%) ^^!= $22 >> Test.asm
echo:db $00,$00,$00,$00>> Test.asm
echo:else >> Test.asm
echo:db readfile1("^!hackname", snestopc(readfile3("^!hackname", snestopc(readfile3("^!hackname", snestopc($05D9E4)+%header%)+$A)+%header%)+(^^!LvlNum^&$1FF))+%header%)>> Test.asm
echo:db readfile1("^!hackname", snestopc(readfile3("^!hackname", snestopc(readfile3("^!hackname", snestopc($05D9E4)+%header%)+$27)+%header%)+(^^!LvlNum^&$1FF))+%header%)>> Test.asm
echo:db readfile1("^!hackname", snestopc(readfile3("^!hackname", snestopc(readfile3("^!hackname", snestopc($05D9E4)+%header%)+$48)+%header%)+(^^!LvlNum^&$1FF))+%header%)>> Test.asm
echo:db readfile1("^!hackname", snestopc(readfile3("^!hackname", snestopc(readfile3("^!hackname", snestopc($05D9E4)+%header%)+$57)+%header%)+(^^!LvlNum^&$1FF))+%header%)>> Test.asm
echo:endif>> Test.asm
echo:db readfile1("^!hackname", snestopc($06FC00)+(^^!LvlNum^&$1FF)+%header%)>> Test.asm
echo:db readfile1("^!hackname", snestopc($06FE00)+(^^!LvlNum^&$1FF)+%header%)>> Test.asm
echo:db readfile1("^!hackname", snestopc(readfile3("^!hackname", snestopc(readfile3("^!hackname", snestopc($05D9A2)+%header%)+$5C)+%header%)+(^^!LvlNum^&$1FF))+%header%)>> Test.asm
echo:db readfile1("^!hackname", snestopc($06FA00)+(^^!LvlNum^&$1FF)+%header%)>> Test.asm

asar "Test.asm" lvl/settings/%LeadZeros%%HexValue%_Set.bin
echo:Misc. Lunar Magic Level Settings Data extracted.
echo:

set /a Loopcounter-=1
set /a LvlNumber+=1
set /a LvlNumber2+=1
if %Loopcounter% neq 0 goto :Loop1

echo:Now extracting global level data from %hackname%...

echo:lorom> Test.asm
echo:org $008000>> Test.asm
echo:^^!hackname = %hackname% >> Test.asm
echo:if readfile1("^!hackname", snestopc($0583AD)+%header%) == $22 >> Test.asm
echo:if readfile2("^!hackname", snestopc(readfile3("^!hackname", snestopc($0583AE)+%header%)+$5B)+%header%) == $0000 >> Test.asm >> Test.asm
echo:print "There is no global exanimation data to extract from this ROM." >> Test.asm
echo:else>> Test.asm
echo:^^!offset = ((readfile1("^!hackname", snestopc(readfile3("^!hackname", snestopc($0583AE)+%header%)+$5C)+%header%)*$10000)^|(readfile2("^!hackname", snestopc(readfile3("^!hackname", snestopc($0583AE)+%header%)+$65)+%header%))) >> Test.asm
echo:^^!offset2 = (readfile2("^!hackname", snestopc(^^!offset)+%header%-$4)+^^!offset+$1)^|$008000 >> Test.asm
echo:^^!offset3 #= snestopc(^^!offset)+%header% >> Test.asm
echo:^^!offset4 #= snestopc(^^!offset2)+%header% >> Test.asm
echo:incbin "%hackname%":(^^!offset3)-(^^!offset4) >> Test.asm
echo:print "Extracted 0x", hex(^^!offset2-^^!offset)," bytes from the Global Level ExAnimation Data at $",hex(^^!offset) >> Test.asm
echo:endif>> Test.asm
echo:endif>> Test.asm

asar "Test.asm" lvl/global/%ID%GlobalExanimation_ExA.bin

echo:lorom> Test.asm
echo:org $008000>> Test.asm
echo:^^!hackname = %hackname% >> Test.asm
echo:if readfile1("^!hackname", snestopc($0DE190)+%header%) ^^!= $BF >> Test.asm
echo:print "Note: LM ASM Hijack '2.50 Secondary Entrance Hijack' is missing." >> Test.asm
echo:^^!offset = $05F800 >> Test.asm
echo:^^!offset2 = (^^!offset+$200)^|$008000 >> Test.asm
echo:elseif readfile3("^!hackname", snestopc($0DE191)+%header%)^&$7FFFFF == $05F800 >> Test.asm
echo:^^!offset = $05F800 >> Test.asm
echo:^^!offset2 = (^^!offset+$200)^|$008000 >> Test.asm
echo:else >> Test.asm
echo:^^!offset = readfile3("^!hackname", snestopc($0DE191)+%header%) >> Test.asm
echo:^^!offset2 = ((readfile2("^!hackname", snestopc(^^!offset)+%header%-$4)+^^!offset+$1))^|$008000 >> Test.asm
echo:endif >> Test.asm
echo:^^!offset3 #= snestopc(^^!offset)+%header% >> Test.asm
echo:^^!offset4 #= snestopc(^^!offset2)+%header% >> Test.asm
echo:incbin "%hackname%":(^^!offset3)-(^^!offset4) >> Test.asm
echo:print "Extracted 0x", hex(^^!offset2-^^!offset)," bytes from the Secondary Entrance $05F800 Table at $",hex(^^!offset) >> Test.asm

asar "Test.asm" lvl/global/%ID%SETBL05F800_Misc.bin

echo:lorom> Test.asm
echo:org $008000>> Test.asm
echo:^^!hackname = %hackname% >> Test.asm
echo:if readfile1("^!hackname", snestopc($0DE197)+%header%) ^^!= $BF >> Test.asm
echo:^^!offset = $05FA00 >> Test.asm
echo:^^!offset2 = (^^!offset+$200)^|$008000 >> Test.asm
echo:elseif readfile3("^!hackname", snestopc($0DE198)+%header%)^&$7FFFFF == $05FA00 >> Test.asm
echo:^^!offset = $05FA00 >> Test.asm
echo:^^!offset2 = (^^!offset+$200)^|$008000 >> Test.asm
echo:else >> Test.asm
echo:^^!offset = readfile3("^!hackname", snestopc($0DE198)+%header%) >> Test.asm
echo:^^!offset2 = ((readfile2("^!hackname", snestopc(^^!offset)+%header%-$4)+^^!offset+$1))^|$008000 >> Test.asm
echo:endif >> Test.asm
echo:^^!offset3 #= snestopc(^^!offset)+%header% >> Test.asm
echo:^^!offset4 #= snestopc(^^!offset2)+%header% >> Test.asm
echo:incbin "%hackname%":(^^!offset3)-(^^!offset4) >> Test.asm
echo:print "Extracted 0x", hex(^^!offset2-^^!offset)," bytes from the Secondary Entrance $05FA00 Table at $",hex(^^!offset) >> Test.asm

asar "Test.asm" lvl/global/%ID%SETBL05FA00_Misc.bin

echo:lorom> Test.asm
echo:org $008000>> Test.asm
echo:^^!hackname = %hackname% >> Test.asm
echo:if readfile1("^!hackname", snestopc($0DE19E)+%header%) ^^!= $BF >> Test.asm
echo:^^!offset = $05FC00 >> Test.asm
echo:^^!offset2 = (^^!offset+$200)^|$008000 >> Test.asm
echo:elseif readfile3("^!hackname", snestopc($0DE19F)+%header%)^&$7FFFFF == $05FC00 >> Test.asm
echo:^^!offset = $05FC00 >> Test.asm
echo:^^!offset2 = (^^!offset+$200)^|$008000 >> Test.asm
echo:else >> Test.asm
echo:^^!offset = readfile3("^!hackname", snestopc($0DE19F)+%header%) >> Test.asm
echo:^^!offset2 = ((readfile2("^!hackname", snestopc(^^!offset)+%header%-$4)+^^!offset+$1))^|$008000 >> Test.asm
echo:endif >> Test.asm
echo:^^!offset3 #= snestopc(^^!offset)+%header% >> Test.asm
echo:^^!offset4 #= snestopc(^^!offset2)+%header% >> Test.asm
echo:incbin "%hackname%":(^^!offset3)-(^^!offset4) >> Test.asm
echo:print "Extracted 0x", hex(^^!offset2-^^!offset)," bytes from the Secondary Entrance $05FC00 Table at $",hex(^^!offset) >> Test.asm

asar "Test.asm" lvl/global/%ID%SETBL05FC00_Misc.bin

echo:lorom> Test.asm
echo:org $008000>> Test.asm
echo:^^!hackname = %hackname% >> Test.asm
echo:if readfile1("^!hackname", snestopc($05DC80)+%header%) ^^!= $BF >> Test.asm
echo:^^!offset = $05FE00 >> Test.asm
echo:^^!offset2 = (^^!offset+$200)^|$008000 >> Test.asm
echo:elseif readfile3("^!hackname", snestopc($05DC81)+%header%)^&$7FFFFF == $05FE00 >> Test.asm
echo:^^!offset = $05FE00 >> Test.asm
echo:^^!offset2 = (^^!offset+$200)^|$008000 >> Test.asm
echo:else >> Test.asm
echo:^^!offset = readfile3("^!hackname", snestopc($05DC81)+%header%) >> Test.asm
echo:^^!offset2 = ((readfile2("^!hackname", snestopc(^^!offset)+%header%-$4)+^^!offset+$1))^|$008000 >> Test.asm
echo:endif >> Test.asm
echo:^^!offset3 #= snestopc(^^!offset)+%header% >> Test.asm
echo:^^!offset4 #= snestopc(^^!offset2)+%header% >> Test.asm
echo:incbin "%hackname%":(^^!offset3)-(^^!offset4) >> Test.asm
echo:print "Extracted 0x", hex(^^!offset2-^^!offset)," bytes from the Secondary Entrance $05FE00 Table at $",hex(^^!offset) >> Test.asm

asar "Test.asm" lvl/global/%ID%SETBL05FE00_Misc.bin

echo:lorom> Test.asm
echo:org $008000>> Test.asm
echo:^^!hackname = %hackname% >> Test.asm
echo:if readfile1("^!hackname", snestopc($05DC85)+%header%) ^^!= $BF >> Test.asm
echo:print "Note: LM ASM Hijack 'Extra Secondary Entrance Tables' is missing. This table can't be extracted" >> Test.asm
echo:else >> Test.asm
echo:^^!offset = readfile3("^!hackname", snestopc($05DC86)+%header%) >> Test.asm
echo:^^!offset2 = ((readfile2("^!hackname", snestopc(^^!offset)+%header%-$4)+^^!offset+$1))^|$008000 >> Test.asm
echo:^^!offset3 #= snestopc(^^!offset)+%header% >> Test.asm
echo:^^!offset4 #= snestopc(^^!offset2)+%header% >> Test.asm
echo:incbin "%hackname%":(^^!offset3)-(^^!offset4) >> Test.asm
echo:print "Extracted 0x", hex(^^!offset2-^^!offset)," bytes from Extra Secondary Entrance Table 1 at $",hex(^^!offset) >> Test.asm
echo:endif >> Test.asm

asar "Test.asm" lvl/global/%ID%ExtraSecondaryEntranceTable1_Misc.bin

echo:lorom> Test.asm
echo:org $008000>> Test.asm
echo:^^!hackname = %hackname% >> Test.asm
echo:if readfile1("^!hackname", snestopc($05DC8A)+%header%) ^^!= $BF >> Test.asm
echo:print "Note: LM ASM Hijack 'Extra Secondary Entrance Tables' is missing. This table can't be extracted" >> Test.asm
echo:else >> Test.asm
echo:^^!offset = readfile3("^!hackname", snestopc($05DC8B)+%header%) >> Test.asm
echo:^^!offset2 = ((readfile2("^!hackname", snestopc(^^!offset)+%header%-$4)+^^!offset+$1))^|$008000 >> Test.asm
echo:^^!offset3 #= snestopc(^^!offset)+%header% >> Test.asm
echo:^^!offset4 #= snestopc(^^!offset2)+%header% >> Test.asm
echo:incbin "%hackname%":(^^!offset3)-(^^!offset4) >> Test.asm
echo:print "Extracted 0x", hex(^^!offset2-^^!offset)," bytes from Extra Secondary Entrance Table 2 at $",hex(^^!offset) >> Test.asm
echo:endif >> Test.asm

asar "Test.asm" lvl/global/%ID%ExtraSecondaryEntranceTable2_Misc.bin

echo:lorom> Test.asm
echo:org $008000>> Test.asm
echo:^^!hackname = %hackname% >> Test.asm
echo:if readfile1("^!hackname", snestopc($0084D5)+%header%)^&$7F ^<= $0F >> Test.asm
echo:print "This ROM has no custom title screen layer 3 image to extract." >> Test.asm
echo:else >> Test.asm
echo:^^!offset = readfile3("^!hackname", snestopc($0084D3)+%header%) >> Test.asm
echo:^^!offset2 = ((readfile2("^!hackname", snestopc(^^!offset)+%header%-$4)+^^!offset+$1))^|$008000 >> Test.asm
echo:^^!offset3 #= snestopc(^^!offset)+%header% >> Test.asm
echo:^^!offset4 #= snestopc(^^!offset2)+%header% >> Test.asm
echo:incbin "%hackname%":(^^!offset3)-(^^!offset4) >> Test.asm
echo:print "Extracted 0x", hex(^^!offset2-^^!offset)," bytes from the Title Screen Layer 3 Data at $",hex(^^!offset) >> Test.asm
echo:endif >> Test.asm

asar "Test.asm" lvl/global/%ID%TitleScreenLayer3_Misc.bin

echo:lorom> Test.asm
echo:org $008000>> Test.asm
echo:^^!hackname = %hackname% >> Test.asm
echo:if readfile1("^!hackname", snestopc($0C9F16)+%header%) ^^!= $BF >> Test.asm
echo:print "Note: LM ASM Hijack 'Custom Credits Layer 3' is missing. No credits image can be extracted due to being in a different format." >> Test.asm
echo:else >> Test.asm
echo:^^!offset = readfile3("^!hackname", snestopc($0C9F17)+%header%) >> Test.asm
echo:^^!offset2 = ((readfile2("^!hackname", snestopc(^^!offset)+%header%-$4)+^^!offset+$1))^|$008000 >> Test.asm
echo:^^!offset3 #= snestopc(^^!offset)+%header% >> Test.asm
echo:^^!offset4 #= snestopc(^^!offset2)+%header% >> Test.asm
echo:incbin "%hackname%":(^^!offset3)-(^^!offset4) >> Test.asm
echo:print "Extracted 0x", hex(^^!offset2-^^!offset)," bytes from the Credits Layer 3 Data at $",hex(^^!offset) >> Test.asm
echo:endif >> Test.asm

asar "Test.asm" lvl/global/%ID%CreditsLayer3_Misc.bin

echo:lorom> Test.asm
echo:org $008000>> Test.asm
echo:^^!hackname = %hackname% >> Test.asm
echo:if readfile1("^!hackname", snestopc($009C6F)+%header%) ^^!= $22 >> Test.asm
echo:print "Note: LM ASM Hijack 'Custom Title Screen Demo' is missing. No demo data will be extracted." >> Test.asm
echo:else >> Test.asm
echo:^^!offset = readfile3("^!hackname", snestopc(readfile3("^!hackname", snestopc($009C70)+%header%)+$36)+%header%)+$3 >> Test.asm
echo:^^!offset2 = ((readfile2("^!hackname", snestopc(^^!offset)+%header%-$4)+^^!offset+$1))^|$008000 >> Test.asm
echo:^^!offset3 #= snestopc(^^!offset)+%header% >> Test.asm
echo:^^!offset4 #= snestopc(^^!offset2)+%header% >> Test.asm
echo:incbin "%hackname%":(^^!offset3)-(^^!offset4) >> Test.asm
echo:print "Extracted 0x", hex(^^!offset2-^^!offset)," bytes from the Title Screen Demo Data at $",hex(^^!offset) >> Test.asm
echo:endif >> Test.asm

asar "Test.asm" lvl/global/%ID%TitleScreenDemoMoves_Misc.bin


:Done
echo Done^^!
goto :Begin

:ConvertDecToHex 
set LOOKUP=0123456789abcdef
set HEXSTR=
set PREFIX=

if "%1" EQU "" (
set "%2=0"
Goto:eof
)
set /a A=%1 || exit /b 1
if !A! LSS 0 set /a A=0xfffffff + !A! + 1 & set PREFIX=f
:looph
set /a B=!A! %% 16 & set /a A=!A! / 16
set HEXSTR=!LOOKUP:~%B%,1!%HEXSTR%
if %A% GTR 0 Goto :looph
set "%2=%PREFIX%%HEXSTR%"
Goto:eof

:BadVal
echo:That level number is invalid^^!
goto :Begin