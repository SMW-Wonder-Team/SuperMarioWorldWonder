;================================
; Super Mario World Disassembly X
;================================

lorom
math pri on
incsrc "constants.asm"

incsrc "defines.asm"
incsrc "macros.asm"
incsrc "rammap.asm"
incsrc "customrammap.asm"
incsrc "bank80to8F/bank_80.asm"
incsrc "bank80to8F/bank_81.asm"
incsrc "bank80to8F/bank_82.asm"
incsrc "bank80to8F/bank_83.asm"
incsrc "bank80to8F/bank_84.asm"
incsrc "bank80to8F/bank_85.asm"
incsrc "bank80to8F/bank_86.asm"
incsrc "bank80to8F/bank_87.asm"
incsrc "bank80to8F/bank_88-8B.asm"
incsrc "bank80to8F/bank_8C.asm"
incsrc "bank80to8F/bank_8D.asm"
incsrc "bank80to8F/bank_8E.asm"
incsrc "bank80to8F/bank_8F.asm"
incsrc "bank90to9F/bank_90.asm"
incsrc "lvl/ExGFXPointers.asm"
incsrc "lvl/ColorPointers.asm"
incsrc "lvl/insert.asm"
ORG $00FFC0

ROMName:              db "SUPERMARIOWORLDWONDER"                ; Internal ROM name
MemoryMap:            db $30                                    ; LoROM, Fast
CatridgeType:         db $02                                    ; ROM + SRAM + Battery
ROMSize:              db $09                                    ; <= 4Mb ROM
SRAMSize:             db $01                                    ; 16Kb SRAM
DestinationCode:      db con($00,$01,$00,$02,$02)
LicenseeCode:         db $01                                    ; Nintendo EAD
MaskROMVersion:       db con($00,$00,$00,$00,$01)
Checksum:             dw con($737F,$5F25,$FFFF,$F616,$3AC9)     ;\ Note that the SS checksum and complement are wrong
                      dw con($8C80,$A0DA,$0000,$09E9,$C536)     ;/ They should be $B4CF and $4B30

NativeVectors:        dw con($FFFF,$FFFF,$0000,$0000,$0000)     ;\ Fairly certain these differences have to do with
                      dw con($FFFF,$FFFF,$0400,$0001,$0400)     ;| the weird freespace pattern & stray bits
                      dw I_EMPTY                                ;|
                      dw con($50B2,$FFFF,$0000,I_RESET,$0000)   ;| Except for this $50B2 maybe?
                      dw I_EMPTY                                ;|
                      dw I_NMI                                  ;|
                      dw I_RESET                                ;|
                      dw I_IRQ                                  ;|
EmulationVectors:     dw con($FFFF,$FFFF,$0000,$0000,$0000)     ;|
                      dw con($FFFF,$FFFF,$0000,$0102,$0000)     ;/
                      dw I_EMPTY
                      dw I_EMPTY
                      dw I_EMPTY
                      dw I_EMPTY
                      dw I_RESET
                      dw I_EMPTY
org $9FFFFF                                                     ;\ Expand the rom to 1MB
NOP                                                             ;/ 