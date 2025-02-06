lorom
org $008000
!hackname = Wonder_ScratchPad.smc 
if readfile1("!hackname", snestopc($009C6F)+$200) != $22 
print "Note: LM ASM Hijack 'Custom Title Screen Demo' is missing. No demo data will be extracted." 
else 
!offset = readfile3("!hackname", snestopc(readfile3("!hackname", snestopc($009C70)+$200)+$36)+$200)+$3 
!offset2 = ((readfile2("!hackname", snestopc(!offset)+$200-$4)+!offset+$1))|$008000 
!offset3 #= snestopc(!offset)+$200 
!offset4 #= snestopc(!offset2)+$200 
incbin "Wonder_ScratchPad.smc":(!offset3)-(!offset4) 
print "Extracted 0x", hex(!offset2-!offset)," bytes from the Title Screen Demo Data at $",hex(!offset) 
endif 
