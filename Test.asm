lorom
org $008000
!LvlNum = 12 
!hackname = Wonder_ScratchPad.smc 
!offset = readfile3("!hackname", snestopc(readfile3("!hackname", snestopc(readfile3("!hackname", snestopc($0583AE)+$200)+$EA)+$200))+((!LvlNum&$1FF)*3)+$200)
if readfile1("!hackname", snestopc($0583AD)+$200) == $22 
