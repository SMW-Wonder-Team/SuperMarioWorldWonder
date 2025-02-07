lorom
org $008000
!LvlNum = 30 
!hackname = Wonder_ScratchPad.smc 
!offset #= (readfile3("!hackname", snestopc($0FF7FF)+$200))+((!LvlNum&$1FF)*32) 
!offset2 #= (!offset+$20)|$008000 
!offset3 #= snestopc(!offset)+$200 
!offset4 #= snestopc(!offset2)+$200 
incbin "Wonder_ScratchPad.smc":(!offset3)-(!offset4) 
print "Extracted 0x", hex(!offset2-!offset)," bytes from this level's SuperGFX Bypass Data at $",hex(!offset) 
db readfile1("!hackname", snestopc($0EF310)+(!LvlNum&$1FF)+$200)
db readfile1("!hackname", snestopc($03FE00)+(!LvlNum&$1FF)+$200)
db readfile1("!hackname", snestopc($05DE00)+(!LvlNum&$1FF)+$200)
db readfile1("!hackname", snestopc($05F000)+(!LvlNum&$1FF)+$200)
db readfile1("!hackname", snestopc($05F200)+(!LvlNum&$1FF)+$200)
db readfile1("!hackname", snestopc($05F400)+(!LvlNum&$1FF)+$200)
db readfile1("!hackname", snestopc($05F600)+(!LvlNum&$1FF)+$200)
if readfile1("!hackname", snestopc($05D9E3)+$200) != $22 
db $00,$00,$00,$00
else 
db readfile1("!hackname", snestopc(readfile3("!hackname", snestopc(readfile3("!hackname", snestopc($05D9E4)+$200)+$A)+$200)+(!LvlNum&$1FF))+$200)
db readfile1("!hackname", snestopc(readfile3("!hackname", snestopc(readfile3("!hackname", snestopc($05D9E4)+$200)+$27)+$200)+(!LvlNum&$1FF))+$200)
db readfile1("!hackname", snestopc(readfile3("!hackname", snestopc(readfile3("!hackname", snestopc($05D9E4)+$200)+$48)+$200)+(!LvlNum&$1FF))+$200)
db readfile1("!hackname", snestopc(readfile3("!hackname", snestopc(readfile3("!hackname", snestopc($05D9E4)+$200)+$57)+$200)+(!LvlNum&$1FF))+$200)
endif
