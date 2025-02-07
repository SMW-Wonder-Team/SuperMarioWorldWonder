; New Macros

;---------------------------------------------------------------------------
org $9A8000
; This will insert all the level palette data where it's inserted.
; This is to insert them all as one continuous block, after modifying the LM palette buffer routine to support bank crossing.
; Put this at the start of a "super bank", where bank crossing is disabled.
!LvlFFF_Flags = $FF
!LevelPaletteUploadAddress #= $9AA000
!LevelPalettesInserted = 0

macro SMWW_InsertCustomLevelPalettes()
for i = 0..!LevelPalettesInserted
	%SMWW_InsertCustomLevelXXXPalette(!i)
endfor
endmacro

;---------------------------------------------------------------------------

; Used by the above macro

macro SMWW_InsertCustomLevelXXXPalette(LevelPal)
	incbin "lvl/Palettes/!{Lvl<LevelPal>Index}_Pal.bin"
endmacro

;---------------------------------------------------------------------------

; Macro that inserts the lvl of the specified level ID (first parameter). Specifically, the layer 1, layer 2, sprite, palette, and ExAnimation data, in that order.
; If a later inserted level ID is specified to have data for a previously inserted level, then the pointer will be reused to avoid duplicates.
; If the palette or ExAnimation parameters are set to FFF, then it specifies that that level won't have a custom palette or ExAnimation.
; If a level uses ExAnimation, but the ExAnimation parameter is set to FFF, the game will crash!
; Palette data is not inserted by this macro. It's instead inserted with %SMWW_InsertCustomLevelPalettes(), because that data is bank crossing safe.

!Lvl000_Flags = $00
!Lvl001_Flags = $00
!Lvl002_Flags = $00
!Lvl003_Flags = $00
!Lvl004_Flags = $00
!Lvl005_Flags = $00
!Lvl006_Flags = $00
!Lvl007_Flags = $00
!Lvl008_Flags = $00
!Lvl009_Flags = $00
!Lvl00A_Flags = $00
!Lvl00B_Flags = $00
!Lvl00C_Flags = $00
!Lvl00D_Flags = $00
!Lvl00E_Flags = $00
!Lvl00F_Flags = $00
!Lvl010_Flags = $00
!Lvl011_Flags = $00
!Lvl012_Flags = $00
!Lvl013_Flags = $00
!Lvl014_Flags = $00
!Lvl015_Flags = $00
!Lvl016_Flags = $00
!Lvl017_Flags = $00
!Lvl018_Flags = $00
!Lvl019_Flags = $00
!Lvl01A_Flags = $00
!Lvl01B_Flags = $00
!Lvl01C_Flags = $00
!Lvl01D_Flags = $00
!Lvl01E_Flags = $00
!Lvl01F_Flags = $00
!Lvl020_Flags = $00
!Lvl021_Flags = $00
!Lvl022_Flags = $00
!Lvl023_Flags = $00
!Lvl024_Flags = $00
!Lvl025_Flags = $00
!Lvl026_Flags = $00
!Lvl027_Flags = $00
!Lvl028_Flags = $00
!Lvl029_Flags = $00
!Lvl02A_Flags = $00
!Lvl02B_Flags = $00
!Lvl02C_Flags = $00
!Lvl02D_Flags = $00
!Lvl02E_Flags = $00
!Lvl02F_Flags = $00
!Lvl030_Flags = $00
!Lvl031_Flags = $00
!Lvl032_Flags = $00
!Lvl033_Flags = $00
!Lvl034_Flags = $00
!Lvl035_Flags = $00
!Lvl036_Flags = $00
!Lvl037_Flags = $00
!Lvl038_Flags = $00
!Lvl039_Flags = $00
!Lvl03A_Flags = $00
!Lvl03B_Flags = $00
!Lvl03C_Flags = $00
!Lvl03D_Flags = $00
!Lvl03E_Flags = $00
!Lvl03F_Flags = $00
!Lvl040_Flags = $00
!Lvl041_Flags = $00
!Lvl042_Flags = $00
!Lvl043_Flags = $00
!Lvl044_Flags = $00
!Lvl045_Flags = $00
!Lvl046_Flags = $00
!Lvl047_Flags = $00
!Lvl048_Flags = $00
!Lvl049_Flags = $00
!Lvl04A_Flags = $00
!Lvl04B_Flags = $00
!Lvl04C_Flags = $00
!Lvl04D_Flags = $00
!Lvl04E_Flags = $00
!Lvl04F_Flags = $00
!Lvl050_Flags = $00
!Lvl051_Flags = $00
!Lvl052_Flags = $00
!Lvl053_Flags = $00
!Lvl054_Flags = $00
!Lvl055_Flags = $00
!Lvl056_Flags = $00
!Lvl057_Flags = $00
!Lvl058_Flags = $00
!Lvl059_Flags = $00
!Lvl05A_Flags = $00
!Lvl05B_Flags = $00
!Lvl05C_Flags = $00
!Lvl05D_Flags = $00
!Lvl05E_Flags = $00
!Lvl05F_Flags = $00
!Lvl060_Flags = $00
!Lvl061_Flags = $00
!Lvl062_Flags = $00
!Lvl063_Flags = $00
!Lvl064_Flags = $00
!Lvl065_Flags = $00
!Lvl066_Flags = $00
!Lvl067_Flags = $00
!Lvl068_Flags = $00
!Lvl069_Flags = $00
!Lvl06A_Flags = $00
!Lvl06B_Flags = $00
!Lvl06C_Flags = $00
!Lvl06D_Flags = $00
!Lvl06E_Flags = $00
!Lvl06F_Flags = $00
!Lvl070_Flags = $00
!Lvl071_Flags = $00
!Lvl072_Flags = $00
!Lvl073_Flags = $00
!Lvl074_Flags = $00
!Lvl075_Flags = $00
!Lvl076_Flags = $00
!Lvl077_Flags = $00
!Lvl078_Flags = $00
!Lvl079_Flags = $00
!Lvl07A_Flags = $00
!Lvl07B_Flags = $00
!Lvl07C_Flags = $00
!Lvl07D_Flags = $00
!Lvl07E_Flags = $00
!Lvl07F_Flags = $00
!Lvl080_Flags = $00
!Lvl081_Flags = $00
!Lvl082_Flags = $00
!Lvl083_Flags = $00
!Lvl084_Flags = $00
!Lvl085_Flags = $00
!Lvl086_Flags = $00
!Lvl087_Flags = $00
!Lvl088_Flags = $00
!Lvl089_Flags = $00
!Lvl08A_Flags = $00
!Lvl08B_Flags = $00
!Lvl08C_Flags = $00
!Lvl08D_Flags = $00
!Lvl08E_Flags = $00
!Lvl08F_Flags = $00
!Lvl090_Flags = $00
!Lvl091_Flags = $00
!Lvl092_Flags = $00
!Lvl093_Flags = $00
!Lvl094_Flags = $00
!Lvl095_Flags = $00
!Lvl096_Flags = $00
!Lvl097_Flags = $00
!Lvl098_Flags = $00
!Lvl099_Flags = $00
!Lvl09A_Flags = $00
!Lvl09B_Flags = $00
!Lvl09C_Flags = $00
!Lvl09D_Flags = $00
!Lvl09E_Flags = $00
!Lvl09F_Flags = $00
!Lvl0A0_Flags = $00
!Lvl0A1_Flags = $00
!Lvl0A2_Flags = $00
!Lvl0A3_Flags = $00
!Lvl0A4_Flags = $00
!Lvl0A5_Flags = $00
!Lvl0A6_Flags = $00
!Lvl0A7_Flags = $00
!Lvl0A8_Flags = $00
!Lvl0A9_Flags = $00
!Lvl0AA_Flags = $00
!Lvl0AB_Flags = $00
!Lvl0AC_Flags = $00
!Lvl0AD_Flags = $00
!Lvl0AE_Flags = $00
!Lvl0AF_Flags = $00
!Lvl0B0_Flags = $00
!Lvl0B1_Flags = $00
!Lvl0B2_Flags = $00
!Lvl0B3_Flags = $00
!Lvl0B4_Flags = $00
!Lvl0B5_Flags = $00
!Lvl0B6_Flags = $00
!Lvl0B7_Flags = $00
!Lvl0B8_Flags = $00
!Lvl0B9_Flags = $00
!Lvl0BA_Flags = $00
!Lvl0BB_Flags = $00
!Lvl0BC_Flags = $00
!Lvl0BD_Flags = $00
!Lvl0BE_Flags = $00
!Lvl0BF_Flags = $00
!Lvl0C0_Flags = $00
!Lvl0C1_Flags = $00
!Lvl0C2_Flags = $00
!Lvl0C3_Flags = $00
!Lvl0C4_Flags = $00
!Lvl0C5_Flags = $00
!Lvl0C6_Flags = $00
!Lvl0C7_Flags = $00
!Lvl0C8_Flags = $00
!Lvl0C9_Flags = $00
!Lvl0CA_Flags = $00
!Lvl0CB_Flags = $00
!Lvl0CC_Flags = $00
!Lvl0CD_Flags = $00
!Lvl0CE_Flags = $00
!Lvl0CF_Flags = $00
!Lvl0D0_Flags = $00
!Lvl0D1_Flags = $00
!Lvl0D2_Flags = $00
!Lvl0D3_Flags = $00
!Lvl0D4_Flags = $00
!Lvl0D5_Flags = $00
!Lvl0D6_Flags = $00
!Lvl0D7_Flags = $00
!Lvl0D8_Flags = $00
!Lvl0D9_Flags = $00
!Lvl0DA_Flags = $00
!Lvl0DB_Flags = $00
!Lvl0DC_Flags = $00
!Lvl0DD_Flags = $00
!Lvl0DE_Flags = $00
!Lvl0DF_Flags = $00
!Lvl0E0_Flags = $00
!Lvl0E1_Flags = $00
!Lvl0E2_Flags = $00
!Lvl0E3_Flags = $00
!Lvl0E4_Flags = $00
!Lvl0E5_Flags = $00
!Lvl0E6_Flags = $00
!Lvl0E7_Flags = $00
!Lvl0E8_Flags = $00
!Lvl0E9_Flags = $00
!Lvl0EA_Flags = $00
!Lvl0EB_Flags = $00
!Lvl0EC_Flags = $00
!Lvl0ED_Flags = $00
!Lvl0EE_Flags = $00
!Lvl0EF_Flags = $00
!Lvl0F0_Flags = $00
!Lvl0F1_Flags = $00
!Lvl0F2_Flags = $00
!Lvl0F3_Flags = $00
!Lvl0F4_Flags = $00
!Lvl0F5_Flags = $00
!Lvl0F6_Flags = $00
!Lvl0F7_Flags = $00
!Lvl0F8_Flags = $00
!Lvl0F9_Flags = $00
!Lvl0FA_Flags = $00
!Lvl0FB_Flags = $00
!Lvl0FC_Flags = $00
!Lvl0FD_Flags = $00
!Lvl0FE_Flags = $00
!Lvl0FF_Flags = $00
!Lvl100_Flags = $00
!Lvl101_Flags = $00
!Lvl102_Flags = $00
!Lvl103_Flags = $00
!Lvl104_Flags = $00
!Lvl105_Flags = $00
!Lvl106_Flags = $00
!Lvl107_Flags = $00
!Lvl108_Flags = $00
!Lvl109_Flags = $00
!Lvl10A_Flags = $00
!Lvl10B_Flags = $00
!Lvl10C_Flags = $00
!Lvl10D_Flags = $00
!Lvl10E_Flags = $00
!Lvl10F_Flags = $00
!Lvl110_Flags = $00
!Lvl111_Flags = $00
!Lvl112_Flags = $00
!Lvl113_Flags = $00
!Lvl114_Flags = $00
!Lvl115_Flags = $00
!Lvl116_Flags = $00
!Lvl117_Flags = $00
!Lvl118_Flags = $00
!Lvl119_Flags = $00
!Lvl11A_Flags = $00
!Lvl11B_Flags = $00
!Lvl11C_Flags = $00
!Lvl11D_Flags = $00
!Lvl11E_Flags = $00
!Lvl11F_Flags = $00
!Lvl120_Flags = $00
!Lvl121_Flags = $00
!Lvl122_Flags = $00
!Lvl123_Flags = $00
!Lvl124_Flags = $00
!Lvl125_Flags = $00
!Lvl126_Flags = $00
!Lvl127_Flags = $00
!Lvl128_Flags = $00
!Lvl129_Flags = $00
!Lvl12A_Flags = $00
!Lvl12B_Flags = $00
!Lvl12C_Flags = $00
!Lvl12D_Flags = $00
!Lvl12E_Flags = $00
!Lvl12F_Flags = $00
!Lvl130_Flags = $00
!Lvl131_Flags = $00
!Lvl132_Flags = $00
!Lvl133_Flags = $00
!Lvl134_Flags = $00
!Lvl135_Flags = $00
!Lvl136_Flags = $00
!Lvl137_Flags = $00
!Lvl138_Flags = $00
!Lvl139_Flags = $00
!Lvl13A_Flags = $00
!Lvl13B_Flags = $00
!Lvl13C_Flags = $00
!Lvl13D_Flags = $00
!Lvl13E_Flags = $00
!Lvl13F_Flags = $00
!Lvl140_Flags = $00
!Lvl141_Flags = $00
!Lvl142_Flags = $00
!Lvl143_Flags = $00
!Lvl144_Flags = $00
!Lvl145_Flags = $00
!Lvl146_Flags = $00
!Lvl147_Flags = $00
!Lvl148_Flags = $00
!Lvl149_Flags = $00
!Lvl14A_Flags = $00
!Lvl14B_Flags = $00
!Lvl14C_Flags = $00
!Lvl14D_Flags = $00
!Lvl14E_Flags = $00
!Lvl14F_Flags = $00
!Lvl150_Flags = $00
!Lvl151_Flags = $00
!Lvl152_Flags = $00
!Lvl153_Flags = $00
!Lvl154_Flags = $00
!Lvl155_Flags = $00
!Lvl156_Flags = $00
!Lvl157_Flags = $00
!Lvl158_Flags = $00
!Lvl159_Flags = $00
!Lvl15A_Flags = $00
!Lvl15B_Flags = $00
!Lvl15C_Flags = $00
!Lvl15D_Flags = $00
!Lvl15E_Flags = $00
!Lvl15F_Flags = $00
!Lvl160_Flags = $00
!Lvl161_Flags = $00
!Lvl162_Flags = $00
!Lvl163_Flags = $00
!Lvl164_Flags = $00
!Lvl165_Flags = $00
!Lvl166_Flags = $00
!Lvl167_Flags = $00
!Lvl168_Flags = $00
!Lvl169_Flags = $00
!Lvl16A_Flags = $00
!Lvl16B_Flags = $00
!Lvl16C_Flags = $00
!Lvl16D_Flags = $00
!Lvl16E_Flags = $00
!Lvl16F_Flags = $00
!Lvl170_Flags = $00
!Lvl171_Flags = $00
!Lvl172_Flags = $00
!Lvl173_Flags = $00
!Lvl174_Flags = $00
!Lvl175_Flags = $00
!Lvl176_Flags = $00
!Lvl177_Flags = $00
!Lvl178_Flags = $00
!Lvl179_Flags = $00
!Lvl17A_Flags = $00
!Lvl17B_Flags = $00
!Lvl17C_Flags = $00
!Lvl17D_Flags = $00
!Lvl17E_Flags = $00
!Lvl17F_Flags = $00
!Lvl180_Flags = $00
!Lvl181_Flags = $00
!Lvl182_Flags = $00
!Lvl183_Flags = $00
!Lvl184_Flags = $00
!Lvl185_Flags = $00
!Lvl186_Flags = $00
!Lvl187_Flags = $00
!Lvl188_Flags = $00
!Lvl189_Flags = $00
!Lvl18A_Flags = $00
!Lvl18B_Flags = $00
!Lvl18C_Flags = $00
!Lvl18D_Flags = $00
!Lvl18E_Flags = $00
!Lvl18F_Flags = $00
!Lvl190_Flags = $00
!Lvl191_Flags = $00
!Lvl192_Flags = $00
!Lvl193_Flags = $00
!Lvl194_Flags = $00
!Lvl195_Flags = $00
!Lvl196_Flags = $00
!Lvl197_Flags = $00
!Lvl198_Flags = $00
!Lvl199_Flags = $00
!Lvl19A_Flags = $00
!Lvl19B_Flags = $00
!Lvl19C_Flags = $00
!Lvl19D_Flags = $00
!Lvl19E_Flags = $00
!Lvl19F_Flags = $00
!Lvl1A0_Flags = $00
!Lvl1A1_Flags = $00
!Lvl1A2_Flags = $00
!Lvl1A3_Flags = $00
!Lvl1A4_Flags = $00
!Lvl1A5_Flags = $00
!Lvl1A6_Flags = $00
!Lvl1A7_Flags = $00
!Lvl1A8_Flags = $00
!Lvl1A9_Flags = $00
!Lvl1AA_Flags = $00
!Lvl1AB_Flags = $00
!Lvl1AC_Flags = $00
!Lvl1AD_Flags = $00
!Lvl1AE_Flags = $00
!Lvl1AF_Flags = $00
!Lvl1B0_Flags = $00
!Lvl1B1_Flags = $00
!Lvl1B2_Flags = $00
!Lvl1B3_Flags = $00
!Lvl1B4_Flags = $00
!Lvl1B5_Flags = $00
!Lvl1B6_Flags = $00
!Lvl1B7_Flags = $00
!Lvl1B8_Flags = $00
!Lvl1B9_Flags = $00
!Lvl1BA_Flags = $00
!Lvl1BB_Flags = $00
!Lvl1BC_Flags = $00
!Lvl1BD_Flags = $00
!Lvl1BE_Flags = $00
!Lvl1BF_Flags = $00
!Lvl1C0_Flags = $00
!Lvl1C1_Flags = $00
!Lvl1C2_Flags = $00
!Lvl1C3_Flags = $00
!Lvl1C4_Flags = $00
!Lvl1C5_Flags = $00
!Lvl1C6_Flags = $00
!Lvl1C7_Flags = $00
!Lvl1C8_Flags = $00
!Lvl1C9_Flags = $00
!Lvl1CA_Flags = $00
!Lvl1CB_Flags = $00
!Lvl1CC_Flags = $00
!Lvl1CD_Flags = $00
!Lvl1CE_Flags = $00
!Lvl1CF_Flags = $00
!Lvl1D0_Flags = $00
!Lvl1D1_Flags = $00
!Lvl1D2_Flags = $00
!Lvl1D3_Flags = $00
!Lvl1D4_Flags = $00
!Lvl1D5_Flags = $00
!Lvl1D6_Flags = $00
!Lvl1D7_Flags = $00
!Lvl1D8_Flags = $00
!Lvl1D9_Flags = $00
!Lvl1DA_Flags = $00
!Lvl1DB_Flags = $00
!Lvl1DC_Flags = $00
!Lvl1DD_Flags = $00
!Lvl1DE_Flags = $00
!Lvl1DF_Flags = $00
!Lvl1E0_Flags = $00
!Lvl1E1_Flags = $00
!Lvl1E2_Flags = $00
!Lvl1E3_Flags = $00
!Lvl1E4_Flags = $00
!Lvl1E5_Flags = $00
!Lvl1E6_Flags = $00
!Lvl1E7_Flags = $00
!Lvl1E8_Flags = $00
!Lvl1E9_Flags = $00
!Lvl1EA_Flags = $00
!Lvl1EB_Flags = $00
!Lvl1EC_Flags = $00
!Lvl1ED_Flags = $00
!Lvl1EE_Flags = $00
!Lvl1EF_Flags = $00
!Lvl1F0_Flags = $00
!Lvl1F1_Flags = $00
!Lvl1F2_Flags = $00
!Lvl1F3_Flags = $00
!Lvl1F4_Flags = $00
!Lvl1F5_Flags = $00
!Lvl1F6_Flags = $00
!Lvl1F7_Flags = $00
!Lvl1F8_Flags = $00
!Lvl1F9_Flags = $00
!Lvl1FA_Flags = $00
!Lvl1FB_Flags = $00
!Lvl1FC_Flags = $00
!Lvl1FD_Flags = $00
!Lvl1FE_Flags = $00
!Lvl1FF_Flags = $00

macro INCLevel(LevelNum,LevelL1,LevelL2,LevelSpr,LevelPal,LevelExA)
if !Lvl<LevelL1>_Flags&$01 == $00
Level<LevelNum>_L1:
L1<LevelL1>Loc:
	incbin "lvl/Layer1/<LevelL1>_L1.bin"
	!Lvl<LevelL1>_Flags #= !Lvl<LevelL1>_Flags|$01
else
	pushpc
org L1<LevelL1>Loc
Level<LevelNum>_L1:
	pullpc
endif

if !Lvl<LevelL2>_Flags == $FF
	pushpc
org SMWW_NullLevelData_Layer2
Level<LevelNum>_L2:
	pullpc

elseif !Lvl<LevelL2>_Flags&$02 == $00
Level<LevelNum>_L2:
L2<LevelL2>Loc:
	incbin "lvl/Layer2/<LevelL2>_L2.bin"
	!Lvl<LevelL2>_Flags #= !Lvl<LevelL2>_Flags|$02
else
	pushpc
org L2<LevelL2>Loc
Level<LevelNum>_L2:
	pullpc
endif

if !Lvl<LevelSpr>_Flags == $FF
	pushpc
org SMWW_NullLevelData_Sprite
Level<LevelNum>_Spr:
	pullpc

elseif !Lvl<LevelSpr>_Flags&$04 == $00
Level<LevelNum>_Spr:
Spr<LevelSpr>Loc:
	incbin "lvl/Sprites/<LevelSpr>_Spr.bin"
	!Lvl<LevelSpr>_Flags #= !Lvl<LevelSpr>_Flags|$04
else
	pushpc
org Spr<LevelSpr>Loc
Level<LevelNum>_Spr:
	pullpc
endif

if !Lvl<LevelPal>_Flags == $FF
	pushpc
org $000000
Level<LevelNum>_Pal:
	pullpc

elseif !Lvl<LevelPal>_Flags&$08 == $00
	pushpc
org !LevelPaletteUploadAddress
Level<LevelNum>_Pal:
Pal<LevelPal>Loc:
	!Lvl<LevelPal>_Flags #= !Lvl<LevelPal>_Flags|$08
	pullpc
	!LevelPaletteUploadAddress #= !LevelPaletteUploadAddress+$0202
	if !LevelPaletteUploadAddress&$00FFFF < $8000
		!LevelPaletteUploadAddress #= !LevelPaletteUploadAddress+$8000
	endif
	%SMWW_GenLevelPaletteIDDefine(<LevelPal>, !LevelPalettesInserted)
	!LevelPalettesInserted #= !LevelPalettesInserted+$01
else
	pushpc
org Pal<LevelPal>Loc
Level<LevelNum>_Pal:
	pullpc
endif

if !Lvl<LevelExA>_Flags == $FF
	pushpc
org $0000FF
Level<LevelNum>_ExA:
	pullpc

elseif !Lvl<LevelExA>_Flags&$10 == $00
Level<LevelNum>_ExA:
ExA<LevelExA>Loc:
	incbin "lvl/ExAnimation/<LevelExA>_ExA.bin"
	!Lvl<LevelExA>_Flags #= !Lvl<LevelExA>_Flags|$10
else
	pushpc
org ExA<LevelExA>Loc
Level<LevelNum>_ExA:
	pullpc
endif
endmacro

;---------------------------------------------------------------------------

; Used by the above macro

macro SMWW_GenLevelPaletteIDDefine(LevelID, PaletteIndex)
	!Lvl<PaletteIndex>Index = <LevelID>
endmacro

;---------------------------------------------------------------------------

macro SuperGFXBypasssettings(LevelNum)
	incbin "lvl/settings/<LevelNum>_Set.bin":$00..$20
endmacro

;---------------------------------------------------------------------------

; New tables

DATA_05DE00:							; Lunar Magic table
incbin "lvl/settings/000_Set.bin":$22..$23
incbin "lvl/settings/001_Set.bin":$22..$23
incbin "lvl/settings/002_Set.bin":$22..$23
incbin "lvl/settings/003_Set.bin":$22..$23
incbin "lvl/settings/004_Set.bin":$22..$23
incbin "lvl/settings/005_Set.bin":$22..$23
incbin "lvl/settings/006_Set.bin":$22..$23
incbin "lvl/settings/007_Set.bin":$22..$23
incbin "lvl/settings/008_Set.bin":$22..$23
incbin "lvl/settings/009_Set.bin":$22..$23
incbin "lvl/settings/00A_Set.bin":$22..$23
incbin "lvl/settings/00B_Set.bin":$22..$23
incbin "lvl/settings/00C_Set.bin":$22..$23
incbin "lvl/settings/00D_Set.bin":$22..$23
incbin "lvl/settings/00E_Set.bin":$22..$23
incbin "lvl/settings/00F_Set.bin":$22..$23
incbin "lvl/settings/010_Set.bin":$22..$23
incbin "lvl/settings/011_Set.bin":$22..$23
incbin "lvl/settings/012_Set.bin":$22..$23
incbin "lvl/settings/013_Set.bin":$22..$23
incbin "lvl/settings/014_Set.bin":$22..$23
incbin "lvl/settings/015_Set.bin":$22..$23
incbin "lvl/settings/016_Set.bin":$22..$23
incbin "lvl/settings/017_Set.bin":$22..$23
incbin "lvl/settings/018_Set.bin":$22..$23
incbin "lvl/settings/019_Set.bin":$22..$23
incbin "lvl/settings/01A_Set.bin":$22..$23
incbin "lvl/settings/01B_Set.bin":$22..$23
incbin "lvl/settings/01C_Set.bin":$22..$23
incbin "lvl/settings/01D_Set.bin":$22..$23
incbin "lvl/settings/01E_Set.bin":$22..$23
incbin "lvl/settings/01F_Set.bin":$22..$23
incbin "lvl/settings/020_Set.bin":$22..$23
incbin "lvl/settings/021_Set.bin":$22..$23
incbin "lvl/settings/022_Set.bin":$22..$23
incbin "lvl/settings/023_Set.bin":$22..$23
incbin "lvl/settings/024_Set.bin":$22..$23
incbin "lvl/settings/025_Set.bin":$22..$23
incbin "lvl/settings/026_Set.bin":$22..$23
incbin "lvl/settings/027_Set.bin":$22..$23
incbin "lvl/settings/028_Set.bin":$22..$23
incbin "lvl/settings/029_Set.bin":$22..$23
incbin "lvl/settings/02A_Set.bin":$22..$23
incbin "lvl/settings/02B_Set.bin":$22..$23
incbin "lvl/settings/02C_Set.bin":$22..$23
incbin "lvl/settings/02D_Set.bin":$22..$23
incbin "lvl/settings/02E_Set.bin":$22..$23
incbin "lvl/settings/02F_Set.bin":$22..$23
incbin "lvl/settings/030_Set.bin":$22..$23
incbin "lvl/settings/031_Set.bin":$22..$23
incbin "lvl/settings/032_Set.bin":$22..$23
incbin "lvl/settings/033_Set.bin":$22..$23
incbin "lvl/settings/034_Set.bin":$22..$23
incbin "lvl/settings/035_Set.bin":$22..$23
incbin "lvl/settings/036_Set.bin":$22..$23
incbin "lvl/settings/037_Set.bin":$22..$23
incbin "lvl/settings/038_Set.bin":$22..$23
incbin "lvl/settings/039_Set.bin":$22..$23
incbin "lvl/settings/03A_Set.bin":$22..$23
incbin "lvl/settings/03B_Set.bin":$22..$23
incbin "lvl/settings/03C_Set.bin":$22..$23
incbin "lvl/settings/03D_Set.bin":$22..$23
incbin "lvl/settings/03E_Set.bin":$22..$23
incbin "lvl/settings/03F_Set.bin":$22..$23
incbin "lvl/settings/040_Set.bin":$22..$23
incbin "lvl/settings/041_Set.bin":$22..$23
incbin "lvl/settings/042_Set.bin":$22..$23
incbin "lvl/settings/043_Set.bin":$22..$23
incbin "lvl/settings/044_Set.bin":$22..$23
incbin "lvl/settings/045_Set.bin":$22..$23
incbin "lvl/settings/046_Set.bin":$22..$23
incbin "lvl/settings/047_Set.bin":$22..$23
incbin "lvl/settings/048_Set.bin":$22..$23
incbin "lvl/settings/049_Set.bin":$22..$23
incbin "lvl/settings/04A_Set.bin":$22..$23
incbin "lvl/settings/04B_Set.bin":$22..$23
incbin "lvl/settings/04C_Set.bin":$22..$23
incbin "lvl/settings/04D_Set.bin":$22..$23
incbin "lvl/settings/04E_Set.bin":$22..$23
incbin "lvl/settings/04F_Set.bin":$22..$23
incbin "lvl/settings/050_Set.bin":$22..$23
incbin "lvl/settings/051_Set.bin":$22..$23
incbin "lvl/settings/052_Set.bin":$22..$23
incbin "lvl/settings/053_Set.bin":$22..$23
incbin "lvl/settings/054_Set.bin":$22..$23
incbin "lvl/settings/055_Set.bin":$22..$23
incbin "lvl/settings/056_Set.bin":$22..$23
incbin "lvl/settings/057_Set.bin":$22..$23
incbin "lvl/settings/058_Set.bin":$22..$23
incbin "lvl/settings/059_Set.bin":$22..$23
incbin "lvl/settings/05A_Set.bin":$22..$23
incbin "lvl/settings/05B_Set.bin":$22..$23
incbin "lvl/settings/05C_Set.bin":$22..$23
incbin "lvl/settings/05D_Set.bin":$22..$23
incbin "lvl/settings/05E_Set.bin":$22..$23
incbin "lvl/settings/05F_Set.bin":$22..$23
incbin "lvl/settings/060_Set.bin":$22..$23
incbin "lvl/settings/061_Set.bin":$22..$23
incbin "lvl/settings/062_Set.bin":$22..$23
incbin "lvl/settings/063_Set.bin":$22..$23
incbin "lvl/settings/064_Set.bin":$22..$23
incbin "lvl/settings/065_Set.bin":$22..$23
incbin "lvl/settings/066_Set.bin":$22..$23
incbin "lvl/settings/067_Set.bin":$22..$23
incbin "lvl/settings/068_Set.bin":$22..$23
incbin "lvl/settings/069_Set.bin":$22..$23
incbin "lvl/settings/06A_Set.bin":$22..$23
incbin "lvl/settings/06B_Set.bin":$22..$23
incbin "lvl/settings/06C_Set.bin":$22..$23
incbin "lvl/settings/06D_Set.bin":$22..$23
incbin "lvl/settings/06E_Set.bin":$22..$23
incbin "lvl/settings/06F_Set.bin":$22..$23
incbin "lvl/settings/070_Set.bin":$22..$23
incbin "lvl/settings/071_Set.bin":$22..$23
incbin "lvl/settings/072_Set.bin":$22..$23
incbin "lvl/settings/073_Set.bin":$22..$23
incbin "lvl/settings/074_Set.bin":$22..$23
incbin "lvl/settings/075_Set.bin":$22..$23
incbin "lvl/settings/076_Set.bin":$22..$23
incbin "lvl/settings/077_Set.bin":$22..$23
incbin "lvl/settings/078_Set.bin":$22..$23
incbin "lvl/settings/079_Set.bin":$22..$23
incbin "lvl/settings/07A_Set.bin":$22..$23
incbin "lvl/settings/07B_Set.bin":$22..$23
incbin "lvl/settings/07C_Set.bin":$22..$23
incbin "lvl/settings/07D_Set.bin":$22..$23
incbin "lvl/settings/07E_Set.bin":$22..$23
incbin "lvl/settings/07F_Set.bin":$22..$23
incbin "lvl/settings/080_Set.bin":$22..$23
incbin "lvl/settings/081_Set.bin":$22..$23
incbin "lvl/settings/082_Set.bin":$22..$23
incbin "lvl/settings/083_Set.bin":$22..$23
incbin "lvl/settings/084_Set.bin":$22..$23
incbin "lvl/settings/085_Set.bin":$22..$23
incbin "lvl/settings/086_Set.bin":$22..$23
incbin "lvl/settings/087_Set.bin":$22..$23
incbin "lvl/settings/088_Set.bin":$22..$23
incbin "lvl/settings/089_Set.bin":$22..$23
incbin "lvl/settings/08A_Set.bin":$22..$23
incbin "lvl/settings/08B_Set.bin":$22..$23
incbin "lvl/settings/08C_Set.bin":$22..$23
incbin "lvl/settings/08D_Set.bin":$22..$23
incbin "lvl/settings/08E_Set.bin":$22..$23
incbin "lvl/settings/08F_Set.bin":$22..$23
incbin "lvl/settings/090_Set.bin":$22..$23
incbin "lvl/settings/091_Set.bin":$22..$23
incbin "lvl/settings/092_Set.bin":$22..$23
incbin "lvl/settings/093_Set.bin":$22..$23
incbin "lvl/settings/094_Set.bin":$22..$23
incbin "lvl/settings/095_Set.bin":$22..$23
incbin "lvl/settings/096_Set.bin":$22..$23
incbin "lvl/settings/097_Set.bin":$22..$23
incbin "lvl/settings/098_Set.bin":$22..$23
incbin "lvl/settings/099_Set.bin":$22..$23
incbin "lvl/settings/09A_Set.bin":$22..$23
incbin "lvl/settings/09B_Set.bin":$22..$23
incbin "lvl/settings/09C_Set.bin":$22..$23
incbin "lvl/settings/09D_Set.bin":$22..$23
incbin "lvl/settings/09E_Set.bin":$22..$23
incbin "lvl/settings/09F_Set.bin":$22..$23
incbin "lvl/settings/0A0_Set.bin":$22..$23
incbin "lvl/settings/0A1_Set.bin":$22..$23
incbin "lvl/settings/0A2_Set.bin":$22..$23
incbin "lvl/settings/0A3_Set.bin":$22..$23
incbin "lvl/settings/0A4_Set.bin":$22..$23
incbin "lvl/settings/0A5_Set.bin":$22..$23
incbin "lvl/settings/0A6_Set.bin":$22..$23
incbin "lvl/settings/0A7_Set.bin":$22..$23
incbin "lvl/settings/0A8_Set.bin":$22..$23
incbin "lvl/settings/0A9_Set.bin":$22..$23
incbin "lvl/settings/0AA_Set.bin":$22..$23
incbin "lvl/settings/0AB_Set.bin":$22..$23
incbin "lvl/settings/0AC_Set.bin":$22..$23
incbin "lvl/settings/0AD_Set.bin":$22..$23
incbin "lvl/settings/0AE_Set.bin":$22..$23
incbin "lvl/settings/0AF_Set.bin":$22..$23
incbin "lvl/settings/0B0_Set.bin":$22..$23
incbin "lvl/settings/0B1_Set.bin":$22..$23
incbin "lvl/settings/0B2_Set.bin":$22..$23
incbin "lvl/settings/0B3_Set.bin":$22..$23
incbin "lvl/settings/0B4_Set.bin":$22..$23
incbin "lvl/settings/0B5_Set.bin":$22..$23
incbin "lvl/settings/0B6_Set.bin":$22..$23
incbin "lvl/settings/0B7_Set.bin":$22..$23
incbin "lvl/settings/0B8_Set.bin":$22..$23
incbin "lvl/settings/0B9_Set.bin":$22..$23
incbin "lvl/settings/0BA_Set.bin":$22..$23
incbin "lvl/settings/0BB_Set.bin":$22..$23
incbin "lvl/settings/0BC_Set.bin":$22..$23
incbin "lvl/settings/0BD_Set.bin":$22..$23
incbin "lvl/settings/0BE_Set.bin":$22..$23
incbin "lvl/settings/0BF_Set.bin":$22..$23
incbin "lvl/settings/0C0_Set.bin":$22..$23
incbin "lvl/settings/0C1_Set.bin":$22..$23
incbin "lvl/settings/0C2_Set.bin":$22..$23
incbin "lvl/settings/0C3_Set.bin":$22..$23
incbin "lvl/settings/0C4_Set.bin":$22..$23
incbin "lvl/settings/0C5_Set.bin":$22..$23
incbin "lvl/settings/0C6_Set.bin":$22..$23
incbin "lvl/settings/0C7_Set.bin":$22..$23
incbin "lvl/settings/0C8_Set.bin":$22..$23
incbin "lvl/settings/0C9_Set.bin":$22..$23
incbin "lvl/settings/0CA_Set.bin":$22..$23
incbin "lvl/settings/0CB_Set.bin":$22..$23
incbin "lvl/settings/0CC_Set.bin":$22..$23
incbin "lvl/settings/0CD_Set.bin":$22..$23
incbin "lvl/settings/0CE_Set.bin":$22..$23
incbin "lvl/settings/0CF_Set.bin":$22..$23
incbin "lvl/settings/0D0_Set.bin":$22..$23
incbin "lvl/settings/0D1_Set.bin":$22..$23
incbin "lvl/settings/0D2_Set.bin":$22..$23
incbin "lvl/settings/0D3_Set.bin":$22..$23
incbin "lvl/settings/0D4_Set.bin":$22..$23
incbin "lvl/settings/0D5_Set.bin":$22..$23
incbin "lvl/settings/0D6_Set.bin":$22..$23
incbin "lvl/settings/0D7_Set.bin":$22..$23
incbin "lvl/settings/0D8_Set.bin":$22..$23
incbin "lvl/settings/0D9_Set.bin":$22..$23
incbin "lvl/settings/0DA_Set.bin":$22..$23
incbin "lvl/settings/0DB_Set.bin":$22..$23
incbin "lvl/settings/0DC_Set.bin":$22..$23
incbin "lvl/settings/0DD_Set.bin":$22..$23
incbin "lvl/settings/0DE_Set.bin":$22..$23
incbin "lvl/settings/0DF_Set.bin":$22..$23
incbin "lvl/settings/0E0_Set.bin":$22..$23
incbin "lvl/settings/0E1_Set.bin":$22..$23
incbin "lvl/settings/0E2_Set.bin":$22..$23
incbin "lvl/settings/0E3_Set.bin":$22..$23
incbin "lvl/settings/0E4_Set.bin":$22..$23
incbin "lvl/settings/0E5_Set.bin":$22..$23
incbin "lvl/settings/0E6_Set.bin":$22..$23
incbin "lvl/settings/0E7_Set.bin":$22..$23
incbin "lvl/settings/0E8_Set.bin":$22..$23
incbin "lvl/settings/0E9_Set.bin":$22..$23
incbin "lvl/settings/0EA_Set.bin":$22..$23
incbin "lvl/settings/0EB_Set.bin":$22..$23
incbin "lvl/settings/0EC_Set.bin":$22..$23
incbin "lvl/settings/0ED_Set.bin":$22..$23
incbin "lvl/settings/0EE_Set.bin":$22..$23
incbin "lvl/settings/0EF_Set.bin":$22..$23
incbin "lvl/settings/0F0_Set.bin":$22..$23
incbin "lvl/settings/0F1_Set.bin":$22..$23
incbin "lvl/settings/0F2_Set.bin":$22..$23
incbin "lvl/settings/0F3_Set.bin":$22..$23
incbin "lvl/settings/0F4_Set.bin":$22..$23
incbin "lvl/settings/0F5_Set.bin":$22..$23
incbin "lvl/settings/0F6_Set.bin":$22..$23
incbin "lvl/settings/0F7_Set.bin":$22..$23
incbin "lvl/settings/0F8_Set.bin":$22..$23
incbin "lvl/settings/0F9_Set.bin":$22..$23
incbin "lvl/settings/0FA_Set.bin":$22..$23
incbin "lvl/settings/0FB_Set.bin":$22..$23
incbin "lvl/settings/0FC_Set.bin":$22..$23
incbin "lvl/settings/0FD_Set.bin":$22..$23
incbin "lvl/settings/0FE_Set.bin":$22..$23
incbin "lvl/settings/0FF_Set.bin":$22..$23
incbin "lvl/settings/100_Set.bin":$22..$23
incbin "lvl/settings/101_Set.bin":$22..$23
incbin "lvl/settings/102_Set.bin":$22..$23
incbin "lvl/settings/103_Set.bin":$22..$23
incbin "lvl/settings/104_Set.bin":$22..$23
incbin "lvl/settings/105_Set.bin":$22..$23
incbin "lvl/settings/106_Set.bin":$22..$23
incbin "lvl/settings/107_Set.bin":$22..$23
incbin "lvl/settings/108_Set.bin":$22..$23
incbin "lvl/settings/109_Set.bin":$22..$23
incbin "lvl/settings/10A_Set.bin":$22..$23
incbin "lvl/settings/10B_Set.bin":$22..$23
incbin "lvl/settings/10C_Set.bin":$22..$23
incbin "lvl/settings/10D_Set.bin":$22..$23
incbin "lvl/settings/10E_Set.bin":$22..$23
incbin "lvl/settings/10F_Set.bin":$22..$23
incbin "lvl/settings/110_Set.bin":$22..$23
incbin "lvl/settings/111_Set.bin":$22..$23
incbin "lvl/settings/112_Set.bin":$22..$23
incbin "lvl/settings/113_Set.bin":$22..$23
incbin "lvl/settings/114_Set.bin":$22..$23
incbin "lvl/settings/115_Set.bin":$22..$23
incbin "lvl/settings/116_Set.bin":$22..$23
incbin "lvl/settings/117_Set.bin":$22..$23
incbin "lvl/settings/118_Set.bin":$22..$23
incbin "lvl/settings/119_Set.bin":$22..$23
incbin "lvl/settings/11A_Set.bin":$22..$23
incbin "lvl/settings/11B_Set.bin":$22..$23
incbin "lvl/settings/11C_Set.bin":$22..$23
incbin "lvl/settings/11D_Set.bin":$22..$23
incbin "lvl/settings/11E_Set.bin":$22..$23
incbin "lvl/settings/11F_Set.bin":$22..$23
incbin "lvl/settings/120_Set.bin":$22..$23
incbin "lvl/settings/121_Set.bin":$22..$23
incbin "lvl/settings/122_Set.bin":$22..$23
incbin "lvl/settings/123_Set.bin":$22..$23
incbin "lvl/settings/124_Set.bin":$22..$23
incbin "lvl/settings/125_Set.bin":$22..$23
incbin "lvl/settings/126_Set.bin":$22..$23
incbin "lvl/settings/127_Set.bin":$22..$23
incbin "lvl/settings/128_Set.bin":$22..$23
incbin "lvl/settings/129_Set.bin":$22..$23
incbin "lvl/settings/12A_Set.bin":$22..$23
incbin "lvl/settings/12B_Set.bin":$22..$23
incbin "lvl/settings/12C_Set.bin":$22..$23
incbin "lvl/settings/12D_Set.bin":$22..$23
incbin "lvl/settings/12E_Set.bin":$22..$23
incbin "lvl/settings/12F_Set.bin":$22..$23
incbin "lvl/settings/130_Set.bin":$22..$23
incbin "lvl/settings/131_Set.bin":$22..$23
incbin "lvl/settings/132_Set.bin":$22..$23
incbin "lvl/settings/133_Set.bin":$22..$23
incbin "lvl/settings/134_Set.bin":$22..$23
incbin "lvl/settings/135_Set.bin":$22..$23
incbin "lvl/settings/136_Set.bin":$22..$23
incbin "lvl/settings/137_Set.bin":$22..$23
incbin "lvl/settings/138_Set.bin":$22..$23
incbin "lvl/settings/139_Set.bin":$22..$23
incbin "lvl/settings/13A_Set.bin":$22..$23
incbin "lvl/settings/13B_Set.bin":$22..$23
incbin "lvl/settings/13C_Set.bin":$22..$23
incbin "lvl/settings/13D_Set.bin":$22..$23
incbin "lvl/settings/13E_Set.bin":$22..$23
incbin "lvl/settings/13F_Set.bin":$22..$23
incbin "lvl/settings/140_Set.bin":$22..$23
incbin "lvl/settings/141_Set.bin":$22..$23
incbin "lvl/settings/142_Set.bin":$22..$23
incbin "lvl/settings/143_Set.bin":$22..$23
incbin "lvl/settings/144_Set.bin":$22..$23
incbin "lvl/settings/145_Set.bin":$22..$23
incbin "lvl/settings/146_Set.bin":$22..$23
incbin "lvl/settings/147_Set.bin":$22..$23
incbin "lvl/settings/148_Set.bin":$22..$23
incbin "lvl/settings/149_Set.bin":$22..$23
incbin "lvl/settings/14A_Set.bin":$22..$23
incbin "lvl/settings/14B_Set.bin":$22..$23
incbin "lvl/settings/14C_Set.bin":$22..$23
incbin "lvl/settings/14D_Set.bin":$22..$23
incbin "lvl/settings/14E_Set.bin":$22..$23
incbin "lvl/settings/14F_Set.bin":$22..$23
incbin "lvl/settings/150_Set.bin":$22..$23
incbin "lvl/settings/151_Set.bin":$22..$23
incbin "lvl/settings/152_Set.bin":$22..$23
incbin "lvl/settings/153_Set.bin":$22..$23
incbin "lvl/settings/154_Set.bin":$22..$23
incbin "lvl/settings/155_Set.bin":$22..$23
incbin "lvl/settings/156_Set.bin":$22..$23
incbin "lvl/settings/157_Set.bin":$22..$23
incbin "lvl/settings/158_Set.bin":$22..$23
incbin "lvl/settings/159_Set.bin":$22..$23
incbin "lvl/settings/15A_Set.bin":$22..$23
incbin "lvl/settings/15B_Set.bin":$22..$23
incbin "lvl/settings/15C_Set.bin":$22..$23
incbin "lvl/settings/15D_Set.bin":$22..$23
incbin "lvl/settings/15E_Set.bin":$22..$23
incbin "lvl/settings/15F_Set.bin":$22..$23
incbin "lvl/settings/160_Set.bin":$22..$23
incbin "lvl/settings/161_Set.bin":$22..$23
incbin "lvl/settings/162_Set.bin":$22..$23
incbin "lvl/settings/163_Set.bin":$22..$23
incbin "lvl/settings/164_Set.bin":$22..$23
incbin "lvl/settings/165_Set.bin":$22..$23
incbin "lvl/settings/166_Set.bin":$22..$23
incbin "lvl/settings/167_Set.bin":$22..$23
incbin "lvl/settings/168_Set.bin":$22..$23
incbin "lvl/settings/169_Set.bin":$22..$23
incbin "lvl/settings/16A_Set.bin":$22..$23
incbin "lvl/settings/16B_Set.bin":$22..$23
incbin "lvl/settings/16C_Set.bin":$22..$23
incbin "lvl/settings/16D_Set.bin":$22..$23
incbin "lvl/settings/16E_Set.bin":$22..$23
incbin "lvl/settings/16F_Set.bin":$22..$23
incbin "lvl/settings/170_Set.bin":$22..$23
incbin "lvl/settings/171_Set.bin":$22..$23
incbin "lvl/settings/172_Set.bin":$22..$23
incbin "lvl/settings/173_Set.bin":$22..$23
incbin "lvl/settings/174_Set.bin":$22..$23
incbin "lvl/settings/175_Set.bin":$22..$23
incbin "lvl/settings/176_Set.bin":$22..$23
incbin "lvl/settings/177_Set.bin":$22..$23
incbin "lvl/settings/178_Set.bin":$22..$23
incbin "lvl/settings/179_Set.bin":$22..$23
incbin "lvl/settings/17A_Set.bin":$22..$23
incbin "lvl/settings/17B_Set.bin":$22..$23
incbin "lvl/settings/17C_Set.bin":$22..$23
incbin "lvl/settings/17D_Set.bin":$22..$23
incbin "lvl/settings/17E_Set.bin":$22..$23
incbin "lvl/settings/17F_Set.bin":$22..$23
incbin "lvl/settings/180_Set.bin":$22..$23
incbin "lvl/settings/181_Set.bin":$22..$23
incbin "lvl/settings/182_Set.bin":$22..$23
incbin "lvl/settings/183_Set.bin":$22..$23
incbin "lvl/settings/184_Set.bin":$22..$23
incbin "lvl/settings/185_Set.bin":$22..$23
incbin "lvl/settings/186_Set.bin":$22..$23
incbin "lvl/settings/187_Set.bin":$22..$23
incbin "lvl/settings/188_Set.bin":$22..$23
incbin "lvl/settings/189_Set.bin":$22..$23
incbin "lvl/settings/18A_Set.bin":$22..$23
incbin "lvl/settings/18B_Set.bin":$22..$23
incbin "lvl/settings/18C_Set.bin":$22..$23
incbin "lvl/settings/18D_Set.bin":$22..$23
incbin "lvl/settings/18E_Set.bin":$22..$23
incbin "lvl/settings/18F_Set.bin":$22..$23
incbin "lvl/settings/190_Set.bin":$22..$23
incbin "lvl/settings/191_Set.bin":$22..$23
incbin "lvl/settings/192_Set.bin":$22..$23
incbin "lvl/settings/193_Set.bin":$22..$23
incbin "lvl/settings/194_Set.bin":$22..$23
incbin "lvl/settings/195_Set.bin":$22..$23
incbin "lvl/settings/196_Set.bin":$22..$23
incbin "lvl/settings/197_Set.bin":$22..$23
incbin "lvl/settings/198_Set.bin":$22..$23
incbin "lvl/settings/199_Set.bin":$22..$23
incbin "lvl/settings/19A_Set.bin":$22..$23
incbin "lvl/settings/19B_Set.bin":$22..$23
incbin "lvl/settings/19C_Set.bin":$22..$23
incbin "lvl/settings/19D_Set.bin":$22..$23
incbin "lvl/settings/19E_Set.bin":$22..$23
incbin "lvl/settings/19F_Set.bin":$22..$23
incbin "lvl/settings/1A0_Set.bin":$22..$23
incbin "lvl/settings/1A1_Set.bin":$22..$23
incbin "lvl/settings/1A2_Set.bin":$22..$23
incbin "lvl/settings/1A3_Set.bin":$22..$23
incbin "lvl/settings/1A4_Set.bin":$22..$23
incbin "lvl/settings/1A5_Set.bin":$22..$23
incbin "lvl/settings/1A6_Set.bin":$22..$23
incbin "lvl/settings/1A7_Set.bin":$22..$23
incbin "lvl/settings/1A8_Set.bin":$22..$23
incbin "lvl/settings/1A9_Set.bin":$22..$23
incbin "lvl/settings/1AA_Set.bin":$22..$23
incbin "lvl/settings/1AB_Set.bin":$22..$23
incbin "lvl/settings/1AC_Set.bin":$22..$23
incbin "lvl/settings/1AD_Set.bin":$22..$23
incbin "lvl/settings/1AE_Set.bin":$22..$23
incbin "lvl/settings/1AF_Set.bin":$22..$23
incbin "lvl/settings/1B0_Set.bin":$22..$23
incbin "lvl/settings/1B1_Set.bin":$22..$23
incbin "lvl/settings/1B2_Set.bin":$22..$23
incbin "lvl/settings/1B3_Set.bin":$22..$23
incbin "lvl/settings/1B4_Set.bin":$22..$23
incbin "lvl/settings/1B5_Set.bin":$22..$23
incbin "lvl/settings/1B6_Set.bin":$22..$23
incbin "lvl/settings/1B7_Set.bin":$22..$23
incbin "lvl/settings/1B8_Set.bin":$22..$23
incbin "lvl/settings/1B9_Set.bin":$22..$23
incbin "lvl/settings/1BA_Set.bin":$22..$23
incbin "lvl/settings/1BB_Set.bin":$22..$23
incbin "lvl/settings/1BC_Set.bin":$22..$23
incbin "lvl/settings/1BD_Set.bin":$22..$23
incbin "lvl/settings/1BE_Set.bin":$22..$23
incbin "lvl/settings/1BF_Set.bin":$22..$23
incbin "lvl/settings/1C0_Set.bin":$22..$23
incbin "lvl/settings/1C1_Set.bin":$22..$23
incbin "lvl/settings/1C2_Set.bin":$22..$23
incbin "lvl/settings/1C3_Set.bin":$22..$23
incbin "lvl/settings/1C4_Set.bin":$22..$23
incbin "lvl/settings/1C5_Set.bin":$22..$23
incbin "lvl/settings/1C6_Set.bin":$22..$23
incbin "lvl/settings/1C7_Set.bin":$22..$23
incbin "lvl/settings/1C8_Set.bin":$22..$23
incbin "lvl/settings/1C9_Set.bin":$22..$23
incbin "lvl/settings/1CA_Set.bin":$22..$23
incbin "lvl/settings/1CB_Set.bin":$22..$23
incbin "lvl/settings/1CC_Set.bin":$22..$23
incbin "lvl/settings/1CD_Set.bin":$22..$23
incbin "lvl/settings/1CE_Set.bin":$22..$23
incbin "lvl/settings/1CF_Set.bin":$22..$23
incbin "lvl/settings/1D0_Set.bin":$22..$23
incbin "lvl/settings/1D1_Set.bin":$22..$23
incbin "lvl/settings/1D2_Set.bin":$22..$23
incbin "lvl/settings/1D3_Set.bin":$22..$23
incbin "lvl/settings/1D4_Set.bin":$22..$23
incbin "lvl/settings/1D5_Set.bin":$22..$23
incbin "lvl/settings/1D6_Set.bin":$22..$23
incbin "lvl/settings/1D7_Set.bin":$22..$23
incbin "lvl/settings/1D8_Set.bin":$22..$23
incbin "lvl/settings/1D9_Set.bin":$22..$23
incbin "lvl/settings/1DA_Set.bin":$22..$23
incbin "lvl/settings/1DB_Set.bin":$22..$23
incbin "lvl/settings/1DC_Set.bin":$22..$23
incbin "lvl/settings/1DD_Set.bin":$22..$23
incbin "lvl/settings/1DE_Set.bin":$22..$23
incbin "lvl/settings/1DF_Set.bin":$22..$23
incbin "lvl/settings/1E0_Set.bin":$22..$23
incbin "lvl/settings/1E1_Set.bin":$22..$23
incbin "lvl/settings/1E2_Set.bin":$22..$23
incbin "lvl/settings/1E3_Set.bin":$22..$23
incbin "lvl/settings/1E4_Set.bin":$22..$23
incbin "lvl/settings/1E5_Set.bin":$22..$23
incbin "lvl/settings/1E6_Set.bin":$22..$23
incbin "lvl/settings/1E7_Set.bin":$22..$23
incbin "lvl/settings/1E8_Set.bin":$22..$23
incbin "lvl/settings/1E9_Set.bin":$22..$23
incbin "lvl/settings/1EA_Set.bin":$22..$23
incbin "lvl/settings/1EB_Set.bin":$22..$23
incbin "lvl/settings/1EC_Set.bin":$22..$23
incbin "lvl/settings/1ED_Set.bin":$22..$23
incbin "lvl/settings/1EE_Set.bin":$22..$23
incbin "lvl/settings/1EF_Set.bin":$22..$23
incbin "lvl/settings/1F0_Set.bin":$22..$23
incbin "lvl/settings/1F1_Set.bin":$22..$23
incbin "lvl/settings/1F2_Set.bin":$22..$23
incbin "lvl/settings/1F3_Set.bin":$22..$23
incbin "lvl/settings/1F4_Set.bin":$22..$23
incbin "lvl/settings/1F5_Set.bin":$22..$23
incbin "lvl/settings/1F6_Set.bin":$22..$23
incbin "lvl/settings/1F7_Set.bin":$22..$23
incbin "lvl/settings/1F8_Set.bin":$22..$23
incbin "lvl/settings/1F9_Set.bin":$22..$23
incbin "lvl/settings/1FA_Set.bin":$22..$23
incbin "lvl/settings/1FB_Set.bin":$22..$23
incbin "lvl/settings/1FC_Set.bin":$22..$23
incbin "lvl/settings/1FD_Set.bin":$22..$23
incbin "lvl/settings/1FE_Set.bin":$22..$23
incbin "lvl/settings/1FF_Set.bin":$22..$23

DATA_05F000:
incbin "lvl/settings/000_Set.bin":$23..$24
incbin "lvl/settings/001_Set.bin":$23..$24
incbin "lvl/settings/002_Set.bin":$23..$24
incbin "lvl/settings/003_Set.bin":$23..$24
incbin "lvl/settings/004_Set.bin":$23..$24
incbin "lvl/settings/005_Set.bin":$23..$24
incbin "lvl/settings/006_Set.bin":$23..$24
incbin "lvl/settings/007_Set.bin":$23..$24
incbin "lvl/settings/008_Set.bin":$23..$24
incbin "lvl/settings/009_Set.bin":$23..$24
incbin "lvl/settings/00A_Set.bin":$23..$24
incbin "lvl/settings/00B_Set.bin":$23..$24
incbin "lvl/settings/00C_Set.bin":$23..$24
incbin "lvl/settings/00D_Set.bin":$23..$24
incbin "lvl/settings/00E_Set.bin":$23..$24
incbin "lvl/settings/00F_Set.bin":$23..$24
incbin "lvl/settings/010_Set.bin":$23..$24
incbin "lvl/settings/011_Set.bin":$23..$24
incbin "lvl/settings/012_Set.bin":$23..$24
incbin "lvl/settings/013_Set.bin":$23..$24
incbin "lvl/settings/014_Set.bin":$23..$24
incbin "lvl/settings/015_Set.bin":$23..$24
incbin "lvl/settings/016_Set.bin":$23..$24
incbin "lvl/settings/017_Set.bin":$23..$24
incbin "lvl/settings/018_Set.bin":$23..$24
incbin "lvl/settings/019_Set.bin":$23..$24
incbin "lvl/settings/01A_Set.bin":$23..$24
incbin "lvl/settings/01B_Set.bin":$23..$24
incbin "lvl/settings/01C_Set.bin":$23..$24
incbin "lvl/settings/01D_Set.bin":$23..$24
incbin "lvl/settings/01E_Set.bin":$23..$24
incbin "lvl/settings/01F_Set.bin":$23..$24
incbin "lvl/settings/020_Set.bin":$23..$24
incbin "lvl/settings/021_Set.bin":$23..$24
incbin "lvl/settings/022_Set.bin":$23..$24
incbin "lvl/settings/023_Set.bin":$23..$24
incbin "lvl/settings/024_Set.bin":$23..$24
incbin "lvl/settings/025_Set.bin":$23..$24
incbin "lvl/settings/026_Set.bin":$23..$24
incbin "lvl/settings/027_Set.bin":$23..$24
incbin "lvl/settings/028_Set.bin":$23..$24
incbin "lvl/settings/029_Set.bin":$23..$24
incbin "lvl/settings/02A_Set.bin":$23..$24
incbin "lvl/settings/02B_Set.bin":$23..$24
incbin "lvl/settings/02C_Set.bin":$23..$24
incbin "lvl/settings/02D_Set.bin":$23..$24
incbin "lvl/settings/02E_Set.bin":$23..$24
incbin "lvl/settings/02F_Set.bin":$23..$24
incbin "lvl/settings/030_Set.bin":$23..$24
incbin "lvl/settings/031_Set.bin":$23..$24
incbin "lvl/settings/032_Set.bin":$23..$24
incbin "lvl/settings/033_Set.bin":$23..$24
incbin "lvl/settings/034_Set.bin":$23..$24
incbin "lvl/settings/035_Set.bin":$23..$24
incbin "lvl/settings/036_Set.bin":$23..$24
incbin "lvl/settings/037_Set.bin":$23..$24
incbin "lvl/settings/038_Set.bin":$23..$24
incbin "lvl/settings/039_Set.bin":$23..$24
incbin "lvl/settings/03A_Set.bin":$23..$24
incbin "lvl/settings/03B_Set.bin":$23..$24
incbin "lvl/settings/03C_Set.bin":$23..$24
incbin "lvl/settings/03D_Set.bin":$23..$24
incbin "lvl/settings/03E_Set.bin":$23..$24
incbin "lvl/settings/03F_Set.bin":$23..$24
incbin "lvl/settings/040_Set.bin":$23..$24
incbin "lvl/settings/041_Set.bin":$23..$24
incbin "lvl/settings/042_Set.bin":$23..$24
incbin "lvl/settings/043_Set.bin":$23..$24
incbin "lvl/settings/044_Set.bin":$23..$24
incbin "lvl/settings/045_Set.bin":$23..$24
incbin "lvl/settings/046_Set.bin":$23..$24
incbin "lvl/settings/047_Set.bin":$23..$24
incbin "lvl/settings/048_Set.bin":$23..$24
incbin "lvl/settings/049_Set.bin":$23..$24
incbin "lvl/settings/04A_Set.bin":$23..$24
incbin "lvl/settings/04B_Set.bin":$23..$24
incbin "lvl/settings/04C_Set.bin":$23..$24
incbin "lvl/settings/04D_Set.bin":$23..$24
incbin "lvl/settings/04E_Set.bin":$23..$24
incbin "lvl/settings/04F_Set.bin":$23..$24
incbin "lvl/settings/050_Set.bin":$23..$24
incbin "lvl/settings/051_Set.bin":$23..$24
incbin "lvl/settings/052_Set.bin":$23..$24
incbin "lvl/settings/053_Set.bin":$23..$24
incbin "lvl/settings/054_Set.bin":$23..$24
incbin "lvl/settings/055_Set.bin":$23..$24
incbin "lvl/settings/056_Set.bin":$23..$24
incbin "lvl/settings/057_Set.bin":$23..$24
incbin "lvl/settings/058_Set.bin":$23..$24
incbin "lvl/settings/059_Set.bin":$23..$24
incbin "lvl/settings/05A_Set.bin":$23..$24
incbin "lvl/settings/05B_Set.bin":$23..$24
incbin "lvl/settings/05C_Set.bin":$23..$24
incbin "lvl/settings/05D_Set.bin":$23..$24
incbin "lvl/settings/05E_Set.bin":$23..$24
incbin "lvl/settings/05F_Set.bin":$23..$24
incbin "lvl/settings/060_Set.bin":$23..$24
incbin "lvl/settings/061_Set.bin":$23..$24
incbin "lvl/settings/062_Set.bin":$23..$24
incbin "lvl/settings/063_Set.bin":$23..$24
incbin "lvl/settings/064_Set.bin":$23..$24
incbin "lvl/settings/065_Set.bin":$23..$24
incbin "lvl/settings/066_Set.bin":$23..$24
incbin "lvl/settings/067_Set.bin":$23..$24
incbin "lvl/settings/068_Set.bin":$23..$24
incbin "lvl/settings/069_Set.bin":$23..$24
incbin "lvl/settings/06A_Set.bin":$23..$24
incbin "lvl/settings/06B_Set.bin":$23..$24
incbin "lvl/settings/06C_Set.bin":$23..$24
incbin "lvl/settings/06D_Set.bin":$23..$24
incbin "lvl/settings/06E_Set.bin":$23..$24
incbin "lvl/settings/06F_Set.bin":$23..$24
incbin "lvl/settings/070_Set.bin":$23..$24
incbin "lvl/settings/071_Set.bin":$23..$24
incbin "lvl/settings/072_Set.bin":$23..$24
incbin "lvl/settings/073_Set.bin":$23..$24
incbin "lvl/settings/074_Set.bin":$23..$24
incbin "lvl/settings/075_Set.bin":$23..$24
incbin "lvl/settings/076_Set.bin":$23..$24
incbin "lvl/settings/077_Set.bin":$23..$24
incbin "lvl/settings/078_Set.bin":$23..$24
incbin "lvl/settings/079_Set.bin":$23..$24
incbin "lvl/settings/07A_Set.bin":$23..$24
incbin "lvl/settings/07B_Set.bin":$23..$24
incbin "lvl/settings/07C_Set.bin":$23..$24
incbin "lvl/settings/07D_Set.bin":$23..$24
incbin "lvl/settings/07E_Set.bin":$23..$24
incbin "lvl/settings/07F_Set.bin":$23..$24
incbin "lvl/settings/080_Set.bin":$23..$24
incbin "lvl/settings/081_Set.bin":$23..$24
incbin "lvl/settings/082_Set.bin":$23..$24
incbin "lvl/settings/083_Set.bin":$23..$24
incbin "lvl/settings/084_Set.bin":$23..$24
incbin "lvl/settings/085_Set.bin":$23..$24
incbin "lvl/settings/086_Set.bin":$23..$24
incbin "lvl/settings/087_Set.bin":$23..$24
incbin "lvl/settings/088_Set.bin":$23..$24
incbin "lvl/settings/089_Set.bin":$23..$24
incbin "lvl/settings/08A_Set.bin":$23..$24
incbin "lvl/settings/08B_Set.bin":$23..$24
incbin "lvl/settings/08C_Set.bin":$23..$24
incbin "lvl/settings/08D_Set.bin":$23..$24
incbin "lvl/settings/08E_Set.bin":$23..$24
incbin "lvl/settings/08F_Set.bin":$23..$24
incbin "lvl/settings/090_Set.bin":$23..$24
incbin "lvl/settings/091_Set.bin":$23..$24
incbin "lvl/settings/092_Set.bin":$23..$24
incbin "lvl/settings/093_Set.bin":$23..$24
incbin "lvl/settings/094_Set.bin":$23..$24
incbin "lvl/settings/095_Set.bin":$23..$24
incbin "lvl/settings/096_Set.bin":$23..$24
incbin "lvl/settings/097_Set.bin":$23..$24
incbin "lvl/settings/098_Set.bin":$23..$24
incbin "lvl/settings/099_Set.bin":$23..$24
incbin "lvl/settings/09A_Set.bin":$23..$24
incbin "lvl/settings/09B_Set.bin":$23..$24
incbin "lvl/settings/09C_Set.bin":$23..$24
incbin "lvl/settings/09D_Set.bin":$23..$24
incbin "lvl/settings/09E_Set.bin":$23..$24
incbin "lvl/settings/09F_Set.bin":$23..$24
incbin "lvl/settings/0A0_Set.bin":$23..$24
incbin "lvl/settings/0A1_Set.bin":$23..$24
incbin "lvl/settings/0A2_Set.bin":$23..$24
incbin "lvl/settings/0A3_Set.bin":$23..$24
incbin "lvl/settings/0A4_Set.bin":$23..$24
incbin "lvl/settings/0A5_Set.bin":$23..$24
incbin "lvl/settings/0A6_Set.bin":$23..$24
incbin "lvl/settings/0A7_Set.bin":$23..$24
incbin "lvl/settings/0A8_Set.bin":$23..$24
incbin "lvl/settings/0A9_Set.bin":$23..$24
incbin "lvl/settings/0AA_Set.bin":$23..$24
incbin "lvl/settings/0AB_Set.bin":$23..$24
incbin "lvl/settings/0AC_Set.bin":$23..$24
incbin "lvl/settings/0AD_Set.bin":$23..$24
incbin "lvl/settings/0AE_Set.bin":$23..$24
incbin "lvl/settings/0AF_Set.bin":$23..$24
incbin "lvl/settings/0B0_Set.bin":$23..$24
incbin "lvl/settings/0B1_Set.bin":$23..$24
incbin "lvl/settings/0B2_Set.bin":$23..$24
incbin "lvl/settings/0B3_Set.bin":$23..$24
incbin "lvl/settings/0B4_Set.bin":$23..$24
incbin "lvl/settings/0B5_Set.bin":$23..$24
incbin "lvl/settings/0B6_Set.bin":$23..$24
incbin "lvl/settings/0B7_Set.bin":$23..$24
incbin "lvl/settings/0B8_Set.bin":$23..$24
incbin "lvl/settings/0B9_Set.bin":$23..$24
incbin "lvl/settings/0BA_Set.bin":$23..$24
incbin "lvl/settings/0BB_Set.bin":$23..$24
incbin "lvl/settings/0BC_Set.bin":$23..$24
incbin "lvl/settings/0BD_Set.bin":$23..$24
incbin "lvl/settings/0BE_Set.bin":$23..$24
incbin "lvl/settings/0BF_Set.bin":$23..$24
incbin "lvl/settings/0C0_Set.bin":$23..$24
incbin "lvl/settings/0C1_Set.bin":$23..$24
incbin "lvl/settings/0C2_Set.bin":$23..$24
incbin "lvl/settings/0C3_Set.bin":$23..$24
incbin "lvl/settings/0C4_Set.bin":$23..$24
incbin "lvl/settings/0C5_Set.bin":$23..$24
incbin "lvl/settings/0C6_Set.bin":$23..$24
incbin "lvl/settings/0C7_Set.bin":$23..$24
incbin "lvl/settings/0C8_Set.bin":$23..$24
incbin "lvl/settings/0C9_Set.bin":$23..$24
incbin "lvl/settings/0CA_Set.bin":$23..$24
incbin "lvl/settings/0CB_Set.bin":$23..$24
incbin "lvl/settings/0CC_Set.bin":$23..$24
incbin "lvl/settings/0CD_Set.bin":$23..$24
incbin "lvl/settings/0CE_Set.bin":$23..$24
incbin "lvl/settings/0CF_Set.bin":$23..$24
incbin "lvl/settings/0D0_Set.bin":$23..$24
incbin "lvl/settings/0D1_Set.bin":$23..$24
incbin "lvl/settings/0D2_Set.bin":$23..$24
incbin "lvl/settings/0D3_Set.bin":$23..$24
incbin "lvl/settings/0D4_Set.bin":$23..$24
incbin "lvl/settings/0D5_Set.bin":$23..$24
incbin "lvl/settings/0D6_Set.bin":$23..$24
incbin "lvl/settings/0D7_Set.bin":$23..$24
incbin "lvl/settings/0D8_Set.bin":$23..$24
incbin "lvl/settings/0D9_Set.bin":$23..$24
incbin "lvl/settings/0DA_Set.bin":$23..$24
incbin "lvl/settings/0DB_Set.bin":$23..$24
incbin "lvl/settings/0DC_Set.bin":$23..$24
incbin "lvl/settings/0DD_Set.bin":$23..$24
incbin "lvl/settings/0DE_Set.bin":$23..$24
incbin "lvl/settings/0DF_Set.bin":$23..$24
incbin "lvl/settings/0E0_Set.bin":$23..$24
incbin "lvl/settings/0E1_Set.bin":$23..$24
incbin "lvl/settings/0E2_Set.bin":$23..$24
incbin "lvl/settings/0E3_Set.bin":$23..$24
incbin "lvl/settings/0E4_Set.bin":$23..$24
incbin "lvl/settings/0E5_Set.bin":$23..$24
incbin "lvl/settings/0E6_Set.bin":$23..$24
incbin "lvl/settings/0E7_Set.bin":$23..$24
incbin "lvl/settings/0E8_Set.bin":$23..$24
incbin "lvl/settings/0E9_Set.bin":$23..$24
incbin "lvl/settings/0EA_Set.bin":$23..$24
incbin "lvl/settings/0EB_Set.bin":$23..$24
incbin "lvl/settings/0EC_Set.bin":$23..$24
incbin "lvl/settings/0ED_Set.bin":$23..$24
incbin "lvl/settings/0EE_Set.bin":$23..$24
incbin "lvl/settings/0EF_Set.bin":$23..$24
incbin "lvl/settings/0F0_Set.bin":$23..$24
incbin "lvl/settings/0F1_Set.bin":$23..$24
incbin "lvl/settings/0F2_Set.bin":$23..$24
incbin "lvl/settings/0F3_Set.bin":$23..$24
incbin "lvl/settings/0F4_Set.bin":$23..$24
incbin "lvl/settings/0F5_Set.bin":$23..$24
incbin "lvl/settings/0F6_Set.bin":$23..$24
incbin "lvl/settings/0F7_Set.bin":$23..$24
incbin "lvl/settings/0F8_Set.bin":$23..$24
incbin "lvl/settings/0F9_Set.bin":$23..$24
incbin "lvl/settings/0FA_Set.bin":$23..$24
incbin "lvl/settings/0FB_Set.bin":$23..$24
incbin "lvl/settings/0FC_Set.bin":$23..$24
incbin "lvl/settings/0FD_Set.bin":$23..$24
incbin "lvl/settings/0FE_Set.bin":$23..$24
incbin "lvl/settings/0FF_Set.bin":$23..$24
incbin "lvl/settings/100_Set.bin":$23..$24
incbin "lvl/settings/101_Set.bin":$23..$24
incbin "lvl/settings/102_Set.bin":$23..$24
incbin "lvl/settings/103_Set.bin":$23..$24
incbin "lvl/settings/104_Set.bin":$23..$24
incbin "lvl/settings/105_Set.bin":$23..$24
incbin "lvl/settings/106_Set.bin":$23..$24
incbin "lvl/settings/107_Set.bin":$23..$24
incbin "lvl/settings/108_Set.bin":$23..$24
incbin "lvl/settings/109_Set.bin":$23..$24
incbin "lvl/settings/10A_Set.bin":$23..$24
incbin "lvl/settings/10B_Set.bin":$23..$24
incbin "lvl/settings/10C_Set.bin":$23..$24
incbin "lvl/settings/10D_Set.bin":$23..$24
incbin "lvl/settings/10E_Set.bin":$23..$24
incbin "lvl/settings/10F_Set.bin":$23..$24
incbin "lvl/settings/110_Set.bin":$23..$24
incbin "lvl/settings/111_Set.bin":$23..$24
incbin "lvl/settings/112_Set.bin":$23..$24
incbin "lvl/settings/113_Set.bin":$23..$24
incbin "lvl/settings/114_Set.bin":$23..$24
incbin "lvl/settings/115_Set.bin":$23..$24
incbin "lvl/settings/116_Set.bin":$23..$24
incbin "lvl/settings/117_Set.bin":$23..$24
incbin "lvl/settings/118_Set.bin":$23..$24
incbin "lvl/settings/119_Set.bin":$23..$24
incbin "lvl/settings/11A_Set.bin":$23..$24
incbin "lvl/settings/11B_Set.bin":$23..$24
incbin "lvl/settings/11C_Set.bin":$23..$24
incbin "lvl/settings/11D_Set.bin":$23..$24
incbin "lvl/settings/11E_Set.bin":$23..$24
incbin "lvl/settings/11F_Set.bin":$23..$24
incbin "lvl/settings/120_Set.bin":$23..$24
incbin "lvl/settings/121_Set.bin":$23..$24
incbin "lvl/settings/122_Set.bin":$23..$24
incbin "lvl/settings/123_Set.bin":$23..$24
incbin "lvl/settings/124_Set.bin":$23..$24
incbin "lvl/settings/125_Set.bin":$23..$24
incbin "lvl/settings/126_Set.bin":$23..$24
incbin "lvl/settings/127_Set.bin":$23..$24
incbin "lvl/settings/128_Set.bin":$23..$24
incbin "lvl/settings/129_Set.bin":$23..$24
incbin "lvl/settings/12A_Set.bin":$23..$24
incbin "lvl/settings/12B_Set.bin":$23..$24
incbin "lvl/settings/12C_Set.bin":$23..$24
incbin "lvl/settings/12D_Set.bin":$23..$24
incbin "lvl/settings/12E_Set.bin":$23..$24
incbin "lvl/settings/12F_Set.bin":$23..$24
incbin "lvl/settings/130_Set.bin":$23..$24
incbin "lvl/settings/131_Set.bin":$23..$24
incbin "lvl/settings/132_Set.bin":$23..$24
incbin "lvl/settings/133_Set.bin":$23..$24
incbin "lvl/settings/134_Set.bin":$23..$24
incbin "lvl/settings/135_Set.bin":$23..$24
incbin "lvl/settings/136_Set.bin":$23..$24
incbin "lvl/settings/137_Set.bin":$23..$24
incbin "lvl/settings/138_Set.bin":$23..$24
incbin "lvl/settings/139_Set.bin":$23..$24
incbin "lvl/settings/13A_Set.bin":$23..$24
incbin "lvl/settings/13B_Set.bin":$23..$24
incbin "lvl/settings/13C_Set.bin":$23..$24
incbin "lvl/settings/13D_Set.bin":$23..$24
incbin "lvl/settings/13E_Set.bin":$23..$24
incbin "lvl/settings/13F_Set.bin":$23..$24
incbin "lvl/settings/140_Set.bin":$23..$24
incbin "lvl/settings/141_Set.bin":$23..$24
incbin "lvl/settings/142_Set.bin":$23..$24
incbin "lvl/settings/143_Set.bin":$23..$24
incbin "lvl/settings/144_Set.bin":$23..$24
incbin "lvl/settings/145_Set.bin":$23..$24
incbin "lvl/settings/146_Set.bin":$23..$24
incbin "lvl/settings/147_Set.bin":$23..$24
incbin "lvl/settings/148_Set.bin":$23..$24
incbin "lvl/settings/149_Set.bin":$23..$24
incbin "lvl/settings/14A_Set.bin":$23..$24
incbin "lvl/settings/14B_Set.bin":$23..$24
incbin "lvl/settings/14C_Set.bin":$23..$24
incbin "lvl/settings/14D_Set.bin":$23..$24
incbin "lvl/settings/14E_Set.bin":$23..$24
incbin "lvl/settings/14F_Set.bin":$23..$24
incbin "lvl/settings/150_Set.bin":$23..$24
incbin "lvl/settings/151_Set.bin":$23..$24
incbin "lvl/settings/152_Set.bin":$23..$24
incbin "lvl/settings/153_Set.bin":$23..$24
incbin "lvl/settings/154_Set.bin":$23..$24
incbin "lvl/settings/155_Set.bin":$23..$24
incbin "lvl/settings/156_Set.bin":$23..$24
incbin "lvl/settings/157_Set.bin":$23..$24
incbin "lvl/settings/158_Set.bin":$23..$24
incbin "lvl/settings/159_Set.bin":$23..$24
incbin "lvl/settings/15A_Set.bin":$23..$24
incbin "lvl/settings/15B_Set.bin":$23..$24
incbin "lvl/settings/15C_Set.bin":$23..$24
incbin "lvl/settings/15D_Set.bin":$23..$24
incbin "lvl/settings/15E_Set.bin":$23..$24
incbin "lvl/settings/15F_Set.bin":$23..$24
incbin "lvl/settings/160_Set.bin":$23..$24
incbin "lvl/settings/161_Set.bin":$23..$24
incbin "lvl/settings/162_Set.bin":$23..$24
incbin "lvl/settings/163_Set.bin":$23..$24
incbin "lvl/settings/164_Set.bin":$23..$24
incbin "lvl/settings/165_Set.bin":$23..$24
incbin "lvl/settings/166_Set.bin":$23..$24
incbin "lvl/settings/167_Set.bin":$23..$24
incbin "lvl/settings/168_Set.bin":$23..$24
incbin "lvl/settings/169_Set.bin":$23..$24
incbin "lvl/settings/16A_Set.bin":$23..$24
incbin "lvl/settings/16B_Set.bin":$23..$24
incbin "lvl/settings/16C_Set.bin":$23..$24
incbin "lvl/settings/16D_Set.bin":$23..$24
incbin "lvl/settings/16E_Set.bin":$23..$24
incbin "lvl/settings/16F_Set.bin":$23..$24
incbin "lvl/settings/170_Set.bin":$23..$24
incbin "lvl/settings/171_Set.bin":$23..$24
incbin "lvl/settings/172_Set.bin":$23..$24
incbin "lvl/settings/173_Set.bin":$23..$24
incbin "lvl/settings/174_Set.bin":$23..$24
incbin "lvl/settings/175_Set.bin":$23..$24
incbin "lvl/settings/176_Set.bin":$23..$24
incbin "lvl/settings/177_Set.bin":$23..$24
incbin "lvl/settings/178_Set.bin":$23..$24
incbin "lvl/settings/179_Set.bin":$23..$24
incbin "lvl/settings/17A_Set.bin":$23..$24
incbin "lvl/settings/17B_Set.bin":$23..$24
incbin "lvl/settings/17C_Set.bin":$23..$24
incbin "lvl/settings/17D_Set.bin":$23..$24
incbin "lvl/settings/17E_Set.bin":$23..$24
incbin "lvl/settings/17F_Set.bin":$23..$24
incbin "lvl/settings/180_Set.bin":$23..$24
incbin "lvl/settings/181_Set.bin":$23..$24
incbin "lvl/settings/182_Set.bin":$23..$24
incbin "lvl/settings/183_Set.bin":$23..$24
incbin "lvl/settings/184_Set.bin":$23..$24
incbin "lvl/settings/185_Set.bin":$23..$24
incbin "lvl/settings/186_Set.bin":$23..$24
incbin "lvl/settings/187_Set.bin":$23..$24
incbin "lvl/settings/188_Set.bin":$23..$24
incbin "lvl/settings/189_Set.bin":$23..$24
incbin "lvl/settings/18A_Set.bin":$23..$24
incbin "lvl/settings/18B_Set.bin":$23..$24
incbin "lvl/settings/18C_Set.bin":$23..$24
incbin "lvl/settings/18D_Set.bin":$23..$24
incbin "lvl/settings/18E_Set.bin":$23..$24
incbin "lvl/settings/18F_Set.bin":$23..$24
incbin "lvl/settings/190_Set.bin":$23..$24
incbin "lvl/settings/191_Set.bin":$23..$24
incbin "lvl/settings/192_Set.bin":$23..$24
incbin "lvl/settings/193_Set.bin":$23..$24
incbin "lvl/settings/194_Set.bin":$23..$24
incbin "lvl/settings/195_Set.bin":$23..$24
incbin "lvl/settings/196_Set.bin":$23..$24
incbin "lvl/settings/197_Set.bin":$23..$24
incbin "lvl/settings/198_Set.bin":$23..$24
incbin "lvl/settings/199_Set.bin":$23..$24
incbin "lvl/settings/19A_Set.bin":$23..$24
incbin "lvl/settings/19B_Set.bin":$23..$24
incbin "lvl/settings/19C_Set.bin":$23..$24
incbin "lvl/settings/19D_Set.bin":$23..$24
incbin "lvl/settings/19E_Set.bin":$23..$24
incbin "lvl/settings/19F_Set.bin":$23..$24
incbin "lvl/settings/1A0_Set.bin":$23..$24
incbin "lvl/settings/1A1_Set.bin":$23..$24
incbin "lvl/settings/1A2_Set.bin":$23..$24
incbin "lvl/settings/1A3_Set.bin":$23..$24
incbin "lvl/settings/1A4_Set.bin":$23..$24
incbin "lvl/settings/1A5_Set.bin":$23..$24
incbin "lvl/settings/1A6_Set.bin":$23..$24
incbin "lvl/settings/1A7_Set.bin":$23..$24
incbin "lvl/settings/1A8_Set.bin":$23..$24
incbin "lvl/settings/1A9_Set.bin":$23..$24
incbin "lvl/settings/1AA_Set.bin":$23..$24
incbin "lvl/settings/1AB_Set.bin":$23..$24
incbin "lvl/settings/1AC_Set.bin":$23..$24
incbin "lvl/settings/1AD_Set.bin":$23..$24
incbin "lvl/settings/1AE_Set.bin":$23..$24
incbin "lvl/settings/1AF_Set.bin":$23..$24
incbin "lvl/settings/1B0_Set.bin":$23..$24
incbin "lvl/settings/1B1_Set.bin":$23..$24
incbin "lvl/settings/1B2_Set.bin":$23..$24
incbin "lvl/settings/1B3_Set.bin":$23..$24
incbin "lvl/settings/1B4_Set.bin":$23..$24
incbin "lvl/settings/1B5_Set.bin":$23..$24
incbin "lvl/settings/1B6_Set.bin":$23..$24
incbin "lvl/settings/1B7_Set.bin":$23..$24
incbin "lvl/settings/1B8_Set.bin":$23..$24
incbin "lvl/settings/1B9_Set.bin":$23..$24
incbin "lvl/settings/1BA_Set.bin":$23..$24
incbin "lvl/settings/1BB_Set.bin":$23..$24
incbin "lvl/settings/1BC_Set.bin":$23..$24
incbin "lvl/settings/1BD_Set.bin":$23..$24
incbin "lvl/settings/1BE_Set.bin":$23..$24
incbin "lvl/settings/1BF_Set.bin":$23..$24
incbin "lvl/settings/1C0_Set.bin":$23..$24
incbin "lvl/settings/1C1_Set.bin":$23..$24
incbin "lvl/settings/1C2_Set.bin":$23..$24
incbin "lvl/settings/1C3_Set.bin":$23..$24
incbin "lvl/settings/1C4_Set.bin":$23..$24
incbin "lvl/settings/1C5_Set.bin":$23..$24
incbin "lvl/settings/1C6_Set.bin":$23..$24
incbin "lvl/settings/1C7_Set.bin":$23..$24
incbin "lvl/settings/1C8_Set.bin":$23..$24
incbin "lvl/settings/1C9_Set.bin":$23..$24
incbin "lvl/settings/1CA_Set.bin":$23..$24
incbin "lvl/settings/1CB_Set.bin":$23..$24
incbin "lvl/settings/1CC_Set.bin":$23..$24
incbin "lvl/settings/1CD_Set.bin":$23..$24
incbin "lvl/settings/1CE_Set.bin":$23..$24
incbin "lvl/settings/1CF_Set.bin":$23..$24
incbin "lvl/settings/1D0_Set.bin":$23..$24
incbin "lvl/settings/1D1_Set.bin":$23..$24
incbin "lvl/settings/1D2_Set.bin":$23..$24
incbin "lvl/settings/1D3_Set.bin":$23..$24
incbin "lvl/settings/1D4_Set.bin":$23..$24
incbin "lvl/settings/1D5_Set.bin":$23..$24
incbin "lvl/settings/1D6_Set.bin":$23..$24
incbin "lvl/settings/1D7_Set.bin":$23..$24
incbin "lvl/settings/1D8_Set.bin":$23..$24
incbin "lvl/settings/1D9_Set.bin":$23..$24
incbin "lvl/settings/1DA_Set.bin":$23..$24
incbin "lvl/settings/1DB_Set.bin":$23..$24
incbin "lvl/settings/1DC_Set.bin":$23..$24
incbin "lvl/settings/1DD_Set.bin":$23..$24
incbin "lvl/settings/1DE_Set.bin":$23..$24
incbin "lvl/settings/1DF_Set.bin":$23..$24
incbin "lvl/settings/1E0_Set.bin":$23..$24
incbin "lvl/settings/1E1_Set.bin":$23..$24
incbin "lvl/settings/1E2_Set.bin":$23..$24
incbin "lvl/settings/1E3_Set.bin":$23..$24
incbin "lvl/settings/1E4_Set.bin":$23..$24
incbin "lvl/settings/1E5_Set.bin":$23..$24
incbin "lvl/settings/1E6_Set.bin":$23..$24
incbin "lvl/settings/1E7_Set.bin":$23..$24
incbin "lvl/settings/1E8_Set.bin":$23..$24
incbin "lvl/settings/1E9_Set.bin":$23..$24
incbin "lvl/settings/1EA_Set.bin":$23..$24
incbin "lvl/settings/1EB_Set.bin":$23..$24
incbin "lvl/settings/1EC_Set.bin":$23..$24
incbin "lvl/settings/1ED_Set.bin":$23..$24
incbin "lvl/settings/1EE_Set.bin":$23..$24
incbin "lvl/settings/1EF_Set.bin":$23..$24
incbin "lvl/settings/1F0_Set.bin":$23..$24
incbin "lvl/settings/1F1_Set.bin":$23..$24
incbin "lvl/settings/1F2_Set.bin":$23..$24
incbin "lvl/settings/1F3_Set.bin":$23..$24
incbin "lvl/settings/1F4_Set.bin":$23..$24
incbin "lvl/settings/1F5_Set.bin":$23..$24
incbin "lvl/settings/1F6_Set.bin":$23..$24
incbin "lvl/settings/1F7_Set.bin":$23..$24
incbin "lvl/settings/1F8_Set.bin":$23..$24
incbin "lvl/settings/1F9_Set.bin":$23..$24
incbin "lvl/settings/1FA_Set.bin":$23..$24
incbin "lvl/settings/1FB_Set.bin":$23..$24
incbin "lvl/settings/1FC_Set.bin":$23..$24
incbin "lvl/settings/1FD_Set.bin":$23..$24
incbin "lvl/settings/1FE_Set.bin":$23..$24
incbin "lvl/settings/1FF_Set.bin":$23..$24
.End:

DATA_05F200:
incbin "lvl/settings/000_Set.bin":$24..$25
incbin "lvl/settings/001_Set.bin":$24..$25
incbin "lvl/settings/002_Set.bin":$24..$25
incbin "lvl/settings/003_Set.bin":$24..$25
incbin "lvl/settings/004_Set.bin":$24..$25
incbin "lvl/settings/005_Set.bin":$24..$25
incbin "lvl/settings/006_Set.bin":$24..$25
incbin "lvl/settings/007_Set.bin":$24..$25
incbin "lvl/settings/008_Set.bin":$24..$25
incbin "lvl/settings/009_Set.bin":$24..$25
incbin "lvl/settings/00A_Set.bin":$24..$25
incbin "lvl/settings/00B_Set.bin":$24..$25
incbin "lvl/settings/00C_Set.bin":$24..$25
incbin "lvl/settings/00D_Set.bin":$24..$25
incbin "lvl/settings/00E_Set.bin":$24..$25
incbin "lvl/settings/00F_Set.bin":$24..$25
incbin "lvl/settings/010_Set.bin":$24..$25
incbin "lvl/settings/011_Set.bin":$24..$25
incbin "lvl/settings/012_Set.bin":$24..$25
incbin "lvl/settings/013_Set.bin":$24..$25
incbin "lvl/settings/014_Set.bin":$24..$25
incbin "lvl/settings/015_Set.bin":$24..$25
incbin "lvl/settings/016_Set.bin":$24..$25
incbin "lvl/settings/017_Set.bin":$24..$25
incbin "lvl/settings/018_Set.bin":$24..$25
incbin "lvl/settings/019_Set.bin":$24..$25
incbin "lvl/settings/01A_Set.bin":$24..$25
incbin "lvl/settings/01B_Set.bin":$24..$25
incbin "lvl/settings/01C_Set.bin":$24..$25
incbin "lvl/settings/01D_Set.bin":$24..$25
incbin "lvl/settings/01E_Set.bin":$24..$25
incbin "lvl/settings/01F_Set.bin":$24..$25
incbin "lvl/settings/020_Set.bin":$24..$25
incbin "lvl/settings/021_Set.bin":$24..$25
incbin "lvl/settings/022_Set.bin":$24..$25
incbin "lvl/settings/023_Set.bin":$24..$25
incbin "lvl/settings/024_Set.bin":$24..$25
incbin "lvl/settings/025_Set.bin":$24..$25
incbin "lvl/settings/026_Set.bin":$24..$25
incbin "lvl/settings/027_Set.bin":$24..$25
incbin "lvl/settings/028_Set.bin":$24..$25
incbin "lvl/settings/029_Set.bin":$24..$25
incbin "lvl/settings/02A_Set.bin":$24..$25
incbin "lvl/settings/02B_Set.bin":$24..$25
incbin "lvl/settings/02C_Set.bin":$24..$25
incbin "lvl/settings/02D_Set.bin":$24..$25
incbin "lvl/settings/02E_Set.bin":$24..$25
incbin "lvl/settings/02F_Set.bin":$24..$25
incbin "lvl/settings/030_Set.bin":$24..$25
incbin "lvl/settings/031_Set.bin":$24..$25
incbin "lvl/settings/032_Set.bin":$24..$25
incbin "lvl/settings/033_Set.bin":$24..$25
incbin "lvl/settings/034_Set.bin":$24..$25
incbin "lvl/settings/035_Set.bin":$24..$25
incbin "lvl/settings/036_Set.bin":$24..$25
incbin "lvl/settings/037_Set.bin":$24..$25
incbin "lvl/settings/038_Set.bin":$24..$25
incbin "lvl/settings/039_Set.bin":$24..$25
incbin "lvl/settings/03A_Set.bin":$24..$25
incbin "lvl/settings/03B_Set.bin":$24..$25
incbin "lvl/settings/03C_Set.bin":$24..$25
incbin "lvl/settings/03D_Set.bin":$24..$25
incbin "lvl/settings/03E_Set.bin":$24..$25
incbin "lvl/settings/03F_Set.bin":$24..$25
incbin "lvl/settings/040_Set.bin":$24..$25
incbin "lvl/settings/041_Set.bin":$24..$25
incbin "lvl/settings/042_Set.bin":$24..$25
incbin "lvl/settings/043_Set.bin":$24..$25
incbin "lvl/settings/044_Set.bin":$24..$25
incbin "lvl/settings/045_Set.bin":$24..$25
incbin "lvl/settings/046_Set.bin":$24..$25
incbin "lvl/settings/047_Set.bin":$24..$25
incbin "lvl/settings/048_Set.bin":$24..$25
incbin "lvl/settings/049_Set.bin":$24..$25
incbin "lvl/settings/04A_Set.bin":$24..$25
incbin "lvl/settings/04B_Set.bin":$24..$25
incbin "lvl/settings/04C_Set.bin":$24..$25
incbin "lvl/settings/04D_Set.bin":$24..$25
incbin "lvl/settings/04E_Set.bin":$24..$25
incbin "lvl/settings/04F_Set.bin":$24..$25
incbin "lvl/settings/050_Set.bin":$24..$25
incbin "lvl/settings/051_Set.bin":$24..$25
incbin "lvl/settings/052_Set.bin":$24..$25
incbin "lvl/settings/053_Set.bin":$24..$25
incbin "lvl/settings/054_Set.bin":$24..$25
incbin "lvl/settings/055_Set.bin":$24..$25
incbin "lvl/settings/056_Set.bin":$24..$25
incbin "lvl/settings/057_Set.bin":$24..$25
incbin "lvl/settings/058_Set.bin":$24..$25
incbin "lvl/settings/059_Set.bin":$24..$25
incbin "lvl/settings/05A_Set.bin":$24..$25
incbin "lvl/settings/05B_Set.bin":$24..$25
incbin "lvl/settings/05C_Set.bin":$24..$25
incbin "lvl/settings/05D_Set.bin":$24..$25
incbin "lvl/settings/05E_Set.bin":$24..$25
incbin "lvl/settings/05F_Set.bin":$24..$25
incbin "lvl/settings/060_Set.bin":$24..$25
incbin "lvl/settings/061_Set.bin":$24..$25
incbin "lvl/settings/062_Set.bin":$24..$25
incbin "lvl/settings/063_Set.bin":$24..$25
incbin "lvl/settings/064_Set.bin":$24..$25
incbin "lvl/settings/065_Set.bin":$24..$25
incbin "lvl/settings/066_Set.bin":$24..$25
incbin "lvl/settings/067_Set.bin":$24..$25
incbin "lvl/settings/068_Set.bin":$24..$25
incbin "lvl/settings/069_Set.bin":$24..$25
incbin "lvl/settings/06A_Set.bin":$24..$25
incbin "lvl/settings/06B_Set.bin":$24..$25
incbin "lvl/settings/06C_Set.bin":$24..$25
incbin "lvl/settings/06D_Set.bin":$24..$25
incbin "lvl/settings/06E_Set.bin":$24..$25
incbin "lvl/settings/06F_Set.bin":$24..$25
incbin "lvl/settings/070_Set.bin":$24..$25
incbin "lvl/settings/071_Set.bin":$24..$25
incbin "lvl/settings/072_Set.bin":$24..$25
incbin "lvl/settings/073_Set.bin":$24..$25
incbin "lvl/settings/074_Set.bin":$24..$25
incbin "lvl/settings/075_Set.bin":$24..$25
incbin "lvl/settings/076_Set.bin":$24..$25
incbin "lvl/settings/077_Set.bin":$24..$25
incbin "lvl/settings/078_Set.bin":$24..$25
incbin "lvl/settings/079_Set.bin":$24..$25
incbin "lvl/settings/07A_Set.bin":$24..$25
incbin "lvl/settings/07B_Set.bin":$24..$25
incbin "lvl/settings/07C_Set.bin":$24..$25
incbin "lvl/settings/07D_Set.bin":$24..$25
incbin "lvl/settings/07E_Set.bin":$24..$25
incbin "lvl/settings/07F_Set.bin":$24..$25
incbin "lvl/settings/080_Set.bin":$24..$25
incbin "lvl/settings/081_Set.bin":$24..$25
incbin "lvl/settings/082_Set.bin":$24..$25
incbin "lvl/settings/083_Set.bin":$24..$25
incbin "lvl/settings/084_Set.bin":$24..$25
incbin "lvl/settings/085_Set.bin":$24..$25
incbin "lvl/settings/086_Set.bin":$24..$25
incbin "lvl/settings/087_Set.bin":$24..$25
incbin "lvl/settings/088_Set.bin":$24..$25
incbin "lvl/settings/089_Set.bin":$24..$25
incbin "lvl/settings/08A_Set.bin":$24..$25
incbin "lvl/settings/08B_Set.bin":$24..$25
incbin "lvl/settings/08C_Set.bin":$24..$25
incbin "lvl/settings/08D_Set.bin":$24..$25
incbin "lvl/settings/08E_Set.bin":$24..$25
incbin "lvl/settings/08F_Set.bin":$24..$25
incbin "lvl/settings/090_Set.bin":$24..$25
incbin "lvl/settings/091_Set.bin":$24..$25
incbin "lvl/settings/092_Set.bin":$24..$25
incbin "lvl/settings/093_Set.bin":$24..$25
incbin "lvl/settings/094_Set.bin":$24..$25
incbin "lvl/settings/095_Set.bin":$24..$25
incbin "lvl/settings/096_Set.bin":$24..$25
incbin "lvl/settings/097_Set.bin":$24..$25
incbin "lvl/settings/098_Set.bin":$24..$25
incbin "lvl/settings/099_Set.bin":$24..$25
incbin "lvl/settings/09A_Set.bin":$24..$25
incbin "lvl/settings/09B_Set.bin":$24..$25
incbin "lvl/settings/09C_Set.bin":$24..$25
incbin "lvl/settings/09D_Set.bin":$24..$25
incbin "lvl/settings/09E_Set.bin":$24..$25
incbin "lvl/settings/09F_Set.bin":$24..$25
incbin "lvl/settings/0A0_Set.bin":$24..$25
incbin "lvl/settings/0A1_Set.bin":$24..$25
incbin "lvl/settings/0A2_Set.bin":$24..$25
incbin "lvl/settings/0A3_Set.bin":$24..$25
incbin "lvl/settings/0A4_Set.bin":$24..$25
incbin "lvl/settings/0A5_Set.bin":$24..$25
incbin "lvl/settings/0A6_Set.bin":$24..$25
incbin "lvl/settings/0A7_Set.bin":$24..$25
incbin "lvl/settings/0A8_Set.bin":$24..$25
incbin "lvl/settings/0A9_Set.bin":$24..$25
incbin "lvl/settings/0AA_Set.bin":$24..$25
incbin "lvl/settings/0AB_Set.bin":$24..$25
incbin "lvl/settings/0AC_Set.bin":$24..$25
incbin "lvl/settings/0AD_Set.bin":$24..$25
incbin "lvl/settings/0AE_Set.bin":$24..$25
incbin "lvl/settings/0AF_Set.bin":$24..$25
incbin "lvl/settings/0B0_Set.bin":$24..$25
incbin "lvl/settings/0B1_Set.bin":$24..$25
incbin "lvl/settings/0B2_Set.bin":$24..$25
incbin "lvl/settings/0B3_Set.bin":$24..$25
incbin "lvl/settings/0B4_Set.bin":$24..$25
incbin "lvl/settings/0B5_Set.bin":$24..$25
incbin "lvl/settings/0B6_Set.bin":$24..$25
incbin "lvl/settings/0B7_Set.bin":$24..$25
incbin "lvl/settings/0B8_Set.bin":$24..$25
incbin "lvl/settings/0B9_Set.bin":$24..$25
incbin "lvl/settings/0BA_Set.bin":$24..$25
incbin "lvl/settings/0BB_Set.bin":$24..$25
incbin "lvl/settings/0BC_Set.bin":$24..$25
incbin "lvl/settings/0BD_Set.bin":$24..$25
incbin "lvl/settings/0BE_Set.bin":$24..$25
incbin "lvl/settings/0BF_Set.bin":$24..$25
incbin "lvl/settings/0C0_Set.bin":$24..$25
incbin "lvl/settings/0C1_Set.bin":$24..$25
incbin "lvl/settings/0C2_Set.bin":$24..$25
incbin "lvl/settings/0C3_Set.bin":$24..$25
incbin "lvl/settings/0C4_Set.bin":$24..$25
incbin "lvl/settings/0C5_Set.bin":$24..$25
incbin "lvl/settings/0C6_Set.bin":$24..$25
incbin "lvl/settings/0C7_Set.bin":$24..$25
incbin "lvl/settings/0C8_Set.bin":$24..$25
incbin "lvl/settings/0C9_Set.bin":$24..$25
incbin "lvl/settings/0CA_Set.bin":$24..$25
incbin "lvl/settings/0CB_Set.bin":$24..$25
incbin "lvl/settings/0CC_Set.bin":$24..$25
incbin "lvl/settings/0CD_Set.bin":$24..$25
incbin "lvl/settings/0CE_Set.bin":$24..$25
incbin "lvl/settings/0CF_Set.bin":$24..$25
incbin "lvl/settings/0D0_Set.bin":$24..$25
incbin "lvl/settings/0D1_Set.bin":$24..$25
incbin "lvl/settings/0D2_Set.bin":$24..$25
incbin "lvl/settings/0D3_Set.bin":$24..$25
incbin "lvl/settings/0D4_Set.bin":$24..$25
incbin "lvl/settings/0D5_Set.bin":$24..$25
incbin "lvl/settings/0D6_Set.bin":$24..$25
incbin "lvl/settings/0D7_Set.bin":$24..$25
incbin "lvl/settings/0D8_Set.bin":$24..$25
incbin "lvl/settings/0D9_Set.bin":$24..$25
incbin "lvl/settings/0DA_Set.bin":$24..$25
incbin "lvl/settings/0DB_Set.bin":$24..$25
incbin "lvl/settings/0DC_Set.bin":$24..$25
incbin "lvl/settings/0DD_Set.bin":$24..$25
incbin "lvl/settings/0DE_Set.bin":$24..$25
incbin "lvl/settings/0DF_Set.bin":$24..$25
incbin "lvl/settings/0E0_Set.bin":$24..$25
incbin "lvl/settings/0E1_Set.bin":$24..$25
incbin "lvl/settings/0E2_Set.bin":$24..$25
incbin "lvl/settings/0E3_Set.bin":$24..$25
incbin "lvl/settings/0E4_Set.bin":$24..$25
incbin "lvl/settings/0E5_Set.bin":$24..$25
incbin "lvl/settings/0E6_Set.bin":$24..$25
incbin "lvl/settings/0E7_Set.bin":$24..$25
incbin "lvl/settings/0E8_Set.bin":$24..$25
incbin "lvl/settings/0E9_Set.bin":$24..$25
incbin "lvl/settings/0EA_Set.bin":$24..$25
incbin "lvl/settings/0EB_Set.bin":$24..$25
incbin "lvl/settings/0EC_Set.bin":$24..$25
incbin "lvl/settings/0ED_Set.bin":$24..$25
incbin "lvl/settings/0EE_Set.bin":$24..$25
incbin "lvl/settings/0EF_Set.bin":$24..$25
incbin "lvl/settings/0F0_Set.bin":$24..$25
incbin "lvl/settings/0F1_Set.bin":$24..$25
incbin "lvl/settings/0F2_Set.bin":$24..$25
incbin "lvl/settings/0F3_Set.bin":$24..$25
incbin "lvl/settings/0F4_Set.bin":$24..$25
incbin "lvl/settings/0F5_Set.bin":$24..$25
incbin "lvl/settings/0F6_Set.bin":$24..$25
incbin "lvl/settings/0F7_Set.bin":$24..$25
incbin "lvl/settings/0F8_Set.bin":$24..$25
incbin "lvl/settings/0F9_Set.bin":$24..$25
incbin "lvl/settings/0FA_Set.bin":$24..$25
incbin "lvl/settings/0FB_Set.bin":$24..$25
incbin "lvl/settings/0FC_Set.bin":$24..$25
incbin "lvl/settings/0FD_Set.bin":$24..$25
incbin "lvl/settings/0FE_Set.bin":$24..$25
incbin "lvl/settings/0FF_Set.bin":$24..$25
incbin "lvl/settings/100_Set.bin":$24..$25
incbin "lvl/settings/101_Set.bin":$24..$25
incbin "lvl/settings/102_Set.bin":$24..$25
incbin "lvl/settings/103_Set.bin":$24..$25
incbin "lvl/settings/104_Set.bin":$24..$25
incbin "lvl/settings/105_Set.bin":$24..$25
incbin "lvl/settings/106_Set.bin":$24..$25
incbin "lvl/settings/107_Set.bin":$24..$25
incbin "lvl/settings/108_Set.bin":$24..$25
incbin "lvl/settings/109_Set.bin":$24..$25
incbin "lvl/settings/10A_Set.bin":$24..$25
incbin "lvl/settings/10B_Set.bin":$24..$25
incbin "lvl/settings/10C_Set.bin":$24..$25
incbin "lvl/settings/10D_Set.bin":$24..$25
incbin "lvl/settings/10E_Set.bin":$24..$25
incbin "lvl/settings/10F_Set.bin":$24..$25
incbin "lvl/settings/110_Set.bin":$24..$25
incbin "lvl/settings/111_Set.bin":$24..$25
incbin "lvl/settings/112_Set.bin":$24..$25
incbin "lvl/settings/113_Set.bin":$24..$25
incbin "lvl/settings/114_Set.bin":$24..$25
incbin "lvl/settings/115_Set.bin":$24..$25
incbin "lvl/settings/116_Set.bin":$24..$25
incbin "lvl/settings/117_Set.bin":$24..$25
incbin "lvl/settings/118_Set.bin":$24..$25
incbin "lvl/settings/119_Set.bin":$24..$25
incbin "lvl/settings/11A_Set.bin":$24..$25
incbin "lvl/settings/11B_Set.bin":$24..$25
incbin "lvl/settings/11C_Set.bin":$24..$25
incbin "lvl/settings/11D_Set.bin":$24..$25
incbin "lvl/settings/11E_Set.bin":$24..$25
incbin "lvl/settings/11F_Set.bin":$24..$25
incbin "lvl/settings/120_Set.bin":$24..$25
incbin "lvl/settings/121_Set.bin":$24..$25
incbin "lvl/settings/122_Set.bin":$24..$25
incbin "lvl/settings/123_Set.bin":$24..$25
incbin "lvl/settings/124_Set.bin":$24..$25
incbin "lvl/settings/125_Set.bin":$24..$25
incbin "lvl/settings/126_Set.bin":$24..$25
incbin "lvl/settings/127_Set.bin":$24..$25
incbin "lvl/settings/128_Set.bin":$24..$25
incbin "lvl/settings/129_Set.bin":$24..$25
incbin "lvl/settings/12A_Set.bin":$24..$25
incbin "lvl/settings/12B_Set.bin":$24..$25
incbin "lvl/settings/12C_Set.bin":$24..$25
incbin "lvl/settings/12D_Set.bin":$24..$25
incbin "lvl/settings/12E_Set.bin":$24..$25
incbin "lvl/settings/12F_Set.bin":$24..$25
incbin "lvl/settings/130_Set.bin":$24..$25
incbin "lvl/settings/131_Set.bin":$24..$25
incbin "lvl/settings/132_Set.bin":$24..$25
incbin "lvl/settings/133_Set.bin":$24..$25
incbin "lvl/settings/134_Set.bin":$24..$25
incbin "lvl/settings/135_Set.bin":$24..$25
incbin "lvl/settings/136_Set.bin":$24..$25
incbin "lvl/settings/137_Set.bin":$24..$25
incbin "lvl/settings/138_Set.bin":$24..$25
incbin "lvl/settings/139_Set.bin":$24..$25
incbin "lvl/settings/13A_Set.bin":$24..$25
incbin "lvl/settings/13B_Set.bin":$24..$25
incbin "lvl/settings/13C_Set.bin":$24..$25
incbin "lvl/settings/13D_Set.bin":$24..$25
incbin "lvl/settings/13E_Set.bin":$24..$25
incbin "lvl/settings/13F_Set.bin":$24..$25
incbin "lvl/settings/140_Set.bin":$24..$25
incbin "lvl/settings/141_Set.bin":$24..$25
incbin "lvl/settings/142_Set.bin":$24..$25
incbin "lvl/settings/143_Set.bin":$24..$25
incbin "lvl/settings/144_Set.bin":$24..$25
incbin "lvl/settings/145_Set.bin":$24..$25
incbin "lvl/settings/146_Set.bin":$24..$25
incbin "lvl/settings/147_Set.bin":$24..$25
incbin "lvl/settings/148_Set.bin":$24..$25
incbin "lvl/settings/149_Set.bin":$24..$25
incbin "lvl/settings/14A_Set.bin":$24..$25
incbin "lvl/settings/14B_Set.bin":$24..$25
incbin "lvl/settings/14C_Set.bin":$24..$25
incbin "lvl/settings/14D_Set.bin":$24..$25
incbin "lvl/settings/14E_Set.bin":$24..$25
incbin "lvl/settings/14F_Set.bin":$24..$25
incbin "lvl/settings/150_Set.bin":$24..$25
incbin "lvl/settings/151_Set.bin":$24..$25
incbin "lvl/settings/152_Set.bin":$24..$25
incbin "lvl/settings/153_Set.bin":$24..$25
incbin "lvl/settings/154_Set.bin":$24..$25
incbin "lvl/settings/155_Set.bin":$24..$25
incbin "lvl/settings/156_Set.bin":$24..$25
incbin "lvl/settings/157_Set.bin":$24..$25
incbin "lvl/settings/158_Set.bin":$24..$25
incbin "lvl/settings/159_Set.bin":$24..$25
incbin "lvl/settings/15A_Set.bin":$24..$25
incbin "lvl/settings/15B_Set.bin":$24..$25
incbin "lvl/settings/15C_Set.bin":$24..$25
incbin "lvl/settings/15D_Set.bin":$24..$25
incbin "lvl/settings/15E_Set.bin":$24..$25
incbin "lvl/settings/15F_Set.bin":$24..$25
incbin "lvl/settings/160_Set.bin":$24..$25
incbin "lvl/settings/161_Set.bin":$24..$25
incbin "lvl/settings/162_Set.bin":$24..$25
incbin "lvl/settings/163_Set.bin":$24..$25
incbin "lvl/settings/164_Set.bin":$24..$25
incbin "lvl/settings/165_Set.bin":$24..$25
incbin "lvl/settings/166_Set.bin":$24..$25
incbin "lvl/settings/167_Set.bin":$24..$25
incbin "lvl/settings/168_Set.bin":$24..$25
incbin "lvl/settings/169_Set.bin":$24..$25
incbin "lvl/settings/16A_Set.bin":$24..$25
incbin "lvl/settings/16B_Set.bin":$24..$25
incbin "lvl/settings/16C_Set.bin":$24..$25
incbin "lvl/settings/16D_Set.bin":$24..$25
incbin "lvl/settings/16E_Set.bin":$24..$25
incbin "lvl/settings/16F_Set.bin":$24..$25
incbin "lvl/settings/170_Set.bin":$24..$25
incbin "lvl/settings/171_Set.bin":$24..$25
incbin "lvl/settings/172_Set.bin":$24..$25
incbin "lvl/settings/173_Set.bin":$24..$25
incbin "lvl/settings/174_Set.bin":$24..$25
incbin "lvl/settings/175_Set.bin":$24..$25
incbin "lvl/settings/176_Set.bin":$24..$25
incbin "lvl/settings/177_Set.bin":$24..$25
incbin "lvl/settings/178_Set.bin":$24..$25
incbin "lvl/settings/179_Set.bin":$24..$25
incbin "lvl/settings/17A_Set.bin":$24..$25
incbin "lvl/settings/17B_Set.bin":$24..$25
incbin "lvl/settings/17C_Set.bin":$24..$25
incbin "lvl/settings/17D_Set.bin":$24..$25
incbin "lvl/settings/17E_Set.bin":$24..$25
incbin "lvl/settings/17F_Set.bin":$24..$25
incbin "lvl/settings/180_Set.bin":$24..$25
incbin "lvl/settings/181_Set.bin":$24..$25
incbin "lvl/settings/182_Set.bin":$24..$25
incbin "lvl/settings/183_Set.bin":$24..$25
incbin "lvl/settings/184_Set.bin":$24..$25
incbin "lvl/settings/185_Set.bin":$24..$25
incbin "lvl/settings/186_Set.bin":$24..$25
incbin "lvl/settings/187_Set.bin":$24..$25
incbin "lvl/settings/188_Set.bin":$24..$25
incbin "lvl/settings/189_Set.bin":$24..$25
incbin "lvl/settings/18A_Set.bin":$24..$25
incbin "lvl/settings/18B_Set.bin":$24..$25
incbin "lvl/settings/18C_Set.bin":$24..$25
incbin "lvl/settings/18D_Set.bin":$24..$25
incbin "lvl/settings/18E_Set.bin":$24..$25
incbin "lvl/settings/18F_Set.bin":$24..$25
incbin "lvl/settings/190_Set.bin":$24..$25
incbin "lvl/settings/191_Set.bin":$24..$25
incbin "lvl/settings/192_Set.bin":$24..$25
incbin "lvl/settings/193_Set.bin":$24..$25
incbin "lvl/settings/194_Set.bin":$24..$25
incbin "lvl/settings/195_Set.bin":$24..$25
incbin "lvl/settings/196_Set.bin":$24..$25
incbin "lvl/settings/197_Set.bin":$24..$25
incbin "lvl/settings/198_Set.bin":$24..$25
incbin "lvl/settings/199_Set.bin":$24..$25
incbin "lvl/settings/19A_Set.bin":$24..$25
incbin "lvl/settings/19B_Set.bin":$24..$25
incbin "lvl/settings/19C_Set.bin":$24..$25
incbin "lvl/settings/19D_Set.bin":$24..$25
incbin "lvl/settings/19E_Set.bin":$24..$25
incbin "lvl/settings/19F_Set.bin":$24..$25
incbin "lvl/settings/1A0_Set.bin":$24..$25
incbin "lvl/settings/1A1_Set.bin":$24..$25
incbin "lvl/settings/1A2_Set.bin":$24..$25
incbin "lvl/settings/1A3_Set.bin":$24..$25
incbin "lvl/settings/1A4_Set.bin":$24..$25
incbin "lvl/settings/1A5_Set.bin":$24..$25
incbin "lvl/settings/1A6_Set.bin":$24..$25
incbin "lvl/settings/1A7_Set.bin":$24..$25
incbin "lvl/settings/1A8_Set.bin":$24..$25
incbin "lvl/settings/1A9_Set.bin":$24..$25
incbin "lvl/settings/1AA_Set.bin":$24..$25
incbin "lvl/settings/1AB_Set.bin":$24..$25
incbin "lvl/settings/1AC_Set.bin":$24..$25
incbin "lvl/settings/1AD_Set.bin":$24..$25
incbin "lvl/settings/1AE_Set.bin":$24..$25
incbin "lvl/settings/1AF_Set.bin":$24..$25
incbin "lvl/settings/1B0_Set.bin":$24..$25
incbin "lvl/settings/1B1_Set.bin":$24..$25
incbin "lvl/settings/1B2_Set.bin":$24..$25
incbin "lvl/settings/1B3_Set.bin":$24..$25
incbin "lvl/settings/1B4_Set.bin":$24..$25
incbin "lvl/settings/1B5_Set.bin":$24..$25
incbin "lvl/settings/1B6_Set.bin":$24..$25
incbin "lvl/settings/1B7_Set.bin":$24..$25
incbin "lvl/settings/1B8_Set.bin":$24..$25
incbin "lvl/settings/1B9_Set.bin":$24..$25
incbin "lvl/settings/1BA_Set.bin":$24..$25
incbin "lvl/settings/1BB_Set.bin":$24..$25
incbin "lvl/settings/1BC_Set.bin":$24..$25
incbin "lvl/settings/1BD_Set.bin":$24..$25
incbin "lvl/settings/1BE_Set.bin":$24..$25
incbin "lvl/settings/1BF_Set.bin":$24..$25
incbin "lvl/settings/1C0_Set.bin":$24..$25
incbin "lvl/settings/1C1_Set.bin":$24..$25
incbin "lvl/settings/1C2_Set.bin":$24..$25
incbin "lvl/settings/1C3_Set.bin":$24..$25
incbin "lvl/settings/1C4_Set.bin":$24..$25
incbin "lvl/settings/1C5_Set.bin":$24..$25
incbin "lvl/settings/1C6_Set.bin":$24..$25
incbin "lvl/settings/1C7_Set.bin":$24..$25
incbin "lvl/settings/1C8_Set.bin":$24..$25
incbin "lvl/settings/1C9_Set.bin":$24..$25
incbin "lvl/settings/1CA_Set.bin":$24..$25
incbin "lvl/settings/1CB_Set.bin":$24..$25
incbin "lvl/settings/1CC_Set.bin":$24..$25
incbin "lvl/settings/1CD_Set.bin":$24..$25
incbin "lvl/settings/1CE_Set.bin":$24..$25
incbin "lvl/settings/1CF_Set.bin":$24..$25
incbin "lvl/settings/1D0_Set.bin":$24..$25
incbin "lvl/settings/1D1_Set.bin":$24..$25
incbin "lvl/settings/1D2_Set.bin":$24..$25
incbin "lvl/settings/1D3_Set.bin":$24..$25
incbin "lvl/settings/1D4_Set.bin":$24..$25
incbin "lvl/settings/1D5_Set.bin":$24..$25
incbin "lvl/settings/1D6_Set.bin":$24..$25
incbin "lvl/settings/1D7_Set.bin":$24..$25
incbin "lvl/settings/1D8_Set.bin":$24..$25
incbin "lvl/settings/1D9_Set.bin":$24..$25
incbin "lvl/settings/1DA_Set.bin":$24..$25
incbin "lvl/settings/1DB_Set.bin":$24..$25
incbin "lvl/settings/1DC_Set.bin":$24..$25
incbin "lvl/settings/1DD_Set.bin":$24..$25
incbin "lvl/settings/1DE_Set.bin":$24..$25
incbin "lvl/settings/1DF_Set.bin":$24..$25
incbin "lvl/settings/1E0_Set.bin":$24..$25
incbin "lvl/settings/1E1_Set.bin":$24..$25
incbin "lvl/settings/1E2_Set.bin":$24..$25
incbin "lvl/settings/1E3_Set.bin":$24..$25
incbin "lvl/settings/1E4_Set.bin":$24..$25
incbin "lvl/settings/1E5_Set.bin":$24..$25
incbin "lvl/settings/1E6_Set.bin":$24..$25
incbin "lvl/settings/1E7_Set.bin":$24..$25
incbin "lvl/settings/1E8_Set.bin":$24..$25
incbin "lvl/settings/1E9_Set.bin":$24..$25
incbin "lvl/settings/1EA_Set.bin":$24..$25
incbin "lvl/settings/1EB_Set.bin":$24..$25
incbin "lvl/settings/1EC_Set.bin":$24..$25
incbin "lvl/settings/1ED_Set.bin":$24..$25
incbin "lvl/settings/1EE_Set.bin":$24..$25
incbin "lvl/settings/1EF_Set.bin":$24..$25
incbin "lvl/settings/1F0_Set.bin":$24..$25
incbin "lvl/settings/1F1_Set.bin":$24..$25
incbin "lvl/settings/1F2_Set.bin":$24..$25
incbin "lvl/settings/1F3_Set.bin":$24..$25
incbin "lvl/settings/1F4_Set.bin":$24..$25
incbin "lvl/settings/1F5_Set.bin":$24..$25
incbin "lvl/settings/1F6_Set.bin":$24..$25
incbin "lvl/settings/1F7_Set.bin":$24..$25
incbin "lvl/settings/1F8_Set.bin":$24..$25
incbin "lvl/settings/1F9_Set.bin":$24..$25
incbin "lvl/settings/1FA_Set.bin":$24..$25
incbin "lvl/settings/1FB_Set.bin":$24..$25
incbin "lvl/settings/1FC_Set.bin":$24..$25
incbin "lvl/settings/1FD_Set.bin":$24..$25
incbin "lvl/settings/1FE_Set.bin":$24..$25
incbin "lvl/settings/1FF_Set.bin":$24..$25
.End:

DATA_05F400:
incbin "lvl/settings/000_Set.bin":$25..$26
incbin "lvl/settings/001_Set.bin":$25..$26
incbin "lvl/settings/002_Set.bin":$25..$26
incbin "lvl/settings/003_Set.bin":$25..$26
incbin "lvl/settings/004_Set.bin":$25..$26
incbin "lvl/settings/005_Set.bin":$25..$26
incbin "lvl/settings/006_Set.bin":$25..$26
incbin "lvl/settings/007_Set.bin":$25..$26
incbin "lvl/settings/008_Set.bin":$25..$26
incbin "lvl/settings/009_Set.bin":$25..$26
incbin "lvl/settings/00A_Set.bin":$25..$26
incbin "lvl/settings/00B_Set.bin":$25..$26
incbin "lvl/settings/00C_Set.bin":$25..$26
incbin "lvl/settings/00D_Set.bin":$25..$26
incbin "lvl/settings/00E_Set.bin":$25..$26
incbin "lvl/settings/00F_Set.bin":$25..$26
incbin "lvl/settings/010_Set.bin":$25..$26
incbin "lvl/settings/011_Set.bin":$25..$26
incbin "lvl/settings/012_Set.bin":$25..$26
incbin "lvl/settings/013_Set.bin":$25..$26
incbin "lvl/settings/014_Set.bin":$25..$26
incbin "lvl/settings/015_Set.bin":$25..$26
incbin "lvl/settings/016_Set.bin":$25..$26
incbin "lvl/settings/017_Set.bin":$25..$26
incbin "lvl/settings/018_Set.bin":$25..$26
incbin "lvl/settings/019_Set.bin":$25..$26
incbin "lvl/settings/01A_Set.bin":$25..$26
incbin "lvl/settings/01B_Set.bin":$25..$26
incbin "lvl/settings/01C_Set.bin":$25..$26
incbin "lvl/settings/01D_Set.bin":$25..$26
incbin "lvl/settings/01E_Set.bin":$25..$26
incbin "lvl/settings/01F_Set.bin":$25..$26
incbin "lvl/settings/020_Set.bin":$25..$26
incbin "lvl/settings/021_Set.bin":$25..$26
incbin "lvl/settings/022_Set.bin":$25..$26
incbin "lvl/settings/023_Set.bin":$25..$26
incbin "lvl/settings/024_Set.bin":$25..$26
incbin "lvl/settings/025_Set.bin":$25..$26
incbin "lvl/settings/026_Set.bin":$25..$26
incbin "lvl/settings/027_Set.bin":$25..$26
incbin "lvl/settings/028_Set.bin":$25..$26
incbin "lvl/settings/029_Set.bin":$25..$26
incbin "lvl/settings/02A_Set.bin":$25..$26
incbin "lvl/settings/02B_Set.bin":$25..$26
incbin "lvl/settings/02C_Set.bin":$25..$26
incbin "lvl/settings/02D_Set.bin":$25..$26
incbin "lvl/settings/02E_Set.bin":$25..$26
incbin "lvl/settings/02F_Set.bin":$25..$26
incbin "lvl/settings/030_Set.bin":$25..$26
incbin "lvl/settings/031_Set.bin":$25..$26
incbin "lvl/settings/032_Set.bin":$25..$26
incbin "lvl/settings/033_Set.bin":$25..$26
incbin "lvl/settings/034_Set.bin":$25..$26
incbin "lvl/settings/035_Set.bin":$25..$26
incbin "lvl/settings/036_Set.bin":$25..$26
incbin "lvl/settings/037_Set.bin":$25..$26
incbin "lvl/settings/038_Set.bin":$25..$26
incbin "lvl/settings/039_Set.bin":$25..$26
incbin "lvl/settings/03A_Set.bin":$25..$26
incbin "lvl/settings/03B_Set.bin":$25..$26
incbin "lvl/settings/03C_Set.bin":$25..$26
incbin "lvl/settings/03D_Set.bin":$25..$26
incbin "lvl/settings/03E_Set.bin":$25..$26
incbin "lvl/settings/03F_Set.bin":$25..$26
incbin "lvl/settings/040_Set.bin":$25..$26
incbin "lvl/settings/041_Set.bin":$25..$26
incbin "lvl/settings/042_Set.bin":$25..$26
incbin "lvl/settings/043_Set.bin":$25..$26
incbin "lvl/settings/044_Set.bin":$25..$26
incbin "lvl/settings/045_Set.bin":$25..$26
incbin "lvl/settings/046_Set.bin":$25..$26
incbin "lvl/settings/047_Set.bin":$25..$26
incbin "lvl/settings/048_Set.bin":$25..$26
incbin "lvl/settings/049_Set.bin":$25..$26
incbin "lvl/settings/04A_Set.bin":$25..$26
incbin "lvl/settings/04B_Set.bin":$25..$26
incbin "lvl/settings/04C_Set.bin":$25..$26
incbin "lvl/settings/04D_Set.bin":$25..$26
incbin "lvl/settings/04E_Set.bin":$25..$26
incbin "lvl/settings/04F_Set.bin":$25..$26
incbin "lvl/settings/050_Set.bin":$25..$26
incbin "lvl/settings/051_Set.bin":$25..$26
incbin "lvl/settings/052_Set.bin":$25..$26
incbin "lvl/settings/053_Set.bin":$25..$26
incbin "lvl/settings/054_Set.bin":$25..$26
incbin "lvl/settings/055_Set.bin":$25..$26
incbin "lvl/settings/056_Set.bin":$25..$26
incbin "lvl/settings/057_Set.bin":$25..$26
incbin "lvl/settings/058_Set.bin":$25..$26
incbin "lvl/settings/059_Set.bin":$25..$26
incbin "lvl/settings/05A_Set.bin":$25..$26
incbin "lvl/settings/05B_Set.bin":$25..$26
incbin "lvl/settings/05C_Set.bin":$25..$26
incbin "lvl/settings/05D_Set.bin":$25..$26
incbin "lvl/settings/05E_Set.bin":$25..$26
incbin "lvl/settings/05F_Set.bin":$25..$26
incbin "lvl/settings/060_Set.bin":$25..$26
incbin "lvl/settings/061_Set.bin":$25..$26
incbin "lvl/settings/062_Set.bin":$25..$26
incbin "lvl/settings/063_Set.bin":$25..$26
incbin "lvl/settings/064_Set.bin":$25..$26
incbin "lvl/settings/065_Set.bin":$25..$26
incbin "lvl/settings/066_Set.bin":$25..$26
incbin "lvl/settings/067_Set.bin":$25..$26
incbin "lvl/settings/068_Set.bin":$25..$26
incbin "lvl/settings/069_Set.bin":$25..$26
incbin "lvl/settings/06A_Set.bin":$25..$26
incbin "lvl/settings/06B_Set.bin":$25..$26
incbin "lvl/settings/06C_Set.bin":$25..$26
incbin "lvl/settings/06D_Set.bin":$25..$26
incbin "lvl/settings/06E_Set.bin":$25..$26
incbin "lvl/settings/06F_Set.bin":$25..$26
incbin "lvl/settings/070_Set.bin":$25..$26
incbin "lvl/settings/071_Set.bin":$25..$26
incbin "lvl/settings/072_Set.bin":$25..$26
incbin "lvl/settings/073_Set.bin":$25..$26
incbin "lvl/settings/074_Set.bin":$25..$26
incbin "lvl/settings/075_Set.bin":$25..$26
incbin "lvl/settings/076_Set.bin":$25..$26
incbin "lvl/settings/077_Set.bin":$25..$26
incbin "lvl/settings/078_Set.bin":$25..$26
incbin "lvl/settings/079_Set.bin":$25..$26
incbin "lvl/settings/07A_Set.bin":$25..$26
incbin "lvl/settings/07B_Set.bin":$25..$26
incbin "lvl/settings/07C_Set.bin":$25..$26
incbin "lvl/settings/07D_Set.bin":$25..$26
incbin "lvl/settings/07E_Set.bin":$25..$26
incbin "lvl/settings/07F_Set.bin":$25..$26
incbin "lvl/settings/080_Set.bin":$25..$26
incbin "lvl/settings/081_Set.bin":$25..$26
incbin "lvl/settings/082_Set.bin":$25..$26
incbin "lvl/settings/083_Set.bin":$25..$26
incbin "lvl/settings/084_Set.bin":$25..$26
incbin "lvl/settings/085_Set.bin":$25..$26
incbin "lvl/settings/086_Set.bin":$25..$26
incbin "lvl/settings/087_Set.bin":$25..$26
incbin "lvl/settings/088_Set.bin":$25..$26
incbin "lvl/settings/089_Set.bin":$25..$26
incbin "lvl/settings/08A_Set.bin":$25..$26
incbin "lvl/settings/08B_Set.bin":$25..$26
incbin "lvl/settings/08C_Set.bin":$25..$26
incbin "lvl/settings/08D_Set.bin":$25..$26
incbin "lvl/settings/08E_Set.bin":$25..$26
incbin "lvl/settings/08F_Set.bin":$25..$26
incbin "lvl/settings/090_Set.bin":$25..$26
incbin "lvl/settings/091_Set.bin":$25..$26
incbin "lvl/settings/092_Set.bin":$25..$26
incbin "lvl/settings/093_Set.bin":$25..$26
incbin "lvl/settings/094_Set.bin":$25..$26
incbin "lvl/settings/095_Set.bin":$25..$26
incbin "lvl/settings/096_Set.bin":$25..$26
incbin "lvl/settings/097_Set.bin":$25..$26
incbin "lvl/settings/098_Set.bin":$25..$26
incbin "lvl/settings/099_Set.bin":$25..$26
incbin "lvl/settings/09A_Set.bin":$25..$26
incbin "lvl/settings/09B_Set.bin":$25..$26
incbin "lvl/settings/09C_Set.bin":$25..$26
incbin "lvl/settings/09D_Set.bin":$25..$26
incbin "lvl/settings/09E_Set.bin":$25..$26
incbin "lvl/settings/09F_Set.bin":$25..$26
incbin "lvl/settings/0A0_Set.bin":$25..$26
incbin "lvl/settings/0A1_Set.bin":$25..$26
incbin "lvl/settings/0A2_Set.bin":$25..$26
incbin "lvl/settings/0A3_Set.bin":$25..$26
incbin "lvl/settings/0A4_Set.bin":$25..$26
incbin "lvl/settings/0A5_Set.bin":$25..$26
incbin "lvl/settings/0A6_Set.bin":$25..$26
incbin "lvl/settings/0A7_Set.bin":$25..$26
incbin "lvl/settings/0A8_Set.bin":$25..$26
incbin "lvl/settings/0A9_Set.bin":$25..$26
incbin "lvl/settings/0AA_Set.bin":$25..$26
incbin "lvl/settings/0AB_Set.bin":$25..$26
incbin "lvl/settings/0AC_Set.bin":$25..$26
incbin "lvl/settings/0AD_Set.bin":$25..$26
incbin "lvl/settings/0AE_Set.bin":$25..$26
incbin "lvl/settings/0AF_Set.bin":$25..$26
incbin "lvl/settings/0B0_Set.bin":$25..$26
incbin "lvl/settings/0B1_Set.bin":$25..$26
incbin "lvl/settings/0B2_Set.bin":$25..$26
incbin "lvl/settings/0B3_Set.bin":$25..$26
incbin "lvl/settings/0B4_Set.bin":$25..$26
incbin "lvl/settings/0B5_Set.bin":$25..$26
incbin "lvl/settings/0B6_Set.bin":$25..$26
incbin "lvl/settings/0B7_Set.bin":$25..$26
incbin "lvl/settings/0B8_Set.bin":$25..$26
incbin "lvl/settings/0B9_Set.bin":$25..$26
incbin "lvl/settings/0BA_Set.bin":$25..$26
incbin "lvl/settings/0BB_Set.bin":$25..$26
incbin "lvl/settings/0BC_Set.bin":$25..$26
incbin "lvl/settings/0BD_Set.bin":$25..$26
incbin "lvl/settings/0BE_Set.bin":$25..$26
incbin "lvl/settings/0BF_Set.bin":$25..$26
incbin "lvl/settings/0C0_Set.bin":$25..$26
incbin "lvl/settings/0C1_Set.bin":$25..$26
incbin "lvl/settings/0C2_Set.bin":$25..$26
incbin "lvl/settings/0C3_Set.bin":$25..$26
incbin "lvl/settings/0C4_Set.bin":$25..$26
incbin "lvl/settings/0C5_Set.bin":$25..$26
incbin "lvl/settings/0C6_Set.bin":$25..$26
incbin "lvl/settings/0C7_Set.bin":$25..$26
incbin "lvl/settings/0C8_Set.bin":$25..$26
incbin "lvl/settings/0C9_Set.bin":$25..$26
incbin "lvl/settings/0CA_Set.bin":$25..$26
incbin "lvl/settings/0CB_Set.bin":$25..$26
incbin "lvl/settings/0CC_Set.bin":$25..$26
incbin "lvl/settings/0CD_Set.bin":$25..$26
incbin "lvl/settings/0CE_Set.bin":$25..$26
incbin "lvl/settings/0CF_Set.bin":$25..$26
incbin "lvl/settings/0D0_Set.bin":$25..$26
incbin "lvl/settings/0D1_Set.bin":$25..$26
incbin "lvl/settings/0D2_Set.bin":$25..$26
incbin "lvl/settings/0D3_Set.bin":$25..$26
incbin "lvl/settings/0D4_Set.bin":$25..$26
incbin "lvl/settings/0D5_Set.bin":$25..$26
incbin "lvl/settings/0D6_Set.bin":$25..$26
incbin "lvl/settings/0D7_Set.bin":$25..$26
incbin "lvl/settings/0D8_Set.bin":$25..$26
incbin "lvl/settings/0D9_Set.bin":$25..$26
incbin "lvl/settings/0DA_Set.bin":$25..$26
incbin "lvl/settings/0DB_Set.bin":$25..$26
incbin "lvl/settings/0DC_Set.bin":$25..$26
incbin "lvl/settings/0DD_Set.bin":$25..$26
incbin "lvl/settings/0DE_Set.bin":$25..$26
incbin "lvl/settings/0DF_Set.bin":$25..$26
incbin "lvl/settings/0E0_Set.bin":$25..$26
incbin "lvl/settings/0E1_Set.bin":$25..$26
incbin "lvl/settings/0E2_Set.bin":$25..$26
incbin "lvl/settings/0E3_Set.bin":$25..$26
incbin "lvl/settings/0E4_Set.bin":$25..$26
incbin "lvl/settings/0E5_Set.bin":$25..$26
incbin "lvl/settings/0E6_Set.bin":$25..$26
incbin "lvl/settings/0E7_Set.bin":$25..$26
incbin "lvl/settings/0E8_Set.bin":$25..$26
incbin "lvl/settings/0E9_Set.bin":$25..$26
incbin "lvl/settings/0EA_Set.bin":$25..$26
incbin "lvl/settings/0EB_Set.bin":$25..$26
incbin "lvl/settings/0EC_Set.bin":$25..$26
incbin "lvl/settings/0ED_Set.bin":$25..$26
incbin "lvl/settings/0EE_Set.bin":$25..$26
incbin "lvl/settings/0EF_Set.bin":$25..$26
incbin "lvl/settings/0F0_Set.bin":$25..$26
incbin "lvl/settings/0F1_Set.bin":$25..$26
incbin "lvl/settings/0F2_Set.bin":$25..$26
incbin "lvl/settings/0F3_Set.bin":$25..$26
incbin "lvl/settings/0F4_Set.bin":$25..$26
incbin "lvl/settings/0F5_Set.bin":$25..$26
incbin "lvl/settings/0F6_Set.bin":$25..$26
incbin "lvl/settings/0F7_Set.bin":$25..$26
incbin "lvl/settings/0F8_Set.bin":$25..$26
incbin "lvl/settings/0F9_Set.bin":$25..$26
incbin "lvl/settings/0FA_Set.bin":$25..$26
incbin "lvl/settings/0FB_Set.bin":$25..$26
incbin "lvl/settings/0FC_Set.bin":$25..$26
incbin "lvl/settings/0FD_Set.bin":$25..$26
incbin "lvl/settings/0FE_Set.bin":$25..$26
incbin "lvl/settings/0FF_Set.bin":$25..$26
incbin "lvl/settings/100_Set.bin":$25..$26
incbin "lvl/settings/101_Set.bin":$25..$26
incbin "lvl/settings/102_Set.bin":$25..$26
incbin "lvl/settings/103_Set.bin":$25..$26
incbin "lvl/settings/104_Set.bin":$25..$26
incbin "lvl/settings/105_Set.bin":$25..$26
incbin "lvl/settings/106_Set.bin":$25..$26
incbin "lvl/settings/107_Set.bin":$25..$26
incbin "lvl/settings/108_Set.bin":$25..$26
incbin "lvl/settings/109_Set.bin":$25..$26
incbin "lvl/settings/10A_Set.bin":$25..$26
incbin "lvl/settings/10B_Set.bin":$25..$26
incbin "lvl/settings/10C_Set.bin":$25..$26
incbin "lvl/settings/10D_Set.bin":$25..$26
incbin "lvl/settings/10E_Set.bin":$25..$26
incbin "lvl/settings/10F_Set.bin":$25..$26
incbin "lvl/settings/110_Set.bin":$25..$26
incbin "lvl/settings/111_Set.bin":$25..$26
incbin "lvl/settings/112_Set.bin":$25..$26
incbin "lvl/settings/113_Set.bin":$25..$26
incbin "lvl/settings/114_Set.bin":$25..$26
incbin "lvl/settings/115_Set.bin":$25..$26
incbin "lvl/settings/116_Set.bin":$25..$26
incbin "lvl/settings/117_Set.bin":$25..$26
incbin "lvl/settings/118_Set.bin":$25..$26
incbin "lvl/settings/119_Set.bin":$25..$26
incbin "lvl/settings/11A_Set.bin":$25..$26
incbin "lvl/settings/11B_Set.bin":$25..$26
incbin "lvl/settings/11C_Set.bin":$25..$26
incbin "lvl/settings/11D_Set.bin":$25..$26
incbin "lvl/settings/11E_Set.bin":$25..$26
incbin "lvl/settings/11F_Set.bin":$25..$26
incbin "lvl/settings/120_Set.bin":$25..$26
incbin "lvl/settings/121_Set.bin":$25..$26
incbin "lvl/settings/122_Set.bin":$25..$26
incbin "lvl/settings/123_Set.bin":$25..$26
incbin "lvl/settings/124_Set.bin":$25..$26
incbin "lvl/settings/125_Set.bin":$25..$26
incbin "lvl/settings/126_Set.bin":$25..$26
incbin "lvl/settings/127_Set.bin":$25..$26
incbin "lvl/settings/128_Set.bin":$25..$26
incbin "lvl/settings/129_Set.bin":$25..$26
incbin "lvl/settings/12A_Set.bin":$25..$26
incbin "lvl/settings/12B_Set.bin":$25..$26
incbin "lvl/settings/12C_Set.bin":$25..$26
incbin "lvl/settings/12D_Set.bin":$25..$26
incbin "lvl/settings/12E_Set.bin":$25..$26
incbin "lvl/settings/12F_Set.bin":$25..$26
incbin "lvl/settings/130_Set.bin":$25..$26
incbin "lvl/settings/131_Set.bin":$25..$26
incbin "lvl/settings/132_Set.bin":$25..$26
incbin "lvl/settings/133_Set.bin":$25..$26
incbin "lvl/settings/134_Set.bin":$25..$26
incbin "lvl/settings/135_Set.bin":$25..$26
incbin "lvl/settings/136_Set.bin":$25..$26
incbin "lvl/settings/137_Set.bin":$25..$26
incbin "lvl/settings/138_Set.bin":$25..$26
incbin "lvl/settings/139_Set.bin":$25..$26
incbin "lvl/settings/13A_Set.bin":$25..$26
incbin "lvl/settings/13B_Set.bin":$25..$26
incbin "lvl/settings/13C_Set.bin":$25..$26
incbin "lvl/settings/13D_Set.bin":$25..$26
incbin "lvl/settings/13E_Set.bin":$25..$26
incbin "lvl/settings/13F_Set.bin":$25..$26
incbin "lvl/settings/140_Set.bin":$25..$26
incbin "lvl/settings/141_Set.bin":$25..$26
incbin "lvl/settings/142_Set.bin":$25..$26
incbin "lvl/settings/143_Set.bin":$25..$26
incbin "lvl/settings/144_Set.bin":$25..$26
incbin "lvl/settings/145_Set.bin":$25..$26
incbin "lvl/settings/146_Set.bin":$25..$26
incbin "lvl/settings/147_Set.bin":$25..$26
incbin "lvl/settings/148_Set.bin":$25..$26
incbin "lvl/settings/149_Set.bin":$25..$26
incbin "lvl/settings/14A_Set.bin":$25..$26
incbin "lvl/settings/14B_Set.bin":$25..$26
incbin "lvl/settings/14C_Set.bin":$25..$26
incbin "lvl/settings/14D_Set.bin":$25..$26
incbin "lvl/settings/14E_Set.bin":$25..$26
incbin "lvl/settings/14F_Set.bin":$25..$26
incbin "lvl/settings/150_Set.bin":$25..$26
incbin "lvl/settings/151_Set.bin":$25..$26
incbin "lvl/settings/152_Set.bin":$25..$26
incbin "lvl/settings/153_Set.bin":$25..$26
incbin "lvl/settings/154_Set.bin":$25..$26
incbin "lvl/settings/155_Set.bin":$25..$26
incbin "lvl/settings/156_Set.bin":$25..$26
incbin "lvl/settings/157_Set.bin":$25..$26
incbin "lvl/settings/158_Set.bin":$25..$26
incbin "lvl/settings/159_Set.bin":$25..$26
incbin "lvl/settings/15A_Set.bin":$25..$26
incbin "lvl/settings/15B_Set.bin":$25..$26
incbin "lvl/settings/15C_Set.bin":$25..$26
incbin "lvl/settings/15D_Set.bin":$25..$26
incbin "lvl/settings/15E_Set.bin":$25..$26
incbin "lvl/settings/15F_Set.bin":$25..$26
incbin "lvl/settings/160_Set.bin":$25..$26
incbin "lvl/settings/161_Set.bin":$25..$26
incbin "lvl/settings/162_Set.bin":$25..$26
incbin "lvl/settings/163_Set.bin":$25..$26
incbin "lvl/settings/164_Set.bin":$25..$26
incbin "lvl/settings/165_Set.bin":$25..$26
incbin "lvl/settings/166_Set.bin":$25..$26
incbin "lvl/settings/167_Set.bin":$25..$26
incbin "lvl/settings/168_Set.bin":$25..$26
incbin "lvl/settings/169_Set.bin":$25..$26
incbin "lvl/settings/16A_Set.bin":$25..$26
incbin "lvl/settings/16B_Set.bin":$25..$26
incbin "lvl/settings/16C_Set.bin":$25..$26
incbin "lvl/settings/16D_Set.bin":$25..$26
incbin "lvl/settings/16E_Set.bin":$25..$26
incbin "lvl/settings/16F_Set.bin":$25..$26
incbin "lvl/settings/170_Set.bin":$25..$26
incbin "lvl/settings/171_Set.bin":$25..$26
incbin "lvl/settings/172_Set.bin":$25..$26
incbin "lvl/settings/173_Set.bin":$25..$26
incbin "lvl/settings/174_Set.bin":$25..$26
incbin "lvl/settings/175_Set.bin":$25..$26
incbin "lvl/settings/176_Set.bin":$25..$26
incbin "lvl/settings/177_Set.bin":$25..$26
incbin "lvl/settings/178_Set.bin":$25..$26
incbin "lvl/settings/179_Set.bin":$25..$26
incbin "lvl/settings/17A_Set.bin":$25..$26
incbin "lvl/settings/17B_Set.bin":$25..$26
incbin "lvl/settings/17C_Set.bin":$25..$26
incbin "lvl/settings/17D_Set.bin":$25..$26
incbin "lvl/settings/17E_Set.bin":$25..$26
incbin "lvl/settings/17F_Set.bin":$25..$26
incbin "lvl/settings/180_Set.bin":$25..$26
incbin "lvl/settings/181_Set.bin":$25..$26
incbin "lvl/settings/182_Set.bin":$25..$26
incbin "lvl/settings/183_Set.bin":$25..$26
incbin "lvl/settings/184_Set.bin":$25..$26
incbin "lvl/settings/185_Set.bin":$25..$26
incbin "lvl/settings/186_Set.bin":$25..$26
incbin "lvl/settings/187_Set.bin":$25..$26
incbin "lvl/settings/188_Set.bin":$25..$26
incbin "lvl/settings/189_Set.bin":$25..$26
incbin "lvl/settings/18A_Set.bin":$25..$26
incbin "lvl/settings/18B_Set.bin":$25..$26
incbin "lvl/settings/18C_Set.bin":$25..$26
incbin "lvl/settings/18D_Set.bin":$25..$26
incbin "lvl/settings/18E_Set.bin":$25..$26
incbin "lvl/settings/18F_Set.bin":$25..$26
incbin "lvl/settings/190_Set.bin":$25..$26
incbin "lvl/settings/191_Set.bin":$25..$26
incbin "lvl/settings/192_Set.bin":$25..$26
incbin "lvl/settings/193_Set.bin":$25..$26
incbin "lvl/settings/194_Set.bin":$25..$26
incbin "lvl/settings/195_Set.bin":$25..$26
incbin "lvl/settings/196_Set.bin":$25..$26
incbin "lvl/settings/197_Set.bin":$25..$26
incbin "lvl/settings/198_Set.bin":$25..$26
incbin "lvl/settings/199_Set.bin":$25..$26
incbin "lvl/settings/19A_Set.bin":$25..$26
incbin "lvl/settings/19B_Set.bin":$25..$26
incbin "lvl/settings/19C_Set.bin":$25..$26
incbin "lvl/settings/19D_Set.bin":$25..$26
incbin "lvl/settings/19E_Set.bin":$25..$26
incbin "lvl/settings/19F_Set.bin":$25..$26
incbin "lvl/settings/1A0_Set.bin":$25..$26
incbin "lvl/settings/1A1_Set.bin":$25..$26
incbin "lvl/settings/1A2_Set.bin":$25..$26
incbin "lvl/settings/1A3_Set.bin":$25..$26
incbin "lvl/settings/1A4_Set.bin":$25..$26
incbin "lvl/settings/1A5_Set.bin":$25..$26
incbin "lvl/settings/1A6_Set.bin":$25..$26
incbin "lvl/settings/1A7_Set.bin":$25..$26
incbin "lvl/settings/1A8_Set.bin":$25..$26
incbin "lvl/settings/1A9_Set.bin":$25..$26
incbin "lvl/settings/1AA_Set.bin":$25..$26
incbin "lvl/settings/1AB_Set.bin":$25..$26
incbin "lvl/settings/1AC_Set.bin":$25..$26
incbin "lvl/settings/1AD_Set.bin":$25..$26
incbin "lvl/settings/1AE_Set.bin":$25..$26
incbin "lvl/settings/1AF_Set.bin":$25..$26
incbin "lvl/settings/1B0_Set.bin":$25..$26
incbin "lvl/settings/1B1_Set.bin":$25..$26
incbin "lvl/settings/1B2_Set.bin":$25..$26
incbin "lvl/settings/1B3_Set.bin":$25..$26
incbin "lvl/settings/1B4_Set.bin":$25..$26
incbin "lvl/settings/1B5_Set.bin":$25..$26
incbin "lvl/settings/1B6_Set.bin":$25..$26
incbin "lvl/settings/1B7_Set.bin":$25..$26
incbin "lvl/settings/1B8_Set.bin":$25..$26
incbin "lvl/settings/1B9_Set.bin":$25..$26
incbin "lvl/settings/1BA_Set.bin":$25..$26
incbin "lvl/settings/1BB_Set.bin":$25..$26
incbin "lvl/settings/1BC_Set.bin":$25..$26
incbin "lvl/settings/1BD_Set.bin":$25..$26
incbin "lvl/settings/1BE_Set.bin":$25..$26
incbin "lvl/settings/1BF_Set.bin":$25..$26
incbin "lvl/settings/1C0_Set.bin":$25..$26
incbin "lvl/settings/1C1_Set.bin":$25..$26
incbin "lvl/settings/1C2_Set.bin":$25..$26
incbin "lvl/settings/1C3_Set.bin":$25..$26
incbin "lvl/settings/1C4_Set.bin":$25..$26
incbin "lvl/settings/1C5_Set.bin":$25..$26
incbin "lvl/settings/1C6_Set.bin":$25..$26
incbin "lvl/settings/1C7_Set.bin":$25..$26
incbin "lvl/settings/1C8_Set.bin":$25..$26
incbin "lvl/settings/1C9_Set.bin":$25..$26
incbin "lvl/settings/1CA_Set.bin":$25..$26
incbin "lvl/settings/1CB_Set.bin":$25..$26
incbin "lvl/settings/1CC_Set.bin":$25..$26
incbin "lvl/settings/1CD_Set.bin":$25..$26
incbin "lvl/settings/1CE_Set.bin":$25..$26
incbin "lvl/settings/1CF_Set.bin":$25..$26
incbin "lvl/settings/1D0_Set.bin":$25..$26
incbin "lvl/settings/1D1_Set.bin":$25..$26
incbin "lvl/settings/1D2_Set.bin":$25..$26
incbin "lvl/settings/1D3_Set.bin":$25..$26
incbin "lvl/settings/1D4_Set.bin":$25..$26
incbin "lvl/settings/1D5_Set.bin":$25..$26
incbin "lvl/settings/1D6_Set.bin":$25..$26
incbin "lvl/settings/1D7_Set.bin":$25..$26
incbin "lvl/settings/1D8_Set.bin":$25..$26
incbin "lvl/settings/1D9_Set.bin":$25..$26
incbin "lvl/settings/1DA_Set.bin":$25..$26
incbin "lvl/settings/1DB_Set.bin":$25..$26
incbin "lvl/settings/1DC_Set.bin":$25..$26
incbin "lvl/settings/1DD_Set.bin":$25..$26
incbin "lvl/settings/1DE_Set.bin":$25..$26
incbin "lvl/settings/1DF_Set.bin":$25..$26
incbin "lvl/settings/1E0_Set.bin":$25..$26
incbin "lvl/settings/1E1_Set.bin":$25..$26
incbin "lvl/settings/1E2_Set.bin":$25..$26
incbin "lvl/settings/1E3_Set.bin":$25..$26
incbin "lvl/settings/1E4_Set.bin":$25..$26
incbin "lvl/settings/1E5_Set.bin":$25..$26
incbin "lvl/settings/1E6_Set.bin":$25..$26
incbin "lvl/settings/1E7_Set.bin":$25..$26
incbin "lvl/settings/1E8_Set.bin":$25..$26
incbin "lvl/settings/1E9_Set.bin":$25..$26
incbin "lvl/settings/1EA_Set.bin":$25..$26
incbin "lvl/settings/1EB_Set.bin":$25..$26
incbin "lvl/settings/1EC_Set.bin":$25..$26
incbin "lvl/settings/1ED_Set.bin":$25..$26
incbin "lvl/settings/1EE_Set.bin":$25..$26
incbin "lvl/settings/1EF_Set.bin":$25..$26
incbin "lvl/settings/1F0_Set.bin":$25..$26
incbin "lvl/settings/1F1_Set.bin":$25..$26
incbin "lvl/settings/1F2_Set.bin":$25..$26
incbin "lvl/settings/1F3_Set.bin":$25..$26
incbin "lvl/settings/1F4_Set.bin":$25..$26
incbin "lvl/settings/1F5_Set.bin":$25..$26
incbin "lvl/settings/1F6_Set.bin":$25..$26
incbin "lvl/settings/1F7_Set.bin":$25..$26
incbin "lvl/settings/1F8_Set.bin":$25..$26
incbin "lvl/settings/1F9_Set.bin":$25..$26
incbin "lvl/settings/1FA_Set.bin":$25..$26
incbin "lvl/settings/1FB_Set.bin":$25..$26
incbin "lvl/settings/1FC_Set.bin":$25..$26
incbin "lvl/settings/1FD_Set.bin":$25..$26
incbin "lvl/settings/1FE_Set.bin":$25..$26
incbin "lvl/settings/1FF_Set.bin":$25..$26
.End:

DATA_05F600:
incbin "lvl/settings/000_Set.bin":$26..$27
incbin "lvl/settings/001_Set.bin":$26..$27
incbin "lvl/settings/002_Set.bin":$26..$27
incbin "lvl/settings/003_Set.bin":$26..$27
incbin "lvl/settings/004_Set.bin":$26..$27
incbin "lvl/settings/005_Set.bin":$26..$27
incbin "lvl/settings/006_Set.bin":$26..$27
incbin "lvl/settings/007_Set.bin":$26..$27
incbin "lvl/settings/008_Set.bin":$26..$27
incbin "lvl/settings/009_Set.bin":$26..$27
incbin "lvl/settings/00A_Set.bin":$26..$27
incbin "lvl/settings/00B_Set.bin":$26..$27
incbin "lvl/settings/00C_Set.bin":$26..$27
incbin "lvl/settings/00D_Set.bin":$26..$27
incbin "lvl/settings/00E_Set.bin":$26..$27
incbin "lvl/settings/00F_Set.bin":$26..$27
incbin "lvl/settings/010_Set.bin":$26..$27
incbin "lvl/settings/011_Set.bin":$26..$27
incbin "lvl/settings/012_Set.bin":$26..$27
incbin "lvl/settings/013_Set.bin":$26..$27
incbin "lvl/settings/014_Set.bin":$26..$27
incbin "lvl/settings/015_Set.bin":$26..$27
incbin "lvl/settings/016_Set.bin":$26..$27
incbin "lvl/settings/017_Set.bin":$26..$27
incbin "lvl/settings/018_Set.bin":$26..$27
incbin "lvl/settings/019_Set.bin":$26..$27
incbin "lvl/settings/01A_Set.bin":$26..$27
incbin "lvl/settings/01B_Set.bin":$26..$27
incbin "lvl/settings/01C_Set.bin":$26..$27
incbin "lvl/settings/01D_Set.bin":$26..$27
incbin "lvl/settings/01E_Set.bin":$26..$27
incbin "lvl/settings/01F_Set.bin":$26..$27
incbin "lvl/settings/020_Set.bin":$26..$27
incbin "lvl/settings/021_Set.bin":$26..$27
incbin "lvl/settings/022_Set.bin":$26..$27
incbin "lvl/settings/023_Set.bin":$26..$27
incbin "lvl/settings/024_Set.bin":$26..$27
incbin "lvl/settings/025_Set.bin":$26..$27
incbin "lvl/settings/026_Set.bin":$26..$27
incbin "lvl/settings/027_Set.bin":$26..$27
incbin "lvl/settings/028_Set.bin":$26..$27
incbin "lvl/settings/029_Set.bin":$26..$27
incbin "lvl/settings/02A_Set.bin":$26..$27
incbin "lvl/settings/02B_Set.bin":$26..$27
incbin "lvl/settings/02C_Set.bin":$26..$27
incbin "lvl/settings/02D_Set.bin":$26..$27
incbin "lvl/settings/02E_Set.bin":$26..$27
incbin "lvl/settings/02F_Set.bin":$26..$27
incbin "lvl/settings/030_Set.bin":$26..$27
incbin "lvl/settings/031_Set.bin":$26..$27
incbin "lvl/settings/032_Set.bin":$26..$27
incbin "lvl/settings/033_Set.bin":$26..$27
incbin "lvl/settings/034_Set.bin":$26..$27
incbin "lvl/settings/035_Set.bin":$26..$27
incbin "lvl/settings/036_Set.bin":$26..$27
incbin "lvl/settings/037_Set.bin":$26..$27
incbin "lvl/settings/038_Set.bin":$26..$27
incbin "lvl/settings/039_Set.bin":$26..$27
incbin "lvl/settings/03A_Set.bin":$26..$27
incbin "lvl/settings/03B_Set.bin":$26..$27
incbin "lvl/settings/03C_Set.bin":$26..$27
incbin "lvl/settings/03D_Set.bin":$26..$27
incbin "lvl/settings/03E_Set.bin":$26..$27
incbin "lvl/settings/03F_Set.bin":$26..$27
incbin "lvl/settings/040_Set.bin":$26..$27
incbin "lvl/settings/041_Set.bin":$26..$27
incbin "lvl/settings/042_Set.bin":$26..$27
incbin "lvl/settings/043_Set.bin":$26..$27
incbin "lvl/settings/044_Set.bin":$26..$27
incbin "lvl/settings/045_Set.bin":$26..$27
incbin "lvl/settings/046_Set.bin":$26..$27
incbin "lvl/settings/047_Set.bin":$26..$27
incbin "lvl/settings/048_Set.bin":$26..$27
incbin "lvl/settings/049_Set.bin":$26..$27
incbin "lvl/settings/04A_Set.bin":$26..$27
incbin "lvl/settings/04B_Set.bin":$26..$27
incbin "lvl/settings/04C_Set.bin":$26..$27
incbin "lvl/settings/04D_Set.bin":$26..$27
incbin "lvl/settings/04E_Set.bin":$26..$27
incbin "lvl/settings/04F_Set.bin":$26..$27
incbin "lvl/settings/050_Set.bin":$26..$27
incbin "lvl/settings/051_Set.bin":$26..$27
incbin "lvl/settings/052_Set.bin":$26..$27
incbin "lvl/settings/053_Set.bin":$26..$27
incbin "lvl/settings/054_Set.bin":$26..$27
incbin "lvl/settings/055_Set.bin":$26..$27
incbin "lvl/settings/056_Set.bin":$26..$27
incbin "lvl/settings/057_Set.bin":$26..$27
incbin "lvl/settings/058_Set.bin":$26..$27
incbin "lvl/settings/059_Set.bin":$26..$27
incbin "lvl/settings/05A_Set.bin":$26..$27
incbin "lvl/settings/05B_Set.bin":$26..$27
incbin "lvl/settings/05C_Set.bin":$26..$27
incbin "lvl/settings/05D_Set.bin":$26..$27
incbin "lvl/settings/05E_Set.bin":$26..$27
incbin "lvl/settings/05F_Set.bin":$26..$27
incbin "lvl/settings/060_Set.bin":$26..$27
incbin "lvl/settings/061_Set.bin":$26..$27
incbin "lvl/settings/062_Set.bin":$26..$27
incbin "lvl/settings/063_Set.bin":$26..$27
incbin "lvl/settings/064_Set.bin":$26..$27
incbin "lvl/settings/065_Set.bin":$26..$27
incbin "lvl/settings/066_Set.bin":$26..$27
incbin "lvl/settings/067_Set.bin":$26..$27
incbin "lvl/settings/068_Set.bin":$26..$27
incbin "lvl/settings/069_Set.bin":$26..$27
incbin "lvl/settings/06A_Set.bin":$26..$27
incbin "lvl/settings/06B_Set.bin":$26..$27
incbin "lvl/settings/06C_Set.bin":$26..$27
incbin "lvl/settings/06D_Set.bin":$26..$27
incbin "lvl/settings/06E_Set.bin":$26..$27
incbin "lvl/settings/06F_Set.bin":$26..$27
incbin "lvl/settings/070_Set.bin":$26..$27
incbin "lvl/settings/071_Set.bin":$26..$27
incbin "lvl/settings/072_Set.bin":$26..$27
incbin "lvl/settings/073_Set.bin":$26..$27
incbin "lvl/settings/074_Set.bin":$26..$27
incbin "lvl/settings/075_Set.bin":$26..$27
incbin "lvl/settings/076_Set.bin":$26..$27
incbin "lvl/settings/077_Set.bin":$26..$27
incbin "lvl/settings/078_Set.bin":$26..$27
incbin "lvl/settings/079_Set.bin":$26..$27
incbin "lvl/settings/07A_Set.bin":$26..$27
incbin "lvl/settings/07B_Set.bin":$26..$27
incbin "lvl/settings/07C_Set.bin":$26..$27
incbin "lvl/settings/07D_Set.bin":$26..$27
incbin "lvl/settings/07E_Set.bin":$26..$27
incbin "lvl/settings/07F_Set.bin":$26..$27
incbin "lvl/settings/080_Set.bin":$26..$27
incbin "lvl/settings/081_Set.bin":$26..$27
incbin "lvl/settings/082_Set.bin":$26..$27
incbin "lvl/settings/083_Set.bin":$26..$27
incbin "lvl/settings/084_Set.bin":$26..$27
incbin "lvl/settings/085_Set.bin":$26..$27
incbin "lvl/settings/086_Set.bin":$26..$27
incbin "lvl/settings/087_Set.bin":$26..$27
incbin "lvl/settings/088_Set.bin":$26..$27
incbin "lvl/settings/089_Set.bin":$26..$27
incbin "lvl/settings/08A_Set.bin":$26..$27
incbin "lvl/settings/08B_Set.bin":$26..$27
incbin "lvl/settings/08C_Set.bin":$26..$27
incbin "lvl/settings/08D_Set.bin":$26..$27
incbin "lvl/settings/08E_Set.bin":$26..$27
incbin "lvl/settings/08F_Set.bin":$26..$27
incbin "lvl/settings/090_Set.bin":$26..$27
incbin "lvl/settings/091_Set.bin":$26..$27
incbin "lvl/settings/092_Set.bin":$26..$27
incbin "lvl/settings/093_Set.bin":$26..$27
incbin "lvl/settings/094_Set.bin":$26..$27
incbin "lvl/settings/095_Set.bin":$26..$27
incbin "lvl/settings/096_Set.bin":$26..$27
incbin "lvl/settings/097_Set.bin":$26..$27
incbin "lvl/settings/098_Set.bin":$26..$27
incbin "lvl/settings/099_Set.bin":$26..$27
incbin "lvl/settings/09A_Set.bin":$26..$27
incbin "lvl/settings/09B_Set.bin":$26..$27
incbin "lvl/settings/09C_Set.bin":$26..$27
incbin "lvl/settings/09D_Set.bin":$26..$27
incbin "lvl/settings/09E_Set.bin":$26..$27
incbin "lvl/settings/09F_Set.bin":$26..$27
incbin "lvl/settings/0A0_Set.bin":$26..$27
incbin "lvl/settings/0A1_Set.bin":$26..$27
incbin "lvl/settings/0A2_Set.bin":$26..$27
incbin "lvl/settings/0A3_Set.bin":$26..$27
incbin "lvl/settings/0A4_Set.bin":$26..$27
incbin "lvl/settings/0A5_Set.bin":$26..$27
incbin "lvl/settings/0A6_Set.bin":$26..$27
incbin "lvl/settings/0A7_Set.bin":$26..$27
incbin "lvl/settings/0A8_Set.bin":$26..$27
incbin "lvl/settings/0A9_Set.bin":$26..$27
incbin "lvl/settings/0AA_Set.bin":$26..$27
incbin "lvl/settings/0AB_Set.bin":$26..$27
incbin "lvl/settings/0AC_Set.bin":$26..$27
incbin "lvl/settings/0AD_Set.bin":$26..$27
incbin "lvl/settings/0AE_Set.bin":$26..$27
incbin "lvl/settings/0AF_Set.bin":$26..$27
incbin "lvl/settings/0B0_Set.bin":$26..$27
incbin "lvl/settings/0B1_Set.bin":$26..$27
incbin "lvl/settings/0B2_Set.bin":$26..$27
incbin "lvl/settings/0B3_Set.bin":$26..$27
incbin "lvl/settings/0B4_Set.bin":$26..$27
incbin "lvl/settings/0B5_Set.bin":$26..$27
incbin "lvl/settings/0B6_Set.bin":$26..$27
incbin "lvl/settings/0B7_Set.bin":$26..$27
incbin "lvl/settings/0B8_Set.bin":$26..$27
incbin "lvl/settings/0B9_Set.bin":$26..$27
incbin "lvl/settings/0BA_Set.bin":$26..$27
incbin "lvl/settings/0BB_Set.bin":$26..$27
incbin "lvl/settings/0BC_Set.bin":$26..$27
incbin "lvl/settings/0BD_Set.bin":$26..$27
incbin "lvl/settings/0BE_Set.bin":$26..$27
incbin "lvl/settings/0BF_Set.bin":$26..$27
incbin "lvl/settings/0C0_Set.bin":$26..$27
incbin "lvl/settings/0C1_Set.bin":$26..$27
incbin "lvl/settings/0C2_Set.bin":$26..$27
incbin "lvl/settings/0C3_Set.bin":$26..$27
incbin "lvl/settings/0C4_Set.bin":$26..$27
incbin "lvl/settings/0C5_Set.bin":$26..$27
incbin "lvl/settings/0C6_Set.bin":$26..$27
incbin "lvl/settings/0C7_Set.bin":$26..$27
incbin "lvl/settings/0C8_Set.bin":$26..$27
incbin "lvl/settings/0C9_Set.bin":$26..$27
incbin "lvl/settings/0CA_Set.bin":$26..$27
incbin "lvl/settings/0CB_Set.bin":$26..$27
incbin "lvl/settings/0CC_Set.bin":$26..$27
incbin "lvl/settings/0CD_Set.bin":$26..$27
incbin "lvl/settings/0CE_Set.bin":$26..$27
incbin "lvl/settings/0CF_Set.bin":$26..$27
incbin "lvl/settings/0D0_Set.bin":$26..$27
incbin "lvl/settings/0D1_Set.bin":$26..$27
incbin "lvl/settings/0D2_Set.bin":$26..$27
incbin "lvl/settings/0D3_Set.bin":$26..$27
incbin "lvl/settings/0D4_Set.bin":$26..$27
incbin "lvl/settings/0D5_Set.bin":$26..$27
incbin "lvl/settings/0D6_Set.bin":$26..$27
incbin "lvl/settings/0D7_Set.bin":$26..$27
incbin "lvl/settings/0D8_Set.bin":$26..$27
incbin "lvl/settings/0D9_Set.bin":$26..$27
incbin "lvl/settings/0DA_Set.bin":$26..$27
incbin "lvl/settings/0DB_Set.bin":$26..$27
incbin "lvl/settings/0DC_Set.bin":$26..$27
incbin "lvl/settings/0DD_Set.bin":$26..$27
incbin "lvl/settings/0DE_Set.bin":$26..$27
incbin "lvl/settings/0DF_Set.bin":$26..$27
incbin "lvl/settings/0E0_Set.bin":$26..$27
incbin "lvl/settings/0E1_Set.bin":$26..$27
incbin "lvl/settings/0E2_Set.bin":$26..$27
incbin "lvl/settings/0E3_Set.bin":$26..$27
incbin "lvl/settings/0E4_Set.bin":$26..$27
incbin "lvl/settings/0E5_Set.bin":$26..$27
incbin "lvl/settings/0E6_Set.bin":$26..$27
incbin "lvl/settings/0E7_Set.bin":$26..$27
incbin "lvl/settings/0E8_Set.bin":$26..$27
incbin "lvl/settings/0E9_Set.bin":$26..$27
incbin "lvl/settings/0EA_Set.bin":$26..$27
incbin "lvl/settings/0EB_Set.bin":$26..$27
incbin "lvl/settings/0EC_Set.bin":$26..$27
incbin "lvl/settings/0ED_Set.bin":$26..$27
incbin "lvl/settings/0EE_Set.bin":$26..$27
incbin "lvl/settings/0EF_Set.bin":$26..$27
incbin "lvl/settings/0F0_Set.bin":$26..$27
incbin "lvl/settings/0F1_Set.bin":$26..$27
incbin "lvl/settings/0F2_Set.bin":$26..$27
incbin "lvl/settings/0F3_Set.bin":$26..$27
incbin "lvl/settings/0F4_Set.bin":$26..$27
incbin "lvl/settings/0F5_Set.bin":$26..$27
incbin "lvl/settings/0F6_Set.bin":$26..$27
incbin "lvl/settings/0F7_Set.bin":$26..$27
incbin "lvl/settings/0F8_Set.bin":$26..$27
incbin "lvl/settings/0F9_Set.bin":$26..$27
incbin "lvl/settings/0FA_Set.bin":$26..$27
incbin "lvl/settings/0FB_Set.bin":$26..$27
incbin "lvl/settings/0FC_Set.bin":$26..$27
incbin "lvl/settings/0FD_Set.bin":$26..$27
incbin "lvl/settings/0FE_Set.bin":$26..$27
incbin "lvl/settings/0FF_Set.bin":$26..$27
incbin "lvl/settings/100_Set.bin":$26..$27
incbin "lvl/settings/101_Set.bin":$26..$27
incbin "lvl/settings/102_Set.bin":$26..$27
incbin "lvl/settings/103_Set.bin":$26..$27
incbin "lvl/settings/104_Set.bin":$26..$27
incbin "lvl/settings/105_Set.bin":$26..$27
incbin "lvl/settings/106_Set.bin":$26..$27
incbin "lvl/settings/107_Set.bin":$26..$27
incbin "lvl/settings/108_Set.bin":$26..$27
incbin "lvl/settings/109_Set.bin":$26..$27
incbin "lvl/settings/10A_Set.bin":$26..$27
incbin "lvl/settings/10B_Set.bin":$26..$27
incbin "lvl/settings/10C_Set.bin":$26..$27
incbin "lvl/settings/10D_Set.bin":$26..$27
incbin "lvl/settings/10E_Set.bin":$26..$27
incbin "lvl/settings/10F_Set.bin":$26..$27
incbin "lvl/settings/110_Set.bin":$26..$27
incbin "lvl/settings/111_Set.bin":$26..$27
incbin "lvl/settings/112_Set.bin":$26..$27
incbin "lvl/settings/113_Set.bin":$26..$27
incbin "lvl/settings/114_Set.bin":$26..$27
incbin "lvl/settings/115_Set.bin":$26..$27
incbin "lvl/settings/116_Set.bin":$26..$27
incbin "lvl/settings/117_Set.bin":$26..$27
incbin "lvl/settings/118_Set.bin":$26..$27
incbin "lvl/settings/119_Set.bin":$26..$27
incbin "lvl/settings/11A_Set.bin":$26..$27
incbin "lvl/settings/11B_Set.bin":$26..$27
incbin "lvl/settings/11C_Set.bin":$26..$27
incbin "lvl/settings/11D_Set.bin":$26..$27
incbin "lvl/settings/11E_Set.bin":$26..$27
incbin "lvl/settings/11F_Set.bin":$26..$27
incbin "lvl/settings/120_Set.bin":$26..$27
incbin "lvl/settings/121_Set.bin":$26..$27
incbin "lvl/settings/122_Set.bin":$26..$27
incbin "lvl/settings/123_Set.bin":$26..$27
incbin "lvl/settings/124_Set.bin":$26..$27
incbin "lvl/settings/125_Set.bin":$26..$27
incbin "lvl/settings/126_Set.bin":$26..$27
incbin "lvl/settings/127_Set.bin":$26..$27
incbin "lvl/settings/128_Set.bin":$26..$27
incbin "lvl/settings/129_Set.bin":$26..$27
incbin "lvl/settings/12A_Set.bin":$26..$27
incbin "lvl/settings/12B_Set.bin":$26..$27
incbin "lvl/settings/12C_Set.bin":$26..$27
incbin "lvl/settings/12D_Set.bin":$26..$27
incbin "lvl/settings/12E_Set.bin":$26..$27
incbin "lvl/settings/12F_Set.bin":$26..$27
incbin "lvl/settings/130_Set.bin":$26..$27
incbin "lvl/settings/131_Set.bin":$26..$27
incbin "lvl/settings/132_Set.bin":$26..$27
incbin "lvl/settings/133_Set.bin":$26..$27
incbin "lvl/settings/134_Set.bin":$26..$27
incbin "lvl/settings/135_Set.bin":$26..$27
incbin "lvl/settings/136_Set.bin":$26..$27
incbin "lvl/settings/137_Set.bin":$26..$27
incbin "lvl/settings/138_Set.bin":$26..$27
incbin "lvl/settings/139_Set.bin":$26..$27
incbin "lvl/settings/13A_Set.bin":$26..$27
incbin "lvl/settings/13B_Set.bin":$26..$27
incbin "lvl/settings/13C_Set.bin":$26..$27
incbin "lvl/settings/13D_Set.bin":$26..$27
incbin "lvl/settings/13E_Set.bin":$26..$27
incbin "lvl/settings/13F_Set.bin":$26..$27
incbin "lvl/settings/140_Set.bin":$26..$27
incbin "lvl/settings/141_Set.bin":$26..$27
incbin "lvl/settings/142_Set.bin":$26..$27
incbin "lvl/settings/143_Set.bin":$26..$27
incbin "lvl/settings/144_Set.bin":$26..$27
incbin "lvl/settings/145_Set.bin":$26..$27
incbin "lvl/settings/146_Set.bin":$26..$27
incbin "lvl/settings/147_Set.bin":$26..$27
incbin "lvl/settings/148_Set.bin":$26..$27
incbin "lvl/settings/149_Set.bin":$26..$27
incbin "lvl/settings/14A_Set.bin":$26..$27
incbin "lvl/settings/14B_Set.bin":$26..$27
incbin "lvl/settings/14C_Set.bin":$26..$27
incbin "lvl/settings/14D_Set.bin":$26..$27
incbin "lvl/settings/14E_Set.bin":$26..$27
incbin "lvl/settings/14F_Set.bin":$26..$27
incbin "lvl/settings/150_Set.bin":$26..$27
incbin "lvl/settings/151_Set.bin":$26..$27
incbin "lvl/settings/152_Set.bin":$26..$27
incbin "lvl/settings/153_Set.bin":$26..$27
incbin "lvl/settings/154_Set.bin":$26..$27
incbin "lvl/settings/155_Set.bin":$26..$27
incbin "lvl/settings/156_Set.bin":$26..$27
incbin "lvl/settings/157_Set.bin":$26..$27
incbin "lvl/settings/158_Set.bin":$26..$27
incbin "lvl/settings/159_Set.bin":$26..$27
incbin "lvl/settings/15A_Set.bin":$26..$27
incbin "lvl/settings/15B_Set.bin":$26..$27
incbin "lvl/settings/15C_Set.bin":$26..$27
incbin "lvl/settings/15D_Set.bin":$26..$27
incbin "lvl/settings/15E_Set.bin":$26..$27
incbin "lvl/settings/15F_Set.bin":$26..$27
incbin "lvl/settings/160_Set.bin":$26..$27
incbin "lvl/settings/161_Set.bin":$26..$27
incbin "lvl/settings/162_Set.bin":$26..$27
incbin "lvl/settings/163_Set.bin":$26..$27
incbin "lvl/settings/164_Set.bin":$26..$27
incbin "lvl/settings/165_Set.bin":$26..$27
incbin "lvl/settings/166_Set.bin":$26..$27
incbin "lvl/settings/167_Set.bin":$26..$27
incbin "lvl/settings/168_Set.bin":$26..$27
incbin "lvl/settings/169_Set.bin":$26..$27
incbin "lvl/settings/16A_Set.bin":$26..$27
incbin "lvl/settings/16B_Set.bin":$26..$27
incbin "lvl/settings/16C_Set.bin":$26..$27
incbin "lvl/settings/16D_Set.bin":$26..$27
incbin "lvl/settings/16E_Set.bin":$26..$27
incbin "lvl/settings/16F_Set.bin":$26..$27
incbin "lvl/settings/170_Set.bin":$26..$27
incbin "lvl/settings/171_Set.bin":$26..$27
incbin "lvl/settings/172_Set.bin":$26..$27
incbin "lvl/settings/173_Set.bin":$26..$27
incbin "lvl/settings/174_Set.bin":$26..$27
incbin "lvl/settings/175_Set.bin":$26..$27
incbin "lvl/settings/176_Set.bin":$26..$27
incbin "lvl/settings/177_Set.bin":$26..$27
incbin "lvl/settings/178_Set.bin":$26..$27
incbin "lvl/settings/179_Set.bin":$26..$27
incbin "lvl/settings/17A_Set.bin":$26..$27
incbin "lvl/settings/17B_Set.bin":$26..$27
incbin "lvl/settings/17C_Set.bin":$26..$27
incbin "lvl/settings/17D_Set.bin":$26..$27
incbin "lvl/settings/17E_Set.bin":$26..$27
incbin "lvl/settings/17F_Set.bin":$26..$27
incbin "lvl/settings/180_Set.bin":$26..$27
incbin "lvl/settings/181_Set.bin":$26..$27
incbin "lvl/settings/182_Set.bin":$26..$27
incbin "lvl/settings/183_Set.bin":$26..$27
incbin "lvl/settings/184_Set.bin":$26..$27
incbin "lvl/settings/185_Set.bin":$26..$27
incbin "lvl/settings/186_Set.bin":$26..$27
incbin "lvl/settings/187_Set.bin":$26..$27
incbin "lvl/settings/188_Set.bin":$26..$27
incbin "lvl/settings/189_Set.bin":$26..$27
incbin "lvl/settings/18A_Set.bin":$26..$27
incbin "lvl/settings/18B_Set.bin":$26..$27
incbin "lvl/settings/18C_Set.bin":$26..$27
incbin "lvl/settings/18D_Set.bin":$26..$27
incbin "lvl/settings/18E_Set.bin":$26..$27
incbin "lvl/settings/18F_Set.bin":$26..$27
incbin "lvl/settings/190_Set.bin":$26..$27
incbin "lvl/settings/191_Set.bin":$26..$27
incbin "lvl/settings/192_Set.bin":$26..$27
incbin "lvl/settings/193_Set.bin":$26..$27
incbin "lvl/settings/194_Set.bin":$26..$27
incbin "lvl/settings/195_Set.bin":$26..$27
incbin "lvl/settings/196_Set.bin":$26..$27
incbin "lvl/settings/197_Set.bin":$26..$27
incbin "lvl/settings/198_Set.bin":$26..$27
incbin "lvl/settings/199_Set.bin":$26..$27
incbin "lvl/settings/19A_Set.bin":$26..$27
incbin "lvl/settings/19B_Set.bin":$26..$27
incbin "lvl/settings/19C_Set.bin":$26..$27
incbin "lvl/settings/19D_Set.bin":$26..$27
incbin "lvl/settings/19E_Set.bin":$26..$27
incbin "lvl/settings/19F_Set.bin":$26..$27
incbin "lvl/settings/1A0_Set.bin":$26..$27
incbin "lvl/settings/1A1_Set.bin":$26..$27
incbin "lvl/settings/1A2_Set.bin":$26..$27
incbin "lvl/settings/1A3_Set.bin":$26..$27
incbin "lvl/settings/1A4_Set.bin":$26..$27
incbin "lvl/settings/1A5_Set.bin":$26..$27
incbin "lvl/settings/1A6_Set.bin":$26..$27
incbin "lvl/settings/1A7_Set.bin":$26..$27
incbin "lvl/settings/1A8_Set.bin":$26..$27
incbin "lvl/settings/1A9_Set.bin":$26..$27
incbin "lvl/settings/1AA_Set.bin":$26..$27
incbin "lvl/settings/1AB_Set.bin":$26..$27
incbin "lvl/settings/1AC_Set.bin":$26..$27
incbin "lvl/settings/1AD_Set.bin":$26..$27
incbin "lvl/settings/1AE_Set.bin":$26..$27
incbin "lvl/settings/1AF_Set.bin":$26..$27
incbin "lvl/settings/1B0_Set.bin":$26..$27
incbin "lvl/settings/1B1_Set.bin":$26..$27
incbin "lvl/settings/1B2_Set.bin":$26..$27
incbin "lvl/settings/1B3_Set.bin":$26..$27
incbin "lvl/settings/1B4_Set.bin":$26..$27
incbin "lvl/settings/1B5_Set.bin":$26..$27
incbin "lvl/settings/1B6_Set.bin":$26..$27
incbin "lvl/settings/1B7_Set.bin":$26..$27
incbin "lvl/settings/1B8_Set.bin":$26..$27
incbin "lvl/settings/1B9_Set.bin":$26..$27
incbin "lvl/settings/1BA_Set.bin":$26..$27
incbin "lvl/settings/1BB_Set.bin":$26..$27
incbin "lvl/settings/1BC_Set.bin":$26..$27
incbin "lvl/settings/1BD_Set.bin":$26..$27
incbin "lvl/settings/1BE_Set.bin":$26..$27
incbin "lvl/settings/1BF_Set.bin":$26..$27
incbin "lvl/settings/1C0_Set.bin":$26..$27
incbin "lvl/settings/1C1_Set.bin":$26..$27
incbin "lvl/settings/1C2_Set.bin":$26..$27
incbin "lvl/settings/1C3_Set.bin":$26..$27
incbin "lvl/settings/1C4_Set.bin":$26..$27
incbin "lvl/settings/1C5_Set.bin":$26..$27
incbin "lvl/settings/1C6_Set.bin":$26..$27
incbin "lvl/settings/1C7_Set.bin":$26..$27
incbin "lvl/settings/1C8_Set.bin":$26..$27
incbin "lvl/settings/1C9_Set.bin":$26..$27
incbin "lvl/settings/1CA_Set.bin":$26..$27
incbin "lvl/settings/1CB_Set.bin":$26..$27
incbin "lvl/settings/1CC_Set.bin":$26..$27
incbin "lvl/settings/1CD_Set.bin":$26..$27
incbin "lvl/settings/1CE_Set.bin":$26..$27
incbin "lvl/settings/1CF_Set.bin":$26..$27
incbin "lvl/settings/1D0_Set.bin":$26..$27
incbin "lvl/settings/1D1_Set.bin":$26..$27
incbin "lvl/settings/1D2_Set.bin":$26..$27
incbin "lvl/settings/1D3_Set.bin":$26..$27
incbin "lvl/settings/1D4_Set.bin":$26..$27
incbin "lvl/settings/1D5_Set.bin":$26..$27
incbin "lvl/settings/1D6_Set.bin":$26..$27
incbin "lvl/settings/1D7_Set.bin":$26..$27
incbin "lvl/settings/1D8_Set.bin":$26..$27
incbin "lvl/settings/1D9_Set.bin":$26..$27
incbin "lvl/settings/1DA_Set.bin":$26..$27
incbin "lvl/settings/1DB_Set.bin":$26..$27
incbin "lvl/settings/1DC_Set.bin":$26..$27
incbin "lvl/settings/1DD_Set.bin":$26..$27
incbin "lvl/settings/1DE_Set.bin":$26..$27
incbin "lvl/settings/1DF_Set.bin":$26..$27
incbin "lvl/settings/1E0_Set.bin":$26..$27
incbin "lvl/settings/1E1_Set.bin":$26..$27
incbin "lvl/settings/1E2_Set.bin":$26..$27
incbin "lvl/settings/1E3_Set.bin":$26..$27
incbin "lvl/settings/1E4_Set.bin":$26..$27
incbin "lvl/settings/1E5_Set.bin":$26..$27
incbin "lvl/settings/1E6_Set.bin":$26..$27
incbin "lvl/settings/1E7_Set.bin":$26..$27
incbin "lvl/settings/1E8_Set.bin":$26..$27
incbin "lvl/settings/1E9_Set.bin":$26..$27
incbin "lvl/settings/1EA_Set.bin":$26..$27
incbin "lvl/settings/1EB_Set.bin":$26..$27
incbin "lvl/settings/1EC_Set.bin":$26..$27
incbin "lvl/settings/1ED_Set.bin":$26..$27
incbin "lvl/settings/1EE_Set.bin":$26..$27
incbin "lvl/settings/1EF_Set.bin":$26..$27
incbin "lvl/settings/1F0_Set.bin":$26..$27
incbin "lvl/settings/1F1_Set.bin":$26..$27
incbin "lvl/settings/1F2_Set.bin":$26..$27
incbin "lvl/settings/1F3_Set.bin":$26..$27
incbin "lvl/settings/1F4_Set.bin":$26..$27
incbin "lvl/settings/1F5_Set.bin":$26..$27
incbin "lvl/settings/1F6_Set.bin":$26..$27
incbin "lvl/settings/1F7_Set.bin":$26..$27
incbin "lvl/settings/1F8_Set.bin":$26..$27
incbin "lvl/settings/1F9_Set.bin":$26..$27
incbin "lvl/settings/1FA_Set.bin":$26..$27
incbin "lvl/settings/1FB_Set.bin":$26..$27
incbin "lvl/settings/1FC_Set.bin":$26..$27
incbin "lvl/settings/1FD_Set.bin":$26..$27
incbin "lvl/settings/1FE_Set.bin":$26..$27
incbin "lvl/settings/1FF_Set.bin":$26..$27
.End:

DATA_05F800:
incbin "Misc/SMWW_SETBL05F800_Misc.bin";:$00..$200
.End:

DATA_05FA00:
incbin "Misc/SMWW_SETBL05FA00_Misc.bin";:$00..$200
.End:

DATA_05FC00:
incbin "Misc/SMWW_SETBL05FC00_Misc.bin";:$00..$200
.End:

DATA_05FE00:
incbin "Misc/SMWW_SETBL05FE00_Misc.bin";:$00..$200
.End:

DATA_03FE00:							; Lunar Magic table
incbin "lvl/settings/000_Set.bin":$21..$22
incbin "lvl/settings/001_Set.bin":$21..$22
incbin "lvl/settings/002_Set.bin":$21..$22
incbin "lvl/settings/003_Set.bin":$21..$22
incbin "lvl/settings/004_Set.bin":$21..$22
incbin "lvl/settings/005_Set.bin":$21..$22
incbin "lvl/settings/006_Set.bin":$21..$22
incbin "lvl/settings/007_Set.bin":$21..$22
incbin "lvl/settings/008_Set.bin":$21..$22
incbin "lvl/settings/009_Set.bin":$21..$22
incbin "lvl/settings/00A_Set.bin":$21..$22
incbin "lvl/settings/00B_Set.bin":$21..$22
incbin "lvl/settings/00C_Set.bin":$21..$22
incbin "lvl/settings/00D_Set.bin":$21..$22
incbin "lvl/settings/00E_Set.bin":$21..$22
incbin "lvl/settings/00F_Set.bin":$21..$22
incbin "lvl/settings/010_Set.bin":$21..$22
incbin "lvl/settings/011_Set.bin":$21..$22
incbin "lvl/settings/012_Set.bin":$21..$22
incbin "lvl/settings/013_Set.bin":$21..$22
incbin "lvl/settings/014_Set.bin":$21..$22
incbin "lvl/settings/015_Set.bin":$21..$22
incbin "lvl/settings/016_Set.bin":$21..$22
incbin "lvl/settings/017_Set.bin":$21..$22
incbin "lvl/settings/018_Set.bin":$21..$22
incbin "lvl/settings/019_Set.bin":$21..$22
incbin "lvl/settings/01A_Set.bin":$21..$22
incbin "lvl/settings/01B_Set.bin":$21..$22
incbin "lvl/settings/01C_Set.bin":$21..$22
incbin "lvl/settings/01D_Set.bin":$21..$22
incbin "lvl/settings/01E_Set.bin":$21..$22
incbin "lvl/settings/01F_Set.bin":$21..$22
incbin "lvl/settings/020_Set.bin":$21..$22
incbin "lvl/settings/021_Set.bin":$21..$22
incbin "lvl/settings/022_Set.bin":$21..$22
incbin "lvl/settings/023_Set.bin":$21..$22
incbin "lvl/settings/024_Set.bin":$21..$22
incbin "lvl/settings/025_Set.bin":$21..$22
incbin "lvl/settings/026_Set.bin":$21..$22
incbin "lvl/settings/027_Set.bin":$21..$22
incbin "lvl/settings/028_Set.bin":$21..$22
incbin "lvl/settings/029_Set.bin":$21..$22
incbin "lvl/settings/02A_Set.bin":$21..$22
incbin "lvl/settings/02B_Set.bin":$21..$22
incbin "lvl/settings/02C_Set.bin":$21..$22
incbin "lvl/settings/02D_Set.bin":$21..$22
incbin "lvl/settings/02E_Set.bin":$21..$22
incbin "lvl/settings/02F_Set.bin":$21..$22
incbin "lvl/settings/030_Set.bin":$21..$22
incbin "lvl/settings/031_Set.bin":$21..$22
incbin "lvl/settings/032_Set.bin":$21..$22
incbin "lvl/settings/033_Set.bin":$21..$22
incbin "lvl/settings/034_Set.bin":$21..$22
incbin "lvl/settings/035_Set.bin":$21..$22
incbin "lvl/settings/036_Set.bin":$21..$22
incbin "lvl/settings/037_Set.bin":$21..$22
incbin "lvl/settings/038_Set.bin":$21..$22
incbin "lvl/settings/039_Set.bin":$21..$22
incbin "lvl/settings/03A_Set.bin":$21..$22
incbin "lvl/settings/03B_Set.bin":$21..$22
incbin "lvl/settings/03C_Set.bin":$21..$22
incbin "lvl/settings/03D_Set.bin":$21..$22
incbin "lvl/settings/03E_Set.bin":$21..$22
incbin "lvl/settings/03F_Set.bin":$21..$22
incbin "lvl/settings/040_Set.bin":$21..$22
incbin "lvl/settings/041_Set.bin":$21..$22
incbin "lvl/settings/042_Set.bin":$21..$22
incbin "lvl/settings/043_Set.bin":$21..$22
incbin "lvl/settings/044_Set.bin":$21..$22
incbin "lvl/settings/045_Set.bin":$21..$22
incbin "lvl/settings/046_Set.bin":$21..$22
incbin "lvl/settings/047_Set.bin":$21..$22
incbin "lvl/settings/048_Set.bin":$21..$22
incbin "lvl/settings/049_Set.bin":$21..$22
incbin "lvl/settings/04A_Set.bin":$21..$22
incbin "lvl/settings/04B_Set.bin":$21..$22
incbin "lvl/settings/04C_Set.bin":$21..$22
incbin "lvl/settings/04D_Set.bin":$21..$22
incbin "lvl/settings/04E_Set.bin":$21..$22
incbin "lvl/settings/04F_Set.bin":$21..$22
incbin "lvl/settings/050_Set.bin":$21..$22
incbin "lvl/settings/051_Set.bin":$21..$22
incbin "lvl/settings/052_Set.bin":$21..$22
incbin "lvl/settings/053_Set.bin":$21..$22
incbin "lvl/settings/054_Set.bin":$21..$22
incbin "lvl/settings/055_Set.bin":$21..$22
incbin "lvl/settings/056_Set.bin":$21..$22
incbin "lvl/settings/057_Set.bin":$21..$22
incbin "lvl/settings/058_Set.bin":$21..$22
incbin "lvl/settings/059_Set.bin":$21..$22
incbin "lvl/settings/05A_Set.bin":$21..$22
incbin "lvl/settings/05B_Set.bin":$21..$22
incbin "lvl/settings/05C_Set.bin":$21..$22
incbin "lvl/settings/05D_Set.bin":$21..$22
incbin "lvl/settings/05E_Set.bin":$21..$22
incbin "lvl/settings/05F_Set.bin":$21..$22
incbin "lvl/settings/060_Set.bin":$21..$22
incbin "lvl/settings/061_Set.bin":$21..$22
incbin "lvl/settings/062_Set.bin":$21..$22
incbin "lvl/settings/063_Set.bin":$21..$22
incbin "lvl/settings/064_Set.bin":$21..$22
incbin "lvl/settings/065_Set.bin":$21..$22
incbin "lvl/settings/066_Set.bin":$21..$22
incbin "lvl/settings/067_Set.bin":$21..$22
incbin "lvl/settings/068_Set.bin":$21..$22
incbin "lvl/settings/069_Set.bin":$21..$22
incbin "lvl/settings/06A_Set.bin":$21..$22
incbin "lvl/settings/06B_Set.bin":$21..$22
incbin "lvl/settings/06C_Set.bin":$21..$22
incbin "lvl/settings/06D_Set.bin":$21..$22
incbin "lvl/settings/06E_Set.bin":$21..$22
incbin "lvl/settings/06F_Set.bin":$21..$22
incbin "lvl/settings/070_Set.bin":$21..$22
incbin "lvl/settings/071_Set.bin":$21..$22
incbin "lvl/settings/072_Set.bin":$21..$22
incbin "lvl/settings/073_Set.bin":$21..$22
incbin "lvl/settings/074_Set.bin":$21..$22
incbin "lvl/settings/075_Set.bin":$21..$22
incbin "lvl/settings/076_Set.bin":$21..$22
incbin "lvl/settings/077_Set.bin":$21..$22
incbin "lvl/settings/078_Set.bin":$21..$22
incbin "lvl/settings/079_Set.bin":$21..$22
incbin "lvl/settings/07A_Set.bin":$21..$22
incbin "lvl/settings/07B_Set.bin":$21..$22
incbin "lvl/settings/07C_Set.bin":$21..$22
incbin "lvl/settings/07D_Set.bin":$21..$22
incbin "lvl/settings/07E_Set.bin":$21..$22
incbin "lvl/settings/07F_Set.bin":$21..$22
incbin "lvl/settings/080_Set.bin":$21..$22
incbin "lvl/settings/081_Set.bin":$21..$22
incbin "lvl/settings/082_Set.bin":$21..$22
incbin "lvl/settings/083_Set.bin":$21..$22
incbin "lvl/settings/084_Set.bin":$21..$22
incbin "lvl/settings/085_Set.bin":$21..$22
incbin "lvl/settings/086_Set.bin":$21..$22
incbin "lvl/settings/087_Set.bin":$21..$22
incbin "lvl/settings/088_Set.bin":$21..$22
incbin "lvl/settings/089_Set.bin":$21..$22
incbin "lvl/settings/08A_Set.bin":$21..$22
incbin "lvl/settings/08B_Set.bin":$21..$22
incbin "lvl/settings/08C_Set.bin":$21..$22
incbin "lvl/settings/08D_Set.bin":$21..$22
incbin "lvl/settings/08E_Set.bin":$21..$22
incbin "lvl/settings/08F_Set.bin":$21..$22
incbin "lvl/settings/090_Set.bin":$21..$22
incbin "lvl/settings/091_Set.bin":$21..$22
incbin "lvl/settings/092_Set.bin":$21..$22
incbin "lvl/settings/093_Set.bin":$21..$22
incbin "lvl/settings/094_Set.bin":$21..$22
incbin "lvl/settings/095_Set.bin":$21..$22
incbin "lvl/settings/096_Set.bin":$21..$22
incbin "lvl/settings/097_Set.bin":$21..$22
incbin "lvl/settings/098_Set.bin":$21..$22
incbin "lvl/settings/099_Set.bin":$21..$22
incbin "lvl/settings/09A_Set.bin":$21..$22
incbin "lvl/settings/09B_Set.bin":$21..$22
incbin "lvl/settings/09C_Set.bin":$21..$22
incbin "lvl/settings/09D_Set.bin":$21..$22
incbin "lvl/settings/09E_Set.bin":$21..$22
incbin "lvl/settings/09F_Set.bin":$21..$22
incbin "lvl/settings/0A0_Set.bin":$21..$22
incbin "lvl/settings/0A1_Set.bin":$21..$22
incbin "lvl/settings/0A2_Set.bin":$21..$22
incbin "lvl/settings/0A3_Set.bin":$21..$22
incbin "lvl/settings/0A4_Set.bin":$21..$22
incbin "lvl/settings/0A5_Set.bin":$21..$22
incbin "lvl/settings/0A6_Set.bin":$21..$22
incbin "lvl/settings/0A7_Set.bin":$21..$22
incbin "lvl/settings/0A8_Set.bin":$21..$22
incbin "lvl/settings/0A9_Set.bin":$21..$22
incbin "lvl/settings/0AA_Set.bin":$21..$22
incbin "lvl/settings/0AB_Set.bin":$21..$22
incbin "lvl/settings/0AC_Set.bin":$21..$22
incbin "lvl/settings/0AD_Set.bin":$21..$22
incbin "lvl/settings/0AE_Set.bin":$21..$22
incbin "lvl/settings/0AF_Set.bin":$21..$22
incbin "lvl/settings/0B0_Set.bin":$21..$22
incbin "lvl/settings/0B1_Set.bin":$21..$22
incbin "lvl/settings/0B2_Set.bin":$21..$22
incbin "lvl/settings/0B3_Set.bin":$21..$22
incbin "lvl/settings/0B4_Set.bin":$21..$22
incbin "lvl/settings/0B5_Set.bin":$21..$22
incbin "lvl/settings/0B6_Set.bin":$21..$22
incbin "lvl/settings/0B7_Set.bin":$21..$22
incbin "lvl/settings/0B8_Set.bin":$21..$22
incbin "lvl/settings/0B9_Set.bin":$21..$22
incbin "lvl/settings/0BA_Set.bin":$21..$22
incbin "lvl/settings/0BB_Set.bin":$21..$22
incbin "lvl/settings/0BC_Set.bin":$21..$22
incbin "lvl/settings/0BD_Set.bin":$21..$22
incbin "lvl/settings/0BE_Set.bin":$21..$22
incbin "lvl/settings/0BF_Set.bin":$21..$22
incbin "lvl/settings/0C0_Set.bin":$21..$22
incbin "lvl/settings/0C1_Set.bin":$21..$22
incbin "lvl/settings/0C2_Set.bin":$21..$22
incbin "lvl/settings/0C3_Set.bin":$21..$22
incbin "lvl/settings/0C4_Set.bin":$21..$22
incbin "lvl/settings/0C5_Set.bin":$21..$22
incbin "lvl/settings/0C6_Set.bin":$21..$22
incbin "lvl/settings/0C7_Set.bin":$21..$22
incbin "lvl/settings/0C8_Set.bin":$21..$22
incbin "lvl/settings/0C9_Set.bin":$21..$22
incbin "lvl/settings/0CA_Set.bin":$21..$22
incbin "lvl/settings/0CB_Set.bin":$21..$22
incbin "lvl/settings/0CC_Set.bin":$21..$22
incbin "lvl/settings/0CD_Set.bin":$21..$22
incbin "lvl/settings/0CE_Set.bin":$21..$22
incbin "lvl/settings/0CF_Set.bin":$21..$22
incbin "lvl/settings/0D0_Set.bin":$21..$22
incbin "lvl/settings/0D1_Set.bin":$21..$22
incbin "lvl/settings/0D2_Set.bin":$21..$22
incbin "lvl/settings/0D3_Set.bin":$21..$22
incbin "lvl/settings/0D4_Set.bin":$21..$22
incbin "lvl/settings/0D5_Set.bin":$21..$22
incbin "lvl/settings/0D6_Set.bin":$21..$22
incbin "lvl/settings/0D7_Set.bin":$21..$22
incbin "lvl/settings/0D8_Set.bin":$21..$22
incbin "lvl/settings/0D9_Set.bin":$21..$22
incbin "lvl/settings/0DA_Set.bin":$21..$22
incbin "lvl/settings/0DB_Set.bin":$21..$22
incbin "lvl/settings/0DC_Set.bin":$21..$22
incbin "lvl/settings/0DD_Set.bin":$21..$22
incbin "lvl/settings/0DE_Set.bin":$21..$22
incbin "lvl/settings/0DF_Set.bin":$21..$22
incbin "lvl/settings/0E0_Set.bin":$21..$22
incbin "lvl/settings/0E1_Set.bin":$21..$22
incbin "lvl/settings/0E2_Set.bin":$21..$22
incbin "lvl/settings/0E3_Set.bin":$21..$22
incbin "lvl/settings/0E4_Set.bin":$21..$22
incbin "lvl/settings/0E5_Set.bin":$21..$22
incbin "lvl/settings/0E6_Set.bin":$21..$22
incbin "lvl/settings/0E7_Set.bin":$21..$22
incbin "lvl/settings/0E8_Set.bin":$21..$22
incbin "lvl/settings/0E9_Set.bin":$21..$22
incbin "lvl/settings/0EA_Set.bin":$21..$22
incbin "lvl/settings/0EB_Set.bin":$21..$22
incbin "lvl/settings/0EC_Set.bin":$21..$22
incbin "lvl/settings/0ED_Set.bin":$21..$22
incbin "lvl/settings/0EE_Set.bin":$21..$22
incbin "lvl/settings/0EF_Set.bin":$21..$22
incbin "lvl/settings/0F0_Set.bin":$21..$22
incbin "lvl/settings/0F1_Set.bin":$21..$22
incbin "lvl/settings/0F2_Set.bin":$21..$22
incbin "lvl/settings/0F3_Set.bin":$21..$22
incbin "lvl/settings/0F4_Set.bin":$21..$22
incbin "lvl/settings/0F5_Set.bin":$21..$22
incbin "lvl/settings/0F6_Set.bin":$21..$22
incbin "lvl/settings/0F7_Set.bin":$21..$22
incbin "lvl/settings/0F8_Set.bin":$21..$22
incbin "lvl/settings/0F9_Set.bin":$21..$22
incbin "lvl/settings/0FA_Set.bin":$21..$22
incbin "lvl/settings/0FB_Set.bin":$21..$22
incbin "lvl/settings/0FC_Set.bin":$21..$22
incbin "lvl/settings/0FD_Set.bin":$21..$22
incbin "lvl/settings/0FE_Set.bin":$21..$22
incbin "lvl/settings/0FF_Set.bin":$21..$22
incbin "lvl/settings/100_Set.bin":$21..$22
incbin "lvl/settings/101_Set.bin":$21..$22
incbin "lvl/settings/102_Set.bin":$21..$22
incbin "lvl/settings/103_Set.bin":$21..$22
incbin "lvl/settings/104_Set.bin":$21..$22
incbin "lvl/settings/105_Set.bin":$21..$22
incbin "lvl/settings/106_Set.bin":$21..$22
incbin "lvl/settings/107_Set.bin":$21..$22
incbin "lvl/settings/108_Set.bin":$21..$22
incbin "lvl/settings/109_Set.bin":$21..$22
incbin "lvl/settings/10A_Set.bin":$21..$22
incbin "lvl/settings/10B_Set.bin":$21..$22
incbin "lvl/settings/10C_Set.bin":$21..$22
incbin "lvl/settings/10D_Set.bin":$21..$22
incbin "lvl/settings/10E_Set.bin":$21..$22
incbin "lvl/settings/10F_Set.bin":$21..$22
incbin "lvl/settings/110_Set.bin":$21..$22
incbin "lvl/settings/111_Set.bin":$21..$22
incbin "lvl/settings/112_Set.bin":$21..$22
incbin "lvl/settings/113_Set.bin":$21..$22
incbin "lvl/settings/114_Set.bin":$21..$22
incbin "lvl/settings/115_Set.bin":$21..$22
incbin "lvl/settings/116_Set.bin":$21..$22
incbin "lvl/settings/117_Set.bin":$21..$22
incbin "lvl/settings/118_Set.bin":$21..$22
incbin "lvl/settings/119_Set.bin":$21..$22
incbin "lvl/settings/11A_Set.bin":$21..$22
incbin "lvl/settings/11B_Set.bin":$21..$22
incbin "lvl/settings/11C_Set.bin":$21..$22
incbin "lvl/settings/11D_Set.bin":$21..$22
incbin "lvl/settings/11E_Set.bin":$21..$22
incbin "lvl/settings/11F_Set.bin":$21..$22
incbin "lvl/settings/120_Set.bin":$21..$22
incbin "lvl/settings/121_Set.bin":$21..$22
incbin "lvl/settings/122_Set.bin":$21..$22
incbin "lvl/settings/123_Set.bin":$21..$22
incbin "lvl/settings/124_Set.bin":$21..$22
incbin "lvl/settings/125_Set.bin":$21..$22
incbin "lvl/settings/126_Set.bin":$21..$22
incbin "lvl/settings/127_Set.bin":$21..$22
incbin "lvl/settings/128_Set.bin":$21..$22
incbin "lvl/settings/129_Set.bin":$21..$22
incbin "lvl/settings/12A_Set.bin":$21..$22
incbin "lvl/settings/12B_Set.bin":$21..$22
incbin "lvl/settings/12C_Set.bin":$21..$22
incbin "lvl/settings/12D_Set.bin":$21..$22
incbin "lvl/settings/12E_Set.bin":$21..$22
incbin "lvl/settings/12F_Set.bin":$21..$22
incbin "lvl/settings/130_Set.bin":$21..$22
incbin "lvl/settings/131_Set.bin":$21..$22
incbin "lvl/settings/132_Set.bin":$21..$22
incbin "lvl/settings/133_Set.bin":$21..$22
incbin "lvl/settings/134_Set.bin":$21..$22
incbin "lvl/settings/135_Set.bin":$21..$22
incbin "lvl/settings/136_Set.bin":$21..$22
incbin "lvl/settings/137_Set.bin":$21..$22
incbin "lvl/settings/138_Set.bin":$21..$22
incbin "lvl/settings/139_Set.bin":$21..$22
incbin "lvl/settings/13A_Set.bin":$21..$22
incbin "lvl/settings/13B_Set.bin":$21..$22
incbin "lvl/settings/13C_Set.bin":$21..$22
incbin "lvl/settings/13D_Set.bin":$21..$22
incbin "lvl/settings/13E_Set.bin":$21..$22
incbin "lvl/settings/13F_Set.bin":$21..$22
incbin "lvl/settings/140_Set.bin":$21..$22
incbin "lvl/settings/141_Set.bin":$21..$22
incbin "lvl/settings/142_Set.bin":$21..$22
incbin "lvl/settings/143_Set.bin":$21..$22
incbin "lvl/settings/144_Set.bin":$21..$22
incbin "lvl/settings/145_Set.bin":$21..$22
incbin "lvl/settings/146_Set.bin":$21..$22
incbin "lvl/settings/147_Set.bin":$21..$22
incbin "lvl/settings/148_Set.bin":$21..$22
incbin "lvl/settings/149_Set.bin":$21..$22
incbin "lvl/settings/14A_Set.bin":$21..$22
incbin "lvl/settings/14B_Set.bin":$21..$22
incbin "lvl/settings/14C_Set.bin":$21..$22
incbin "lvl/settings/14D_Set.bin":$21..$22
incbin "lvl/settings/14E_Set.bin":$21..$22
incbin "lvl/settings/14F_Set.bin":$21..$22
incbin "lvl/settings/150_Set.bin":$21..$22
incbin "lvl/settings/151_Set.bin":$21..$22
incbin "lvl/settings/152_Set.bin":$21..$22
incbin "lvl/settings/153_Set.bin":$21..$22
incbin "lvl/settings/154_Set.bin":$21..$22
incbin "lvl/settings/155_Set.bin":$21..$22
incbin "lvl/settings/156_Set.bin":$21..$22
incbin "lvl/settings/157_Set.bin":$21..$22
incbin "lvl/settings/158_Set.bin":$21..$22
incbin "lvl/settings/159_Set.bin":$21..$22
incbin "lvl/settings/15A_Set.bin":$21..$22
incbin "lvl/settings/15B_Set.bin":$21..$22
incbin "lvl/settings/15C_Set.bin":$21..$22
incbin "lvl/settings/15D_Set.bin":$21..$22
incbin "lvl/settings/15E_Set.bin":$21..$22
incbin "lvl/settings/15F_Set.bin":$21..$22
incbin "lvl/settings/160_Set.bin":$21..$22
incbin "lvl/settings/161_Set.bin":$21..$22
incbin "lvl/settings/162_Set.bin":$21..$22
incbin "lvl/settings/163_Set.bin":$21..$22
incbin "lvl/settings/164_Set.bin":$21..$22
incbin "lvl/settings/165_Set.bin":$21..$22
incbin "lvl/settings/166_Set.bin":$21..$22
incbin "lvl/settings/167_Set.bin":$21..$22
incbin "lvl/settings/168_Set.bin":$21..$22
incbin "lvl/settings/169_Set.bin":$21..$22
incbin "lvl/settings/16A_Set.bin":$21..$22
incbin "lvl/settings/16B_Set.bin":$21..$22
incbin "lvl/settings/16C_Set.bin":$21..$22
incbin "lvl/settings/16D_Set.bin":$21..$22
incbin "lvl/settings/16E_Set.bin":$21..$22
incbin "lvl/settings/16F_Set.bin":$21..$22
incbin "lvl/settings/170_Set.bin":$21..$22
incbin "lvl/settings/171_Set.bin":$21..$22
incbin "lvl/settings/172_Set.bin":$21..$22
incbin "lvl/settings/173_Set.bin":$21..$22
incbin "lvl/settings/174_Set.bin":$21..$22
incbin "lvl/settings/175_Set.bin":$21..$22
incbin "lvl/settings/176_Set.bin":$21..$22
incbin "lvl/settings/177_Set.bin":$21..$22
incbin "lvl/settings/178_Set.bin":$21..$22
incbin "lvl/settings/179_Set.bin":$21..$22
incbin "lvl/settings/17A_Set.bin":$21..$22
incbin "lvl/settings/17B_Set.bin":$21..$22
incbin "lvl/settings/17C_Set.bin":$21..$22
incbin "lvl/settings/17D_Set.bin":$21..$22
incbin "lvl/settings/17E_Set.bin":$21..$22
incbin "lvl/settings/17F_Set.bin":$21..$22
incbin "lvl/settings/180_Set.bin":$21..$22
incbin "lvl/settings/181_Set.bin":$21..$22
incbin "lvl/settings/182_Set.bin":$21..$22
incbin "lvl/settings/183_Set.bin":$21..$22
incbin "lvl/settings/184_Set.bin":$21..$22
incbin "lvl/settings/185_Set.bin":$21..$22
incbin "lvl/settings/186_Set.bin":$21..$22
incbin "lvl/settings/187_Set.bin":$21..$22
incbin "lvl/settings/188_Set.bin":$21..$22
incbin "lvl/settings/189_Set.bin":$21..$22
incbin "lvl/settings/18A_Set.bin":$21..$22
incbin "lvl/settings/18B_Set.bin":$21..$22
incbin "lvl/settings/18C_Set.bin":$21..$22
incbin "lvl/settings/18D_Set.bin":$21..$22
incbin "lvl/settings/18E_Set.bin":$21..$22
incbin "lvl/settings/18F_Set.bin":$21..$22
incbin "lvl/settings/190_Set.bin":$21..$22
incbin "lvl/settings/191_Set.bin":$21..$22
incbin "lvl/settings/192_Set.bin":$21..$22
incbin "lvl/settings/193_Set.bin":$21..$22
incbin "lvl/settings/194_Set.bin":$21..$22
incbin "lvl/settings/195_Set.bin":$21..$22
incbin "lvl/settings/196_Set.bin":$21..$22
incbin "lvl/settings/197_Set.bin":$21..$22
incbin "lvl/settings/198_Set.bin":$21..$22
incbin "lvl/settings/199_Set.bin":$21..$22
incbin "lvl/settings/19A_Set.bin":$21..$22
incbin "lvl/settings/19B_Set.bin":$21..$22
incbin "lvl/settings/19C_Set.bin":$21..$22
incbin "lvl/settings/19D_Set.bin":$21..$22
incbin "lvl/settings/19E_Set.bin":$21..$22
incbin "lvl/settings/19F_Set.bin":$21..$22
incbin "lvl/settings/1A0_Set.bin":$21..$22
incbin "lvl/settings/1A1_Set.bin":$21..$22
incbin "lvl/settings/1A2_Set.bin":$21..$22
incbin "lvl/settings/1A3_Set.bin":$21..$22
incbin "lvl/settings/1A4_Set.bin":$21..$22
incbin "lvl/settings/1A5_Set.bin":$21..$22
incbin "lvl/settings/1A6_Set.bin":$21..$22
incbin "lvl/settings/1A7_Set.bin":$21..$22
incbin "lvl/settings/1A8_Set.bin":$21..$22
incbin "lvl/settings/1A9_Set.bin":$21..$22
incbin "lvl/settings/1AA_Set.bin":$21..$22
incbin "lvl/settings/1AB_Set.bin":$21..$22
incbin "lvl/settings/1AC_Set.bin":$21..$22
incbin "lvl/settings/1AD_Set.bin":$21..$22
incbin "lvl/settings/1AE_Set.bin":$21..$22
incbin "lvl/settings/1AF_Set.bin":$21..$22
incbin "lvl/settings/1B0_Set.bin":$21..$22
incbin "lvl/settings/1B1_Set.bin":$21..$22
incbin "lvl/settings/1B2_Set.bin":$21..$22
incbin "lvl/settings/1B3_Set.bin":$21..$22
incbin "lvl/settings/1B4_Set.bin":$21..$22
incbin "lvl/settings/1B5_Set.bin":$21..$22
incbin "lvl/settings/1B6_Set.bin":$21..$22
incbin "lvl/settings/1B7_Set.bin":$21..$22
incbin "lvl/settings/1B8_Set.bin":$21..$22
incbin "lvl/settings/1B9_Set.bin":$21..$22
incbin "lvl/settings/1BA_Set.bin":$21..$22
incbin "lvl/settings/1BB_Set.bin":$21..$22
incbin "lvl/settings/1BC_Set.bin":$21..$22
incbin "lvl/settings/1BD_Set.bin":$21..$22
incbin "lvl/settings/1BE_Set.bin":$21..$22
incbin "lvl/settings/1BF_Set.bin":$21..$22
incbin "lvl/settings/1C0_Set.bin":$21..$22
incbin "lvl/settings/1C1_Set.bin":$21..$22
incbin "lvl/settings/1C2_Set.bin":$21..$22
incbin "lvl/settings/1C3_Set.bin":$21..$22
incbin "lvl/settings/1C4_Set.bin":$21..$22
incbin "lvl/settings/1C5_Set.bin":$21..$22
incbin "lvl/settings/1C6_Set.bin":$21..$22
incbin "lvl/settings/1C7_Set.bin":$21..$22
incbin "lvl/settings/1C8_Set.bin":$21..$22
incbin "lvl/settings/1C9_Set.bin":$21..$22
incbin "lvl/settings/1CA_Set.bin":$21..$22
incbin "lvl/settings/1CB_Set.bin":$21..$22
incbin "lvl/settings/1CC_Set.bin":$21..$22
incbin "lvl/settings/1CD_Set.bin":$21..$22
incbin "lvl/settings/1CE_Set.bin":$21..$22
incbin "lvl/settings/1CF_Set.bin":$21..$22
incbin "lvl/settings/1D0_Set.bin":$21..$22
incbin "lvl/settings/1D1_Set.bin":$21..$22
incbin "lvl/settings/1D2_Set.bin":$21..$22
incbin "lvl/settings/1D3_Set.bin":$21..$22
incbin "lvl/settings/1D4_Set.bin":$21..$22
incbin "lvl/settings/1D5_Set.bin":$21..$22
incbin "lvl/settings/1D6_Set.bin":$21..$22
incbin "lvl/settings/1D7_Set.bin":$21..$22
incbin "lvl/settings/1D8_Set.bin":$21..$22
incbin "lvl/settings/1D9_Set.bin":$21..$22
incbin "lvl/settings/1DA_Set.bin":$21..$22
incbin "lvl/settings/1DB_Set.bin":$21..$22
incbin "lvl/settings/1DC_Set.bin":$21..$22
incbin "lvl/settings/1DD_Set.bin":$21..$22
incbin "lvl/settings/1DE_Set.bin":$21..$22
incbin "lvl/settings/1DF_Set.bin":$21..$22
incbin "lvl/settings/1E0_Set.bin":$21..$22
incbin "lvl/settings/1E1_Set.bin":$21..$22
incbin "lvl/settings/1E2_Set.bin":$21..$22
incbin "lvl/settings/1E3_Set.bin":$21..$22
incbin "lvl/settings/1E4_Set.bin":$21..$22
incbin "lvl/settings/1E5_Set.bin":$21..$22
incbin "lvl/settings/1E6_Set.bin":$21..$22
incbin "lvl/settings/1E7_Set.bin":$21..$22
incbin "lvl/settings/1E8_Set.bin":$21..$22
incbin "lvl/settings/1E9_Set.bin":$21..$22
incbin "lvl/settings/1EA_Set.bin":$21..$22
incbin "lvl/settings/1EB_Set.bin":$21..$22
incbin "lvl/settings/1EC_Set.bin":$21..$22
incbin "lvl/settings/1ED_Set.bin":$21..$22
incbin "lvl/settings/1EE_Set.bin":$21..$22
incbin "lvl/settings/1EF_Set.bin":$21..$22
incbin "lvl/settings/1F0_Set.bin":$21..$22
incbin "lvl/settings/1F1_Set.bin":$21..$22
incbin "lvl/settings/1F2_Set.bin":$21..$22
incbin "lvl/settings/1F3_Set.bin":$21..$22
incbin "lvl/settings/1F4_Set.bin":$21..$22
incbin "lvl/settings/1F5_Set.bin":$21..$22
incbin "lvl/settings/1F6_Set.bin":$21..$22
incbin "lvl/settings/1F7_Set.bin":$21..$22
incbin "lvl/settings/1F8_Set.bin":$21..$22
incbin "lvl/settings/1F9_Set.bin":$21..$22
incbin "lvl/settings/1FA_Set.bin":$21..$22
incbin "lvl/settings/1FB_Set.bin":$21..$22
incbin "lvl/settings/1FC_Set.bin":$21..$22
incbin "lvl/settings/1FD_Set.bin":$21..$22
incbin "lvl/settings/1FE_Set.bin":$21..$22
incbin "lvl/settings/1FF_Set.bin":$21..$22

DATA_06FA00:						; Lunar Magic table
incbin "lvl/settings/000_Set.bin":$2E..$2F
incbin "lvl/settings/001_Set.bin":$2E..$2F
incbin "lvl/settings/002_Set.bin":$2E..$2F
incbin "lvl/settings/003_Set.bin":$2E..$2F
incbin "lvl/settings/004_Set.bin":$2E..$2F
incbin "lvl/settings/005_Set.bin":$2E..$2F
incbin "lvl/settings/006_Set.bin":$2E..$2F
incbin "lvl/settings/007_Set.bin":$2E..$2F
incbin "lvl/settings/008_Set.bin":$2E..$2F
incbin "lvl/settings/009_Set.bin":$2E..$2F
incbin "lvl/settings/00A_Set.bin":$2E..$2F
incbin "lvl/settings/00B_Set.bin":$2E..$2F
incbin "lvl/settings/00C_Set.bin":$2E..$2F
incbin "lvl/settings/00D_Set.bin":$2E..$2F
incbin "lvl/settings/00E_Set.bin":$2E..$2F
incbin "lvl/settings/00F_Set.bin":$2E..$2F
incbin "lvl/settings/010_Set.bin":$2E..$2F
incbin "lvl/settings/011_Set.bin":$2E..$2F
incbin "lvl/settings/012_Set.bin":$2E..$2F
incbin "lvl/settings/013_Set.bin":$2E..$2F
incbin "lvl/settings/014_Set.bin":$2E..$2F
incbin "lvl/settings/015_Set.bin":$2E..$2F
incbin "lvl/settings/016_Set.bin":$2E..$2F
incbin "lvl/settings/017_Set.bin":$2E..$2F
incbin "lvl/settings/018_Set.bin":$2E..$2F
incbin "lvl/settings/019_Set.bin":$2E..$2F
incbin "lvl/settings/01A_Set.bin":$2E..$2F
incbin "lvl/settings/01B_Set.bin":$2E..$2F
incbin "lvl/settings/01C_Set.bin":$2E..$2F
incbin "lvl/settings/01D_Set.bin":$2E..$2F
incbin "lvl/settings/01E_Set.bin":$2E..$2F
incbin "lvl/settings/01F_Set.bin":$2E..$2F
incbin "lvl/settings/020_Set.bin":$2E..$2F
incbin "lvl/settings/021_Set.bin":$2E..$2F
incbin "lvl/settings/022_Set.bin":$2E..$2F
incbin "lvl/settings/023_Set.bin":$2E..$2F
incbin "lvl/settings/024_Set.bin":$2E..$2F
incbin "lvl/settings/025_Set.bin":$2E..$2F
incbin "lvl/settings/026_Set.bin":$2E..$2F
incbin "lvl/settings/027_Set.bin":$2E..$2F
incbin "lvl/settings/028_Set.bin":$2E..$2F
incbin "lvl/settings/029_Set.bin":$2E..$2F
incbin "lvl/settings/02A_Set.bin":$2E..$2F
incbin "lvl/settings/02B_Set.bin":$2E..$2F
incbin "lvl/settings/02C_Set.bin":$2E..$2F
incbin "lvl/settings/02D_Set.bin":$2E..$2F
incbin "lvl/settings/02E_Set.bin":$2E..$2F
incbin "lvl/settings/02F_Set.bin":$2E..$2F
incbin "lvl/settings/030_Set.bin":$2E..$2F
incbin "lvl/settings/031_Set.bin":$2E..$2F
incbin "lvl/settings/032_Set.bin":$2E..$2F
incbin "lvl/settings/033_Set.bin":$2E..$2F
incbin "lvl/settings/034_Set.bin":$2E..$2F
incbin "lvl/settings/035_Set.bin":$2E..$2F
incbin "lvl/settings/036_Set.bin":$2E..$2F
incbin "lvl/settings/037_Set.bin":$2E..$2F
incbin "lvl/settings/038_Set.bin":$2E..$2F
incbin "lvl/settings/039_Set.bin":$2E..$2F
incbin "lvl/settings/03A_Set.bin":$2E..$2F
incbin "lvl/settings/03B_Set.bin":$2E..$2F
incbin "lvl/settings/03C_Set.bin":$2E..$2F
incbin "lvl/settings/03D_Set.bin":$2E..$2F
incbin "lvl/settings/03E_Set.bin":$2E..$2F
incbin "lvl/settings/03F_Set.bin":$2E..$2F
incbin "lvl/settings/040_Set.bin":$2E..$2F
incbin "lvl/settings/041_Set.bin":$2E..$2F
incbin "lvl/settings/042_Set.bin":$2E..$2F
incbin "lvl/settings/043_Set.bin":$2E..$2F
incbin "lvl/settings/044_Set.bin":$2E..$2F
incbin "lvl/settings/045_Set.bin":$2E..$2F
incbin "lvl/settings/046_Set.bin":$2E..$2F
incbin "lvl/settings/047_Set.bin":$2E..$2F
incbin "lvl/settings/048_Set.bin":$2E..$2F
incbin "lvl/settings/049_Set.bin":$2E..$2F
incbin "lvl/settings/04A_Set.bin":$2E..$2F
incbin "lvl/settings/04B_Set.bin":$2E..$2F
incbin "lvl/settings/04C_Set.bin":$2E..$2F
incbin "lvl/settings/04D_Set.bin":$2E..$2F
incbin "lvl/settings/04E_Set.bin":$2E..$2F
incbin "lvl/settings/04F_Set.bin":$2E..$2F
incbin "lvl/settings/050_Set.bin":$2E..$2F
incbin "lvl/settings/051_Set.bin":$2E..$2F
incbin "lvl/settings/052_Set.bin":$2E..$2F
incbin "lvl/settings/053_Set.bin":$2E..$2F
incbin "lvl/settings/054_Set.bin":$2E..$2F
incbin "lvl/settings/055_Set.bin":$2E..$2F
incbin "lvl/settings/056_Set.bin":$2E..$2F
incbin "lvl/settings/057_Set.bin":$2E..$2F
incbin "lvl/settings/058_Set.bin":$2E..$2F
incbin "lvl/settings/059_Set.bin":$2E..$2F
incbin "lvl/settings/05A_Set.bin":$2E..$2F
incbin "lvl/settings/05B_Set.bin":$2E..$2F
incbin "lvl/settings/05C_Set.bin":$2E..$2F
incbin "lvl/settings/05D_Set.bin":$2E..$2F
incbin "lvl/settings/05E_Set.bin":$2E..$2F
incbin "lvl/settings/05F_Set.bin":$2E..$2F
incbin "lvl/settings/060_Set.bin":$2E..$2F
incbin "lvl/settings/061_Set.bin":$2E..$2F
incbin "lvl/settings/062_Set.bin":$2E..$2F
incbin "lvl/settings/063_Set.bin":$2E..$2F
incbin "lvl/settings/064_Set.bin":$2E..$2F
incbin "lvl/settings/065_Set.bin":$2E..$2F
incbin "lvl/settings/066_Set.bin":$2E..$2F
incbin "lvl/settings/067_Set.bin":$2E..$2F
incbin "lvl/settings/068_Set.bin":$2E..$2F
incbin "lvl/settings/069_Set.bin":$2E..$2F
incbin "lvl/settings/06A_Set.bin":$2E..$2F
incbin "lvl/settings/06B_Set.bin":$2E..$2F
incbin "lvl/settings/06C_Set.bin":$2E..$2F
incbin "lvl/settings/06D_Set.bin":$2E..$2F
incbin "lvl/settings/06E_Set.bin":$2E..$2F
incbin "lvl/settings/06F_Set.bin":$2E..$2F
incbin "lvl/settings/070_Set.bin":$2E..$2F
incbin "lvl/settings/071_Set.bin":$2E..$2F
incbin "lvl/settings/072_Set.bin":$2E..$2F
incbin "lvl/settings/073_Set.bin":$2E..$2F
incbin "lvl/settings/074_Set.bin":$2E..$2F
incbin "lvl/settings/075_Set.bin":$2E..$2F
incbin "lvl/settings/076_Set.bin":$2E..$2F
incbin "lvl/settings/077_Set.bin":$2E..$2F
incbin "lvl/settings/078_Set.bin":$2E..$2F
incbin "lvl/settings/079_Set.bin":$2E..$2F
incbin "lvl/settings/07A_Set.bin":$2E..$2F
incbin "lvl/settings/07B_Set.bin":$2E..$2F
incbin "lvl/settings/07C_Set.bin":$2E..$2F
incbin "lvl/settings/07D_Set.bin":$2E..$2F
incbin "lvl/settings/07E_Set.bin":$2E..$2F
incbin "lvl/settings/07F_Set.bin":$2E..$2F
incbin "lvl/settings/080_Set.bin":$2E..$2F
incbin "lvl/settings/081_Set.bin":$2E..$2F
incbin "lvl/settings/082_Set.bin":$2E..$2F
incbin "lvl/settings/083_Set.bin":$2E..$2F
incbin "lvl/settings/084_Set.bin":$2E..$2F
incbin "lvl/settings/085_Set.bin":$2E..$2F
incbin "lvl/settings/086_Set.bin":$2E..$2F
incbin "lvl/settings/087_Set.bin":$2E..$2F
incbin "lvl/settings/088_Set.bin":$2E..$2F
incbin "lvl/settings/089_Set.bin":$2E..$2F
incbin "lvl/settings/08A_Set.bin":$2E..$2F
incbin "lvl/settings/08B_Set.bin":$2E..$2F
incbin "lvl/settings/08C_Set.bin":$2E..$2F
incbin "lvl/settings/08D_Set.bin":$2E..$2F
incbin "lvl/settings/08E_Set.bin":$2E..$2F
incbin "lvl/settings/08F_Set.bin":$2E..$2F
incbin "lvl/settings/090_Set.bin":$2E..$2F
incbin "lvl/settings/091_Set.bin":$2E..$2F
incbin "lvl/settings/092_Set.bin":$2E..$2F
incbin "lvl/settings/093_Set.bin":$2E..$2F
incbin "lvl/settings/094_Set.bin":$2E..$2F
incbin "lvl/settings/095_Set.bin":$2E..$2F
incbin "lvl/settings/096_Set.bin":$2E..$2F
incbin "lvl/settings/097_Set.bin":$2E..$2F
incbin "lvl/settings/098_Set.bin":$2E..$2F
incbin "lvl/settings/099_Set.bin":$2E..$2F
incbin "lvl/settings/09A_Set.bin":$2E..$2F
incbin "lvl/settings/09B_Set.bin":$2E..$2F
incbin "lvl/settings/09C_Set.bin":$2E..$2F
incbin "lvl/settings/09D_Set.bin":$2E..$2F
incbin "lvl/settings/09E_Set.bin":$2E..$2F
incbin "lvl/settings/09F_Set.bin":$2E..$2F
incbin "lvl/settings/0A0_Set.bin":$2E..$2F
incbin "lvl/settings/0A1_Set.bin":$2E..$2F
incbin "lvl/settings/0A2_Set.bin":$2E..$2F
incbin "lvl/settings/0A3_Set.bin":$2E..$2F
incbin "lvl/settings/0A4_Set.bin":$2E..$2F
incbin "lvl/settings/0A5_Set.bin":$2E..$2F
incbin "lvl/settings/0A6_Set.bin":$2E..$2F
incbin "lvl/settings/0A7_Set.bin":$2E..$2F
incbin "lvl/settings/0A8_Set.bin":$2E..$2F
incbin "lvl/settings/0A9_Set.bin":$2E..$2F
incbin "lvl/settings/0AA_Set.bin":$2E..$2F
incbin "lvl/settings/0AB_Set.bin":$2E..$2F
incbin "lvl/settings/0AC_Set.bin":$2E..$2F
incbin "lvl/settings/0AD_Set.bin":$2E..$2F
incbin "lvl/settings/0AE_Set.bin":$2E..$2F
incbin "lvl/settings/0AF_Set.bin":$2E..$2F
incbin "lvl/settings/0B0_Set.bin":$2E..$2F
incbin "lvl/settings/0B1_Set.bin":$2E..$2F
incbin "lvl/settings/0B2_Set.bin":$2E..$2F
incbin "lvl/settings/0B3_Set.bin":$2E..$2F
incbin "lvl/settings/0B4_Set.bin":$2E..$2F
incbin "lvl/settings/0B5_Set.bin":$2E..$2F
incbin "lvl/settings/0B6_Set.bin":$2E..$2F
incbin "lvl/settings/0B7_Set.bin":$2E..$2F
incbin "lvl/settings/0B8_Set.bin":$2E..$2F
incbin "lvl/settings/0B9_Set.bin":$2E..$2F
incbin "lvl/settings/0BA_Set.bin":$2E..$2F
incbin "lvl/settings/0BB_Set.bin":$2E..$2F
incbin "lvl/settings/0BC_Set.bin":$2E..$2F
incbin "lvl/settings/0BD_Set.bin":$2E..$2F
incbin "lvl/settings/0BE_Set.bin":$2E..$2F
incbin "lvl/settings/0BF_Set.bin":$2E..$2F
incbin "lvl/settings/0C0_Set.bin":$2E..$2F
incbin "lvl/settings/0C1_Set.bin":$2E..$2F
incbin "lvl/settings/0C2_Set.bin":$2E..$2F
incbin "lvl/settings/0C3_Set.bin":$2E..$2F
incbin "lvl/settings/0C4_Set.bin":$2E..$2F
incbin "lvl/settings/0C5_Set.bin":$2E..$2F
incbin "lvl/settings/0C6_Set.bin":$2E..$2F
incbin "lvl/settings/0C7_Set.bin":$2E..$2F
incbin "lvl/settings/0C8_Set.bin":$2E..$2F
incbin "lvl/settings/0C9_Set.bin":$2E..$2F
incbin "lvl/settings/0CA_Set.bin":$2E..$2F
incbin "lvl/settings/0CB_Set.bin":$2E..$2F
incbin "lvl/settings/0CC_Set.bin":$2E..$2F
incbin "lvl/settings/0CD_Set.bin":$2E..$2F
incbin "lvl/settings/0CE_Set.bin":$2E..$2F
incbin "lvl/settings/0CF_Set.bin":$2E..$2F
incbin "lvl/settings/0D0_Set.bin":$2E..$2F
incbin "lvl/settings/0D1_Set.bin":$2E..$2F
incbin "lvl/settings/0D2_Set.bin":$2E..$2F
incbin "lvl/settings/0D3_Set.bin":$2E..$2F
incbin "lvl/settings/0D4_Set.bin":$2E..$2F
incbin "lvl/settings/0D5_Set.bin":$2E..$2F
incbin "lvl/settings/0D6_Set.bin":$2E..$2F
incbin "lvl/settings/0D7_Set.bin":$2E..$2F
incbin "lvl/settings/0D8_Set.bin":$2E..$2F
incbin "lvl/settings/0D9_Set.bin":$2E..$2F
incbin "lvl/settings/0DA_Set.bin":$2E..$2F
incbin "lvl/settings/0DB_Set.bin":$2E..$2F
incbin "lvl/settings/0DC_Set.bin":$2E..$2F
incbin "lvl/settings/0DD_Set.bin":$2E..$2F
incbin "lvl/settings/0DE_Set.bin":$2E..$2F
incbin "lvl/settings/0DF_Set.bin":$2E..$2F
incbin "lvl/settings/0E0_Set.bin":$2E..$2F
incbin "lvl/settings/0E1_Set.bin":$2E..$2F
incbin "lvl/settings/0E2_Set.bin":$2E..$2F
incbin "lvl/settings/0E3_Set.bin":$2E..$2F
incbin "lvl/settings/0E4_Set.bin":$2E..$2F
incbin "lvl/settings/0E5_Set.bin":$2E..$2F
incbin "lvl/settings/0E6_Set.bin":$2E..$2F
incbin "lvl/settings/0E7_Set.bin":$2E..$2F
incbin "lvl/settings/0E8_Set.bin":$2E..$2F
incbin "lvl/settings/0E9_Set.bin":$2E..$2F
incbin "lvl/settings/0EA_Set.bin":$2E..$2F
incbin "lvl/settings/0EB_Set.bin":$2E..$2F
incbin "lvl/settings/0EC_Set.bin":$2E..$2F
incbin "lvl/settings/0ED_Set.bin":$2E..$2F
incbin "lvl/settings/0EE_Set.bin":$2E..$2F
incbin "lvl/settings/0EF_Set.bin":$2E..$2F
incbin "lvl/settings/0F0_Set.bin":$2E..$2F
incbin "lvl/settings/0F1_Set.bin":$2E..$2F
incbin "lvl/settings/0F2_Set.bin":$2E..$2F
incbin "lvl/settings/0F3_Set.bin":$2E..$2F
incbin "lvl/settings/0F4_Set.bin":$2E..$2F
incbin "lvl/settings/0F5_Set.bin":$2E..$2F
incbin "lvl/settings/0F6_Set.bin":$2E..$2F
incbin "lvl/settings/0F7_Set.bin":$2E..$2F
incbin "lvl/settings/0F8_Set.bin":$2E..$2F
incbin "lvl/settings/0F9_Set.bin":$2E..$2F
incbin "lvl/settings/0FA_Set.bin":$2E..$2F
incbin "lvl/settings/0FB_Set.bin":$2E..$2F
incbin "lvl/settings/0FC_Set.bin":$2E..$2F
incbin "lvl/settings/0FD_Set.bin":$2E..$2F
incbin "lvl/settings/0FE_Set.bin":$2E..$2F
incbin "lvl/settings/0FF_Set.bin":$2E..$2F
incbin "lvl/settings/100_Set.bin":$2E..$2F
incbin "lvl/settings/101_Set.bin":$2E..$2F
incbin "lvl/settings/102_Set.bin":$2E..$2F
incbin "lvl/settings/103_Set.bin":$2E..$2F
incbin "lvl/settings/104_Set.bin":$2E..$2F
incbin "lvl/settings/105_Set.bin":$2E..$2F
incbin "lvl/settings/106_Set.bin":$2E..$2F
incbin "lvl/settings/107_Set.bin":$2E..$2F
incbin "lvl/settings/108_Set.bin":$2E..$2F
incbin "lvl/settings/109_Set.bin":$2E..$2F
incbin "lvl/settings/10A_Set.bin":$2E..$2F
incbin "lvl/settings/10B_Set.bin":$2E..$2F
incbin "lvl/settings/10C_Set.bin":$2E..$2F
incbin "lvl/settings/10D_Set.bin":$2E..$2F
incbin "lvl/settings/10E_Set.bin":$2E..$2F
incbin "lvl/settings/10F_Set.bin":$2E..$2F
incbin "lvl/settings/110_Set.bin":$2E..$2F
incbin "lvl/settings/111_Set.bin":$2E..$2F
incbin "lvl/settings/112_Set.bin":$2E..$2F
incbin "lvl/settings/113_Set.bin":$2E..$2F
incbin "lvl/settings/114_Set.bin":$2E..$2F
incbin "lvl/settings/115_Set.bin":$2E..$2F
incbin "lvl/settings/116_Set.bin":$2E..$2F
incbin "lvl/settings/117_Set.bin":$2E..$2F
incbin "lvl/settings/118_Set.bin":$2E..$2F
incbin "lvl/settings/119_Set.bin":$2E..$2F
incbin "lvl/settings/11A_Set.bin":$2E..$2F
incbin "lvl/settings/11B_Set.bin":$2E..$2F
incbin "lvl/settings/11C_Set.bin":$2E..$2F
incbin "lvl/settings/11D_Set.bin":$2E..$2F
incbin "lvl/settings/11E_Set.bin":$2E..$2F
incbin "lvl/settings/11F_Set.bin":$2E..$2F
incbin "lvl/settings/120_Set.bin":$2E..$2F
incbin "lvl/settings/121_Set.bin":$2E..$2F
incbin "lvl/settings/122_Set.bin":$2E..$2F
incbin "lvl/settings/123_Set.bin":$2E..$2F
incbin "lvl/settings/124_Set.bin":$2E..$2F
incbin "lvl/settings/125_Set.bin":$2E..$2F
incbin "lvl/settings/126_Set.bin":$2E..$2F
incbin "lvl/settings/127_Set.bin":$2E..$2F
incbin "lvl/settings/128_Set.bin":$2E..$2F
incbin "lvl/settings/129_Set.bin":$2E..$2F
incbin "lvl/settings/12A_Set.bin":$2E..$2F
incbin "lvl/settings/12B_Set.bin":$2E..$2F
incbin "lvl/settings/12C_Set.bin":$2E..$2F
incbin "lvl/settings/12D_Set.bin":$2E..$2F
incbin "lvl/settings/12E_Set.bin":$2E..$2F
incbin "lvl/settings/12F_Set.bin":$2E..$2F
incbin "lvl/settings/130_Set.bin":$2E..$2F
incbin "lvl/settings/131_Set.bin":$2E..$2F
incbin "lvl/settings/132_Set.bin":$2E..$2F
incbin "lvl/settings/133_Set.bin":$2E..$2F
incbin "lvl/settings/134_Set.bin":$2E..$2F
incbin "lvl/settings/135_Set.bin":$2E..$2F
incbin "lvl/settings/136_Set.bin":$2E..$2F
incbin "lvl/settings/137_Set.bin":$2E..$2F
incbin "lvl/settings/138_Set.bin":$2E..$2F
incbin "lvl/settings/139_Set.bin":$2E..$2F
incbin "lvl/settings/13A_Set.bin":$2E..$2F
incbin "lvl/settings/13B_Set.bin":$2E..$2F
incbin "lvl/settings/13C_Set.bin":$2E..$2F
incbin "lvl/settings/13D_Set.bin":$2E..$2F
incbin "lvl/settings/13E_Set.bin":$2E..$2F
incbin "lvl/settings/13F_Set.bin":$2E..$2F
incbin "lvl/settings/140_Set.bin":$2E..$2F
incbin "lvl/settings/141_Set.bin":$2E..$2F
incbin "lvl/settings/142_Set.bin":$2E..$2F
incbin "lvl/settings/143_Set.bin":$2E..$2F
incbin "lvl/settings/144_Set.bin":$2E..$2F
incbin "lvl/settings/145_Set.bin":$2E..$2F
incbin "lvl/settings/146_Set.bin":$2E..$2F
incbin "lvl/settings/147_Set.bin":$2E..$2F
incbin "lvl/settings/148_Set.bin":$2E..$2F
incbin "lvl/settings/149_Set.bin":$2E..$2F
incbin "lvl/settings/14A_Set.bin":$2E..$2F
incbin "lvl/settings/14B_Set.bin":$2E..$2F
incbin "lvl/settings/14C_Set.bin":$2E..$2F
incbin "lvl/settings/14D_Set.bin":$2E..$2F
incbin "lvl/settings/14E_Set.bin":$2E..$2F
incbin "lvl/settings/14F_Set.bin":$2E..$2F
incbin "lvl/settings/150_Set.bin":$2E..$2F
incbin "lvl/settings/151_Set.bin":$2E..$2F
incbin "lvl/settings/152_Set.bin":$2E..$2F
incbin "lvl/settings/153_Set.bin":$2E..$2F
incbin "lvl/settings/154_Set.bin":$2E..$2F
incbin "lvl/settings/155_Set.bin":$2E..$2F
incbin "lvl/settings/156_Set.bin":$2E..$2F
incbin "lvl/settings/157_Set.bin":$2E..$2F
incbin "lvl/settings/158_Set.bin":$2E..$2F
incbin "lvl/settings/159_Set.bin":$2E..$2F
incbin "lvl/settings/15A_Set.bin":$2E..$2F
incbin "lvl/settings/15B_Set.bin":$2E..$2F
incbin "lvl/settings/15C_Set.bin":$2E..$2F
incbin "lvl/settings/15D_Set.bin":$2E..$2F
incbin "lvl/settings/15E_Set.bin":$2E..$2F
incbin "lvl/settings/15F_Set.bin":$2E..$2F
incbin "lvl/settings/160_Set.bin":$2E..$2F
incbin "lvl/settings/161_Set.bin":$2E..$2F
incbin "lvl/settings/162_Set.bin":$2E..$2F
incbin "lvl/settings/163_Set.bin":$2E..$2F
incbin "lvl/settings/164_Set.bin":$2E..$2F
incbin "lvl/settings/165_Set.bin":$2E..$2F
incbin "lvl/settings/166_Set.bin":$2E..$2F
incbin "lvl/settings/167_Set.bin":$2E..$2F
incbin "lvl/settings/168_Set.bin":$2E..$2F
incbin "lvl/settings/169_Set.bin":$2E..$2F
incbin "lvl/settings/16A_Set.bin":$2E..$2F
incbin "lvl/settings/16B_Set.bin":$2E..$2F
incbin "lvl/settings/16C_Set.bin":$2E..$2F
incbin "lvl/settings/16D_Set.bin":$2E..$2F
incbin "lvl/settings/16E_Set.bin":$2E..$2F
incbin "lvl/settings/16F_Set.bin":$2E..$2F
incbin "lvl/settings/170_Set.bin":$2E..$2F
incbin "lvl/settings/171_Set.bin":$2E..$2F
incbin "lvl/settings/172_Set.bin":$2E..$2F
incbin "lvl/settings/173_Set.bin":$2E..$2F
incbin "lvl/settings/174_Set.bin":$2E..$2F
incbin "lvl/settings/175_Set.bin":$2E..$2F
incbin "lvl/settings/176_Set.bin":$2E..$2F
incbin "lvl/settings/177_Set.bin":$2E..$2F
incbin "lvl/settings/178_Set.bin":$2E..$2F
incbin "lvl/settings/179_Set.bin":$2E..$2F
incbin "lvl/settings/17A_Set.bin":$2E..$2F
incbin "lvl/settings/17B_Set.bin":$2E..$2F
incbin "lvl/settings/17C_Set.bin":$2E..$2F
incbin "lvl/settings/17D_Set.bin":$2E..$2F
incbin "lvl/settings/17E_Set.bin":$2E..$2F
incbin "lvl/settings/17F_Set.bin":$2E..$2F
incbin "lvl/settings/180_Set.bin":$2E..$2F
incbin "lvl/settings/181_Set.bin":$2E..$2F
incbin "lvl/settings/182_Set.bin":$2E..$2F
incbin "lvl/settings/183_Set.bin":$2E..$2F
incbin "lvl/settings/184_Set.bin":$2E..$2F
incbin "lvl/settings/185_Set.bin":$2E..$2F
incbin "lvl/settings/186_Set.bin":$2E..$2F
incbin "lvl/settings/187_Set.bin":$2E..$2F
incbin "lvl/settings/188_Set.bin":$2E..$2F
incbin "lvl/settings/189_Set.bin":$2E..$2F
incbin "lvl/settings/18A_Set.bin":$2E..$2F
incbin "lvl/settings/18B_Set.bin":$2E..$2F
incbin "lvl/settings/18C_Set.bin":$2E..$2F
incbin "lvl/settings/18D_Set.bin":$2E..$2F
incbin "lvl/settings/18E_Set.bin":$2E..$2F
incbin "lvl/settings/18F_Set.bin":$2E..$2F
incbin "lvl/settings/190_Set.bin":$2E..$2F
incbin "lvl/settings/191_Set.bin":$2E..$2F
incbin "lvl/settings/192_Set.bin":$2E..$2F
incbin "lvl/settings/193_Set.bin":$2E..$2F
incbin "lvl/settings/194_Set.bin":$2E..$2F
incbin "lvl/settings/195_Set.bin":$2E..$2F
incbin "lvl/settings/196_Set.bin":$2E..$2F
incbin "lvl/settings/197_Set.bin":$2E..$2F
incbin "lvl/settings/198_Set.bin":$2E..$2F
incbin "lvl/settings/199_Set.bin":$2E..$2F
incbin "lvl/settings/19A_Set.bin":$2E..$2F
incbin "lvl/settings/19B_Set.bin":$2E..$2F
incbin "lvl/settings/19C_Set.bin":$2E..$2F
incbin "lvl/settings/19D_Set.bin":$2E..$2F
incbin "lvl/settings/19E_Set.bin":$2E..$2F
incbin "lvl/settings/19F_Set.bin":$2E..$2F
incbin "lvl/settings/1A0_Set.bin":$2E..$2F
incbin "lvl/settings/1A1_Set.bin":$2E..$2F
incbin "lvl/settings/1A2_Set.bin":$2E..$2F
incbin "lvl/settings/1A3_Set.bin":$2E..$2F
incbin "lvl/settings/1A4_Set.bin":$2E..$2F
incbin "lvl/settings/1A5_Set.bin":$2E..$2F
incbin "lvl/settings/1A6_Set.bin":$2E..$2F
incbin "lvl/settings/1A7_Set.bin":$2E..$2F
incbin "lvl/settings/1A8_Set.bin":$2E..$2F
incbin "lvl/settings/1A9_Set.bin":$2E..$2F
incbin "lvl/settings/1AA_Set.bin":$2E..$2F
incbin "lvl/settings/1AB_Set.bin":$2E..$2F
incbin "lvl/settings/1AC_Set.bin":$2E..$2F
incbin "lvl/settings/1AD_Set.bin":$2E..$2F
incbin "lvl/settings/1AE_Set.bin":$2E..$2F
incbin "lvl/settings/1AF_Set.bin":$2E..$2F
incbin "lvl/settings/1B0_Set.bin":$2E..$2F
incbin "lvl/settings/1B1_Set.bin":$2E..$2F
incbin "lvl/settings/1B2_Set.bin":$2E..$2F
incbin "lvl/settings/1B3_Set.bin":$2E..$2F
incbin "lvl/settings/1B4_Set.bin":$2E..$2F
incbin "lvl/settings/1B5_Set.bin":$2E..$2F
incbin "lvl/settings/1B6_Set.bin":$2E..$2F
incbin "lvl/settings/1B7_Set.bin":$2E..$2F
incbin "lvl/settings/1B8_Set.bin":$2E..$2F
incbin "lvl/settings/1B9_Set.bin":$2E..$2F
incbin "lvl/settings/1BA_Set.bin":$2E..$2F
incbin "lvl/settings/1BB_Set.bin":$2E..$2F
incbin "lvl/settings/1BC_Set.bin":$2E..$2F
incbin "lvl/settings/1BD_Set.bin":$2E..$2F
incbin "lvl/settings/1BE_Set.bin":$2E..$2F
incbin "lvl/settings/1BF_Set.bin":$2E..$2F
incbin "lvl/settings/1C0_Set.bin":$2E..$2F
incbin "lvl/settings/1C1_Set.bin":$2E..$2F
incbin "lvl/settings/1C2_Set.bin":$2E..$2F
incbin "lvl/settings/1C3_Set.bin":$2E..$2F
incbin "lvl/settings/1C4_Set.bin":$2E..$2F
incbin "lvl/settings/1C5_Set.bin":$2E..$2F
incbin "lvl/settings/1C6_Set.bin":$2E..$2F
incbin "lvl/settings/1C7_Set.bin":$2E..$2F
incbin "lvl/settings/1C8_Set.bin":$2E..$2F
incbin "lvl/settings/1C9_Set.bin":$2E..$2F
incbin "lvl/settings/1CA_Set.bin":$2E..$2F
incbin "lvl/settings/1CB_Set.bin":$2E..$2F
incbin "lvl/settings/1CC_Set.bin":$2E..$2F
incbin "lvl/settings/1CD_Set.bin":$2E..$2F
incbin "lvl/settings/1CE_Set.bin":$2E..$2F
incbin "lvl/settings/1CF_Set.bin":$2E..$2F
incbin "lvl/settings/1D0_Set.bin":$2E..$2F
incbin "lvl/settings/1D1_Set.bin":$2E..$2F
incbin "lvl/settings/1D2_Set.bin":$2E..$2F
incbin "lvl/settings/1D3_Set.bin":$2E..$2F
incbin "lvl/settings/1D4_Set.bin":$2E..$2F
incbin "lvl/settings/1D5_Set.bin":$2E..$2F
incbin "lvl/settings/1D6_Set.bin":$2E..$2F
incbin "lvl/settings/1D7_Set.bin":$2E..$2F
incbin "lvl/settings/1D8_Set.bin":$2E..$2F
incbin "lvl/settings/1D9_Set.bin":$2E..$2F
incbin "lvl/settings/1DA_Set.bin":$2E..$2F
incbin "lvl/settings/1DB_Set.bin":$2E..$2F
incbin "lvl/settings/1DC_Set.bin":$2E..$2F
incbin "lvl/settings/1DD_Set.bin":$2E..$2F
incbin "lvl/settings/1DE_Set.bin":$2E..$2F
incbin "lvl/settings/1DF_Set.bin":$2E..$2F
incbin "lvl/settings/1E0_Set.bin":$2E..$2F
incbin "lvl/settings/1E1_Set.bin":$2E..$2F
incbin "lvl/settings/1E2_Set.bin":$2E..$2F
incbin "lvl/settings/1E3_Set.bin":$2E..$2F
incbin "lvl/settings/1E4_Set.bin":$2E..$2F
incbin "lvl/settings/1E5_Set.bin":$2E..$2F
incbin "lvl/settings/1E6_Set.bin":$2E..$2F
incbin "lvl/settings/1E7_Set.bin":$2E..$2F
incbin "lvl/settings/1E8_Set.bin":$2E..$2F
incbin "lvl/settings/1E9_Set.bin":$2E..$2F
incbin "lvl/settings/1EA_Set.bin":$2E..$2F
incbin "lvl/settings/1EB_Set.bin":$2E..$2F
incbin "lvl/settings/1EC_Set.bin":$2E..$2F
incbin "lvl/settings/1ED_Set.bin":$2E..$2F
incbin "lvl/settings/1EE_Set.bin":$2E..$2F
incbin "lvl/settings/1EF_Set.bin":$2E..$2F
incbin "lvl/settings/1F0_Set.bin":$2E..$2F
incbin "lvl/settings/1F1_Set.bin":$2E..$2F
incbin "lvl/settings/1F2_Set.bin":$2E..$2F
incbin "lvl/settings/1F3_Set.bin":$2E..$2F
incbin "lvl/settings/1F4_Set.bin":$2E..$2F
incbin "lvl/settings/1F5_Set.bin":$2E..$2F
incbin "lvl/settings/1F6_Set.bin":$2E..$2F
incbin "lvl/settings/1F7_Set.bin":$2E..$2F
incbin "lvl/settings/1F8_Set.bin":$2E..$2F
incbin "lvl/settings/1F9_Set.bin":$2E..$2F
incbin "lvl/settings/1FA_Set.bin":$2E..$2F
incbin "lvl/settings/1FB_Set.bin":$2E..$2F
incbin "lvl/settings/1FC_Set.bin":$2E..$2F
incbin "lvl/settings/1FD_Set.bin":$2E..$2F
incbin "lvl/settings/1FE_Set.bin":$2E..$2F
incbin "lvl/settings/1FF_Set.bin":$2E..$2F

DATA_06FC00:						; Lunar Magic table
incbin "lvl/settings/000_Set.bin":$2B..$2C
incbin "lvl/settings/001_Set.bin":$2B..$2C
incbin "lvl/settings/002_Set.bin":$2B..$2C
incbin "lvl/settings/003_Set.bin":$2B..$2C
incbin "lvl/settings/004_Set.bin":$2B..$2C
incbin "lvl/settings/005_Set.bin":$2B..$2C
incbin "lvl/settings/006_Set.bin":$2B..$2C
incbin "lvl/settings/007_Set.bin":$2B..$2C
incbin "lvl/settings/008_Set.bin":$2B..$2C
incbin "lvl/settings/009_Set.bin":$2B..$2C
incbin "lvl/settings/00A_Set.bin":$2B..$2C
incbin "lvl/settings/00B_Set.bin":$2B..$2C
incbin "lvl/settings/00C_Set.bin":$2B..$2C
incbin "lvl/settings/00D_Set.bin":$2B..$2C
incbin "lvl/settings/00E_Set.bin":$2B..$2C
incbin "lvl/settings/00F_Set.bin":$2B..$2C
incbin "lvl/settings/010_Set.bin":$2B..$2C
incbin "lvl/settings/011_Set.bin":$2B..$2C
incbin "lvl/settings/012_Set.bin":$2B..$2C
incbin "lvl/settings/013_Set.bin":$2B..$2C
incbin "lvl/settings/014_Set.bin":$2B..$2C
incbin "lvl/settings/015_Set.bin":$2B..$2C
incbin "lvl/settings/016_Set.bin":$2B..$2C
incbin "lvl/settings/017_Set.bin":$2B..$2C
incbin "lvl/settings/018_Set.bin":$2B..$2C
incbin "lvl/settings/019_Set.bin":$2B..$2C
incbin "lvl/settings/01A_Set.bin":$2B..$2C
incbin "lvl/settings/01B_Set.bin":$2B..$2C
incbin "lvl/settings/01C_Set.bin":$2B..$2C
incbin "lvl/settings/01D_Set.bin":$2B..$2C
incbin "lvl/settings/01E_Set.bin":$2B..$2C
incbin "lvl/settings/01F_Set.bin":$2B..$2C
incbin "lvl/settings/020_Set.bin":$2B..$2C
incbin "lvl/settings/021_Set.bin":$2B..$2C
incbin "lvl/settings/022_Set.bin":$2B..$2C
incbin "lvl/settings/023_Set.bin":$2B..$2C
incbin "lvl/settings/024_Set.bin":$2B..$2C
incbin "lvl/settings/025_Set.bin":$2B..$2C
incbin "lvl/settings/026_Set.bin":$2B..$2C
incbin "lvl/settings/027_Set.bin":$2B..$2C
incbin "lvl/settings/028_Set.bin":$2B..$2C
incbin "lvl/settings/029_Set.bin":$2B..$2C
incbin "lvl/settings/02A_Set.bin":$2B..$2C
incbin "lvl/settings/02B_Set.bin":$2B..$2C
incbin "lvl/settings/02C_Set.bin":$2B..$2C
incbin "lvl/settings/02D_Set.bin":$2B..$2C
incbin "lvl/settings/02E_Set.bin":$2B..$2C
incbin "lvl/settings/02F_Set.bin":$2B..$2C
incbin "lvl/settings/030_Set.bin":$2B..$2C
incbin "lvl/settings/031_Set.bin":$2B..$2C
incbin "lvl/settings/032_Set.bin":$2B..$2C
incbin "lvl/settings/033_Set.bin":$2B..$2C
incbin "lvl/settings/034_Set.bin":$2B..$2C
incbin "lvl/settings/035_Set.bin":$2B..$2C
incbin "lvl/settings/036_Set.bin":$2B..$2C
incbin "lvl/settings/037_Set.bin":$2B..$2C
incbin "lvl/settings/038_Set.bin":$2B..$2C
incbin "lvl/settings/039_Set.bin":$2B..$2C
incbin "lvl/settings/03A_Set.bin":$2B..$2C
incbin "lvl/settings/03B_Set.bin":$2B..$2C
incbin "lvl/settings/03C_Set.bin":$2B..$2C
incbin "lvl/settings/03D_Set.bin":$2B..$2C
incbin "lvl/settings/03E_Set.bin":$2B..$2C
incbin "lvl/settings/03F_Set.bin":$2B..$2C
incbin "lvl/settings/040_Set.bin":$2B..$2C
incbin "lvl/settings/041_Set.bin":$2B..$2C
incbin "lvl/settings/042_Set.bin":$2B..$2C
incbin "lvl/settings/043_Set.bin":$2B..$2C
incbin "lvl/settings/044_Set.bin":$2B..$2C
incbin "lvl/settings/045_Set.bin":$2B..$2C
incbin "lvl/settings/046_Set.bin":$2B..$2C
incbin "lvl/settings/047_Set.bin":$2B..$2C
incbin "lvl/settings/048_Set.bin":$2B..$2C
incbin "lvl/settings/049_Set.bin":$2B..$2C
incbin "lvl/settings/04A_Set.bin":$2B..$2C
incbin "lvl/settings/04B_Set.bin":$2B..$2C
incbin "lvl/settings/04C_Set.bin":$2B..$2C
incbin "lvl/settings/04D_Set.bin":$2B..$2C
incbin "lvl/settings/04E_Set.bin":$2B..$2C
incbin "lvl/settings/04F_Set.bin":$2B..$2C
incbin "lvl/settings/050_Set.bin":$2B..$2C
incbin "lvl/settings/051_Set.bin":$2B..$2C
incbin "lvl/settings/052_Set.bin":$2B..$2C
incbin "lvl/settings/053_Set.bin":$2B..$2C
incbin "lvl/settings/054_Set.bin":$2B..$2C
incbin "lvl/settings/055_Set.bin":$2B..$2C
incbin "lvl/settings/056_Set.bin":$2B..$2C
incbin "lvl/settings/057_Set.bin":$2B..$2C
incbin "lvl/settings/058_Set.bin":$2B..$2C
incbin "lvl/settings/059_Set.bin":$2B..$2C
incbin "lvl/settings/05A_Set.bin":$2B..$2C
incbin "lvl/settings/05B_Set.bin":$2B..$2C
incbin "lvl/settings/05C_Set.bin":$2B..$2C
incbin "lvl/settings/05D_Set.bin":$2B..$2C
incbin "lvl/settings/05E_Set.bin":$2B..$2C
incbin "lvl/settings/05F_Set.bin":$2B..$2C
incbin "lvl/settings/060_Set.bin":$2B..$2C
incbin "lvl/settings/061_Set.bin":$2B..$2C
incbin "lvl/settings/062_Set.bin":$2B..$2C
incbin "lvl/settings/063_Set.bin":$2B..$2C
incbin "lvl/settings/064_Set.bin":$2B..$2C
incbin "lvl/settings/065_Set.bin":$2B..$2C
incbin "lvl/settings/066_Set.bin":$2B..$2C
incbin "lvl/settings/067_Set.bin":$2B..$2C
incbin "lvl/settings/068_Set.bin":$2B..$2C
incbin "lvl/settings/069_Set.bin":$2B..$2C
incbin "lvl/settings/06A_Set.bin":$2B..$2C
incbin "lvl/settings/06B_Set.bin":$2B..$2C
incbin "lvl/settings/06C_Set.bin":$2B..$2C
incbin "lvl/settings/06D_Set.bin":$2B..$2C
incbin "lvl/settings/06E_Set.bin":$2B..$2C
incbin "lvl/settings/06F_Set.bin":$2B..$2C
incbin "lvl/settings/070_Set.bin":$2B..$2C
incbin "lvl/settings/071_Set.bin":$2B..$2C
incbin "lvl/settings/072_Set.bin":$2B..$2C
incbin "lvl/settings/073_Set.bin":$2B..$2C
incbin "lvl/settings/074_Set.bin":$2B..$2C
incbin "lvl/settings/075_Set.bin":$2B..$2C
incbin "lvl/settings/076_Set.bin":$2B..$2C
incbin "lvl/settings/077_Set.bin":$2B..$2C
incbin "lvl/settings/078_Set.bin":$2B..$2C
incbin "lvl/settings/079_Set.bin":$2B..$2C
incbin "lvl/settings/07A_Set.bin":$2B..$2C
incbin "lvl/settings/07B_Set.bin":$2B..$2C
incbin "lvl/settings/07C_Set.bin":$2B..$2C
incbin "lvl/settings/07D_Set.bin":$2B..$2C
incbin "lvl/settings/07E_Set.bin":$2B..$2C
incbin "lvl/settings/07F_Set.bin":$2B..$2C
incbin "lvl/settings/080_Set.bin":$2B..$2C
incbin "lvl/settings/081_Set.bin":$2B..$2C
incbin "lvl/settings/082_Set.bin":$2B..$2C
incbin "lvl/settings/083_Set.bin":$2B..$2C
incbin "lvl/settings/084_Set.bin":$2B..$2C
incbin "lvl/settings/085_Set.bin":$2B..$2C
incbin "lvl/settings/086_Set.bin":$2B..$2C
incbin "lvl/settings/087_Set.bin":$2B..$2C
incbin "lvl/settings/088_Set.bin":$2B..$2C
incbin "lvl/settings/089_Set.bin":$2B..$2C
incbin "lvl/settings/08A_Set.bin":$2B..$2C
incbin "lvl/settings/08B_Set.bin":$2B..$2C
incbin "lvl/settings/08C_Set.bin":$2B..$2C
incbin "lvl/settings/08D_Set.bin":$2B..$2C
incbin "lvl/settings/08E_Set.bin":$2B..$2C
incbin "lvl/settings/08F_Set.bin":$2B..$2C
incbin "lvl/settings/090_Set.bin":$2B..$2C
incbin "lvl/settings/091_Set.bin":$2B..$2C
incbin "lvl/settings/092_Set.bin":$2B..$2C
incbin "lvl/settings/093_Set.bin":$2B..$2C
incbin "lvl/settings/094_Set.bin":$2B..$2C
incbin "lvl/settings/095_Set.bin":$2B..$2C
incbin "lvl/settings/096_Set.bin":$2B..$2C
incbin "lvl/settings/097_Set.bin":$2B..$2C
incbin "lvl/settings/098_Set.bin":$2B..$2C
incbin "lvl/settings/099_Set.bin":$2B..$2C
incbin "lvl/settings/09A_Set.bin":$2B..$2C
incbin "lvl/settings/09B_Set.bin":$2B..$2C
incbin "lvl/settings/09C_Set.bin":$2B..$2C
incbin "lvl/settings/09D_Set.bin":$2B..$2C
incbin "lvl/settings/09E_Set.bin":$2B..$2C
incbin "lvl/settings/09F_Set.bin":$2B..$2C
incbin "lvl/settings/0A0_Set.bin":$2B..$2C
incbin "lvl/settings/0A1_Set.bin":$2B..$2C
incbin "lvl/settings/0A2_Set.bin":$2B..$2C
incbin "lvl/settings/0A3_Set.bin":$2B..$2C
incbin "lvl/settings/0A4_Set.bin":$2B..$2C
incbin "lvl/settings/0A5_Set.bin":$2B..$2C
incbin "lvl/settings/0A6_Set.bin":$2B..$2C
incbin "lvl/settings/0A7_Set.bin":$2B..$2C
incbin "lvl/settings/0A8_Set.bin":$2B..$2C
incbin "lvl/settings/0A9_Set.bin":$2B..$2C
incbin "lvl/settings/0AA_Set.bin":$2B..$2C
incbin "lvl/settings/0AB_Set.bin":$2B..$2C
incbin "lvl/settings/0AC_Set.bin":$2B..$2C
incbin "lvl/settings/0AD_Set.bin":$2B..$2C
incbin "lvl/settings/0AE_Set.bin":$2B..$2C
incbin "lvl/settings/0AF_Set.bin":$2B..$2C
incbin "lvl/settings/0B0_Set.bin":$2B..$2C
incbin "lvl/settings/0B1_Set.bin":$2B..$2C
incbin "lvl/settings/0B2_Set.bin":$2B..$2C
incbin "lvl/settings/0B3_Set.bin":$2B..$2C
incbin "lvl/settings/0B4_Set.bin":$2B..$2C
incbin "lvl/settings/0B5_Set.bin":$2B..$2C
incbin "lvl/settings/0B6_Set.bin":$2B..$2C
incbin "lvl/settings/0B7_Set.bin":$2B..$2C
incbin "lvl/settings/0B8_Set.bin":$2B..$2C
incbin "lvl/settings/0B9_Set.bin":$2B..$2C
incbin "lvl/settings/0BA_Set.bin":$2B..$2C
incbin "lvl/settings/0BB_Set.bin":$2B..$2C
incbin "lvl/settings/0BC_Set.bin":$2B..$2C
incbin "lvl/settings/0BD_Set.bin":$2B..$2C
incbin "lvl/settings/0BE_Set.bin":$2B..$2C
incbin "lvl/settings/0BF_Set.bin":$2B..$2C
incbin "lvl/settings/0C0_Set.bin":$2B..$2C
incbin "lvl/settings/0C1_Set.bin":$2B..$2C
incbin "lvl/settings/0C2_Set.bin":$2B..$2C
incbin "lvl/settings/0C3_Set.bin":$2B..$2C
incbin "lvl/settings/0C4_Set.bin":$2B..$2C
incbin "lvl/settings/0C5_Set.bin":$2B..$2C
incbin "lvl/settings/0C6_Set.bin":$2B..$2C
incbin "lvl/settings/0C7_Set.bin":$2B..$2C
incbin "lvl/settings/0C8_Set.bin":$2B..$2C
incbin "lvl/settings/0C9_Set.bin":$2B..$2C
incbin "lvl/settings/0CA_Set.bin":$2B..$2C
incbin "lvl/settings/0CB_Set.bin":$2B..$2C
incbin "lvl/settings/0CC_Set.bin":$2B..$2C
incbin "lvl/settings/0CD_Set.bin":$2B..$2C
incbin "lvl/settings/0CE_Set.bin":$2B..$2C
incbin "lvl/settings/0CF_Set.bin":$2B..$2C
incbin "lvl/settings/0D0_Set.bin":$2B..$2C
incbin "lvl/settings/0D1_Set.bin":$2B..$2C
incbin "lvl/settings/0D2_Set.bin":$2B..$2C
incbin "lvl/settings/0D3_Set.bin":$2B..$2C
incbin "lvl/settings/0D4_Set.bin":$2B..$2C
incbin "lvl/settings/0D5_Set.bin":$2B..$2C
incbin "lvl/settings/0D6_Set.bin":$2B..$2C
incbin "lvl/settings/0D7_Set.bin":$2B..$2C
incbin "lvl/settings/0D8_Set.bin":$2B..$2C
incbin "lvl/settings/0D9_Set.bin":$2B..$2C
incbin "lvl/settings/0DA_Set.bin":$2B..$2C
incbin "lvl/settings/0DB_Set.bin":$2B..$2C
incbin "lvl/settings/0DC_Set.bin":$2B..$2C
incbin "lvl/settings/0DD_Set.bin":$2B..$2C
incbin "lvl/settings/0DE_Set.bin":$2B..$2C
incbin "lvl/settings/0DF_Set.bin":$2B..$2C
incbin "lvl/settings/0E0_Set.bin":$2B..$2C
incbin "lvl/settings/0E1_Set.bin":$2B..$2C
incbin "lvl/settings/0E2_Set.bin":$2B..$2C
incbin "lvl/settings/0E3_Set.bin":$2B..$2C
incbin "lvl/settings/0E4_Set.bin":$2B..$2C
incbin "lvl/settings/0E5_Set.bin":$2B..$2C
incbin "lvl/settings/0E6_Set.bin":$2B..$2C
incbin "lvl/settings/0E7_Set.bin":$2B..$2C
incbin "lvl/settings/0E8_Set.bin":$2B..$2C
incbin "lvl/settings/0E9_Set.bin":$2B..$2C
incbin "lvl/settings/0EA_Set.bin":$2B..$2C
incbin "lvl/settings/0EB_Set.bin":$2B..$2C
incbin "lvl/settings/0EC_Set.bin":$2B..$2C
incbin "lvl/settings/0ED_Set.bin":$2B..$2C
incbin "lvl/settings/0EE_Set.bin":$2B..$2C
incbin "lvl/settings/0EF_Set.bin":$2B..$2C
incbin "lvl/settings/0F0_Set.bin":$2B..$2C
incbin "lvl/settings/0F1_Set.bin":$2B..$2C
incbin "lvl/settings/0F2_Set.bin":$2B..$2C
incbin "lvl/settings/0F3_Set.bin":$2B..$2C
incbin "lvl/settings/0F4_Set.bin":$2B..$2C
incbin "lvl/settings/0F5_Set.bin":$2B..$2C
incbin "lvl/settings/0F6_Set.bin":$2B..$2C
incbin "lvl/settings/0F7_Set.bin":$2B..$2C
incbin "lvl/settings/0F8_Set.bin":$2B..$2C
incbin "lvl/settings/0F9_Set.bin":$2B..$2C
incbin "lvl/settings/0FA_Set.bin":$2B..$2C
incbin "lvl/settings/0FB_Set.bin":$2B..$2C
incbin "lvl/settings/0FC_Set.bin":$2B..$2C
incbin "lvl/settings/0FD_Set.bin":$2B..$2C
incbin "lvl/settings/0FE_Set.bin":$2B..$2C
incbin "lvl/settings/0FF_Set.bin":$2B..$2C
incbin "lvl/settings/100_Set.bin":$2B..$2C
incbin "lvl/settings/101_Set.bin":$2B..$2C
incbin "lvl/settings/102_Set.bin":$2B..$2C
incbin "lvl/settings/103_Set.bin":$2B..$2C
incbin "lvl/settings/104_Set.bin":$2B..$2C
incbin "lvl/settings/105_Set.bin":$2B..$2C
incbin "lvl/settings/106_Set.bin":$2B..$2C
incbin "lvl/settings/107_Set.bin":$2B..$2C
incbin "lvl/settings/108_Set.bin":$2B..$2C
incbin "lvl/settings/109_Set.bin":$2B..$2C
incbin "lvl/settings/10A_Set.bin":$2B..$2C
incbin "lvl/settings/10B_Set.bin":$2B..$2C
incbin "lvl/settings/10C_Set.bin":$2B..$2C
incbin "lvl/settings/10D_Set.bin":$2B..$2C
incbin "lvl/settings/10E_Set.bin":$2B..$2C
incbin "lvl/settings/10F_Set.bin":$2B..$2C
incbin "lvl/settings/110_Set.bin":$2B..$2C
incbin "lvl/settings/111_Set.bin":$2B..$2C
incbin "lvl/settings/112_Set.bin":$2B..$2C
incbin "lvl/settings/113_Set.bin":$2B..$2C
incbin "lvl/settings/114_Set.bin":$2B..$2C
incbin "lvl/settings/115_Set.bin":$2B..$2C
incbin "lvl/settings/116_Set.bin":$2B..$2C
incbin "lvl/settings/117_Set.bin":$2B..$2C
incbin "lvl/settings/118_Set.bin":$2B..$2C
incbin "lvl/settings/119_Set.bin":$2B..$2C
incbin "lvl/settings/11A_Set.bin":$2B..$2C
incbin "lvl/settings/11B_Set.bin":$2B..$2C
incbin "lvl/settings/11C_Set.bin":$2B..$2C
incbin "lvl/settings/11D_Set.bin":$2B..$2C
incbin "lvl/settings/11E_Set.bin":$2B..$2C
incbin "lvl/settings/11F_Set.bin":$2B..$2C
incbin "lvl/settings/120_Set.bin":$2B..$2C
incbin "lvl/settings/121_Set.bin":$2B..$2C
incbin "lvl/settings/122_Set.bin":$2B..$2C
incbin "lvl/settings/123_Set.bin":$2B..$2C
incbin "lvl/settings/124_Set.bin":$2B..$2C
incbin "lvl/settings/125_Set.bin":$2B..$2C
incbin "lvl/settings/126_Set.bin":$2B..$2C
incbin "lvl/settings/127_Set.bin":$2B..$2C
incbin "lvl/settings/128_Set.bin":$2B..$2C
incbin "lvl/settings/129_Set.bin":$2B..$2C
incbin "lvl/settings/12A_Set.bin":$2B..$2C
incbin "lvl/settings/12B_Set.bin":$2B..$2C
incbin "lvl/settings/12C_Set.bin":$2B..$2C
incbin "lvl/settings/12D_Set.bin":$2B..$2C
incbin "lvl/settings/12E_Set.bin":$2B..$2C
incbin "lvl/settings/12F_Set.bin":$2B..$2C
incbin "lvl/settings/130_Set.bin":$2B..$2C
incbin "lvl/settings/131_Set.bin":$2B..$2C
incbin "lvl/settings/132_Set.bin":$2B..$2C
incbin "lvl/settings/133_Set.bin":$2B..$2C
incbin "lvl/settings/134_Set.bin":$2B..$2C
incbin "lvl/settings/135_Set.bin":$2B..$2C
incbin "lvl/settings/136_Set.bin":$2B..$2C
incbin "lvl/settings/137_Set.bin":$2B..$2C
incbin "lvl/settings/138_Set.bin":$2B..$2C
incbin "lvl/settings/139_Set.bin":$2B..$2C
incbin "lvl/settings/13A_Set.bin":$2B..$2C
incbin "lvl/settings/13B_Set.bin":$2B..$2C
incbin "lvl/settings/13C_Set.bin":$2B..$2C
incbin "lvl/settings/13D_Set.bin":$2B..$2C
incbin "lvl/settings/13E_Set.bin":$2B..$2C
incbin "lvl/settings/13F_Set.bin":$2B..$2C
incbin "lvl/settings/140_Set.bin":$2B..$2C
incbin "lvl/settings/141_Set.bin":$2B..$2C
incbin "lvl/settings/142_Set.bin":$2B..$2C
incbin "lvl/settings/143_Set.bin":$2B..$2C
incbin "lvl/settings/144_Set.bin":$2B..$2C
incbin "lvl/settings/145_Set.bin":$2B..$2C
incbin "lvl/settings/146_Set.bin":$2B..$2C
incbin "lvl/settings/147_Set.bin":$2B..$2C
incbin "lvl/settings/148_Set.bin":$2B..$2C
incbin "lvl/settings/149_Set.bin":$2B..$2C
incbin "lvl/settings/14A_Set.bin":$2B..$2C
incbin "lvl/settings/14B_Set.bin":$2B..$2C
incbin "lvl/settings/14C_Set.bin":$2B..$2C
incbin "lvl/settings/14D_Set.bin":$2B..$2C
incbin "lvl/settings/14E_Set.bin":$2B..$2C
incbin "lvl/settings/14F_Set.bin":$2B..$2C
incbin "lvl/settings/150_Set.bin":$2B..$2C
incbin "lvl/settings/151_Set.bin":$2B..$2C
incbin "lvl/settings/152_Set.bin":$2B..$2C
incbin "lvl/settings/153_Set.bin":$2B..$2C
incbin "lvl/settings/154_Set.bin":$2B..$2C
incbin "lvl/settings/155_Set.bin":$2B..$2C
incbin "lvl/settings/156_Set.bin":$2B..$2C
incbin "lvl/settings/157_Set.bin":$2B..$2C
incbin "lvl/settings/158_Set.bin":$2B..$2C
incbin "lvl/settings/159_Set.bin":$2B..$2C
incbin "lvl/settings/15A_Set.bin":$2B..$2C
incbin "lvl/settings/15B_Set.bin":$2B..$2C
incbin "lvl/settings/15C_Set.bin":$2B..$2C
incbin "lvl/settings/15D_Set.bin":$2B..$2C
incbin "lvl/settings/15E_Set.bin":$2B..$2C
incbin "lvl/settings/15F_Set.bin":$2B..$2C
incbin "lvl/settings/160_Set.bin":$2B..$2C
incbin "lvl/settings/161_Set.bin":$2B..$2C
incbin "lvl/settings/162_Set.bin":$2B..$2C
incbin "lvl/settings/163_Set.bin":$2B..$2C
incbin "lvl/settings/164_Set.bin":$2B..$2C
incbin "lvl/settings/165_Set.bin":$2B..$2C
incbin "lvl/settings/166_Set.bin":$2B..$2C
incbin "lvl/settings/167_Set.bin":$2B..$2C
incbin "lvl/settings/168_Set.bin":$2B..$2C
incbin "lvl/settings/169_Set.bin":$2B..$2C
incbin "lvl/settings/16A_Set.bin":$2B..$2C
incbin "lvl/settings/16B_Set.bin":$2B..$2C
incbin "lvl/settings/16C_Set.bin":$2B..$2C
incbin "lvl/settings/16D_Set.bin":$2B..$2C
incbin "lvl/settings/16E_Set.bin":$2B..$2C
incbin "lvl/settings/16F_Set.bin":$2B..$2C
incbin "lvl/settings/170_Set.bin":$2B..$2C
incbin "lvl/settings/171_Set.bin":$2B..$2C
incbin "lvl/settings/172_Set.bin":$2B..$2C
incbin "lvl/settings/173_Set.bin":$2B..$2C
incbin "lvl/settings/174_Set.bin":$2B..$2C
incbin "lvl/settings/175_Set.bin":$2B..$2C
incbin "lvl/settings/176_Set.bin":$2B..$2C
incbin "lvl/settings/177_Set.bin":$2B..$2C
incbin "lvl/settings/178_Set.bin":$2B..$2C
incbin "lvl/settings/179_Set.bin":$2B..$2C
incbin "lvl/settings/17A_Set.bin":$2B..$2C
incbin "lvl/settings/17B_Set.bin":$2B..$2C
incbin "lvl/settings/17C_Set.bin":$2B..$2C
incbin "lvl/settings/17D_Set.bin":$2B..$2C
incbin "lvl/settings/17E_Set.bin":$2B..$2C
incbin "lvl/settings/17F_Set.bin":$2B..$2C
incbin "lvl/settings/180_Set.bin":$2B..$2C
incbin "lvl/settings/181_Set.bin":$2B..$2C
incbin "lvl/settings/182_Set.bin":$2B..$2C
incbin "lvl/settings/183_Set.bin":$2B..$2C
incbin "lvl/settings/184_Set.bin":$2B..$2C
incbin "lvl/settings/185_Set.bin":$2B..$2C
incbin "lvl/settings/186_Set.bin":$2B..$2C
incbin "lvl/settings/187_Set.bin":$2B..$2C
incbin "lvl/settings/188_Set.bin":$2B..$2C
incbin "lvl/settings/189_Set.bin":$2B..$2C
incbin "lvl/settings/18A_Set.bin":$2B..$2C
incbin "lvl/settings/18B_Set.bin":$2B..$2C
incbin "lvl/settings/18C_Set.bin":$2B..$2C
incbin "lvl/settings/18D_Set.bin":$2B..$2C
incbin "lvl/settings/18E_Set.bin":$2B..$2C
incbin "lvl/settings/18F_Set.bin":$2B..$2C
incbin "lvl/settings/190_Set.bin":$2B..$2C
incbin "lvl/settings/191_Set.bin":$2B..$2C
incbin "lvl/settings/192_Set.bin":$2B..$2C
incbin "lvl/settings/193_Set.bin":$2B..$2C
incbin "lvl/settings/194_Set.bin":$2B..$2C
incbin "lvl/settings/195_Set.bin":$2B..$2C
incbin "lvl/settings/196_Set.bin":$2B..$2C
incbin "lvl/settings/197_Set.bin":$2B..$2C
incbin "lvl/settings/198_Set.bin":$2B..$2C
incbin "lvl/settings/199_Set.bin":$2B..$2C
incbin "lvl/settings/19A_Set.bin":$2B..$2C
incbin "lvl/settings/19B_Set.bin":$2B..$2C
incbin "lvl/settings/19C_Set.bin":$2B..$2C
incbin "lvl/settings/19D_Set.bin":$2B..$2C
incbin "lvl/settings/19E_Set.bin":$2B..$2C
incbin "lvl/settings/19F_Set.bin":$2B..$2C
incbin "lvl/settings/1A0_Set.bin":$2B..$2C
incbin "lvl/settings/1A1_Set.bin":$2B..$2C
incbin "lvl/settings/1A2_Set.bin":$2B..$2C
incbin "lvl/settings/1A3_Set.bin":$2B..$2C
incbin "lvl/settings/1A4_Set.bin":$2B..$2C
incbin "lvl/settings/1A5_Set.bin":$2B..$2C
incbin "lvl/settings/1A6_Set.bin":$2B..$2C
incbin "lvl/settings/1A7_Set.bin":$2B..$2C
incbin "lvl/settings/1A8_Set.bin":$2B..$2C
incbin "lvl/settings/1A9_Set.bin":$2B..$2C
incbin "lvl/settings/1AA_Set.bin":$2B..$2C
incbin "lvl/settings/1AB_Set.bin":$2B..$2C
incbin "lvl/settings/1AC_Set.bin":$2B..$2C
incbin "lvl/settings/1AD_Set.bin":$2B..$2C
incbin "lvl/settings/1AE_Set.bin":$2B..$2C
incbin "lvl/settings/1AF_Set.bin":$2B..$2C
incbin "lvl/settings/1B0_Set.bin":$2B..$2C
incbin "lvl/settings/1B1_Set.bin":$2B..$2C
incbin "lvl/settings/1B2_Set.bin":$2B..$2C
incbin "lvl/settings/1B3_Set.bin":$2B..$2C
incbin "lvl/settings/1B4_Set.bin":$2B..$2C
incbin "lvl/settings/1B5_Set.bin":$2B..$2C
incbin "lvl/settings/1B6_Set.bin":$2B..$2C
incbin "lvl/settings/1B7_Set.bin":$2B..$2C
incbin "lvl/settings/1B8_Set.bin":$2B..$2C
incbin "lvl/settings/1B9_Set.bin":$2B..$2C
incbin "lvl/settings/1BA_Set.bin":$2B..$2C
incbin "lvl/settings/1BB_Set.bin":$2B..$2C
incbin "lvl/settings/1BC_Set.bin":$2B..$2C
incbin "lvl/settings/1BD_Set.bin":$2B..$2C
incbin "lvl/settings/1BE_Set.bin":$2B..$2C
incbin "lvl/settings/1BF_Set.bin":$2B..$2C
incbin "lvl/settings/1C0_Set.bin":$2B..$2C
incbin "lvl/settings/1C1_Set.bin":$2B..$2C
incbin "lvl/settings/1C2_Set.bin":$2B..$2C
incbin "lvl/settings/1C3_Set.bin":$2B..$2C
incbin "lvl/settings/1C4_Set.bin":$2B..$2C
incbin "lvl/settings/1C5_Set.bin":$2B..$2C
incbin "lvl/settings/1C6_Set.bin":$2B..$2C
incbin "lvl/settings/1C7_Set.bin":$2B..$2C
incbin "lvl/settings/1C8_Set.bin":$2B..$2C
incbin "lvl/settings/1C9_Set.bin":$2B..$2C
incbin "lvl/settings/1CA_Set.bin":$2B..$2C
incbin "lvl/settings/1CB_Set.bin":$2B..$2C
incbin "lvl/settings/1CC_Set.bin":$2B..$2C
incbin "lvl/settings/1CD_Set.bin":$2B..$2C
incbin "lvl/settings/1CE_Set.bin":$2B..$2C
incbin "lvl/settings/1CF_Set.bin":$2B..$2C
incbin "lvl/settings/1D0_Set.bin":$2B..$2C
incbin "lvl/settings/1D1_Set.bin":$2B..$2C
incbin "lvl/settings/1D2_Set.bin":$2B..$2C
incbin "lvl/settings/1D3_Set.bin":$2B..$2C
incbin "lvl/settings/1D4_Set.bin":$2B..$2C
incbin "lvl/settings/1D5_Set.bin":$2B..$2C
incbin "lvl/settings/1D6_Set.bin":$2B..$2C
incbin "lvl/settings/1D7_Set.bin":$2B..$2C
incbin "lvl/settings/1D8_Set.bin":$2B..$2C
incbin "lvl/settings/1D9_Set.bin":$2B..$2C
incbin "lvl/settings/1DA_Set.bin":$2B..$2C
incbin "lvl/settings/1DB_Set.bin":$2B..$2C
incbin "lvl/settings/1DC_Set.bin":$2B..$2C
incbin "lvl/settings/1DD_Set.bin":$2B..$2C
incbin "lvl/settings/1DE_Set.bin":$2B..$2C
incbin "lvl/settings/1DF_Set.bin":$2B..$2C
incbin "lvl/settings/1E0_Set.bin":$2B..$2C
incbin "lvl/settings/1E1_Set.bin":$2B..$2C
incbin "lvl/settings/1E2_Set.bin":$2B..$2C
incbin "lvl/settings/1E3_Set.bin":$2B..$2C
incbin "lvl/settings/1E4_Set.bin":$2B..$2C
incbin "lvl/settings/1E5_Set.bin":$2B..$2C
incbin "lvl/settings/1E6_Set.bin":$2B..$2C
incbin "lvl/settings/1E7_Set.bin":$2B..$2C
incbin "lvl/settings/1E8_Set.bin":$2B..$2C
incbin "lvl/settings/1E9_Set.bin":$2B..$2C
incbin "lvl/settings/1EA_Set.bin":$2B..$2C
incbin "lvl/settings/1EB_Set.bin":$2B..$2C
incbin "lvl/settings/1EC_Set.bin":$2B..$2C
incbin "lvl/settings/1ED_Set.bin":$2B..$2C
incbin "lvl/settings/1EE_Set.bin":$2B..$2C
incbin "lvl/settings/1EF_Set.bin":$2B..$2C
incbin "lvl/settings/1F0_Set.bin":$2B..$2C
incbin "lvl/settings/1F1_Set.bin":$2B..$2C
incbin "lvl/settings/1F2_Set.bin":$2B..$2C
incbin "lvl/settings/1F3_Set.bin":$2B..$2C
incbin "lvl/settings/1F4_Set.bin":$2B..$2C
incbin "lvl/settings/1F5_Set.bin":$2B..$2C
incbin "lvl/settings/1F6_Set.bin":$2B..$2C
incbin "lvl/settings/1F7_Set.bin":$2B..$2C
incbin "lvl/settings/1F8_Set.bin":$2B..$2C
incbin "lvl/settings/1F9_Set.bin":$2B..$2C
incbin "lvl/settings/1FA_Set.bin":$2B..$2C
incbin "lvl/settings/1FB_Set.bin":$2B..$2C
incbin "lvl/settings/1FC_Set.bin":$2B..$2C
incbin "lvl/settings/1FD_Set.bin":$2B..$2C
incbin "lvl/settings/1FE_Set.bin":$2B..$2C
incbin "lvl/settings/1FF_Set.bin":$2B..$2C
.End:

DATA_06FE00:						; Lunar Magic table
incbin "lvl/settings/000_Set.bin":$2C..$2D
incbin "lvl/settings/001_Set.bin":$2C..$2D
incbin "lvl/settings/002_Set.bin":$2C..$2D
incbin "lvl/settings/003_Set.bin":$2C..$2D
incbin "lvl/settings/004_Set.bin":$2C..$2D
incbin "lvl/settings/005_Set.bin":$2C..$2D
incbin "lvl/settings/006_Set.bin":$2C..$2D
incbin "lvl/settings/007_Set.bin":$2C..$2D
incbin "lvl/settings/008_Set.bin":$2C..$2D
incbin "lvl/settings/009_Set.bin":$2C..$2D
incbin "lvl/settings/00A_Set.bin":$2C..$2D
incbin "lvl/settings/00B_Set.bin":$2C..$2D
incbin "lvl/settings/00C_Set.bin":$2C..$2D
incbin "lvl/settings/00D_Set.bin":$2C..$2D
incbin "lvl/settings/00E_Set.bin":$2C..$2D
incbin "lvl/settings/00F_Set.bin":$2C..$2D
incbin "lvl/settings/010_Set.bin":$2C..$2D
incbin "lvl/settings/011_Set.bin":$2C..$2D
incbin "lvl/settings/012_Set.bin":$2C..$2D
incbin "lvl/settings/013_Set.bin":$2C..$2D
incbin "lvl/settings/014_Set.bin":$2C..$2D
incbin "lvl/settings/015_Set.bin":$2C..$2D
incbin "lvl/settings/016_Set.bin":$2C..$2D
incbin "lvl/settings/017_Set.bin":$2C..$2D
incbin "lvl/settings/018_Set.bin":$2C..$2D
incbin "lvl/settings/019_Set.bin":$2C..$2D
incbin "lvl/settings/01A_Set.bin":$2C..$2D
incbin "lvl/settings/01B_Set.bin":$2C..$2D
incbin "lvl/settings/01C_Set.bin":$2C..$2D
incbin "lvl/settings/01D_Set.bin":$2C..$2D
incbin "lvl/settings/01E_Set.bin":$2C..$2D
incbin "lvl/settings/01F_Set.bin":$2C..$2D
incbin "lvl/settings/020_Set.bin":$2C..$2D
incbin "lvl/settings/021_Set.bin":$2C..$2D
incbin "lvl/settings/022_Set.bin":$2C..$2D
incbin "lvl/settings/023_Set.bin":$2C..$2D
incbin "lvl/settings/024_Set.bin":$2C..$2D
incbin "lvl/settings/025_Set.bin":$2C..$2D
incbin "lvl/settings/026_Set.bin":$2C..$2D
incbin "lvl/settings/027_Set.bin":$2C..$2D
incbin "lvl/settings/028_Set.bin":$2C..$2D
incbin "lvl/settings/029_Set.bin":$2C..$2D
incbin "lvl/settings/02A_Set.bin":$2C..$2D
incbin "lvl/settings/02B_Set.bin":$2C..$2D
incbin "lvl/settings/02C_Set.bin":$2C..$2D
incbin "lvl/settings/02D_Set.bin":$2C..$2D
incbin "lvl/settings/02E_Set.bin":$2C..$2D
incbin "lvl/settings/02F_Set.bin":$2C..$2D
incbin "lvl/settings/030_Set.bin":$2C..$2D
incbin "lvl/settings/031_Set.bin":$2C..$2D
incbin "lvl/settings/032_Set.bin":$2C..$2D
incbin "lvl/settings/033_Set.bin":$2C..$2D
incbin "lvl/settings/034_Set.bin":$2C..$2D
incbin "lvl/settings/035_Set.bin":$2C..$2D
incbin "lvl/settings/036_Set.bin":$2C..$2D
incbin "lvl/settings/037_Set.bin":$2C..$2D
incbin "lvl/settings/038_Set.bin":$2C..$2D
incbin "lvl/settings/039_Set.bin":$2C..$2D
incbin "lvl/settings/03A_Set.bin":$2C..$2D
incbin "lvl/settings/03B_Set.bin":$2C..$2D
incbin "lvl/settings/03C_Set.bin":$2C..$2D
incbin "lvl/settings/03D_Set.bin":$2C..$2D
incbin "lvl/settings/03E_Set.bin":$2C..$2D
incbin "lvl/settings/03F_Set.bin":$2C..$2D
incbin "lvl/settings/040_Set.bin":$2C..$2D
incbin "lvl/settings/041_Set.bin":$2C..$2D
incbin "lvl/settings/042_Set.bin":$2C..$2D
incbin "lvl/settings/043_Set.bin":$2C..$2D
incbin "lvl/settings/044_Set.bin":$2C..$2D
incbin "lvl/settings/045_Set.bin":$2C..$2D
incbin "lvl/settings/046_Set.bin":$2C..$2D
incbin "lvl/settings/047_Set.bin":$2C..$2D
incbin "lvl/settings/048_Set.bin":$2C..$2D
incbin "lvl/settings/049_Set.bin":$2C..$2D
incbin "lvl/settings/04A_Set.bin":$2C..$2D
incbin "lvl/settings/04B_Set.bin":$2C..$2D
incbin "lvl/settings/04C_Set.bin":$2C..$2D
incbin "lvl/settings/04D_Set.bin":$2C..$2D
incbin "lvl/settings/04E_Set.bin":$2C..$2D
incbin "lvl/settings/04F_Set.bin":$2C..$2D
incbin "lvl/settings/050_Set.bin":$2C..$2D
incbin "lvl/settings/051_Set.bin":$2C..$2D
incbin "lvl/settings/052_Set.bin":$2C..$2D
incbin "lvl/settings/053_Set.bin":$2C..$2D
incbin "lvl/settings/054_Set.bin":$2C..$2D
incbin "lvl/settings/055_Set.bin":$2C..$2D
incbin "lvl/settings/056_Set.bin":$2C..$2D
incbin "lvl/settings/057_Set.bin":$2C..$2D
incbin "lvl/settings/058_Set.bin":$2C..$2D
incbin "lvl/settings/059_Set.bin":$2C..$2D
incbin "lvl/settings/05A_Set.bin":$2C..$2D
incbin "lvl/settings/05B_Set.bin":$2C..$2D
incbin "lvl/settings/05C_Set.bin":$2C..$2D
incbin "lvl/settings/05D_Set.bin":$2C..$2D
incbin "lvl/settings/05E_Set.bin":$2C..$2D
incbin "lvl/settings/05F_Set.bin":$2C..$2D
incbin "lvl/settings/060_Set.bin":$2C..$2D
incbin "lvl/settings/061_Set.bin":$2C..$2D
incbin "lvl/settings/062_Set.bin":$2C..$2D
incbin "lvl/settings/063_Set.bin":$2C..$2D
incbin "lvl/settings/064_Set.bin":$2C..$2D
incbin "lvl/settings/065_Set.bin":$2C..$2D
incbin "lvl/settings/066_Set.bin":$2C..$2D
incbin "lvl/settings/067_Set.bin":$2C..$2D
incbin "lvl/settings/068_Set.bin":$2C..$2D
incbin "lvl/settings/069_Set.bin":$2C..$2D
incbin "lvl/settings/06A_Set.bin":$2C..$2D
incbin "lvl/settings/06B_Set.bin":$2C..$2D
incbin "lvl/settings/06C_Set.bin":$2C..$2D
incbin "lvl/settings/06D_Set.bin":$2C..$2D
incbin "lvl/settings/06E_Set.bin":$2C..$2D
incbin "lvl/settings/06F_Set.bin":$2C..$2D
incbin "lvl/settings/070_Set.bin":$2C..$2D
incbin "lvl/settings/071_Set.bin":$2C..$2D
incbin "lvl/settings/072_Set.bin":$2C..$2D
incbin "lvl/settings/073_Set.bin":$2C..$2D
incbin "lvl/settings/074_Set.bin":$2C..$2D
incbin "lvl/settings/075_Set.bin":$2C..$2D
incbin "lvl/settings/076_Set.bin":$2C..$2D
incbin "lvl/settings/077_Set.bin":$2C..$2D
incbin "lvl/settings/078_Set.bin":$2C..$2D
incbin "lvl/settings/079_Set.bin":$2C..$2D
incbin "lvl/settings/07A_Set.bin":$2C..$2D
incbin "lvl/settings/07B_Set.bin":$2C..$2D
incbin "lvl/settings/07C_Set.bin":$2C..$2D
incbin "lvl/settings/07D_Set.bin":$2C..$2D
incbin "lvl/settings/07E_Set.bin":$2C..$2D
incbin "lvl/settings/07F_Set.bin":$2C..$2D
incbin "lvl/settings/080_Set.bin":$2C..$2D
incbin "lvl/settings/081_Set.bin":$2C..$2D
incbin "lvl/settings/082_Set.bin":$2C..$2D
incbin "lvl/settings/083_Set.bin":$2C..$2D
incbin "lvl/settings/084_Set.bin":$2C..$2D
incbin "lvl/settings/085_Set.bin":$2C..$2D
incbin "lvl/settings/086_Set.bin":$2C..$2D
incbin "lvl/settings/087_Set.bin":$2C..$2D
incbin "lvl/settings/088_Set.bin":$2C..$2D
incbin "lvl/settings/089_Set.bin":$2C..$2D
incbin "lvl/settings/08A_Set.bin":$2C..$2D
incbin "lvl/settings/08B_Set.bin":$2C..$2D
incbin "lvl/settings/08C_Set.bin":$2C..$2D
incbin "lvl/settings/08D_Set.bin":$2C..$2D
incbin "lvl/settings/08E_Set.bin":$2C..$2D
incbin "lvl/settings/08F_Set.bin":$2C..$2D
incbin "lvl/settings/090_Set.bin":$2C..$2D
incbin "lvl/settings/091_Set.bin":$2C..$2D
incbin "lvl/settings/092_Set.bin":$2C..$2D
incbin "lvl/settings/093_Set.bin":$2C..$2D
incbin "lvl/settings/094_Set.bin":$2C..$2D
incbin "lvl/settings/095_Set.bin":$2C..$2D
incbin "lvl/settings/096_Set.bin":$2C..$2D
incbin "lvl/settings/097_Set.bin":$2C..$2D
incbin "lvl/settings/098_Set.bin":$2C..$2D
incbin "lvl/settings/099_Set.bin":$2C..$2D
incbin "lvl/settings/09A_Set.bin":$2C..$2D
incbin "lvl/settings/09B_Set.bin":$2C..$2D
incbin "lvl/settings/09C_Set.bin":$2C..$2D
incbin "lvl/settings/09D_Set.bin":$2C..$2D
incbin "lvl/settings/09E_Set.bin":$2C..$2D
incbin "lvl/settings/09F_Set.bin":$2C..$2D
incbin "lvl/settings/0A0_Set.bin":$2C..$2D
incbin "lvl/settings/0A1_Set.bin":$2C..$2D
incbin "lvl/settings/0A2_Set.bin":$2C..$2D
incbin "lvl/settings/0A3_Set.bin":$2C..$2D
incbin "lvl/settings/0A4_Set.bin":$2C..$2D
incbin "lvl/settings/0A5_Set.bin":$2C..$2D
incbin "lvl/settings/0A6_Set.bin":$2C..$2D
incbin "lvl/settings/0A7_Set.bin":$2C..$2D
incbin "lvl/settings/0A8_Set.bin":$2C..$2D
incbin "lvl/settings/0A9_Set.bin":$2C..$2D
incbin "lvl/settings/0AA_Set.bin":$2C..$2D
incbin "lvl/settings/0AB_Set.bin":$2C..$2D
incbin "lvl/settings/0AC_Set.bin":$2C..$2D
incbin "lvl/settings/0AD_Set.bin":$2C..$2D
incbin "lvl/settings/0AE_Set.bin":$2C..$2D
incbin "lvl/settings/0AF_Set.bin":$2C..$2D
incbin "lvl/settings/0B0_Set.bin":$2C..$2D
incbin "lvl/settings/0B1_Set.bin":$2C..$2D
incbin "lvl/settings/0B2_Set.bin":$2C..$2D
incbin "lvl/settings/0B3_Set.bin":$2C..$2D
incbin "lvl/settings/0B4_Set.bin":$2C..$2D
incbin "lvl/settings/0B5_Set.bin":$2C..$2D
incbin "lvl/settings/0B6_Set.bin":$2C..$2D
incbin "lvl/settings/0B7_Set.bin":$2C..$2D
incbin "lvl/settings/0B8_Set.bin":$2C..$2D
incbin "lvl/settings/0B9_Set.bin":$2C..$2D
incbin "lvl/settings/0BA_Set.bin":$2C..$2D
incbin "lvl/settings/0BB_Set.bin":$2C..$2D
incbin "lvl/settings/0BC_Set.bin":$2C..$2D
incbin "lvl/settings/0BD_Set.bin":$2C..$2D
incbin "lvl/settings/0BE_Set.bin":$2C..$2D
incbin "lvl/settings/0BF_Set.bin":$2C..$2D
incbin "lvl/settings/0C0_Set.bin":$2C..$2D
incbin "lvl/settings/0C1_Set.bin":$2C..$2D
incbin "lvl/settings/0C2_Set.bin":$2C..$2D
incbin "lvl/settings/0C3_Set.bin":$2C..$2D
incbin "lvl/settings/0C4_Set.bin":$2C..$2D
incbin "lvl/settings/0C5_Set.bin":$2C..$2D
incbin "lvl/settings/0C6_Set.bin":$2C..$2D
incbin "lvl/settings/0C7_Set.bin":$2C..$2D
incbin "lvl/settings/0C8_Set.bin":$2C..$2D
incbin "lvl/settings/0C9_Set.bin":$2C..$2D
incbin "lvl/settings/0CA_Set.bin":$2C..$2D
incbin "lvl/settings/0CB_Set.bin":$2C..$2D
incbin "lvl/settings/0CC_Set.bin":$2C..$2D
incbin "lvl/settings/0CD_Set.bin":$2C..$2D
incbin "lvl/settings/0CE_Set.bin":$2C..$2D
incbin "lvl/settings/0CF_Set.bin":$2C..$2D
incbin "lvl/settings/0D0_Set.bin":$2C..$2D
incbin "lvl/settings/0D1_Set.bin":$2C..$2D
incbin "lvl/settings/0D2_Set.bin":$2C..$2D
incbin "lvl/settings/0D3_Set.bin":$2C..$2D
incbin "lvl/settings/0D4_Set.bin":$2C..$2D
incbin "lvl/settings/0D5_Set.bin":$2C..$2D
incbin "lvl/settings/0D6_Set.bin":$2C..$2D
incbin "lvl/settings/0D7_Set.bin":$2C..$2D
incbin "lvl/settings/0D8_Set.bin":$2C..$2D
incbin "lvl/settings/0D9_Set.bin":$2C..$2D
incbin "lvl/settings/0DA_Set.bin":$2C..$2D
incbin "lvl/settings/0DB_Set.bin":$2C..$2D
incbin "lvl/settings/0DC_Set.bin":$2C..$2D
incbin "lvl/settings/0DD_Set.bin":$2C..$2D
incbin "lvl/settings/0DE_Set.bin":$2C..$2D
incbin "lvl/settings/0DF_Set.bin":$2C..$2D
incbin "lvl/settings/0E0_Set.bin":$2C..$2D
incbin "lvl/settings/0E1_Set.bin":$2C..$2D
incbin "lvl/settings/0E2_Set.bin":$2C..$2D
incbin "lvl/settings/0E3_Set.bin":$2C..$2D
incbin "lvl/settings/0E4_Set.bin":$2C..$2D
incbin "lvl/settings/0E5_Set.bin":$2C..$2D
incbin "lvl/settings/0E6_Set.bin":$2C..$2D
incbin "lvl/settings/0E7_Set.bin":$2C..$2D
incbin "lvl/settings/0E8_Set.bin":$2C..$2D
incbin "lvl/settings/0E9_Set.bin":$2C..$2D
incbin "lvl/settings/0EA_Set.bin":$2C..$2D
incbin "lvl/settings/0EB_Set.bin":$2C..$2D
incbin "lvl/settings/0EC_Set.bin":$2C..$2D
incbin "lvl/settings/0ED_Set.bin":$2C..$2D
incbin "lvl/settings/0EE_Set.bin":$2C..$2D
incbin "lvl/settings/0EF_Set.bin":$2C..$2D
incbin "lvl/settings/0F0_Set.bin":$2C..$2D
incbin "lvl/settings/0F1_Set.bin":$2C..$2D
incbin "lvl/settings/0F2_Set.bin":$2C..$2D
incbin "lvl/settings/0F3_Set.bin":$2C..$2D
incbin "lvl/settings/0F4_Set.bin":$2C..$2D
incbin "lvl/settings/0F5_Set.bin":$2C..$2D
incbin "lvl/settings/0F6_Set.bin":$2C..$2D
incbin "lvl/settings/0F7_Set.bin":$2C..$2D
incbin "lvl/settings/0F8_Set.bin":$2C..$2D
incbin "lvl/settings/0F9_Set.bin":$2C..$2D
incbin "lvl/settings/0FA_Set.bin":$2C..$2D
incbin "lvl/settings/0FB_Set.bin":$2C..$2D
incbin "lvl/settings/0FC_Set.bin":$2C..$2D
incbin "lvl/settings/0FD_Set.bin":$2C..$2D
incbin "lvl/settings/0FE_Set.bin":$2C..$2D
incbin "lvl/settings/0FF_Set.bin":$2C..$2D
incbin "lvl/settings/100_Set.bin":$2C..$2D
incbin "lvl/settings/101_Set.bin":$2C..$2D
incbin "lvl/settings/102_Set.bin":$2C..$2D
incbin "lvl/settings/103_Set.bin":$2C..$2D
incbin "lvl/settings/104_Set.bin":$2C..$2D
incbin "lvl/settings/105_Set.bin":$2C..$2D
incbin "lvl/settings/106_Set.bin":$2C..$2D
incbin "lvl/settings/107_Set.bin":$2C..$2D
incbin "lvl/settings/108_Set.bin":$2C..$2D
incbin "lvl/settings/109_Set.bin":$2C..$2D
incbin "lvl/settings/10A_Set.bin":$2C..$2D
incbin "lvl/settings/10B_Set.bin":$2C..$2D
incbin "lvl/settings/10C_Set.bin":$2C..$2D
incbin "lvl/settings/10D_Set.bin":$2C..$2D
incbin "lvl/settings/10E_Set.bin":$2C..$2D
incbin "lvl/settings/10F_Set.bin":$2C..$2D
incbin "lvl/settings/110_Set.bin":$2C..$2D
incbin "lvl/settings/111_Set.bin":$2C..$2D
incbin "lvl/settings/112_Set.bin":$2C..$2D
incbin "lvl/settings/113_Set.bin":$2C..$2D
incbin "lvl/settings/114_Set.bin":$2C..$2D
incbin "lvl/settings/115_Set.bin":$2C..$2D
incbin "lvl/settings/116_Set.bin":$2C..$2D
incbin "lvl/settings/117_Set.bin":$2C..$2D
incbin "lvl/settings/118_Set.bin":$2C..$2D
incbin "lvl/settings/119_Set.bin":$2C..$2D
incbin "lvl/settings/11A_Set.bin":$2C..$2D
incbin "lvl/settings/11B_Set.bin":$2C..$2D
incbin "lvl/settings/11C_Set.bin":$2C..$2D
incbin "lvl/settings/11D_Set.bin":$2C..$2D
incbin "lvl/settings/11E_Set.bin":$2C..$2D
incbin "lvl/settings/11F_Set.bin":$2C..$2D
incbin "lvl/settings/120_Set.bin":$2C..$2D
incbin "lvl/settings/121_Set.bin":$2C..$2D
incbin "lvl/settings/122_Set.bin":$2C..$2D
incbin "lvl/settings/123_Set.bin":$2C..$2D
incbin "lvl/settings/124_Set.bin":$2C..$2D
incbin "lvl/settings/125_Set.bin":$2C..$2D
incbin "lvl/settings/126_Set.bin":$2C..$2D
incbin "lvl/settings/127_Set.bin":$2C..$2D
incbin "lvl/settings/128_Set.bin":$2C..$2D
incbin "lvl/settings/129_Set.bin":$2C..$2D
incbin "lvl/settings/12A_Set.bin":$2C..$2D
incbin "lvl/settings/12B_Set.bin":$2C..$2D
incbin "lvl/settings/12C_Set.bin":$2C..$2D
incbin "lvl/settings/12D_Set.bin":$2C..$2D
incbin "lvl/settings/12E_Set.bin":$2C..$2D
incbin "lvl/settings/12F_Set.bin":$2C..$2D
incbin "lvl/settings/130_Set.bin":$2C..$2D
incbin "lvl/settings/131_Set.bin":$2C..$2D
incbin "lvl/settings/132_Set.bin":$2C..$2D
incbin "lvl/settings/133_Set.bin":$2C..$2D
incbin "lvl/settings/134_Set.bin":$2C..$2D
incbin "lvl/settings/135_Set.bin":$2C..$2D
incbin "lvl/settings/136_Set.bin":$2C..$2D
incbin "lvl/settings/137_Set.bin":$2C..$2D
incbin "lvl/settings/138_Set.bin":$2C..$2D
incbin "lvl/settings/139_Set.bin":$2C..$2D
incbin "lvl/settings/13A_Set.bin":$2C..$2D
incbin "lvl/settings/13B_Set.bin":$2C..$2D
incbin "lvl/settings/13C_Set.bin":$2C..$2D
incbin "lvl/settings/13D_Set.bin":$2C..$2D
incbin "lvl/settings/13E_Set.bin":$2C..$2D
incbin "lvl/settings/13F_Set.bin":$2C..$2D
incbin "lvl/settings/140_Set.bin":$2C..$2D
incbin "lvl/settings/141_Set.bin":$2C..$2D
incbin "lvl/settings/142_Set.bin":$2C..$2D
incbin "lvl/settings/143_Set.bin":$2C..$2D
incbin "lvl/settings/144_Set.bin":$2C..$2D
incbin "lvl/settings/145_Set.bin":$2C..$2D
incbin "lvl/settings/146_Set.bin":$2C..$2D
incbin "lvl/settings/147_Set.bin":$2C..$2D
incbin "lvl/settings/148_Set.bin":$2C..$2D
incbin "lvl/settings/149_Set.bin":$2C..$2D
incbin "lvl/settings/14A_Set.bin":$2C..$2D
incbin "lvl/settings/14B_Set.bin":$2C..$2D
incbin "lvl/settings/14C_Set.bin":$2C..$2D
incbin "lvl/settings/14D_Set.bin":$2C..$2D
incbin "lvl/settings/14E_Set.bin":$2C..$2D
incbin "lvl/settings/14F_Set.bin":$2C..$2D
incbin "lvl/settings/150_Set.bin":$2C..$2D
incbin "lvl/settings/151_Set.bin":$2C..$2D
incbin "lvl/settings/152_Set.bin":$2C..$2D
incbin "lvl/settings/153_Set.bin":$2C..$2D
incbin "lvl/settings/154_Set.bin":$2C..$2D
incbin "lvl/settings/155_Set.bin":$2C..$2D
incbin "lvl/settings/156_Set.bin":$2C..$2D
incbin "lvl/settings/157_Set.bin":$2C..$2D
incbin "lvl/settings/158_Set.bin":$2C..$2D
incbin "lvl/settings/159_Set.bin":$2C..$2D
incbin "lvl/settings/15A_Set.bin":$2C..$2D
incbin "lvl/settings/15B_Set.bin":$2C..$2D
incbin "lvl/settings/15C_Set.bin":$2C..$2D
incbin "lvl/settings/15D_Set.bin":$2C..$2D
incbin "lvl/settings/15E_Set.bin":$2C..$2D
incbin "lvl/settings/15F_Set.bin":$2C..$2D
incbin "lvl/settings/160_Set.bin":$2C..$2D
incbin "lvl/settings/161_Set.bin":$2C..$2D
incbin "lvl/settings/162_Set.bin":$2C..$2D
incbin "lvl/settings/163_Set.bin":$2C..$2D
incbin "lvl/settings/164_Set.bin":$2C..$2D
incbin "lvl/settings/165_Set.bin":$2C..$2D
incbin "lvl/settings/166_Set.bin":$2C..$2D
incbin "lvl/settings/167_Set.bin":$2C..$2D
incbin "lvl/settings/168_Set.bin":$2C..$2D
incbin "lvl/settings/169_Set.bin":$2C..$2D
incbin "lvl/settings/16A_Set.bin":$2C..$2D
incbin "lvl/settings/16B_Set.bin":$2C..$2D
incbin "lvl/settings/16C_Set.bin":$2C..$2D
incbin "lvl/settings/16D_Set.bin":$2C..$2D
incbin "lvl/settings/16E_Set.bin":$2C..$2D
incbin "lvl/settings/16F_Set.bin":$2C..$2D
incbin "lvl/settings/170_Set.bin":$2C..$2D
incbin "lvl/settings/171_Set.bin":$2C..$2D
incbin "lvl/settings/172_Set.bin":$2C..$2D
incbin "lvl/settings/173_Set.bin":$2C..$2D
incbin "lvl/settings/174_Set.bin":$2C..$2D
incbin "lvl/settings/175_Set.bin":$2C..$2D
incbin "lvl/settings/176_Set.bin":$2C..$2D
incbin "lvl/settings/177_Set.bin":$2C..$2D
incbin "lvl/settings/178_Set.bin":$2C..$2D
incbin "lvl/settings/179_Set.bin":$2C..$2D
incbin "lvl/settings/17A_Set.bin":$2C..$2D
incbin "lvl/settings/17B_Set.bin":$2C..$2D
incbin "lvl/settings/17C_Set.bin":$2C..$2D
incbin "lvl/settings/17D_Set.bin":$2C..$2D
incbin "lvl/settings/17E_Set.bin":$2C..$2D
incbin "lvl/settings/17F_Set.bin":$2C..$2D
incbin "lvl/settings/180_Set.bin":$2C..$2D
incbin "lvl/settings/181_Set.bin":$2C..$2D
incbin "lvl/settings/182_Set.bin":$2C..$2D
incbin "lvl/settings/183_Set.bin":$2C..$2D
incbin "lvl/settings/184_Set.bin":$2C..$2D
incbin "lvl/settings/185_Set.bin":$2C..$2D
incbin "lvl/settings/186_Set.bin":$2C..$2D
incbin "lvl/settings/187_Set.bin":$2C..$2D
incbin "lvl/settings/188_Set.bin":$2C..$2D
incbin "lvl/settings/189_Set.bin":$2C..$2D
incbin "lvl/settings/18A_Set.bin":$2C..$2D
incbin "lvl/settings/18B_Set.bin":$2C..$2D
incbin "lvl/settings/18C_Set.bin":$2C..$2D
incbin "lvl/settings/18D_Set.bin":$2C..$2D
incbin "lvl/settings/18E_Set.bin":$2C..$2D
incbin "lvl/settings/18F_Set.bin":$2C..$2D
incbin "lvl/settings/190_Set.bin":$2C..$2D
incbin "lvl/settings/191_Set.bin":$2C..$2D
incbin "lvl/settings/192_Set.bin":$2C..$2D
incbin "lvl/settings/193_Set.bin":$2C..$2D
incbin "lvl/settings/194_Set.bin":$2C..$2D
incbin "lvl/settings/195_Set.bin":$2C..$2D
incbin "lvl/settings/196_Set.bin":$2C..$2D
incbin "lvl/settings/197_Set.bin":$2C..$2D
incbin "lvl/settings/198_Set.bin":$2C..$2D
incbin "lvl/settings/199_Set.bin":$2C..$2D
incbin "lvl/settings/19A_Set.bin":$2C..$2D
incbin "lvl/settings/19B_Set.bin":$2C..$2D
incbin "lvl/settings/19C_Set.bin":$2C..$2D
incbin "lvl/settings/19D_Set.bin":$2C..$2D
incbin "lvl/settings/19E_Set.bin":$2C..$2D
incbin "lvl/settings/19F_Set.bin":$2C..$2D
incbin "lvl/settings/1A0_Set.bin":$2C..$2D
incbin "lvl/settings/1A1_Set.bin":$2C..$2D
incbin "lvl/settings/1A2_Set.bin":$2C..$2D
incbin "lvl/settings/1A3_Set.bin":$2C..$2D
incbin "lvl/settings/1A4_Set.bin":$2C..$2D
incbin "lvl/settings/1A5_Set.bin":$2C..$2D
incbin "lvl/settings/1A6_Set.bin":$2C..$2D
incbin "lvl/settings/1A7_Set.bin":$2C..$2D
incbin "lvl/settings/1A8_Set.bin":$2C..$2D
incbin "lvl/settings/1A9_Set.bin":$2C..$2D
incbin "lvl/settings/1AA_Set.bin":$2C..$2D
incbin "lvl/settings/1AB_Set.bin":$2C..$2D
incbin "lvl/settings/1AC_Set.bin":$2C..$2D
incbin "lvl/settings/1AD_Set.bin":$2C..$2D
incbin "lvl/settings/1AE_Set.bin":$2C..$2D
incbin "lvl/settings/1AF_Set.bin":$2C..$2D
incbin "lvl/settings/1B0_Set.bin":$2C..$2D
incbin "lvl/settings/1B1_Set.bin":$2C..$2D
incbin "lvl/settings/1B2_Set.bin":$2C..$2D
incbin "lvl/settings/1B3_Set.bin":$2C..$2D
incbin "lvl/settings/1B4_Set.bin":$2C..$2D
incbin "lvl/settings/1B5_Set.bin":$2C..$2D
incbin "lvl/settings/1B6_Set.bin":$2C..$2D
incbin "lvl/settings/1B7_Set.bin":$2C..$2D
incbin "lvl/settings/1B8_Set.bin":$2C..$2D
incbin "lvl/settings/1B9_Set.bin":$2C..$2D
incbin "lvl/settings/1BA_Set.bin":$2C..$2D
incbin "lvl/settings/1BB_Set.bin":$2C..$2D
incbin "lvl/settings/1BC_Set.bin":$2C..$2D
incbin "lvl/settings/1BD_Set.bin":$2C..$2D
incbin "lvl/settings/1BE_Set.bin":$2C..$2D
incbin "lvl/settings/1BF_Set.bin":$2C..$2D
incbin "lvl/settings/1C0_Set.bin":$2C..$2D
incbin "lvl/settings/1C1_Set.bin":$2C..$2D
incbin "lvl/settings/1C2_Set.bin":$2C..$2D
incbin "lvl/settings/1C3_Set.bin":$2C..$2D
incbin "lvl/settings/1C4_Set.bin":$2C..$2D
incbin "lvl/settings/1C5_Set.bin":$2C..$2D
incbin "lvl/settings/1C6_Set.bin":$2C..$2D
incbin "lvl/settings/1C7_Set.bin":$2C..$2D
incbin "lvl/settings/1C8_Set.bin":$2C..$2D
incbin "lvl/settings/1C9_Set.bin":$2C..$2D
incbin "lvl/settings/1CA_Set.bin":$2C..$2D
incbin "lvl/settings/1CB_Set.bin":$2C..$2D
incbin "lvl/settings/1CC_Set.bin":$2C..$2D
incbin "lvl/settings/1CD_Set.bin":$2C..$2D
incbin "lvl/settings/1CE_Set.bin":$2C..$2D
incbin "lvl/settings/1CF_Set.bin":$2C..$2D
incbin "lvl/settings/1D0_Set.bin":$2C..$2D
incbin "lvl/settings/1D1_Set.bin":$2C..$2D
incbin "lvl/settings/1D2_Set.bin":$2C..$2D
incbin "lvl/settings/1D3_Set.bin":$2C..$2D
incbin "lvl/settings/1D4_Set.bin":$2C..$2D
incbin "lvl/settings/1D5_Set.bin":$2C..$2D
incbin "lvl/settings/1D6_Set.bin":$2C..$2D
incbin "lvl/settings/1D7_Set.bin":$2C..$2D
incbin "lvl/settings/1D8_Set.bin":$2C..$2D
incbin "lvl/settings/1D9_Set.bin":$2C..$2D
incbin "lvl/settings/1DA_Set.bin":$2C..$2D
incbin "lvl/settings/1DB_Set.bin":$2C..$2D
incbin "lvl/settings/1DC_Set.bin":$2C..$2D
incbin "lvl/settings/1DD_Set.bin":$2C..$2D
incbin "lvl/settings/1DE_Set.bin":$2C..$2D
incbin "lvl/settings/1DF_Set.bin":$2C..$2D
incbin "lvl/settings/1E0_Set.bin":$2C..$2D
incbin "lvl/settings/1E1_Set.bin":$2C..$2D
incbin "lvl/settings/1E2_Set.bin":$2C..$2D
incbin "lvl/settings/1E3_Set.bin":$2C..$2D
incbin "lvl/settings/1E4_Set.bin":$2C..$2D
incbin "lvl/settings/1E5_Set.bin":$2C..$2D
incbin "lvl/settings/1E6_Set.bin":$2C..$2D
incbin "lvl/settings/1E7_Set.bin":$2C..$2D
incbin "lvl/settings/1E8_Set.bin":$2C..$2D
incbin "lvl/settings/1E9_Set.bin":$2C..$2D
incbin "lvl/settings/1EA_Set.bin":$2C..$2D
incbin "lvl/settings/1EB_Set.bin":$2C..$2D
incbin "lvl/settings/1EC_Set.bin":$2C..$2D
incbin "lvl/settings/1ED_Set.bin":$2C..$2D
incbin "lvl/settings/1EE_Set.bin":$2C..$2D
incbin "lvl/settings/1EF_Set.bin":$2C..$2D
incbin "lvl/settings/1F0_Set.bin":$2C..$2D
incbin "lvl/settings/1F1_Set.bin":$2C..$2D
incbin "lvl/settings/1F2_Set.bin":$2C..$2D
incbin "lvl/settings/1F3_Set.bin":$2C..$2D
incbin "lvl/settings/1F4_Set.bin":$2C..$2D
incbin "lvl/settings/1F5_Set.bin":$2C..$2D
incbin "lvl/settings/1F6_Set.bin":$2C..$2D
incbin "lvl/settings/1F7_Set.bin":$2C..$2D
incbin "lvl/settings/1F8_Set.bin":$2C..$2D
incbin "lvl/settings/1F9_Set.bin":$2C..$2D
incbin "lvl/settings/1FA_Set.bin":$2C..$2D
incbin "lvl/settings/1FB_Set.bin":$2C..$2D
incbin "lvl/settings/1FC_Set.bin":$2C..$2D
incbin "lvl/settings/1FD_Set.bin":$2C..$2D
incbin "lvl/settings/1FE_Set.bin":$2C..$2D
incbin "lvl/settings/1FF_Set.bin":$2C..$2D

DATA_0EF310:						; Lunar Magic table
incbin "lvl/settings/000_Set.bin":$20..$21
incbin "lvl/settings/001_Set.bin":$20..$21
incbin "lvl/settings/002_Set.bin":$20..$21
incbin "lvl/settings/003_Set.bin":$20..$21
incbin "lvl/settings/004_Set.bin":$20..$21
incbin "lvl/settings/005_Set.bin":$20..$21
incbin "lvl/settings/006_Set.bin":$20..$21
incbin "lvl/settings/007_Set.bin":$20..$21
incbin "lvl/settings/008_Set.bin":$20..$21
incbin "lvl/settings/009_Set.bin":$20..$21
incbin "lvl/settings/00A_Set.bin":$20..$21
incbin "lvl/settings/00B_Set.bin":$20..$21
incbin "lvl/settings/00C_Set.bin":$20..$21
incbin "lvl/settings/00D_Set.bin":$20..$21
incbin "lvl/settings/00E_Set.bin":$20..$21
incbin "lvl/settings/00F_Set.bin":$20..$21
incbin "lvl/settings/010_Set.bin":$20..$21
incbin "lvl/settings/011_Set.bin":$20..$21
incbin "lvl/settings/012_Set.bin":$20..$21
incbin "lvl/settings/013_Set.bin":$20..$21
incbin "lvl/settings/014_Set.bin":$20..$21
incbin "lvl/settings/015_Set.bin":$20..$21
incbin "lvl/settings/016_Set.bin":$20..$21
incbin "lvl/settings/017_Set.bin":$20..$21
incbin "lvl/settings/018_Set.bin":$20..$21
incbin "lvl/settings/019_Set.bin":$20..$21
incbin "lvl/settings/01A_Set.bin":$20..$21
incbin "lvl/settings/01B_Set.bin":$20..$21
incbin "lvl/settings/01C_Set.bin":$20..$21
incbin "lvl/settings/01D_Set.bin":$20..$21
incbin "lvl/settings/01E_Set.bin":$20..$21
incbin "lvl/settings/01F_Set.bin":$20..$21
incbin "lvl/settings/020_Set.bin":$20..$21
incbin "lvl/settings/021_Set.bin":$20..$21
incbin "lvl/settings/022_Set.bin":$20..$21
incbin "lvl/settings/023_Set.bin":$20..$21
incbin "lvl/settings/024_Set.bin":$20..$21
incbin "lvl/settings/025_Set.bin":$20..$21
incbin "lvl/settings/026_Set.bin":$20..$21
incbin "lvl/settings/027_Set.bin":$20..$21
incbin "lvl/settings/028_Set.bin":$20..$21
incbin "lvl/settings/029_Set.bin":$20..$21
incbin "lvl/settings/02A_Set.bin":$20..$21
incbin "lvl/settings/02B_Set.bin":$20..$21
incbin "lvl/settings/02C_Set.bin":$20..$21
incbin "lvl/settings/02D_Set.bin":$20..$21
incbin "lvl/settings/02E_Set.bin":$20..$21
incbin "lvl/settings/02F_Set.bin":$20..$21
incbin "lvl/settings/030_Set.bin":$20..$21
incbin "lvl/settings/031_Set.bin":$20..$21
incbin "lvl/settings/032_Set.bin":$20..$21
incbin "lvl/settings/033_Set.bin":$20..$21
incbin "lvl/settings/034_Set.bin":$20..$21
incbin "lvl/settings/035_Set.bin":$20..$21
incbin "lvl/settings/036_Set.bin":$20..$21
incbin "lvl/settings/037_Set.bin":$20..$21
incbin "lvl/settings/038_Set.bin":$20..$21
incbin "lvl/settings/039_Set.bin":$20..$21
incbin "lvl/settings/03A_Set.bin":$20..$21
incbin "lvl/settings/03B_Set.bin":$20..$21
incbin "lvl/settings/03C_Set.bin":$20..$21
incbin "lvl/settings/03D_Set.bin":$20..$21
incbin "lvl/settings/03E_Set.bin":$20..$21
incbin "lvl/settings/03F_Set.bin":$20..$21
incbin "lvl/settings/040_Set.bin":$20..$21
incbin "lvl/settings/041_Set.bin":$20..$21
incbin "lvl/settings/042_Set.bin":$20..$21
incbin "lvl/settings/043_Set.bin":$20..$21
incbin "lvl/settings/044_Set.bin":$20..$21
incbin "lvl/settings/045_Set.bin":$20..$21
incbin "lvl/settings/046_Set.bin":$20..$21
incbin "lvl/settings/047_Set.bin":$20..$21
incbin "lvl/settings/048_Set.bin":$20..$21
incbin "lvl/settings/049_Set.bin":$20..$21
incbin "lvl/settings/04A_Set.bin":$20..$21
incbin "lvl/settings/04B_Set.bin":$20..$21
incbin "lvl/settings/04C_Set.bin":$20..$21
incbin "lvl/settings/04D_Set.bin":$20..$21
incbin "lvl/settings/04E_Set.bin":$20..$21
incbin "lvl/settings/04F_Set.bin":$20..$21
incbin "lvl/settings/050_Set.bin":$20..$21
incbin "lvl/settings/051_Set.bin":$20..$21
incbin "lvl/settings/052_Set.bin":$20..$21
incbin "lvl/settings/053_Set.bin":$20..$21
incbin "lvl/settings/054_Set.bin":$20..$21
incbin "lvl/settings/055_Set.bin":$20..$21
incbin "lvl/settings/056_Set.bin":$20..$21
incbin "lvl/settings/057_Set.bin":$20..$21
incbin "lvl/settings/058_Set.bin":$20..$21
incbin "lvl/settings/059_Set.bin":$20..$21
incbin "lvl/settings/05A_Set.bin":$20..$21
incbin "lvl/settings/05B_Set.bin":$20..$21
incbin "lvl/settings/05C_Set.bin":$20..$21
incbin "lvl/settings/05D_Set.bin":$20..$21
incbin "lvl/settings/05E_Set.bin":$20..$21
incbin "lvl/settings/05F_Set.bin":$20..$21
incbin "lvl/settings/060_Set.bin":$20..$21
incbin "lvl/settings/061_Set.bin":$20..$21
incbin "lvl/settings/062_Set.bin":$20..$21
incbin "lvl/settings/063_Set.bin":$20..$21
incbin "lvl/settings/064_Set.bin":$20..$21
incbin "lvl/settings/065_Set.bin":$20..$21
incbin "lvl/settings/066_Set.bin":$20..$21
incbin "lvl/settings/067_Set.bin":$20..$21
incbin "lvl/settings/068_Set.bin":$20..$21
incbin "lvl/settings/069_Set.bin":$20..$21
incbin "lvl/settings/06A_Set.bin":$20..$21
incbin "lvl/settings/06B_Set.bin":$20..$21
incbin "lvl/settings/06C_Set.bin":$20..$21
incbin "lvl/settings/06D_Set.bin":$20..$21
incbin "lvl/settings/06E_Set.bin":$20..$21
incbin "lvl/settings/06F_Set.bin":$20..$21
incbin "lvl/settings/070_Set.bin":$20..$21
incbin "lvl/settings/071_Set.bin":$20..$21
incbin "lvl/settings/072_Set.bin":$20..$21
incbin "lvl/settings/073_Set.bin":$20..$21
incbin "lvl/settings/074_Set.bin":$20..$21
incbin "lvl/settings/075_Set.bin":$20..$21
incbin "lvl/settings/076_Set.bin":$20..$21
incbin "lvl/settings/077_Set.bin":$20..$21
incbin "lvl/settings/078_Set.bin":$20..$21
incbin "lvl/settings/079_Set.bin":$20..$21
incbin "lvl/settings/07A_Set.bin":$20..$21
incbin "lvl/settings/07B_Set.bin":$20..$21
incbin "lvl/settings/07C_Set.bin":$20..$21
incbin "lvl/settings/07D_Set.bin":$20..$21
incbin "lvl/settings/07E_Set.bin":$20..$21
incbin "lvl/settings/07F_Set.bin":$20..$21
incbin "lvl/settings/080_Set.bin":$20..$21
incbin "lvl/settings/081_Set.bin":$20..$21
incbin "lvl/settings/082_Set.bin":$20..$21
incbin "lvl/settings/083_Set.bin":$20..$21
incbin "lvl/settings/084_Set.bin":$20..$21
incbin "lvl/settings/085_Set.bin":$20..$21
incbin "lvl/settings/086_Set.bin":$20..$21
incbin "lvl/settings/087_Set.bin":$20..$21
incbin "lvl/settings/088_Set.bin":$20..$21
incbin "lvl/settings/089_Set.bin":$20..$21
incbin "lvl/settings/08A_Set.bin":$20..$21
incbin "lvl/settings/08B_Set.bin":$20..$21
incbin "lvl/settings/08C_Set.bin":$20..$21
incbin "lvl/settings/08D_Set.bin":$20..$21
incbin "lvl/settings/08E_Set.bin":$20..$21
incbin "lvl/settings/08F_Set.bin":$20..$21
incbin "lvl/settings/090_Set.bin":$20..$21
incbin "lvl/settings/091_Set.bin":$20..$21
incbin "lvl/settings/092_Set.bin":$20..$21
incbin "lvl/settings/093_Set.bin":$20..$21
incbin "lvl/settings/094_Set.bin":$20..$21
incbin "lvl/settings/095_Set.bin":$20..$21
incbin "lvl/settings/096_Set.bin":$20..$21
incbin "lvl/settings/097_Set.bin":$20..$21
incbin "lvl/settings/098_Set.bin":$20..$21
incbin "lvl/settings/099_Set.bin":$20..$21
incbin "lvl/settings/09A_Set.bin":$20..$21
incbin "lvl/settings/09B_Set.bin":$20..$21
incbin "lvl/settings/09C_Set.bin":$20..$21
incbin "lvl/settings/09D_Set.bin":$20..$21
incbin "lvl/settings/09E_Set.bin":$20..$21
incbin "lvl/settings/09F_Set.bin":$20..$21
incbin "lvl/settings/0A0_Set.bin":$20..$21
incbin "lvl/settings/0A1_Set.bin":$20..$21
incbin "lvl/settings/0A2_Set.bin":$20..$21
incbin "lvl/settings/0A3_Set.bin":$20..$21
incbin "lvl/settings/0A4_Set.bin":$20..$21
incbin "lvl/settings/0A5_Set.bin":$20..$21
incbin "lvl/settings/0A6_Set.bin":$20..$21
incbin "lvl/settings/0A7_Set.bin":$20..$21
incbin "lvl/settings/0A8_Set.bin":$20..$21
incbin "lvl/settings/0A9_Set.bin":$20..$21
incbin "lvl/settings/0AA_Set.bin":$20..$21
incbin "lvl/settings/0AB_Set.bin":$20..$21
incbin "lvl/settings/0AC_Set.bin":$20..$21
incbin "lvl/settings/0AD_Set.bin":$20..$21
incbin "lvl/settings/0AE_Set.bin":$20..$21
incbin "lvl/settings/0AF_Set.bin":$20..$21
incbin "lvl/settings/0B0_Set.bin":$20..$21
incbin "lvl/settings/0B1_Set.bin":$20..$21
incbin "lvl/settings/0B2_Set.bin":$20..$21
incbin "lvl/settings/0B3_Set.bin":$20..$21
incbin "lvl/settings/0B4_Set.bin":$20..$21
incbin "lvl/settings/0B5_Set.bin":$20..$21
incbin "lvl/settings/0B6_Set.bin":$20..$21
incbin "lvl/settings/0B7_Set.bin":$20..$21
incbin "lvl/settings/0B8_Set.bin":$20..$21
incbin "lvl/settings/0B9_Set.bin":$20..$21
incbin "lvl/settings/0BA_Set.bin":$20..$21
incbin "lvl/settings/0BB_Set.bin":$20..$21
incbin "lvl/settings/0BC_Set.bin":$20..$21
incbin "lvl/settings/0BD_Set.bin":$20..$21
incbin "lvl/settings/0BE_Set.bin":$20..$21
incbin "lvl/settings/0BF_Set.bin":$20..$21
incbin "lvl/settings/0C0_Set.bin":$20..$21
incbin "lvl/settings/0C1_Set.bin":$20..$21
incbin "lvl/settings/0C2_Set.bin":$20..$21
incbin "lvl/settings/0C3_Set.bin":$20..$21
incbin "lvl/settings/0C4_Set.bin":$20..$21
incbin "lvl/settings/0C5_Set.bin":$20..$21
incbin "lvl/settings/0C6_Set.bin":$20..$21
incbin "lvl/settings/0C7_Set.bin":$20..$21
incbin "lvl/settings/0C8_Set.bin":$20..$21
incbin "lvl/settings/0C9_Set.bin":$20..$21
incbin "lvl/settings/0CA_Set.bin":$20..$21
incbin "lvl/settings/0CB_Set.bin":$20..$21
incbin "lvl/settings/0CC_Set.bin":$20..$21
incbin "lvl/settings/0CD_Set.bin":$20..$21
incbin "lvl/settings/0CE_Set.bin":$20..$21
incbin "lvl/settings/0CF_Set.bin":$20..$21
incbin "lvl/settings/0D0_Set.bin":$20..$21
incbin "lvl/settings/0D1_Set.bin":$20..$21
incbin "lvl/settings/0D2_Set.bin":$20..$21
incbin "lvl/settings/0D3_Set.bin":$20..$21
incbin "lvl/settings/0D4_Set.bin":$20..$21
incbin "lvl/settings/0D5_Set.bin":$20..$21
incbin "lvl/settings/0D6_Set.bin":$20..$21
incbin "lvl/settings/0D7_Set.bin":$20..$21
incbin "lvl/settings/0D8_Set.bin":$20..$21
incbin "lvl/settings/0D9_Set.bin":$20..$21
incbin "lvl/settings/0DA_Set.bin":$20..$21
incbin "lvl/settings/0DB_Set.bin":$20..$21
incbin "lvl/settings/0DC_Set.bin":$20..$21
incbin "lvl/settings/0DD_Set.bin":$20..$21
incbin "lvl/settings/0DE_Set.bin":$20..$21
incbin "lvl/settings/0DF_Set.bin":$20..$21
incbin "lvl/settings/0E0_Set.bin":$20..$21
incbin "lvl/settings/0E1_Set.bin":$20..$21
incbin "lvl/settings/0E2_Set.bin":$20..$21
incbin "lvl/settings/0E3_Set.bin":$20..$21
incbin "lvl/settings/0E4_Set.bin":$20..$21
incbin "lvl/settings/0E5_Set.bin":$20..$21
incbin "lvl/settings/0E6_Set.bin":$20..$21
incbin "lvl/settings/0E7_Set.bin":$20..$21
incbin "lvl/settings/0E8_Set.bin":$20..$21
incbin "lvl/settings/0E9_Set.bin":$20..$21
incbin "lvl/settings/0EA_Set.bin":$20..$21
incbin "lvl/settings/0EB_Set.bin":$20..$21
incbin "lvl/settings/0EC_Set.bin":$20..$21
incbin "lvl/settings/0ED_Set.bin":$20..$21
incbin "lvl/settings/0EE_Set.bin":$20..$21
incbin "lvl/settings/0EF_Set.bin":$20..$21
incbin "lvl/settings/0F0_Set.bin":$20..$21
incbin "lvl/settings/0F1_Set.bin":$20..$21
incbin "lvl/settings/0F2_Set.bin":$20..$21
incbin "lvl/settings/0F3_Set.bin":$20..$21
incbin "lvl/settings/0F4_Set.bin":$20..$21
incbin "lvl/settings/0F5_Set.bin":$20..$21
incbin "lvl/settings/0F6_Set.bin":$20..$21
incbin "lvl/settings/0F7_Set.bin":$20..$21
incbin "lvl/settings/0F8_Set.bin":$20..$21
incbin "lvl/settings/0F9_Set.bin":$20..$21
incbin "lvl/settings/0FA_Set.bin":$20..$21
incbin "lvl/settings/0FB_Set.bin":$20..$21
incbin "lvl/settings/0FC_Set.bin":$20..$21
incbin "lvl/settings/0FD_Set.bin":$20..$21
incbin "lvl/settings/0FE_Set.bin":$20..$21
incbin "lvl/settings/0FF_Set.bin":$20..$21
incbin "lvl/settings/100_Set.bin":$20..$21
incbin "lvl/settings/101_Set.bin":$20..$21
incbin "lvl/settings/102_Set.bin":$20..$21
incbin "lvl/settings/103_Set.bin":$20..$21
incbin "lvl/settings/104_Set.bin":$20..$21
incbin "lvl/settings/105_Set.bin":$20..$21
incbin "lvl/settings/106_Set.bin":$20..$21
incbin "lvl/settings/107_Set.bin":$20..$21
incbin "lvl/settings/108_Set.bin":$20..$21
incbin "lvl/settings/109_Set.bin":$20..$21
incbin "lvl/settings/10A_Set.bin":$20..$21
incbin "lvl/settings/10B_Set.bin":$20..$21
incbin "lvl/settings/10C_Set.bin":$20..$21
incbin "lvl/settings/10D_Set.bin":$20..$21
incbin "lvl/settings/10E_Set.bin":$20..$21
incbin "lvl/settings/10F_Set.bin":$20..$21
incbin "lvl/settings/110_Set.bin":$20..$21
incbin "lvl/settings/111_Set.bin":$20..$21
incbin "lvl/settings/112_Set.bin":$20..$21
incbin "lvl/settings/113_Set.bin":$20..$21
incbin "lvl/settings/114_Set.bin":$20..$21
incbin "lvl/settings/115_Set.bin":$20..$21
incbin "lvl/settings/116_Set.bin":$20..$21
incbin "lvl/settings/117_Set.bin":$20..$21
incbin "lvl/settings/118_Set.bin":$20..$21
incbin "lvl/settings/119_Set.bin":$20..$21
incbin "lvl/settings/11A_Set.bin":$20..$21
incbin "lvl/settings/11B_Set.bin":$20..$21
incbin "lvl/settings/11C_Set.bin":$20..$21
incbin "lvl/settings/11D_Set.bin":$20..$21
incbin "lvl/settings/11E_Set.bin":$20..$21
incbin "lvl/settings/11F_Set.bin":$20..$21
incbin "lvl/settings/120_Set.bin":$20..$21
incbin "lvl/settings/121_Set.bin":$20..$21
incbin "lvl/settings/122_Set.bin":$20..$21
incbin "lvl/settings/123_Set.bin":$20..$21
incbin "lvl/settings/124_Set.bin":$20..$21
incbin "lvl/settings/125_Set.bin":$20..$21
incbin "lvl/settings/126_Set.bin":$20..$21
incbin "lvl/settings/127_Set.bin":$20..$21
incbin "lvl/settings/128_Set.bin":$20..$21
incbin "lvl/settings/129_Set.bin":$20..$21
incbin "lvl/settings/12A_Set.bin":$20..$21
incbin "lvl/settings/12B_Set.bin":$20..$21
incbin "lvl/settings/12C_Set.bin":$20..$21
incbin "lvl/settings/12D_Set.bin":$20..$21
incbin "lvl/settings/12E_Set.bin":$20..$21
incbin "lvl/settings/12F_Set.bin":$20..$21
incbin "lvl/settings/130_Set.bin":$20..$21
incbin "lvl/settings/131_Set.bin":$20..$21
incbin "lvl/settings/132_Set.bin":$20..$21
incbin "lvl/settings/133_Set.bin":$20..$21
incbin "lvl/settings/134_Set.bin":$20..$21
incbin "lvl/settings/135_Set.bin":$20..$21
incbin "lvl/settings/136_Set.bin":$20..$21
incbin "lvl/settings/137_Set.bin":$20..$21
incbin "lvl/settings/138_Set.bin":$20..$21
incbin "lvl/settings/139_Set.bin":$20..$21
incbin "lvl/settings/13A_Set.bin":$20..$21
incbin "lvl/settings/13B_Set.bin":$20..$21
incbin "lvl/settings/13C_Set.bin":$20..$21
incbin "lvl/settings/13D_Set.bin":$20..$21
incbin "lvl/settings/13E_Set.bin":$20..$21
incbin "lvl/settings/13F_Set.bin":$20..$21
incbin "lvl/settings/140_Set.bin":$20..$21
incbin "lvl/settings/141_Set.bin":$20..$21
incbin "lvl/settings/142_Set.bin":$20..$21
incbin "lvl/settings/143_Set.bin":$20..$21
incbin "lvl/settings/144_Set.bin":$20..$21
incbin "lvl/settings/145_Set.bin":$20..$21
incbin "lvl/settings/146_Set.bin":$20..$21
incbin "lvl/settings/147_Set.bin":$20..$21
incbin "lvl/settings/148_Set.bin":$20..$21
incbin "lvl/settings/149_Set.bin":$20..$21
incbin "lvl/settings/14A_Set.bin":$20..$21
incbin "lvl/settings/14B_Set.bin":$20..$21
incbin "lvl/settings/14C_Set.bin":$20..$21
incbin "lvl/settings/14D_Set.bin":$20..$21
incbin "lvl/settings/14E_Set.bin":$20..$21
incbin "lvl/settings/14F_Set.bin":$20..$21
incbin "lvl/settings/150_Set.bin":$20..$21
incbin "lvl/settings/151_Set.bin":$20..$21
incbin "lvl/settings/152_Set.bin":$20..$21
incbin "lvl/settings/153_Set.bin":$20..$21
incbin "lvl/settings/154_Set.bin":$20..$21
incbin "lvl/settings/155_Set.bin":$20..$21
incbin "lvl/settings/156_Set.bin":$20..$21
incbin "lvl/settings/157_Set.bin":$20..$21
incbin "lvl/settings/158_Set.bin":$20..$21
incbin "lvl/settings/159_Set.bin":$20..$21
incbin "lvl/settings/15A_Set.bin":$20..$21
incbin "lvl/settings/15B_Set.bin":$20..$21
incbin "lvl/settings/15C_Set.bin":$20..$21
incbin "lvl/settings/15D_Set.bin":$20..$21
incbin "lvl/settings/15E_Set.bin":$20..$21
incbin "lvl/settings/15F_Set.bin":$20..$21
incbin "lvl/settings/160_Set.bin":$20..$21
incbin "lvl/settings/161_Set.bin":$20..$21
incbin "lvl/settings/162_Set.bin":$20..$21
incbin "lvl/settings/163_Set.bin":$20..$21
incbin "lvl/settings/164_Set.bin":$20..$21
incbin "lvl/settings/165_Set.bin":$20..$21
incbin "lvl/settings/166_Set.bin":$20..$21
incbin "lvl/settings/167_Set.bin":$20..$21
incbin "lvl/settings/168_Set.bin":$20..$21
incbin "lvl/settings/169_Set.bin":$20..$21
incbin "lvl/settings/16A_Set.bin":$20..$21
incbin "lvl/settings/16B_Set.bin":$20..$21
incbin "lvl/settings/16C_Set.bin":$20..$21
incbin "lvl/settings/16D_Set.bin":$20..$21
incbin "lvl/settings/16E_Set.bin":$20..$21
incbin "lvl/settings/16F_Set.bin":$20..$21
incbin "lvl/settings/170_Set.bin":$20..$21
incbin "lvl/settings/171_Set.bin":$20..$21
incbin "lvl/settings/172_Set.bin":$20..$21
incbin "lvl/settings/173_Set.bin":$20..$21
incbin "lvl/settings/174_Set.bin":$20..$21
incbin "lvl/settings/175_Set.bin":$20..$21
incbin "lvl/settings/176_Set.bin":$20..$21
incbin "lvl/settings/177_Set.bin":$20..$21
incbin "lvl/settings/178_Set.bin":$20..$21
incbin "lvl/settings/179_Set.bin":$20..$21
incbin "lvl/settings/17A_Set.bin":$20..$21
incbin "lvl/settings/17B_Set.bin":$20..$21
incbin "lvl/settings/17C_Set.bin":$20..$21
incbin "lvl/settings/17D_Set.bin":$20..$21
incbin "lvl/settings/17E_Set.bin":$20..$21
incbin "lvl/settings/17F_Set.bin":$20..$21
incbin "lvl/settings/180_Set.bin":$20..$21
incbin "lvl/settings/181_Set.bin":$20..$21
incbin "lvl/settings/182_Set.bin":$20..$21
incbin "lvl/settings/183_Set.bin":$20..$21
incbin "lvl/settings/184_Set.bin":$20..$21
incbin "lvl/settings/185_Set.bin":$20..$21
incbin "lvl/settings/186_Set.bin":$20..$21
incbin "lvl/settings/187_Set.bin":$20..$21
incbin "lvl/settings/188_Set.bin":$20..$21
incbin "lvl/settings/189_Set.bin":$20..$21
incbin "lvl/settings/18A_Set.bin":$20..$21
incbin "lvl/settings/18B_Set.bin":$20..$21
incbin "lvl/settings/18C_Set.bin":$20..$21
incbin "lvl/settings/18D_Set.bin":$20..$21
incbin "lvl/settings/18E_Set.bin":$20..$21
incbin "lvl/settings/18F_Set.bin":$20..$21
incbin "lvl/settings/190_Set.bin":$20..$21
incbin "lvl/settings/191_Set.bin":$20..$21
incbin "lvl/settings/192_Set.bin":$20..$21
incbin "lvl/settings/193_Set.bin":$20..$21
incbin "lvl/settings/194_Set.bin":$20..$21
incbin "lvl/settings/195_Set.bin":$20..$21
incbin "lvl/settings/196_Set.bin":$20..$21
incbin "lvl/settings/197_Set.bin":$20..$21
incbin "lvl/settings/198_Set.bin":$20..$21
incbin "lvl/settings/199_Set.bin":$20..$21
incbin "lvl/settings/19A_Set.bin":$20..$21
incbin "lvl/settings/19B_Set.bin":$20..$21
incbin "lvl/settings/19C_Set.bin":$20..$21
incbin "lvl/settings/19D_Set.bin":$20..$21
incbin "lvl/settings/19E_Set.bin":$20..$21
incbin "lvl/settings/19F_Set.bin":$20..$21
incbin "lvl/settings/1A0_Set.bin":$20..$21
incbin "lvl/settings/1A1_Set.bin":$20..$21
incbin "lvl/settings/1A2_Set.bin":$20..$21
incbin "lvl/settings/1A3_Set.bin":$20..$21
incbin "lvl/settings/1A4_Set.bin":$20..$21
incbin "lvl/settings/1A5_Set.bin":$20..$21
incbin "lvl/settings/1A6_Set.bin":$20..$21
incbin "lvl/settings/1A7_Set.bin":$20..$21
incbin "lvl/settings/1A8_Set.bin":$20..$21
incbin "lvl/settings/1A9_Set.bin":$20..$21
incbin "lvl/settings/1AA_Set.bin":$20..$21
incbin "lvl/settings/1AB_Set.bin":$20..$21
incbin "lvl/settings/1AC_Set.bin":$20..$21
incbin "lvl/settings/1AD_Set.bin":$20..$21
incbin "lvl/settings/1AE_Set.bin":$20..$21
incbin "lvl/settings/1AF_Set.bin":$20..$21
incbin "lvl/settings/1B0_Set.bin":$20..$21
incbin "lvl/settings/1B1_Set.bin":$20..$21
incbin "lvl/settings/1B2_Set.bin":$20..$21
incbin "lvl/settings/1B3_Set.bin":$20..$21
incbin "lvl/settings/1B4_Set.bin":$20..$21
incbin "lvl/settings/1B5_Set.bin":$20..$21
incbin "lvl/settings/1B6_Set.bin":$20..$21
incbin "lvl/settings/1B7_Set.bin":$20..$21
incbin "lvl/settings/1B8_Set.bin":$20..$21
incbin "lvl/settings/1B9_Set.bin":$20..$21
incbin "lvl/settings/1BA_Set.bin":$20..$21
incbin "lvl/settings/1BB_Set.bin":$20..$21
incbin "lvl/settings/1BC_Set.bin":$20..$21
incbin "lvl/settings/1BD_Set.bin":$20..$21
incbin "lvl/settings/1BE_Set.bin":$20..$21
incbin "lvl/settings/1BF_Set.bin":$20..$21
incbin "lvl/settings/1C0_Set.bin":$20..$21
incbin "lvl/settings/1C1_Set.bin":$20..$21
incbin "lvl/settings/1C2_Set.bin":$20..$21
incbin "lvl/settings/1C3_Set.bin":$20..$21
incbin "lvl/settings/1C4_Set.bin":$20..$21
incbin "lvl/settings/1C5_Set.bin":$20..$21
incbin "lvl/settings/1C6_Set.bin":$20..$21
incbin "lvl/settings/1C7_Set.bin":$20..$21
incbin "lvl/settings/1C8_Set.bin":$20..$21
incbin "lvl/settings/1C9_Set.bin":$20..$21
incbin "lvl/settings/1CA_Set.bin":$20..$21
incbin "lvl/settings/1CB_Set.bin":$20..$21
incbin "lvl/settings/1CC_Set.bin":$20..$21
incbin "lvl/settings/1CD_Set.bin":$20..$21
incbin "lvl/settings/1CE_Set.bin":$20..$21
incbin "lvl/settings/1CF_Set.bin":$20..$21
incbin "lvl/settings/1D0_Set.bin":$20..$21
incbin "lvl/settings/1D1_Set.bin":$20..$21
incbin "lvl/settings/1D2_Set.bin":$20..$21
incbin "lvl/settings/1D3_Set.bin":$20..$21
incbin "lvl/settings/1D4_Set.bin":$20..$21
incbin "lvl/settings/1D5_Set.bin":$20..$21
incbin "lvl/settings/1D6_Set.bin":$20..$21
incbin "lvl/settings/1D7_Set.bin":$20..$21
incbin "lvl/settings/1D8_Set.bin":$20..$21
incbin "lvl/settings/1D9_Set.bin":$20..$21
incbin "lvl/settings/1DA_Set.bin":$20..$21
incbin "lvl/settings/1DB_Set.bin":$20..$21
incbin "lvl/settings/1DC_Set.bin":$20..$21
incbin "lvl/settings/1DD_Set.bin":$20..$21
incbin "lvl/settings/1DE_Set.bin":$20..$21
incbin "lvl/settings/1DF_Set.bin":$20..$21
incbin "lvl/settings/1E0_Set.bin":$20..$21
incbin "lvl/settings/1E1_Set.bin":$20..$21
incbin "lvl/settings/1E2_Set.bin":$20..$21
incbin "lvl/settings/1E3_Set.bin":$20..$21
incbin "lvl/settings/1E4_Set.bin":$20..$21
incbin "lvl/settings/1E5_Set.bin":$20..$21
incbin "lvl/settings/1E6_Set.bin":$20..$21
incbin "lvl/settings/1E7_Set.bin":$20..$21
incbin "lvl/settings/1E8_Set.bin":$20..$21
incbin "lvl/settings/1E9_Set.bin":$20..$21
incbin "lvl/settings/1EA_Set.bin":$20..$21
incbin "lvl/settings/1EB_Set.bin":$20..$21
incbin "lvl/settings/1EC_Set.bin":$20..$21
incbin "lvl/settings/1ED_Set.bin":$20..$21
incbin "lvl/settings/1EE_Set.bin":$20..$21
incbin "lvl/settings/1EF_Set.bin":$20..$21
incbin "lvl/settings/1F0_Set.bin":$20..$21
incbin "lvl/settings/1F1_Set.bin":$20..$21
incbin "lvl/settings/1F2_Set.bin":$20..$21
incbin "lvl/settings/1F3_Set.bin":$20..$21
incbin "lvl/settings/1F4_Set.bin":$20..$21
incbin "lvl/settings/1F5_Set.bin":$20..$21
incbin "lvl/settings/1F6_Set.bin":$20..$21
incbin "lvl/settings/1F7_Set.bin":$20..$21
incbin "lvl/settings/1F8_Set.bin":$20..$21
incbin "lvl/settings/1F9_Set.bin":$20..$21
incbin "lvl/settings/1FA_Set.bin":$20..$21
incbin "lvl/settings/1FB_Set.bin":$20..$21
incbin "lvl/settings/1FC_Set.bin":$20..$21
incbin "lvl/settings/1FD_Set.bin":$20..$21
incbin "lvl/settings/1FE_Set.bin":$20..$21
incbin "lvl/settings/1FF_Set.bin":$20..$21

SuperGFXBypassTable:											; Lunar Magic table, accessed from the routine inserted at $0FF7F0
	%SuperGFXBypasssettings(000)	:	%SuperGFXBypasssettings(001)	:	%SuperGFXBypasssettings(002)	:	%SuperGFXBypasssettings(003)
	%SuperGFXBypasssettings(004)	:	%SuperGFXBypasssettings(005)	:	%SuperGFXBypasssettings(006)	:	%SuperGFXBypasssettings(007)
	%SuperGFXBypasssettings(008)	:	%SuperGFXBypasssettings(009)	:	%SuperGFXBypasssettings(00A)	:	%SuperGFXBypasssettings(00B)
	%SuperGFXBypasssettings(00C)	:	%SuperGFXBypasssettings(00D)	:	%SuperGFXBypasssettings(00E)	:	%SuperGFXBypasssettings(00F)
	%SuperGFXBypasssettings(010)	:	%SuperGFXBypasssettings(011)	:	%SuperGFXBypasssettings(012)	:	%SuperGFXBypasssettings(013)
	%SuperGFXBypasssettings(014)	:	%SuperGFXBypasssettings(015)	:	%SuperGFXBypasssettings(016)	:	%SuperGFXBypasssettings(017)
	%SuperGFXBypasssettings(018)	:	%SuperGFXBypasssettings(019)	:	%SuperGFXBypasssettings(01A)	:	%SuperGFXBypasssettings(01B)
	%SuperGFXBypasssettings(01C)	:	%SuperGFXBypasssettings(01D)	:	%SuperGFXBypasssettings(01E)	:	%SuperGFXBypasssettings(01F)
	%SuperGFXBypasssettings(020)	:	%SuperGFXBypasssettings(021)	:	%SuperGFXBypasssettings(022)	:	%SuperGFXBypasssettings(023)
	%SuperGFXBypasssettings(024)	:	%SuperGFXBypasssettings(025)	:	%SuperGFXBypasssettings(026)	:	%SuperGFXBypasssettings(027)
	%SuperGFXBypasssettings(028)	:	%SuperGFXBypasssettings(029)	:	%SuperGFXBypasssettings(02A)	:	%SuperGFXBypasssettings(02B)
	%SuperGFXBypasssettings(02C)	:	%SuperGFXBypasssettings(02D)	:	%SuperGFXBypasssettings(02E)	:	%SuperGFXBypasssettings(02F)
	%SuperGFXBypasssettings(030)	:	%SuperGFXBypasssettings(031)	:	%SuperGFXBypasssettings(032)	:	%SuperGFXBypasssettings(033)
	%SuperGFXBypasssettings(034)	:	%SuperGFXBypasssettings(035)	:	%SuperGFXBypasssettings(036)	:	%SuperGFXBypasssettings(037)
	%SuperGFXBypasssettings(038)	:	%SuperGFXBypasssettings(039)	:	%SuperGFXBypasssettings(03A)	:	%SuperGFXBypasssettings(03B)
	%SuperGFXBypasssettings(03C)	:	%SuperGFXBypasssettings(03D)	:	%SuperGFXBypasssettings(03E)	:	%SuperGFXBypasssettings(03F)
	%SuperGFXBypasssettings(040)	:	%SuperGFXBypasssettings(041)	:	%SuperGFXBypasssettings(042)	:	%SuperGFXBypasssettings(043)
	%SuperGFXBypasssettings(044)	:	%SuperGFXBypasssettings(045)	:	%SuperGFXBypasssettings(046)	:	%SuperGFXBypasssettings(047)
	%SuperGFXBypasssettings(048)	:	%SuperGFXBypasssettings(049)	:	%SuperGFXBypasssettings(04A)	:	%SuperGFXBypasssettings(04B)
	%SuperGFXBypasssettings(04C)	:	%SuperGFXBypasssettings(04D)	:	%SuperGFXBypasssettings(04E)	:	%SuperGFXBypasssettings(04F)
	%SuperGFXBypasssettings(050)	:	%SuperGFXBypasssettings(051)	:	%SuperGFXBypasssettings(052)	:	%SuperGFXBypasssettings(053)
	%SuperGFXBypasssettings(054)	:	%SuperGFXBypasssettings(055)	:	%SuperGFXBypasssettings(056)	:	%SuperGFXBypasssettings(057)
	%SuperGFXBypasssettings(058)	:	%SuperGFXBypasssettings(059)	:	%SuperGFXBypasssettings(05A)	:	%SuperGFXBypasssettings(05B)
	%SuperGFXBypasssettings(05C)	:	%SuperGFXBypasssettings(05D)	:	%SuperGFXBypasssettings(05E)	:	%SuperGFXBypasssettings(05F)
	%SuperGFXBypasssettings(060)	:	%SuperGFXBypasssettings(061)	:	%SuperGFXBypasssettings(062)	:	%SuperGFXBypasssettings(063)
	%SuperGFXBypasssettings(064)	:	%SuperGFXBypasssettings(065)	:	%SuperGFXBypasssettings(066)	:	%SuperGFXBypasssettings(067)
	%SuperGFXBypasssettings(068)	:	%SuperGFXBypasssettings(069)	:	%SuperGFXBypasssettings(06A)	:	%SuperGFXBypasssettings(06B)
	%SuperGFXBypasssettings(06C)	:	%SuperGFXBypasssettings(06D)	:	%SuperGFXBypasssettings(06E)	:	%SuperGFXBypasssettings(06F)
	%SuperGFXBypasssettings(070)	:	%SuperGFXBypasssettings(071)	:	%SuperGFXBypasssettings(072)	:	%SuperGFXBypasssettings(073)
	%SuperGFXBypasssettings(074)	:	%SuperGFXBypasssettings(075)	:	%SuperGFXBypasssettings(076)	:	%SuperGFXBypasssettings(077)
	%SuperGFXBypasssettings(078)	:	%SuperGFXBypasssettings(079)	:	%SuperGFXBypasssettings(07A)	:	%SuperGFXBypasssettings(07B)
	%SuperGFXBypasssettings(07C)	:	%SuperGFXBypasssettings(07D)	:	%SuperGFXBypasssettings(07E)	:	%SuperGFXBypasssettings(07F)
	%SuperGFXBypasssettings(080)	:	%SuperGFXBypasssettings(081)	:	%SuperGFXBypasssettings(082)	:	%SuperGFXBypasssettings(083)
	%SuperGFXBypasssettings(084)	:	%SuperGFXBypasssettings(085)	:	%SuperGFXBypasssettings(086)	:	%SuperGFXBypasssettings(087)
	%SuperGFXBypasssettings(088)	:	%SuperGFXBypasssettings(089)	:	%SuperGFXBypasssettings(08A)	:	%SuperGFXBypasssettings(08B)
	%SuperGFXBypasssettings(08C)	:	%SuperGFXBypasssettings(08D)	:	%SuperGFXBypasssettings(08E)	:	%SuperGFXBypasssettings(08F)
	%SuperGFXBypasssettings(090)	:	%SuperGFXBypasssettings(091)	:	%SuperGFXBypasssettings(092)	:	%SuperGFXBypasssettings(093)
	%SuperGFXBypasssettings(094)	:	%SuperGFXBypasssettings(095)	:	%SuperGFXBypasssettings(096)	:	%SuperGFXBypasssettings(097)
	%SuperGFXBypasssettings(098)	:	%SuperGFXBypasssettings(099)	:	%SuperGFXBypasssettings(09A)	:	%SuperGFXBypasssettings(09B)
	%SuperGFXBypasssettings(09C)	:	%SuperGFXBypasssettings(09D)	:	%SuperGFXBypasssettings(09E)	:	%SuperGFXBypasssettings(09F)
	%SuperGFXBypasssettings(0A0)	:	%SuperGFXBypasssettings(0A1)	:	%SuperGFXBypasssettings(0A2)	:	%SuperGFXBypasssettings(0A3)
	%SuperGFXBypasssettings(0A4)	:	%SuperGFXBypasssettings(0A5)	:	%SuperGFXBypasssettings(0A6)	:	%SuperGFXBypasssettings(0A7)
	%SuperGFXBypasssettings(0A8)	:	%SuperGFXBypasssettings(0A9)	:	%SuperGFXBypasssettings(0AA)	:	%SuperGFXBypasssettings(0AB)
	%SuperGFXBypasssettings(0AC)	:	%SuperGFXBypasssettings(0AD)	:	%SuperGFXBypasssettings(0AE)	:	%SuperGFXBypasssettings(0AF)
	%SuperGFXBypasssettings(0B0)	:	%SuperGFXBypasssettings(0B1)	:	%SuperGFXBypasssettings(0B2)	:	%SuperGFXBypasssettings(0B3)
	%SuperGFXBypasssettings(0B4)	:	%SuperGFXBypasssettings(0B5)	:	%SuperGFXBypasssettings(0B6)	:	%SuperGFXBypasssettings(0B7)
	%SuperGFXBypasssettings(0B8)	:	%SuperGFXBypasssettings(0B9)	:	%SuperGFXBypasssettings(0BA)	:	%SuperGFXBypasssettings(0BB)
	%SuperGFXBypasssettings(0BC)	:	%SuperGFXBypasssettings(0BD)	:	%SuperGFXBypasssettings(0BE)	:	%SuperGFXBypasssettings(0BF)
	%SuperGFXBypasssettings(0C0)	:	%SuperGFXBypasssettings(0C1)	:	%SuperGFXBypasssettings(0C2)	:	%SuperGFXBypasssettings(0C3)
	%SuperGFXBypasssettings(0C4)	:	%SuperGFXBypasssettings(0C5)	:	%SuperGFXBypasssettings(0C6)	:	%SuperGFXBypasssettings(0C7)
	%SuperGFXBypasssettings(0C8)	:	%SuperGFXBypasssettings(0C9)	:	%SuperGFXBypasssettings(0CA)	:	%SuperGFXBypasssettings(0CB)
	%SuperGFXBypasssettings(0CC)	:	%SuperGFXBypasssettings(0CD)	:	%SuperGFXBypasssettings(0CE)	:	%SuperGFXBypasssettings(0CF)
	%SuperGFXBypasssettings(0D0)	:	%SuperGFXBypasssettings(0D1)	:	%SuperGFXBypasssettings(0D2)	:	%SuperGFXBypasssettings(0D3)
	%SuperGFXBypasssettings(0D4)	:	%SuperGFXBypasssettings(0D5)	:	%SuperGFXBypasssettings(0D6)	:	%SuperGFXBypasssettings(0D7)
	%SuperGFXBypasssettings(0D8)	:	%SuperGFXBypasssettings(0D9)	:	%SuperGFXBypasssettings(0DA)	:	%SuperGFXBypasssettings(0DB)
	%SuperGFXBypasssettings(0DC)	:	%SuperGFXBypasssettings(0DD)	:	%SuperGFXBypasssettings(0DE)	:	%SuperGFXBypasssettings(0DF)
	%SuperGFXBypasssettings(0E0)	:	%SuperGFXBypasssettings(0E1)	:	%SuperGFXBypasssettings(0E2)	:	%SuperGFXBypasssettings(0E3)
	%SuperGFXBypasssettings(0E4)	:	%SuperGFXBypasssettings(0E5)	:	%SuperGFXBypasssettings(0E6)	:	%SuperGFXBypasssettings(0E7)
	%SuperGFXBypasssettings(0E8)	:	%SuperGFXBypasssettings(0E9)	:	%SuperGFXBypasssettings(0EA)	:	%SuperGFXBypasssettings(0EB)
	%SuperGFXBypasssettings(0EC)	:	%SuperGFXBypasssettings(0ED)	:	%SuperGFXBypasssettings(0EE)	:	%SuperGFXBypasssettings(0EF)
	%SuperGFXBypasssettings(0F0)	:	%SuperGFXBypasssettings(0F1)	:	%SuperGFXBypasssettings(0F2)	:	%SuperGFXBypasssettings(0F3)
	%SuperGFXBypasssettings(0F4)	:	%SuperGFXBypasssettings(0F5)	:	%SuperGFXBypasssettings(0F6)	:	%SuperGFXBypasssettings(0F7)
	%SuperGFXBypasssettings(0F8)	:	%SuperGFXBypasssettings(0F9)	:	%SuperGFXBypasssettings(0FA)	:	%SuperGFXBypasssettings(0FB)
	%SuperGFXBypasssettings(0FC)	:	%SuperGFXBypasssettings(0FD)	:	%SuperGFXBypasssettings(0FE)	:	%SuperGFXBypasssettings(0FF)
	%SuperGFXBypasssettings(100)	:	%SuperGFXBypasssettings(101)	:	%SuperGFXBypasssettings(102)	:	%SuperGFXBypasssettings(103)
	%SuperGFXBypasssettings(104)	:	%SuperGFXBypasssettings(105)	:	%SuperGFXBypasssettings(106)	:	%SuperGFXBypasssettings(107)
	%SuperGFXBypasssettings(108)	:	%SuperGFXBypasssettings(109)	:	%SuperGFXBypasssettings(10A)	:	%SuperGFXBypasssettings(10B)
	%SuperGFXBypasssettings(10C)	:	%SuperGFXBypasssettings(10D)	:	%SuperGFXBypasssettings(10E)	:	%SuperGFXBypasssettings(10F)
	%SuperGFXBypasssettings(110)	:	%SuperGFXBypasssettings(111)	:	%SuperGFXBypasssettings(112)	:	%SuperGFXBypasssettings(113)
	%SuperGFXBypasssettings(114)	:	%SuperGFXBypasssettings(115)	:	%SuperGFXBypasssettings(116)	:	%SuperGFXBypasssettings(117)
	%SuperGFXBypasssettings(118)	:	%SuperGFXBypasssettings(119)	:	%SuperGFXBypasssettings(11A)	:	%SuperGFXBypasssettings(11B)
	%SuperGFXBypasssettings(11C)	:	%SuperGFXBypasssettings(11D)	:	%SuperGFXBypasssettings(11E)	:	%SuperGFXBypasssettings(11F)
	%SuperGFXBypasssettings(120)	:	%SuperGFXBypasssettings(121)	:	%SuperGFXBypasssettings(122)	:	%SuperGFXBypasssettings(123)
	%SuperGFXBypasssettings(124)	:	%SuperGFXBypasssettings(125)	:	%SuperGFXBypasssettings(126)	:	%SuperGFXBypasssettings(127)
	%SuperGFXBypasssettings(128)	:	%SuperGFXBypasssettings(129)	:	%SuperGFXBypasssettings(12A)	:	%SuperGFXBypasssettings(12B)
	%SuperGFXBypasssettings(12C)	:	%SuperGFXBypasssettings(12D)	:	%SuperGFXBypasssettings(12E)	:	%SuperGFXBypasssettings(12F)
	%SuperGFXBypasssettings(130)	:	%SuperGFXBypasssettings(131)	:	%SuperGFXBypasssettings(132)	:	%SuperGFXBypasssettings(133)
	%SuperGFXBypasssettings(134)	:	%SuperGFXBypasssettings(135)	:	%SuperGFXBypasssettings(136)	:	%SuperGFXBypasssettings(137)
	%SuperGFXBypasssettings(138)	:	%SuperGFXBypasssettings(139)	:	%SuperGFXBypasssettings(13A)	:	%SuperGFXBypasssettings(13B)
	%SuperGFXBypasssettings(13C)	:	%SuperGFXBypasssettings(13D)	:	%SuperGFXBypasssettings(13E)	:	%SuperGFXBypasssettings(13F)
	%SuperGFXBypasssettings(140)	:	%SuperGFXBypasssettings(141)	:	%SuperGFXBypasssettings(142)	:	%SuperGFXBypasssettings(143)
	%SuperGFXBypasssettings(144)	:	%SuperGFXBypasssettings(145)	:	%SuperGFXBypasssettings(146)	:	%SuperGFXBypasssettings(147)
	%SuperGFXBypasssettings(148)	:	%SuperGFXBypasssettings(149)	:	%SuperGFXBypasssettings(14A)	:	%SuperGFXBypasssettings(14B)
	%SuperGFXBypasssettings(14C)	:	%SuperGFXBypasssettings(14D)	:	%SuperGFXBypasssettings(14E)	:	%SuperGFXBypasssettings(14F)
	%SuperGFXBypasssettings(150)	:	%SuperGFXBypasssettings(151)	:	%SuperGFXBypasssettings(152)	:	%SuperGFXBypasssettings(153)
	%SuperGFXBypasssettings(154)	:	%SuperGFXBypasssettings(155)	:	%SuperGFXBypasssettings(156)	:	%SuperGFXBypasssettings(157)
	%SuperGFXBypasssettings(158)	:	%SuperGFXBypasssettings(159)	:	%SuperGFXBypasssettings(15A)	:	%SuperGFXBypasssettings(15B)
	%SuperGFXBypasssettings(15C)	:	%SuperGFXBypasssettings(15D)	:	%SuperGFXBypasssettings(15E)	:	%SuperGFXBypasssettings(15F)
	%SuperGFXBypasssettings(160)	:	%SuperGFXBypasssettings(161)	:	%SuperGFXBypasssettings(162)	:	%SuperGFXBypasssettings(163)
	%SuperGFXBypasssettings(164)	:	%SuperGFXBypasssettings(165)	:	%SuperGFXBypasssettings(166)	:	%SuperGFXBypasssettings(167)
	%SuperGFXBypasssettings(168)	:	%SuperGFXBypasssettings(169)	:	%SuperGFXBypasssettings(16A)	:	%SuperGFXBypasssettings(16B)
	%SuperGFXBypasssettings(16C)	:	%SuperGFXBypasssettings(16D)	:	%SuperGFXBypasssettings(16E)	:	%SuperGFXBypasssettings(16F)
	%SuperGFXBypasssettings(170)	:	%SuperGFXBypasssettings(171)	:	%SuperGFXBypasssettings(172)	:	%SuperGFXBypasssettings(173)
	%SuperGFXBypasssettings(174)	:	%SuperGFXBypasssettings(175)	:	%SuperGFXBypasssettings(176)	:	%SuperGFXBypasssettings(177)
	%SuperGFXBypasssettings(178)	:	%SuperGFXBypasssettings(179)	:	%SuperGFXBypasssettings(17A)	:	%SuperGFXBypasssettings(17B)
	%SuperGFXBypasssettings(17C)	:	%SuperGFXBypasssettings(17D)	:	%SuperGFXBypasssettings(17E)	:	%SuperGFXBypasssettings(17F)
	%SuperGFXBypasssettings(180)	:	%SuperGFXBypasssettings(181)	:	%SuperGFXBypasssettings(182)	:	%SuperGFXBypasssettings(183)
	%SuperGFXBypasssettings(184)	:	%SuperGFXBypasssettings(185)	:	%SuperGFXBypasssettings(186)	:	%SuperGFXBypasssettings(187)
	%SuperGFXBypasssettings(188)	:	%SuperGFXBypasssettings(189)	:	%SuperGFXBypasssettings(18A)	:	%SuperGFXBypasssettings(18B)
	%SuperGFXBypasssettings(18C)	:	%SuperGFXBypasssettings(18D)	:	%SuperGFXBypasssettings(18E)	:	%SuperGFXBypasssettings(18F)
	%SuperGFXBypasssettings(190)	:	%SuperGFXBypasssettings(191)	:	%SuperGFXBypasssettings(192)	:	%SuperGFXBypasssettings(193)
	%SuperGFXBypasssettings(194)	:	%SuperGFXBypasssettings(195)	:	%SuperGFXBypasssettings(196)	:	%SuperGFXBypasssettings(197)
	%SuperGFXBypasssettings(198)	:	%SuperGFXBypasssettings(199)	:	%SuperGFXBypasssettings(19A)	:	%SuperGFXBypasssettings(19B)
	%SuperGFXBypasssettings(19C)	:	%SuperGFXBypasssettings(19D)	:	%SuperGFXBypasssettings(19E)	:	%SuperGFXBypasssettings(19F)
	%SuperGFXBypasssettings(1A0)	:	%SuperGFXBypasssettings(1A1)	:	%SuperGFXBypasssettings(1A2)	:	%SuperGFXBypasssettings(1A3)
	%SuperGFXBypasssettings(1A4)	:	%SuperGFXBypasssettings(1A5)	:	%SuperGFXBypasssettings(1A6)	:	%SuperGFXBypasssettings(1A7)
	%SuperGFXBypasssettings(1A8)	:	%SuperGFXBypasssettings(1A9)	:	%SuperGFXBypasssettings(1AA)	:	%SuperGFXBypasssettings(1AB)
	%SuperGFXBypasssettings(1AC)	:	%SuperGFXBypasssettings(1AD)	:	%SuperGFXBypasssettings(1AE)	:	%SuperGFXBypasssettings(1AF)
	%SuperGFXBypasssettings(1B0)	:	%SuperGFXBypasssettings(1B1)	:	%SuperGFXBypasssettings(1B2)	:	%SuperGFXBypasssettings(1B3)
	%SuperGFXBypasssettings(1B4)	:	%SuperGFXBypasssettings(1B5)	:	%SuperGFXBypasssettings(1B6)	:	%SuperGFXBypasssettings(1B7)
	%SuperGFXBypasssettings(1B8)	:	%SuperGFXBypasssettings(1B9)	:	%SuperGFXBypasssettings(1BA)	:	%SuperGFXBypasssettings(1BB)
	%SuperGFXBypasssettings(1BC)	:	%SuperGFXBypasssettings(1BD)	:	%SuperGFXBypasssettings(1BE)	:	%SuperGFXBypasssettings(1BF)
	%SuperGFXBypasssettings(1C0)	:	%SuperGFXBypasssettings(1C1)	:	%SuperGFXBypasssettings(1C2)	:	%SuperGFXBypasssettings(1C3)
	%SuperGFXBypasssettings(1C4)	:	%SuperGFXBypasssettings(1C5)	:	%SuperGFXBypasssettings(1C6)	:	%SuperGFXBypasssettings(1C7)
	%SuperGFXBypasssettings(1C8)	:	%SuperGFXBypasssettings(1C9)	:	%SuperGFXBypasssettings(1CA)	:	%SuperGFXBypasssettings(1CB)
	%SuperGFXBypasssettings(1CC)	:	%SuperGFXBypasssettings(1CD)	:	%SuperGFXBypasssettings(1CE)	:	%SuperGFXBypasssettings(1CF)
	%SuperGFXBypasssettings(1D0)	:	%SuperGFXBypasssettings(1D1)	:	%SuperGFXBypasssettings(1D2)	:	%SuperGFXBypasssettings(1D3)
	%SuperGFXBypasssettings(1D4)	:	%SuperGFXBypasssettings(1D5)	:	%SuperGFXBypasssettings(1D6)	:	%SuperGFXBypasssettings(1D7)
	%SuperGFXBypasssettings(1D8)	:	%SuperGFXBypasssettings(1D9)	:	%SuperGFXBypasssettings(1DA)	:	%SuperGFXBypasssettings(1DB)
	%SuperGFXBypasssettings(1DC)	:	%SuperGFXBypasssettings(1DD)	:	%SuperGFXBypasssettings(1DE)	:	%SuperGFXBypasssettings(1DF)
	%SuperGFXBypasssettings(1E0)	:	%SuperGFXBypasssettings(1E1)	:	%SuperGFXBypasssettings(1E2)	:	%SuperGFXBypasssettings(1E3)
	%SuperGFXBypasssettings(1E4)	:	%SuperGFXBypasssettings(1E5)	:	%SuperGFXBypasssettings(1E6)	:	%SuperGFXBypasssettings(1E7)
	%SuperGFXBypasssettings(1E8)	:	%SuperGFXBypasssettings(1E9)	:	%SuperGFXBypasssettings(1EA)	:	%SuperGFXBypasssettings(1EB)
	%SuperGFXBypasssettings(1EC)	:	%SuperGFXBypasssettings(1ED)	:	%SuperGFXBypasssettings(1EE)	:	%SuperGFXBypasssettings(1EF)
	%SuperGFXBypasssettings(1F0)	:	%SuperGFXBypasssettings(1F1)	:	%SuperGFXBypasssettings(1F2)	:	%SuperGFXBypasssettings(1F3)
	%SuperGFXBypasssettings(1F4)	:	%SuperGFXBypasssettings(1F5)	:	%SuperGFXBypasssettings(1F6)	:	%SuperGFXBypasssettings(1F7)
	%SuperGFXBypasssettings(1F8)	:	%SuperGFXBypasssettings(1F9)	:	%SuperGFXBypasssettings(1FA)	:	%SuperGFXBypasssettings(1FB)
	%SuperGFXBypasssettings(1FC)	:	%SuperGFXBypasssettings(1FD)	:	%SuperGFXBypasssettings(1FE)	:	%SuperGFXBypasssettings(1FF)

.Overworld:
	db $7F,$00,$7F,$00,$7F,$00,$7F,$00,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$7F,$00,$2B,$00,$2A,$00,$29,$00,$28,$00
	db $7F,$00,$7F,$00,$7F,$00,$7F,$00,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$7F,$00,$2B,$00,$2A,$00,$29,$00,$28,$00
	db $7F,$00,$7F,$00,$7F,$00,$7F,$00,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$7F,$00,$2B,$00,$2A,$00,$29,$00,$28,$00
	db $7F,$00,$7F,$00,$7F,$00,$7F,$00,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$7F,$00,$2B,$00,$2A,$00,$29,$00,$28,$00
	db $7F,$00,$7F,$00,$7F,$00,$7F,$00,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$7F,$00,$2B,$00,$2A,$00,$29,$00,$28,$00
	db $7F,$00,$7F,$00,$7F,$00,$7F,$00,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$7F,$00,$2B,$00,$2A,$00,$29,$00,$28,$00
	db $7F,$00,$7F,$00,$7F,$00,$7F,$00,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$7F,$00,$2B,$00,$2A,$00,$29,$00,$28,$00

.Unknown:
	db $7F,$00,$7F,$00,$7F,$00,$7F,$00,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$7F,$00,$2B,$00,$2A,$00,$29,$00,$28,$00

DATA_1087EC:							; Lunar Magic Table (512 byte table at the start of the main ExLevels hack, accessed from hijack at $05DA8A, and many other locations)
incbin "lvl/settings/000_Set.bin":$2D..$2E
incbin "lvl/settings/001_Set.bin":$2D..$2E
incbin "lvl/settings/002_Set.bin":$2D..$2E
incbin "lvl/settings/003_Set.bin":$2D..$2E
incbin "lvl/settings/004_Set.bin":$2D..$2E
incbin "lvl/settings/005_Set.bin":$2D..$2E
incbin "lvl/settings/006_Set.bin":$2D..$2E
incbin "lvl/settings/007_Set.bin":$2D..$2E
incbin "lvl/settings/008_Set.bin":$2D..$2E
incbin "lvl/settings/009_Set.bin":$2D..$2E
incbin "lvl/settings/00A_Set.bin":$2D..$2E
incbin "lvl/settings/00B_Set.bin":$2D..$2E
incbin "lvl/settings/00C_Set.bin":$2D..$2E
incbin "lvl/settings/00D_Set.bin":$2D..$2E
incbin "lvl/settings/00E_Set.bin":$2D..$2E
incbin "lvl/settings/00F_Set.bin":$2D..$2E
incbin "lvl/settings/010_Set.bin":$2D..$2E
incbin "lvl/settings/011_Set.bin":$2D..$2E
incbin "lvl/settings/012_Set.bin":$2D..$2E
incbin "lvl/settings/013_Set.bin":$2D..$2E
incbin "lvl/settings/014_Set.bin":$2D..$2E
incbin "lvl/settings/015_Set.bin":$2D..$2E
incbin "lvl/settings/016_Set.bin":$2D..$2E
incbin "lvl/settings/017_Set.bin":$2D..$2E
incbin "lvl/settings/018_Set.bin":$2D..$2E
incbin "lvl/settings/019_Set.bin":$2D..$2E
incbin "lvl/settings/01A_Set.bin":$2D..$2E
incbin "lvl/settings/01B_Set.bin":$2D..$2E
incbin "lvl/settings/01C_Set.bin":$2D..$2E
incbin "lvl/settings/01D_Set.bin":$2D..$2E
incbin "lvl/settings/01E_Set.bin":$2D..$2E
incbin "lvl/settings/01F_Set.bin":$2D..$2E
incbin "lvl/settings/020_Set.bin":$2D..$2E
incbin "lvl/settings/021_Set.bin":$2D..$2E
incbin "lvl/settings/022_Set.bin":$2D..$2E
incbin "lvl/settings/023_Set.bin":$2D..$2E
incbin "lvl/settings/024_Set.bin":$2D..$2E
incbin "lvl/settings/025_Set.bin":$2D..$2E
incbin "lvl/settings/026_Set.bin":$2D..$2E
incbin "lvl/settings/027_Set.bin":$2D..$2E
incbin "lvl/settings/028_Set.bin":$2D..$2E
incbin "lvl/settings/029_Set.bin":$2D..$2E
incbin "lvl/settings/02A_Set.bin":$2D..$2E
incbin "lvl/settings/02B_Set.bin":$2D..$2E
incbin "lvl/settings/02C_Set.bin":$2D..$2E
incbin "lvl/settings/02D_Set.bin":$2D..$2E
incbin "lvl/settings/02E_Set.bin":$2D..$2E
incbin "lvl/settings/02F_Set.bin":$2D..$2E
incbin "lvl/settings/030_Set.bin":$2D..$2E
incbin "lvl/settings/031_Set.bin":$2D..$2E
incbin "lvl/settings/032_Set.bin":$2D..$2E
incbin "lvl/settings/033_Set.bin":$2D..$2E
incbin "lvl/settings/034_Set.bin":$2D..$2E
incbin "lvl/settings/035_Set.bin":$2D..$2E
incbin "lvl/settings/036_Set.bin":$2D..$2E
incbin "lvl/settings/037_Set.bin":$2D..$2E
incbin "lvl/settings/038_Set.bin":$2D..$2E
incbin "lvl/settings/039_Set.bin":$2D..$2E
incbin "lvl/settings/03A_Set.bin":$2D..$2E
incbin "lvl/settings/03B_Set.bin":$2D..$2E
incbin "lvl/settings/03C_Set.bin":$2D..$2E
incbin "lvl/settings/03D_Set.bin":$2D..$2E
incbin "lvl/settings/03E_Set.bin":$2D..$2E
incbin "lvl/settings/03F_Set.bin":$2D..$2E
incbin "lvl/settings/040_Set.bin":$2D..$2E
incbin "lvl/settings/041_Set.bin":$2D..$2E
incbin "lvl/settings/042_Set.bin":$2D..$2E
incbin "lvl/settings/043_Set.bin":$2D..$2E
incbin "lvl/settings/044_Set.bin":$2D..$2E
incbin "lvl/settings/045_Set.bin":$2D..$2E
incbin "lvl/settings/046_Set.bin":$2D..$2E
incbin "lvl/settings/047_Set.bin":$2D..$2E
incbin "lvl/settings/048_Set.bin":$2D..$2E
incbin "lvl/settings/049_Set.bin":$2D..$2E
incbin "lvl/settings/04A_Set.bin":$2D..$2E
incbin "lvl/settings/04B_Set.bin":$2D..$2E
incbin "lvl/settings/04C_Set.bin":$2D..$2E
incbin "lvl/settings/04D_Set.bin":$2D..$2E
incbin "lvl/settings/04E_Set.bin":$2D..$2E
incbin "lvl/settings/04F_Set.bin":$2D..$2E
incbin "lvl/settings/050_Set.bin":$2D..$2E
incbin "lvl/settings/051_Set.bin":$2D..$2E
incbin "lvl/settings/052_Set.bin":$2D..$2E
incbin "lvl/settings/053_Set.bin":$2D..$2E
incbin "lvl/settings/054_Set.bin":$2D..$2E
incbin "lvl/settings/055_Set.bin":$2D..$2E
incbin "lvl/settings/056_Set.bin":$2D..$2E
incbin "lvl/settings/057_Set.bin":$2D..$2E
incbin "lvl/settings/058_Set.bin":$2D..$2E
incbin "lvl/settings/059_Set.bin":$2D..$2E
incbin "lvl/settings/05A_Set.bin":$2D..$2E
incbin "lvl/settings/05B_Set.bin":$2D..$2E
incbin "lvl/settings/05C_Set.bin":$2D..$2E
incbin "lvl/settings/05D_Set.bin":$2D..$2E
incbin "lvl/settings/05E_Set.bin":$2D..$2E
incbin "lvl/settings/05F_Set.bin":$2D..$2E
incbin "lvl/settings/060_Set.bin":$2D..$2E
incbin "lvl/settings/061_Set.bin":$2D..$2E
incbin "lvl/settings/062_Set.bin":$2D..$2E
incbin "lvl/settings/063_Set.bin":$2D..$2E
incbin "lvl/settings/064_Set.bin":$2D..$2E
incbin "lvl/settings/065_Set.bin":$2D..$2E
incbin "lvl/settings/066_Set.bin":$2D..$2E
incbin "lvl/settings/067_Set.bin":$2D..$2E
incbin "lvl/settings/068_Set.bin":$2D..$2E
incbin "lvl/settings/069_Set.bin":$2D..$2E
incbin "lvl/settings/06A_Set.bin":$2D..$2E
incbin "lvl/settings/06B_Set.bin":$2D..$2E
incbin "lvl/settings/06C_Set.bin":$2D..$2E
incbin "lvl/settings/06D_Set.bin":$2D..$2E
incbin "lvl/settings/06E_Set.bin":$2D..$2E
incbin "lvl/settings/06F_Set.bin":$2D..$2E
incbin "lvl/settings/070_Set.bin":$2D..$2E
incbin "lvl/settings/071_Set.bin":$2D..$2E
incbin "lvl/settings/072_Set.bin":$2D..$2E
incbin "lvl/settings/073_Set.bin":$2D..$2E
incbin "lvl/settings/074_Set.bin":$2D..$2E
incbin "lvl/settings/075_Set.bin":$2D..$2E
incbin "lvl/settings/076_Set.bin":$2D..$2E
incbin "lvl/settings/077_Set.bin":$2D..$2E
incbin "lvl/settings/078_Set.bin":$2D..$2E
incbin "lvl/settings/079_Set.bin":$2D..$2E
incbin "lvl/settings/07A_Set.bin":$2D..$2E
incbin "lvl/settings/07B_Set.bin":$2D..$2E
incbin "lvl/settings/07C_Set.bin":$2D..$2E
incbin "lvl/settings/07D_Set.bin":$2D..$2E
incbin "lvl/settings/07E_Set.bin":$2D..$2E
incbin "lvl/settings/07F_Set.bin":$2D..$2E
incbin "lvl/settings/080_Set.bin":$2D..$2E
incbin "lvl/settings/081_Set.bin":$2D..$2E
incbin "lvl/settings/082_Set.bin":$2D..$2E
incbin "lvl/settings/083_Set.bin":$2D..$2E
incbin "lvl/settings/084_Set.bin":$2D..$2E
incbin "lvl/settings/085_Set.bin":$2D..$2E
incbin "lvl/settings/086_Set.bin":$2D..$2E
incbin "lvl/settings/087_Set.bin":$2D..$2E
incbin "lvl/settings/088_Set.bin":$2D..$2E
incbin "lvl/settings/089_Set.bin":$2D..$2E
incbin "lvl/settings/08A_Set.bin":$2D..$2E
incbin "lvl/settings/08B_Set.bin":$2D..$2E
incbin "lvl/settings/08C_Set.bin":$2D..$2E
incbin "lvl/settings/08D_Set.bin":$2D..$2E
incbin "lvl/settings/08E_Set.bin":$2D..$2E
incbin "lvl/settings/08F_Set.bin":$2D..$2E
incbin "lvl/settings/090_Set.bin":$2D..$2E
incbin "lvl/settings/091_Set.bin":$2D..$2E
incbin "lvl/settings/092_Set.bin":$2D..$2E
incbin "lvl/settings/093_Set.bin":$2D..$2E
incbin "lvl/settings/094_Set.bin":$2D..$2E
incbin "lvl/settings/095_Set.bin":$2D..$2E
incbin "lvl/settings/096_Set.bin":$2D..$2E
incbin "lvl/settings/097_Set.bin":$2D..$2E
incbin "lvl/settings/098_Set.bin":$2D..$2E
incbin "lvl/settings/099_Set.bin":$2D..$2E
incbin "lvl/settings/09A_Set.bin":$2D..$2E
incbin "lvl/settings/09B_Set.bin":$2D..$2E
incbin "lvl/settings/09C_Set.bin":$2D..$2E
incbin "lvl/settings/09D_Set.bin":$2D..$2E
incbin "lvl/settings/09E_Set.bin":$2D..$2E
incbin "lvl/settings/09F_Set.bin":$2D..$2E
incbin "lvl/settings/0A0_Set.bin":$2D..$2E
incbin "lvl/settings/0A1_Set.bin":$2D..$2E
incbin "lvl/settings/0A2_Set.bin":$2D..$2E
incbin "lvl/settings/0A3_Set.bin":$2D..$2E
incbin "lvl/settings/0A4_Set.bin":$2D..$2E
incbin "lvl/settings/0A5_Set.bin":$2D..$2E
incbin "lvl/settings/0A6_Set.bin":$2D..$2E
incbin "lvl/settings/0A7_Set.bin":$2D..$2E
incbin "lvl/settings/0A8_Set.bin":$2D..$2E
incbin "lvl/settings/0A9_Set.bin":$2D..$2E
incbin "lvl/settings/0AA_Set.bin":$2D..$2E
incbin "lvl/settings/0AB_Set.bin":$2D..$2E
incbin "lvl/settings/0AC_Set.bin":$2D..$2E
incbin "lvl/settings/0AD_Set.bin":$2D..$2E
incbin "lvl/settings/0AE_Set.bin":$2D..$2E
incbin "lvl/settings/0AF_Set.bin":$2D..$2E
incbin "lvl/settings/0B0_Set.bin":$2D..$2E
incbin "lvl/settings/0B1_Set.bin":$2D..$2E
incbin "lvl/settings/0B2_Set.bin":$2D..$2E
incbin "lvl/settings/0B3_Set.bin":$2D..$2E
incbin "lvl/settings/0B4_Set.bin":$2D..$2E
incbin "lvl/settings/0B5_Set.bin":$2D..$2E
incbin "lvl/settings/0B6_Set.bin":$2D..$2E
incbin "lvl/settings/0B7_Set.bin":$2D..$2E
incbin "lvl/settings/0B8_Set.bin":$2D..$2E
incbin "lvl/settings/0B9_Set.bin":$2D..$2E
incbin "lvl/settings/0BA_Set.bin":$2D..$2E
incbin "lvl/settings/0BB_Set.bin":$2D..$2E
incbin "lvl/settings/0BC_Set.bin":$2D..$2E
incbin "lvl/settings/0BD_Set.bin":$2D..$2E
incbin "lvl/settings/0BE_Set.bin":$2D..$2E
incbin "lvl/settings/0BF_Set.bin":$2D..$2E
incbin "lvl/settings/0C0_Set.bin":$2D..$2E
incbin "lvl/settings/0C1_Set.bin":$2D..$2E
incbin "lvl/settings/0C2_Set.bin":$2D..$2E
incbin "lvl/settings/0C3_Set.bin":$2D..$2E
incbin "lvl/settings/0C4_Set.bin":$2D..$2E
incbin "lvl/settings/0C5_Set.bin":$2D..$2E
incbin "lvl/settings/0C6_Set.bin":$2D..$2E
incbin "lvl/settings/0C7_Set.bin":$2D..$2E
incbin "lvl/settings/0C8_Set.bin":$2D..$2E
incbin "lvl/settings/0C9_Set.bin":$2D..$2E
incbin "lvl/settings/0CA_Set.bin":$2D..$2E
incbin "lvl/settings/0CB_Set.bin":$2D..$2E
incbin "lvl/settings/0CC_Set.bin":$2D..$2E
incbin "lvl/settings/0CD_Set.bin":$2D..$2E
incbin "lvl/settings/0CE_Set.bin":$2D..$2E
incbin "lvl/settings/0CF_Set.bin":$2D..$2E
incbin "lvl/settings/0D0_Set.bin":$2D..$2E
incbin "lvl/settings/0D1_Set.bin":$2D..$2E
incbin "lvl/settings/0D2_Set.bin":$2D..$2E
incbin "lvl/settings/0D3_Set.bin":$2D..$2E
incbin "lvl/settings/0D4_Set.bin":$2D..$2E
incbin "lvl/settings/0D5_Set.bin":$2D..$2E
incbin "lvl/settings/0D6_Set.bin":$2D..$2E
incbin "lvl/settings/0D7_Set.bin":$2D..$2E
incbin "lvl/settings/0D8_Set.bin":$2D..$2E
incbin "lvl/settings/0D9_Set.bin":$2D..$2E
incbin "lvl/settings/0DA_Set.bin":$2D..$2E
incbin "lvl/settings/0DB_Set.bin":$2D..$2E
incbin "lvl/settings/0DC_Set.bin":$2D..$2E
incbin "lvl/settings/0DD_Set.bin":$2D..$2E
incbin "lvl/settings/0DE_Set.bin":$2D..$2E
incbin "lvl/settings/0DF_Set.bin":$2D..$2E
incbin "lvl/settings/0E0_Set.bin":$2D..$2E
incbin "lvl/settings/0E1_Set.bin":$2D..$2E
incbin "lvl/settings/0E2_Set.bin":$2D..$2E
incbin "lvl/settings/0E3_Set.bin":$2D..$2E
incbin "lvl/settings/0E4_Set.bin":$2D..$2E
incbin "lvl/settings/0E5_Set.bin":$2D..$2E
incbin "lvl/settings/0E6_Set.bin":$2D..$2E
incbin "lvl/settings/0E7_Set.bin":$2D..$2E
incbin "lvl/settings/0E8_Set.bin":$2D..$2E
incbin "lvl/settings/0E9_Set.bin":$2D..$2E
incbin "lvl/settings/0EA_Set.bin":$2D..$2E
incbin "lvl/settings/0EB_Set.bin":$2D..$2E
incbin "lvl/settings/0EC_Set.bin":$2D..$2E
incbin "lvl/settings/0ED_Set.bin":$2D..$2E
incbin "lvl/settings/0EE_Set.bin":$2D..$2E
incbin "lvl/settings/0EF_Set.bin":$2D..$2E
incbin "lvl/settings/0F0_Set.bin":$2D..$2E
incbin "lvl/settings/0F1_Set.bin":$2D..$2E
incbin "lvl/settings/0F2_Set.bin":$2D..$2E
incbin "lvl/settings/0F3_Set.bin":$2D..$2E
incbin "lvl/settings/0F4_Set.bin":$2D..$2E
incbin "lvl/settings/0F5_Set.bin":$2D..$2E
incbin "lvl/settings/0F6_Set.bin":$2D..$2E
incbin "lvl/settings/0F7_Set.bin":$2D..$2E
incbin "lvl/settings/0F8_Set.bin":$2D..$2E
incbin "lvl/settings/0F9_Set.bin":$2D..$2E
incbin "lvl/settings/0FA_Set.bin":$2D..$2E
incbin "lvl/settings/0FB_Set.bin":$2D..$2E
incbin "lvl/settings/0FC_Set.bin":$2D..$2E
incbin "lvl/settings/0FD_Set.bin":$2D..$2E
incbin "lvl/settings/0FE_Set.bin":$2D..$2E
incbin "lvl/settings/0FF_Set.bin":$2D..$2E
incbin "lvl/settings/100_Set.bin":$2D..$2E
incbin "lvl/settings/101_Set.bin":$2D..$2E
incbin "lvl/settings/102_Set.bin":$2D..$2E
incbin "lvl/settings/103_Set.bin":$2D..$2E
incbin "lvl/settings/104_Set.bin":$2D..$2E
incbin "lvl/settings/105_Set.bin":$2D..$2E
incbin "lvl/settings/106_Set.bin":$2D..$2E
incbin "lvl/settings/107_Set.bin":$2D..$2E
incbin "lvl/settings/108_Set.bin":$2D..$2E
incbin "lvl/settings/109_Set.bin":$2D..$2E
incbin "lvl/settings/10A_Set.bin":$2D..$2E
incbin "lvl/settings/10B_Set.bin":$2D..$2E
incbin "lvl/settings/10C_Set.bin":$2D..$2E
incbin "lvl/settings/10D_Set.bin":$2D..$2E
incbin "lvl/settings/10E_Set.bin":$2D..$2E
incbin "lvl/settings/10F_Set.bin":$2D..$2E
incbin "lvl/settings/110_Set.bin":$2D..$2E
incbin "lvl/settings/111_Set.bin":$2D..$2E
incbin "lvl/settings/112_Set.bin":$2D..$2E
incbin "lvl/settings/113_Set.bin":$2D..$2E
incbin "lvl/settings/114_Set.bin":$2D..$2E
incbin "lvl/settings/115_Set.bin":$2D..$2E
incbin "lvl/settings/116_Set.bin":$2D..$2E
incbin "lvl/settings/117_Set.bin":$2D..$2E
incbin "lvl/settings/118_Set.bin":$2D..$2E
incbin "lvl/settings/119_Set.bin":$2D..$2E
incbin "lvl/settings/11A_Set.bin":$2D..$2E
incbin "lvl/settings/11B_Set.bin":$2D..$2E
incbin "lvl/settings/11C_Set.bin":$2D..$2E
incbin "lvl/settings/11D_Set.bin":$2D..$2E
incbin "lvl/settings/11E_Set.bin":$2D..$2E
incbin "lvl/settings/11F_Set.bin":$2D..$2E
incbin "lvl/settings/120_Set.bin":$2D..$2E
incbin "lvl/settings/121_Set.bin":$2D..$2E
incbin "lvl/settings/122_Set.bin":$2D..$2E
incbin "lvl/settings/123_Set.bin":$2D..$2E
incbin "lvl/settings/124_Set.bin":$2D..$2E
incbin "lvl/settings/125_Set.bin":$2D..$2E
incbin "lvl/settings/126_Set.bin":$2D..$2E
incbin "lvl/settings/127_Set.bin":$2D..$2E
incbin "lvl/settings/128_Set.bin":$2D..$2E
incbin "lvl/settings/129_Set.bin":$2D..$2E
incbin "lvl/settings/12A_Set.bin":$2D..$2E
incbin "lvl/settings/12B_Set.bin":$2D..$2E
incbin "lvl/settings/12C_Set.bin":$2D..$2E
incbin "lvl/settings/12D_Set.bin":$2D..$2E
incbin "lvl/settings/12E_Set.bin":$2D..$2E
incbin "lvl/settings/12F_Set.bin":$2D..$2E
incbin "lvl/settings/130_Set.bin":$2D..$2E
incbin "lvl/settings/131_Set.bin":$2D..$2E
incbin "lvl/settings/132_Set.bin":$2D..$2E
incbin "lvl/settings/133_Set.bin":$2D..$2E
incbin "lvl/settings/134_Set.bin":$2D..$2E
incbin "lvl/settings/135_Set.bin":$2D..$2E
incbin "lvl/settings/136_Set.bin":$2D..$2E
incbin "lvl/settings/137_Set.bin":$2D..$2E
incbin "lvl/settings/138_Set.bin":$2D..$2E
incbin "lvl/settings/139_Set.bin":$2D..$2E
incbin "lvl/settings/13A_Set.bin":$2D..$2E
incbin "lvl/settings/13B_Set.bin":$2D..$2E
incbin "lvl/settings/13C_Set.bin":$2D..$2E
incbin "lvl/settings/13D_Set.bin":$2D..$2E
incbin "lvl/settings/13E_Set.bin":$2D..$2E
incbin "lvl/settings/13F_Set.bin":$2D..$2E
incbin "lvl/settings/140_Set.bin":$2D..$2E
incbin "lvl/settings/141_Set.bin":$2D..$2E
incbin "lvl/settings/142_Set.bin":$2D..$2E
incbin "lvl/settings/143_Set.bin":$2D..$2E
incbin "lvl/settings/144_Set.bin":$2D..$2E
incbin "lvl/settings/145_Set.bin":$2D..$2E
incbin "lvl/settings/146_Set.bin":$2D..$2E
incbin "lvl/settings/147_Set.bin":$2D..$2E
incbin "lvl/settings/148_Set.bin":$2D..$2E
incbin "lvl/settings/149_Set.bin":$2D..$2E
incbin "lvl/settings/14A_Set.bin":$2D..$2E
incbin "lvl/settings/14B_Set.bin":$2D..$2E
incbin "lvl/settings/14C_Set.bin":$2D..$2E
incbin "lvl/settings/14D_Set.bin":$2D..$2E
incbin "lvl/settings/14E_Set.bin":$2D..$2E
incbin "lvl/settings/14F_Set.bin":$2D..$2E
incbin "lvl/settings/150_Set.bin":$2D..$2E
incbin "lvl/settings/151_Set.bin":$2D..$2E
incbin "lvl/settings/152_Set.bin":$2D..$2E
incbin "lvl/settings/153_Set.bin":$2D..$2E
incbin "lvl/settings/154_Set.bin":$2D..$2E
incbin "lvl/settings/155_Set.bin":$2D..$2E
incbin "lvl/settings/156_Set.bin":$2D..$2E
incbin "lvl/settings/157_Set.bin":$2D..$2E
incbin "lvl/settings/158_Set.bin":$2D..$2E
incbin "lvl/settings/159_Set.bin":$2D..$2E
incbin "lvl/settings/15A_Set.bin":$2D..$2E
incbin "lvl/settings/15B_Set.bin":$2D..$2E
incbin "lvl/settings/15C_Set.bin":$2D..$2E
incbin "lvl/settings/15D_Set.bin":$2D..$2E
incbin "lvl/settings/15E_Set.bin":$2D..$2E
incbin "lvl/settings/15F_Set.bin":$2D..$2E
incbin "lvl/settings/160_Set.bin":$2D..$2E
incbin "lvl/settings/161_Set.bin":$2D..$2E
incbin "lvl/settings/162_Set.bin":$2D..$2E
incbin "lvl/settings/163_Set.bin":$2D..$2E
incbin "lvl/settings/164_Set.bin":$2D..$2E
incbin "lvl/settings/165_Set.bin":$2D..$2E
incbin "lvl/settings/166_Set.bin":$2D..$2E
incbin "lvl/settings/167_Set.bin":$2D..$2E
incbin "lvl/settings/168_Set.bin":$2D..$2E
incbin "lvl/settings/169_Set.bin":$2D..$2E
incbin "lvl/settings/16A_Set.bin":$2D..$2E
incbin "lvl/settings/16B_Set.bin":$2D..$2E
incbin "lvl/settings/16C_Set.bin":$2D..$2E
incbin "lvl/settings/16D_Set.bin":$2D..$2E
incbin "lvl/settings/16E_Set.bin":$2D..$2E
incbin "lvl/settings/16F_Set.bin":$2D..$2E
incbin "lvl/settings/170_Set.bin":$2D..$2E
incbin "lvl/settings/171_Set.bin":$2D..$2E
incbin "lvl/settings/172_Set.bin":$2D..$2E
incbin "lvl/settings/173_Set.bin":$2D..$2E
incbin "lvl/settings/174_Set.bin":$2D..$2E
incbin "lvl/settings/175_Set.bin":$2D..$2E
incbin "lvl/settings/176_Set.bin":$2D..$2E
incbin "lvl/settings/177_Set.bin":$2D..$2E
incbin "lvl/settings/178_Set.bin":$2D..$2E
incbin "lvl/settings/179_Set.bin":$2D..$2E
incbin "lvl/settings/17A_Set.bin":$2D..$2E
incbin "lvl/settings/17B_Set.bin":$2D..$2E
incbin "lvl/settings/17C_Set.bin":$2D..$2E
incbin "lvl/settings/17D_Set.bin":$2D..$2E
incbin "lvl/settings/17E_Set.bin":$2D..$2E
incbin "lvl/settings/17F_Set.bin":$2D..$2E
incbin "lvl/settings/180_Set.bin":$2D..$2E
incbin "lvl/settings/181_Set.bin":$2D..$2E
incbin "lvl/settings/182_Set.bin":$2D..$2E
incbin "lvl/settings/183_Set.bin":$2D..$2E
incbin "lvl/settings/184_Set.bin":$2D..$2E
incbin "lvl/settings/185_Set.bin":$2D..$2E
incbin "lvl/settings/186_Set.bin":$2D..$2E
incbin "lvl/settings/187_Set.bin":$2D..$2E
incbin "lvl/settings/188_Set.bin":$2D..$2E
incbin "lvl/settings/189_Set.bin":$2D..$2E
incbin "lvl/settings/18A_Set.bin":$2D..$2E
incbin "lvl/settings/18B_Set.bin":$2D..$2E
incbin "lvl/settings/18C_Set.bin":$2D..$2E
incbin "lvl/settings/18D_Set.bin":$2D..$2E
incbin "lvl/settings/18E_Set.bin":$2D..$2E
incbin "lvl/settings/18F_Set.bin":$2D..$2E
incbin "lvl/settings/190_Set.bin":$2D..$2E
incbin "lvl/settings/191_Set.bin":$2D..$2E
incbin "lvl/settings/192_Set.bin":$2D..$2E
incbin "lvl/settings/193_Set.bin":$2D..$2E
incbin "lvl/settings/194_Set.bin":$2D..$2E
incbin "lvl/settings/195_Set.bin":$2D..$2E
incbin "lvl/settings/196_Set.bin":$2D..$2E
incbin "lvl/settings/197_Set.bin":$2D..$2E
incbin "lvl/settings/198_Set.bin":$2D..$2E
incbin "lvl/settings/199_Set.bin":$2D..$2E
incbin "lvl/settings/19A_Set.bin":$2D..$2E
incbin "lvl/settings/19B_Set.bin":$2D..$2E
incbin "lvl/settings/19C_Set.bin":$2D..$2E
incbin "lvl/settings/19D_Set.bin":$2D..$2E
incbin "lvl/settings/19E_Set.bin":$2D..$2E
incbin "lvl/settings/19F_Set.bin":$2D..$2E
incbin "lvl/settings/1A0_Set.bin":$2D..$2E
incbin "lvl/settings/1A1_Set.bin":$2D..$2E
incbin "lvl/settings/1A2_Set.bin":$2D..$2E
incbin "lvl/settings/1A3_Set.bin":$2D..$2E
incbin "lvl/settings/1A4_Set.bin":$2D..$2E
incbin "lvl/settings/1A5_Set.bin":$2D..$2E
incbin "lvl/settings/1A6_Set.bin":$2D..$2E
incbin "lvl/settings/1A7_Set.bin":$2D..$2E
incbin "lvl/settings/1A8_Set.bin":$2D..$2E
incbin "lvl/settings/1A9_Set.bin":$2D..$2E
incbin "lvl/settings/1AA_Set.bin":$2D..$2E
incbin "lvl/settings/1AB_Set.bin":$2D..$2E
incbin "lvl/settings/1AC_Set.bin":$2D..$2E
incbin "lvl/settings/1AD_Set.bin":$2D..$2E
incbin "lvl/settings/1AE_Set.bin":$2D..$2E
incbin "lvl/settings/1AF_Set.bin":$2D..$2E
incbin "lvl/settings/1B0_Set.bin":$2D..$2E
incbin "lvl/settings/1B1_Set.bin":$2D..$2E
incbin "lvl/settings/1B2_Set.bin":$2D..$2E
incbin "lvl/settings/1B3_Set.bin":$2D..$2E
incbin "lvl/settings/1B4_Set.bin":$2D..$2E
incbin "lvl/settings/1B5_Set.bin":$2D..$2E
incbin "lvl/settings/1B6_Set.bin":$2D..$2E
incbin "lvl/settings/1B7_Set.bin":$2D..$2E
incbin "lvl/settings/1B8_Set.bin":$2D..$2E
incbin "lvl/settings/1B9_Set.bin":$2D..$2E
incbin "lvl/settings/1BA_Set.bin":$2D..$2E
incbin "lvl/settings/1BB_Set.bin":$2D..$2E
incbin "lvl/settings/1BC_Set.bin":$2D..$2E
incbin "lvl/settings/1BD_Set.bin":$2D..$2E
incbin "lvl/settings/1BE_Set.bin":$2D..$2E
incbin "lvl/settings/1BF_Set.bin":$2D..$2E
incbin "lvl/settings/1C0_Set.bin":$2D..$2E
incbin "lvl/settings/1C1_Set.bin":$2D..$2E
incbin "lvl/settings/1C2_Set.bin":$2D..$2E
incbin "lvl/settings/1C3_Set.bin":$2D..$2E
incbin "lvl/settings/1C4_Set.bin":$2D..$2E
incbin "lvl/settings/1C5_Set.bin":$2D..$2E
incbin "lvl/settings/1C6_Set.bin":$2D..$2E
incbin "lvl/settings/1C7_Set.bin":$2D..$2E
incbin "lvl/settings/1C8_Set.bin":$2D..$2E
incbin "lvl/settings/1C9_Set.bin":$2D..$2E
incbin "lvl/settings/1CA_Set.bin":$2D..$2E
incbin "lvl/settings/1CB_Set.bin":$2D..$2E
incbin "lvl/settings/1CC_Set.bin":$2D..$2E
incbin "lvl/settings/1CD_Set.bin":$2D..$2E
incbin "lvl/settings/1CE_Set.bin":$2D..$2E
incbin "lvl/settings/1CF_Set.bin":$2D..$2E
incbin "lvl/settings/1D0_Set.bin":$2D..$2E
incbin "lvl/settings/1D1_Set.bin":$2D..$2E
incbin "lvl/settings/1D2_Set.bin":$2D..$2E
incbin "lvl/settings/1D3_Set.bin":$2D..$2E
incbin "lvl/settings/1D4_Set.bin":$2D..$2E
incbin "lvl/settings/1D5_Set.bin":$2D..$2E
incbin "lvl/settings/1D6_Set.bin":$2D..$2E
incbin "lvl/settings/1D7_Set.bin":$2D..$2E
incbin "lvl/settings/1D8_Set.bin":$2D..$2E
incbin "lvl/settings/1D9_Set.bin":$2D..$2E
incbin "lvl/settings/1DA_Set.bin":$2D..$2E
incbin "lvl/settings/1DB_Set.bin":$2D..$2E
incbin "lvl/settings/1DC_Set.bin":$2D..$2E
incbin "lvl/settings/1DD_Set.bin":$2D..$2E
incbin "lvl/settings/1DE_Set.bin":$2D..$2E
incbin "lvl/settings/1DF_Set.bin":$2D..$2E
incbin "lvl/settings/1E0_Set.bin":$2D..$2E
incbin "lvl/settings/1E1_Set.bin":$2D..$2E
incbin "lvl/settings/1E2_Set.bin":$2D..$2E
incbin "lvl/settings/1E3_Set.bin":$2D..$2E
incbin "lvl/settings/1E4_Set.bin":$2D..$2E
incbin "lvl/settings/1E5_Set.bin":$2D..$2E
incbin "lvl/settings/1E6_Set.bin":$2D..$2E
incbin "lvl/settings/1E7_Set.bin":$2D..$2E
incbin "lvl/settings/1E8_Set.bin":$2D..$2E
incbin "lvl/settings/1E9_Set.bin":$2D..$2E
incbin "lvl/settings/1EA_Set.bin":$2D..$2E
incbin "lvl/settings/1EB_Set.bin":$2D..$2E
incbin "lvl/settings/1EC_Set.bin":$2D..$2E
incbin "lvl/settings/1ED_Set.bin":$2D..$2E
incbin "lvl/settings/1EE_Set.bin":$2D..$2E
incbin "lvl/settings/1EF_Set.bin":$2D..$2E
incbin "lvl/settings/1F0_Set.bin":$2D..$2E
incbin "lvl/settings/1F1_Set.bin":$2D..$2E
incbin "lvl/settings/1F2_Set.bin":$2D..$2E
incbin "lvl/settings/1F3_Set.bin":$2D..$2E
incbin "lvl/settings/1F4_Set.bin":$2D..$2E
incbin "lvl/settings/1F5_Set.bin":$2D..$2E
incbin "lvl/settings/1F6_Set.bin":$2D..$2E
incbin "lvl/settings/1F7_Set.bin":$2D..$2E
incbin "lvl/settings/1F8_Set.bin":$2D..$2E
incbin "lvl/settings/1F9_Set.bin":$2D..$2E
incbin "lvl/settings/1FA_Set.bin":$2D..$2E
incbin "lvl/settings/1FB_Set.bin":$2D..$2E
incbin "lvl/settings/1FC_Set.bin":$2D..$2E
incbin "lvl/settings/1FD_Set.bin":$2D..$2E
incbin "lvl/settings/1FE_Set.bin":$2D..$2E
incbin "lvl/settings/1FF_Set.bin":$2D..$2E

DATA_1083E0:									; Lunar Magic table (referenced at the routine inserted at $05DC85)
	incbin "lvl/Misc/SMWW_ExtraSecondaryEntranceTable1_Misc.bin"

DATA_1085E6:									; Lunar Magic table (referenced at the routine inserted at $05DC8A)
	incbin "lvl/Misc/SMWW_ExtraSecondaryEntranceTable2_Misc.bin"

; Macros that insert the levels

	%INCLevel(000,000,000,000,FFF,FFF)
	%INCLevel(001,001,001,001,FFF,FFF)
	%INCLevel(002,002,002,002,FFF,FFF)
	%INCLevel(003,003,003,003,FFF,FFF)
	%INCLevel(004,004,004,004,FFF,FFF)
	%INCLevel(005,005,005,005,FFF,FFF)
	%INCLevel(006,006,006,006,FFF,FFF)
	%INCLevel(007,007,007,007,FFF,FFF)
	%INCLevel(008,008,008,008,FFF,FFF)
	%INCLevel(009,009,009,009,FFF,FFF)
	%INCLevel(00A,00A,00A,00A,FFF,FFF)
	%INCLevel(00B,00B,00B,00B,FFF,FFF)
	%INCLevel(00C,00C,00C,00C,FFF,FFF)
	%INCLevel(00D,00D,00D,00D,FFF,FFF)
	%INCLevel(00E,00E,00E,00E,FFF,FFF)
	%INCLevel(00F,00F,00F,00F,FFF,FFF)
	%INCLevel(010,010,010,010,FFF,FFF)
	%INCLevel(011,011,011,011,FFF,FFF)
	%INCLevel(012,012,012,012,FFF,FFF)
	%INCLevel(013,013,013,013,FFF,FFF)
	%INCLevel(014,014,014,014,FFF,FFF)
	%INCLevel(015,015,015,015,FFF,FFF)
	%INCLevel(016,016,016,016,FFF,FFF)
	%INCLevel(017,017,017,017,FFF,FFF)
	%INCLevel(018,018,018,018,FFF,FFF)
	%INCLevel(019,019,019,019,FFF,FFF)
	%INCLevel(01A,01A,01A,01A,FFF,FFF)
	%INCLevel(01B,01B,01B,01B,FFF,FFF)
	%INCLevel(01C,01C,01C,01C,FFF,FFF)
	%INCLevel(01D,01D,01D,01D,FFF,FFF)
	%INCLevel(01E,01E,01E,01E,FFF,FFF)
	%INCLevel(01F,01F,01F,01F,FFF,FFF)
	%INCLevel(020,020,020,020,FFF,FFF)
	%INCLevel(021,021,021,021,FFF,FFF)
	%INCLevel(022,022,022,022,FFF,FFF)
	%INCLevel(023,023,023,023,FFF,FFF)
	%INCLevel(024,024,024,024,FFF,FFF)
	%INCLevel(025,025,025,025,FFF,FFF)
	%INCLevel(026,026,026,026,FFF,FFF)
	%INCLevel(027,027,027,027,FFF,FFF)
	%INCLevel(028,028,028,028,FFF,FFF)
	%INCLevel(029,029,029,029,FFF,FFF)
	%INCLevel(02A,02A,02A,02A,FFF,FFF)
	%INCLevel(02B,02B,02B,02B,FFF,FFF)
	%INCLevel(02C,02C,02C,02C,FFF,FFF)
	%INCLevel(02D,02D,02D,02D,FFF,FFF)
	%INCLevel(02E,02E,02E,02E,FFF,FFF)
	%INCLevel(02F,02F,02F,02F,FFF,FFF)
	%INCLevel(030,030,030,030,FFF,FFF)
	%INCLevel(031,031,031,031,FFF,FFF)
	%INCLevel(032,032,032,032,FFF,FFF)
	%INCLevel(033,033,033,033,FFF,FFF)
	%INCLevel(034,034,034,034,FFF,FFF)
	%INCLevel(035,035,035,035,FFF,FFF)
	%INCLevel(036,036,036,036,FFF,FFF)
	%INCLevel(037,037,037,037,FFF,FFF)
	%INCLevel(038,038,038,038,FFF,FFF)
	%INCLevel(039,039,039,039,FFF,FFF)
	%INCLevel(03A,03A,03A,03A,FFF,FFF)
	%INCLevel(03B,03B,03B,03B,FFF,FFF)
	%INCLevel(03C,03C,03C,03C,FFF,FFF)
	%INCLevel(03D,03D,03D,03D,FFF,FFF)
	%INCLevel(03E,03E,03E,03E,FFF,FFF)
	%INCLevel(03F,03F,03F,03F,FFF,FFF)
	%INCLevel(040,040,040,040,FFF,FFF)
	%INCLevel(041,041,041,041,FFF,FFF)
	%INCLevel(042,042,042,042,FFF,FFF)
	%INCLevel(043,043,043,043,FFF,FFF)
	%INCLevel(044,044,044,044,FFF,FFF)
	%INCLevel(045,045,045,045,FFF,FFF)
	%INCLevel(046,046,046,046,FFF,FFF)
	%INCLevel(047,047,047,047,FFF,FFF)
	%INCLevel(048,048,048,048,FFF,FFF)
	%INCLevel(049,049,049,049,FFF,FFF)
	%INCLevel(04A,04A,04A,04A,FFF,FFF)
	%INCLevel(04B,04B,04B,04B,FFF,FFF)
	%INCLevel(04C,04C,04C,04C,FFF,FFF)
	%INCLevel(04D,04D,04D,04D,FFF,FFF)
	%INCLevel(04E,04E,04E,04E,FFF,FFF)
	%INCLevel(04F,04F,04F,04F,FFF,FFF)
	%INCLevel(050,050,050,050,FFF,FFF)
	%INCLevel(051,051,051,051,FFF,FFF)
	%INCLevel(052,052,052,052,FFF,FFF)
	%INCLevel(053,053,053,053,FFF,FFF)
	%INCLevel(054,054,054,054,FFF,FFF)
	%INCLevel(055,055,055,055,FFF,FFF)
	%INCLevel(056,056,056,056,FFF,FFF)
	%INCLevel(057,057,057,057,FFF,FFF)
	%INCLevel(058,058,058,058,FFF,FFF)
	%INCLevel(059,059,059,059,FFF,FFF)
	%INCLevel(05A,05A,05A,05A,FFF,FFF)
	%INCLevel(05B,05B,05B,05B,FFF,FFF)
	%INCLevel(05C,05C,05C,05C,FFF,FFF)
	%INCLevel(05D,05D,05D,05D,FFF,FFF)
	%INCLevel(05E,05E,05E,05E,FFF,FFF)
	%INCLevel(05F,05F,05F,05F,FFF,FFF)
	%INCLevel(060,060,060,060,FFF,FFF)
	%INCLevel(061,061,061,061,FFF,FFF)
	%INCLevel(062,062,062,062,FFF,FFF)
	%INCLevel(063,063,063,063,FFF,FFF)
	%INCLevel(064,064,064,064,FFF,FFF)
	%INCLevel(065,065,065,065,FFF,FFF)
	%INCLevel(066,066,066,066,FFF,FFF)
	%INCLevel(067,067,067,067,FFF,FFF)
	%INCLevel(068,068,068,068,FFF,FFF)
	%INCLevel(069,069,069,069,FFF,FFF)
	%INCLevel(06A,06A,06A,06A,FFF,FFF)
	%INCLevel(06B,06B,06B,06B,FFF,FFF)
	%INCLevel(06C,06C,06C,06C,FFF,FFF)
	%INCLevel(06D,06D,06D,06D,FFF,FFF)
	%INCLevel(06E,06E,06E,06E,FFF,FFF)
	%INCLevel(06F,06F,06F,06F,FFF,FFF)
	%INCLevel(070,070,070,070,FFF,FFF)
	%INCLevel(071,071,071,071,FFF,FFF)
	%INCLevel(072,072,072,072,FFF,FFF)
	%INCLevel(073,073,073,073,FFF,FFF)
	%INCLevel(074,074,074,074,FFF,FFF)
	%INCLevel(075,075,075,075,FFF,FFF)
	%INCLevel(076,076,076,076,FFF,FFF)
	%INCLevel(077,077,077,077,FFF,FFF)
	%INCLevel(078,078,078,078,FFF,FFF)
	%INCLevel(079,079,079,079,FFF,FFF)
	%INCLevel(07A,07A,07A,07A,FFF,FFF)
	%INCLevel(07B,07B,07B,07B,FFF,FFF)
	%INCLevel(07C,07C,07C,07C,FFF,FFF)
	%INCLevel(07D,07D,07D,07D,FFF,FFF)
	%INCLevel(07E,07E,07E,07E,FFF,FFF)
	%INCLevel(07F,07F,07F,07F,FFF,FFF)
	%INCLevel(080,080,080,080,FFF,FFF)
	%INCLevel(081,081,081,081,FFF,FFF)
	%INCLevel(082,082,082,082,FFF,FFF)
	%INCLevel(083,083,083,083,FFF,FFF)
	%INCLevel(084,084,084,084,FFF,FFF)
	%INCLevel(085,085,085,085,FFF,FFF)
	%INCLevel(086,086,086,086,FFF,FFF)
	%INCLevel(087,087,087,087,FFF,FFF)
	%INCLevel(088,088,088,088,FFF,FFF)
	%INCLevel(089,089,089,089,FFF,FFF)
	%INCLevel(08A,08A,08A,08A,FFF,FFF)
	%INCLevel(08B,08B,08B,08B,FFF,FFF)
	%INCLevel(08C,08C,08C,08C,FFF,FFF)
	%INCLevel(08D,08D,08D,08D,FFF,FFF)
	%INCLevel(08E,08E,08E,08E,FFF,FFF)
	%INCLevel(08F,08F,08F,08F,FFF,FFF)
	%INCLevel(090,090,090,090,FFF,FFF)
	%INCLevel(091,091,091,091,FFF,FFF)
	%INCLevel(092,092,092,092,FFF,FFF)
	%INCLevel(093,093,093,093,FFF,FFF)
	%INCLevel(094,094,094,094,FFF,FFF)
	%INCLevel(095,095,095,095,FFF,FFF)
	%INCLevel(096,096,096,096,FFF,FFF)
	%INCLevel(097,097,097,097,FFF,FFF)
	%INCLevel(098,098,098,098,FFF,FFF)
	%INCLevel(099,099,099,099,FFF,FFF)
	%INCLevel(09A,09A,09A,09A,FFF,FFF)
	%INCLevel(09B,09B,09B,09B,FFF,FFF)
	%INCLevel(09C,09C,09C,09C,FFF,FFF)
	%INCLevel(09D,09D,09D,09D,FFF,FFF)
	%INCLevel(09E,09E,09E,09E,FFF,FFF)
	%INCLevel(09F,09F,09F,09F,FFF,FFF)
	%INCLevel(0A0,0A0,0A0,0A0,FFF,FFF)
	%INCLevel(0A1,0A1,0A1,0A1,FFF,FFF)
	%INCLevel(0A2,0A2,0A2,0A2,FFF,FFF)
	%INCLevel(0A3,0A3,0A3,0A3,FFF,FFF)
	%INCLevel(0A4,0A4,0A4,0A4,FFF,FFF)
	%INCLevel(0A5,0A5,0A5,0A5,FFF,FFF)
	%INCLevel(0A6,0A6,0A6,0A6,FFF,FFF)
	%INCLevel(0A7,0A7,0A7,0A7,FFF,FFF)
	%INCLevel(0A8,0A8,0A8,0A8,FFF,FFF)
	%INCLevel(0A9,0A9,0A9,0A9,FFF,FFF)
	%INCLevel(0AA,0AA,0AA,0AA,FFF,FFF)
	%INCLevel(0AB,0AB,0AB,0AB,FFF,FFF)
	%INCLevel(0AC,0AC,0AC,0AC,FFF,FFF)
	%INCLevel(0AD,0AD,0AD,0AD,FFF,FFF)
	%INCLevel(0AE,0AE,0AE,0AE,FFF,FFF)
	%INCLevel(0AF,0AF,0AF,0AF,FFF,FFF)
	%INCLevel(0B0,0B0,0B0,0B0,FFF,FFF)
	%INCLevel(0B1,0B1,0B1,0B1,FFF,FFF)
	%INCLevel(0B2,0B2,0B2,0B2,FFF,FFF)
	%INCLevel(0B3,0B3,0B3,0B3,FFF,FFF)
	%INCLevel(0B4,0B4,0B4,0B4,FFF,FFF)
	%INCLevel(0B5,0B5,0B5,0B5,FFF,FFF)
	%INCLevel(0B6,0B6,0B6,0B6,FFF,FFF)
	%INCLevel(0B7,0B7,0B7,0B7,FFF,FFF)
	%INCLevel(0B8,0B8,0B8,0B8,FFF,FFF)
	%INCLevel(0B9,0B9,0B9,0B9,FFF,FFF)
	%INCLevel(0BA,0BA,0BA,0BA,FFF,FFF)
	%INCLevel(0BB,0BB,0BB,0BB,FFF,FFF)
	%INCLevel(0BC,0BC,0BC,0BC,FFF,FFF)
	%INCLevel(0BD,0BD,0BD,0BD,FFF,FFF)
	%INCLevel(0BE,0BE,0BE,0BE,FFF,FFF)
	%INCLevel(0BF,0BF,0BF,0BF,FFF,FFF)
	%INCLevel(0C0,0C0,0C0,0C0,FFF,FFF)
	%INCLevel(0C1,0C1,0C1,0C1,FFF,FFF)
	%INCLevel(0C2,0C2,0C2,0C2,FFF,FFF)
	%INCLevel(0C3,0C3,0C3,0C3,FFF,FFF)
	%INCLevel(0C4,0C4,0C4,0C4,FFF,FFF)
	%INCLevel(0C5,0C5,0C5,0C5,FFF,FFF)
	%INCLevel(0C6,0C6,0C6,0C6,FFF,FFF)
	%INCLevel(0C7,0C7,0C7,0C7,FFF,FFF)
	%INCLevel(0C8,0C8,0C8,0C8,FFF,FFF)
	%INCLevel(0C9,0C9,0C9,0C9,FFF,FFF)
	%INCLevel(0CA,0CA,0CA,0CA,FFF,FFF)
	%INCLevel(0CB,0CB,0CB,0CB,FFF,FFF)
	%INCLevel(0CC,0CC,0CC,0CC,FFF,FFF)
	%INCLevel(0CD,0CD,0CD,0CD,FFF,FFF)
	%INCLevel(0CE,0CE,0CE,0CE,FFF,FFF)
	%INCLevel(0CF,0CF,0CF,0CF,FFF,FFF)
	%INCLevel(0D0,0D0,0D0,0D0,FFF,FFF)
	%INCLevel(0D1,0D1,0D1,0D1,FFF,FFF)
	%INCLevel(0D2,0D2,0D2,0D2,FFF,FFF)
	%INCLevel(0D3,0D3,0D3,0D3,FFF,FFF)
	%INCLevel(0D4,0D4,0D4,0D4,FFF,FFF)
	%INCLevel(0D5,0D5,0D5,0D5,FFF,FFF)
	%INCLevel(0D6,0D6,0D6,0D6,FFF,FFF)
	%INCLevel(0D7,0D7,0D7,0D7,FFF,FFF)
	%INCLevel(0D8,0D8,0D8,0D8,FFF,FFF)
	%INCLevel(0D9,0D9,0D9,0D9,FFF,FFF)
	%INCLevel(0DA,0DA,0DA,0DA,FFF,FFF)
	%INCLevel(0DB,0DB,0DB,0DB,FFF,FFF)
	%INCLevel(0DC,0DC,0DC,0DC,FFF,FFF)
	%INCLevel(0DD,0DD,0DD,0DD,FFF,FFF)
	%INCLevel(0DE,0DE,0DE,0DE,FFF,FFF)
	%INCLevel(0DF,0DF,0DF,0DF,FFF,FFF)
	%INCLevel(0E0,0E0,0E0,0E0,FFF,FFF)
	%INCLevel(0E1,0E1,0E1,0E1,FFF,FFF)
	%INCLevel(0E2,0E2,0E2,0E2,FFF,FFF)
	%INCLevel(0E3,0E3,0E3,0E3,FFF,FFF)
	%INCLevel(0E4,0E4,0E4,0E4,FFF,FFF)
	%INCLevel(0E5,0E5,0E5,0E5,FFF,FFF)
	%INCLevel(0E6,0E6,0E6,0E6,FFF,FFF)
	%INCLevel(0E7,0E7,0E7,0E7,FFF,FFF)
	%INCLevel(0E8,0E8,0E8,0E8,FFF,FFF)
	%INCLevel(0E9,0E9,0E9,0E9,FFF,FFF)
	%INCLevel(0EA,0EA,0EA,0EA,FFF,FFF)
	%INCLevel(0EB,0EB,0EB,0EB,FFF,FFF)
	%INCLevel(0EC,0EC,0EC,0EC,FFF,FFF)
	%INCLevel(0ED,0ED,0ED,0ED,FFF,FFF)
	%INCLevel(0EE,0EE,0EE,0EE,FFF,FFF)
	%INCLevel(0EF,0EF,0EF,0EF,FFF,FFF)
	%INCLevel(0F0,0F0,0F0,0F0,FFF,FFF)
	%INCLevel(0F1,0F1,0F1,0F1,FFF,FFF)
	%INCLevel(0F2,0F2,0F2,0F2,FFF,FFF)
	%INCLevel(0F3,0F3,0F3,0F3,FFF,FFF)
	%INCLevel(0F4,0F4,0F4,0F4,FFF,FFF)
	%INCLevel(0F5,0F5,0F5,0F5,FFF,FFF)
	%INCLevel(0F6,0F6,0F6,0F6,FFF,FFF)
	%INCLevel(0F7,0F7,0F7,0F7,FFF,FFF)
	%INCLevel(0F8,0F8,0F8,0F8,FFF,FFF)
	%INCLevel(0F9,0F9,0F9,0F9,FFF,FFF)
	%INCLevel(0FA,0FA,0FA,0FA,FFF,FFF)
	%INCLevel(0FB,0FB,0FB,0FB,FFF,FFF)
	%INCLevel(0FC,0FC,0FC,0FC,FFF,FFF)
	%INCLevel(0FD,0FD,0FD,0FD,FFF,FFF)
	%INCLevel(0FE,0FE,0FE,0FE,FFF,FFF)
	%INCLevel(0FF,0FF,0FF,0FF,FFF,FFF)
	%INCLevel(100,100,100,100,FFF,FFF)
	%INCLevel(101,101,101,101,FFF,FFF)
	%INCLevel(102,102,102,102,FFF,FFF)
	%INCLevel(103,103,103,103,FFF,FFF)
	%INCLevel(104,104,104,104,FFF,FFF)
	%INCLevel(105,105,105,105,FFF,FFF)
	%INCLevel(106,106,106,106,FFF,FFF)
	%INCLevel(107,107,107,107,FFF,FFF)
	%INCLevel(108,108,108,108,FFF,FFF)
	%INCLevel(109,109,109,109,FFF,FFF)
	%INCLevel(10A,10A,10A,10A,FFF,FFF)
	%INCLevel(10B,10B,10B,10B,FFF,FFF)
	%INCLevel(10C,10C,10C,10C,FFF,FFF)
	%INCLevel(10D,10D,10D,10D,FFF,FFF)
	%INCLevel(10E,10E,10E,10E,FFF,FFF)
	%INCLevel(10F,10F,10F,10F,FFF,FFF)
	%INCLevel(110,110,110,110,FFF,FFF)
	%INCLevel(111,111,111,111,FFF,FFF)
	%INCLevel(112,112,112,112,FFF,FFF)
	%INCLevel(113,113,113,113,FFF,FFF)
	%INCLevel(114,114,114,114,FFF,FFF)
	%INCLevel(115,115,115,115,FFF,FFF)
	%INCLevel(116,116,116,116,FFF,FFF)
	%INCLevel(117,117,117,117,FFF,FFF)
	%INCLevel(118,118,118,118,FFF,FFF)
	%INCLevel(119,119,119,119,FFF,FFF)
	%INCLevel(11A,11A,11A,11A,FFF,FFF)
	%INCLevel(11B,11B,11B,11B,FFF,FFF)
	%INCLevel(11C,11C,11C,11C,FFF,FFF)
	%INCLevel(11D,11D,11D,11D,FFF,FFF)
	%INCLevel(11E,11E,11E,11E,FFF,FFF)
	%INCLevel(11F,11F,11F,11F,FFF,FFF)
	%INCLevel(120,120,120,120,FFF,FFF)
	%INCLevel(121,121,121,121,FFF,FFF)
	%INCLevel(122,122,122,122,FFF,FFF)
	%INCLevel(123,123,123,123,FFF,FFF)
	%INCLevel(124,124,124,124,FFF,FFF)
	%INCLevel(125,125,125,125,FFF,FFF)
	%INCLevel(126,126,126,126,FFF,FFF)
	%INCLevel(127,127,127,127,FFF,FFF)
	%INCLevel(128,128,128,128,FFF,FFF)
	%INCLevel(129,129,129,129,FFF,FFF)
	%INCLevel(12A,12A,12A,12A,FFF,FFF)
	%INCLevel(12B,12B,12B,12B,FFF,FFF)
	%INCLevel(12C,12C,12C,12C,FFF,FFF)
	%INCLevel(12D,12D,12D,12D,FFF,FFF)
	%INCLevel(12E,12E,12E,12E,FFF,FFF)
	%INCLevel(12F,12F,12F,12F,FFF,FFF)
	%INCLevel(130,130,130,130,FFF,FFF)
	%INCLevel(131,131,131,131,FFF,FFF)
	%INCLevel(132,132,132,132,FFF,FFF)
	%INCLevel(133,133,133,133,FFF,FFF)
	%INCLevel(134,134,134,134,FFF,FFF)
	%INCLevel(135,135,135,135,FFF,FFF)
	%INCLevel(136,136,136,136,FFF,FFF)
	%INCLevel(137,137,137,137,FFF,FFF)
	%INCLevel(138,138,138,138,FFF,FFF)
	%INCLevel(139,139,139,139,FFF,FFF)
	%INCLevel(13A,13A,13A,13A,FFF,FFF)
	%INCLevel(13B,13B,13B,13B,FFF,FFF)
	%INCLevel(13C,13C,13C,13C,FFF,FFF)
	%INCLevel(13D,13D,13D,13D,FFF,FFF)
	%INCLevel(13E,13E,13E,13E,FFF,FFF)
	%INCLevel(13F,13F,13F,13F,FFF,FFF)
	%INCLevel(140,140,140,140,FFF,FFF)
	%INCLevel(141,141,141,141,FFF,FFF)
	%INCLevel(142,142,142,142,FFF,FFF)
	%INCLevel(143,143,143,143,FFF,FFF)
	%INCLevel(144,144,144,144,FFF,FFF)
	%INCLevel(145,145,145,145,FFF,FFF)
	%INCLevel(146,146,146,146,FFF,FFF)
	%INCLevel(147,147,147,147,FFF,FFF)
	%INCLevel(148,148,148,148,FFF,FFF)
	%INCLevel(149,149,149,149,FFF,FFF)
	%INCLevel(14A,14A,14A,14A,FFF,FFF)
	%INCLevel(14B,14B,14B,14B,FFF,FFF)
	%INCLevel(14C,14C,14C,14C,FFF,FFF)
	%INCLevel(14D,14D,14D,14D,FFF,FFF)
	%INCLevel(14E,14E,14E,14E,FFF,FFF)
	%INCLevel(14F,14F,14F,14F,FFF,FFF)
	%INCLevel(150,150,150,150,FFF,FFF)
	%INCLevel(151,151,151,151,FFF,FFF)
	%INCLevel(152,152,152,152,FFF,FFF)
	%INCLevel(153,153,153,153,FFF,FFF)
	%INCLevel(154,154,154,154,FFF,FFF)
	%INCLevel(155,155,155,155,FFF,FFF)
	%INCLevel(156,156,156,156,FFF,FFF)
	%INCLevel(157,157,157,157,FFF,FFF)
	%INCLevel(158,158,158,158,FFF,FFF)
	%INCLevel(159,159,159,159,FFF,FFF)
	%INCLevel(15A,15A,15A,15A,FFF,FFF)
	%INCLevel(15B,15B,15B,15B,FFF,FFF)
	%INCLevel(15C,15C,15C,15C,FFF,FFF)
	%INCLevel(15D,15D,15D,15D,FFF,FFF)
	%INCLevel(15E,15E,15E,15E,FFF,FFF)
	%INCLevel(15F,15F,15F,15F,FFF,FFF)
	%INCLevel(160,160,160,160,FFF,FFF)
	%INCLevel(161,161,161,161,FFF,FFF)
	%INCLevel(162,162,162,162,FFF,FFF)
	%INCLevel(163,163,163,163,FFF,FFF)
	%INCLevel(164,164,164,164,FFF,FFF)
	%INCLevel(165,165,165,165,FFF,FFF)
	%INCLevel(166,166,166,166,FFF,FFF)
	%INCLevel(167,167,167,167,FFF,FFF)
	%INCLevel(168,168,168,168,FFF,FFF)
	%INCLevel(169,169,169,169,FFF,FFF)
	%INCLevel(16A,16A,16A,16A,FFF,FFF)
	%INCLevel(16B,16B,16B,16B,FFF,FFF)
	%INCLevel(16C,16C,16C,16C,FFF,FFF)
	%INCLevel(16D,16D,16D,16D,FFF,FFF)
	%INCLevel(16E,16E,16E,16E,FFF,FFF)
	%INCLevel(16F,16F,16F,16F,FFF,FFF)
	%INCLevel(170,170,170,170,FFF,FFF)
	%INCLevel(171,171,171,171,FFF,FFF)
	%INCLevel(172,172,172,172,FFF,FFF)
	%INCLevel(173,173,173,173,FFF,FFF)
	%INCLevel(174,174,174,174,FFF,FFF)
	%INCLevel(175,175,175,175,FFF,FFF)
	%INCLevel(176,176,176,176,FFF,FFF)
	%INCLevel(177,177,177,177,FFF,FFF)
	%INCLevel(178,178,178,178,FFF,FFF)
	%INCLevel(179,179,179,179,FFF,FFF)
	%INCLevel(17A,17A,17A,17A,FFF,FFF)
	%INCLevel(17B,17B,17B,17B,FFF,FFF)
	%INCLevel(17C,17C,17C,17C,FFF,FFF)
	%INCLevel(17D,17D,17D,17D,FFF,FFF)
	%INCLevel(17E,17E,17E,17E,FFF,FFF)
	%INCLevel(17F,17F,17F,17F,FFF,FFF)
	%INCLevel(180,180,180,180,FFF,FFF)
	%INCLevel(181,181,181,181,FFF,FFF)
	%INCLevel(182,182,182,182,FFF,FFF)
	%INCLevel(183,183,183,183,FFF,FFF)
	%INCLevel(184,184,184,184,FFF,FFF)
	%INCLevel(185,185,185,185,FFF,FFF)
	%INCLevel(186,186,186,186,FFF,FFF)
	%INCLevel(187,187,187,187,FFF,FFF)
	%INCLevel(188,188,188,188,FFF,FFF)
	%INCLevel(189,189,189,189,FFF,FFF)
	%INCLevel(18A,18A,18A,18A,FFF,FFF)
	%INCLevel(18B,18B,18B,18B,FFF,FFF)
	%INCLevel(18C,18C,18C,18C,FFF,FFF)
	%INCLevel(18D,18D,18D,18D,FFF,FFF)
	%INCLevel(18E,18E,18E,18E,FFF,FFF)
	%INCLevel(18F,18F,18F,18F,FFF,FFF)
	%INCLevel(190,190,190,190,FFF,FFF)
	%INCLevel(191,191,191,191,FFF,FFF)
	%INCLevel(192,192,192,192,FFF,FFF)
	%INCLevel(193,193,193,193,FFF,FFF)
	%INCLevel(194,194,194,194,FFF,FFF)
	%INCLevel(195,195,195,195,FFF,FFF)
	%INCLevel(196,196,196,196,FFF,FFF)
	%INCLevel(197,197,197,197,FFF,FFF)
	%INCLevel(198,198,198,198,FFF,FFF)
	%INCLevel(199,199,199,199,FFF,FFF)
	%INCLevel(19A,19A,19A,19A,FFF,FFF)
	%INCLevel(19B,19B,19B,19B,FFF,FFF)
	%INCLevel(19C,19C,19C,19C,FFF,FFF)
	%INCLevel(19D,19D,19D,19D,FFF,FFF)
	%INCLevel(19E,19E,19E,19E,FFF,FFF)
	%INCLevel(19F,19F,19F,19F,FFF,FFF)
	%INCLevel(1A0,1A0,1A0,1A0,FFF,FFF)
	%INCLevel(1A1,1A1,1A1,1A1,FFF,FFF)
	%INCLevel(1A2,1A2,1A2,1A2,FFF,FFF)
	%INCLevel(1A3,1A3,1A3,1A3,FFF,FFF)
	%INCLevel(1A4,1A4,1A4,1A4,FFF,FFF)
	%INCLevel(1A5,1A5,1A5,1A5,FFF,FFF)
	%INCLevel(1A6,1A6,1A6,1A6,FFF,FFF)
	%INCLevel(1A7,1A7,1A7,1A7,FFF,FFF)
	%INCLevel(1A8,1A8,1A8,1A8,FFF,FFF)
	%INCLevel(1A9,1A9,1A9,1A9,FFF,FFF)
	%INCLevel(1AA,1AA,1AA,1AA,FFF,FFF)
	%INCLevel(1AB,1AB,1AB,1AB,FFF,FFF)
	%INCLevel(1AC,1AC,1AC,1AC,FFF,FFF)
	%INCLevel(1AD,1AD,1AD,1AD,FFF,FFF)
	%INCLevel(1AE,1AE,1AE,1AE,FFF,FFF)
	%INCLevel(1AF,1AF,1AF,1AF,FFF,FFF)
	%INCLevel(1B0,1B0,1B0,1B0,FFF,FFF)
	%INCLevel(1B1,1B1,1B1,1B1,FFF,FFF)
	%INCLevel(1B2,1B2,1B2,1B2,FFF,FFF)
	%INCLevel(1B3,1B3,1B3,1B3,FFF,FFF)
	%INCLevel(1B4,1B4,1B4,1B4,FFF,FFF)
	%INCLevel(1B5,1B5,1B5,1B5,FFF,FFF)
	%INCLevel(1B6,1B6,1B6,1B6,FFF,FFF)
	%INCLevel(1B7,1B7,1B7,1B7,FFF,FFF)
	%INCLevel(1B8,1B8,1B8,1B8,FFF,FFF)
	%INCLevel(1B9,1B9,1B9,1B9,FFF,FFF)
	%INCLevel(1BA,1BA,1BA,1BA,FFF,FFF)
	%INCLevel(1BB,1BB,1BB,1BB,FFF,FFF)
	%INCLevel(1BC,1BC,1BC,1BC,FFF,FFF)
	%INCLevel(1BD,1BD,1BD,1BD,FFF,FFF)
	%INCLevel(1BE,1BE,1BE,1BE,FFF,FFF)
	%INCLevel(1BF,1BF,1BF,1BF,FFF,FFF)
	%INCLevel(1C0,1C0,1C0,1C0,FFF,FFF)
	%INCLevel(1C1,1C1,1C1,1C1,FFF,FFF)
	%INCLevel(1C2,1C2,1C2,1C2,FFF,FFF)
	%INCLevel(1C3,1C3,1C3,1C3,FFF,FFF)
	%INCLevel(1C4,1C4,1C4,1C4,FFF,FFF)
	%INCLevel(1C5,1C5,1C5,1C5,FFF,FFF)
	%INCLevel(1C6,1C6,1C6,1C6,FFF,FFF)
	%INCLevel(1C7,1C7,1C7,1C7,FFF,FFF)
	%INCLevel(1C8,1C8,1C8,1C8,FFF,FFF)
	%INCLevel(1C9,1C9,1C9,1C9,FFF,FFF)
	%INCLevel(1CA,1CA,1CA,1CA,FFF,FFF)
	%INCLevel(1CB,1CB,1CB,1CB,FFF,FFF)
	%INCLevel(1CC,1CC,1CC,1CC,FFF,FFF)
	%INCLevel(1CD,1CD,1CD,1CD,FFF,FFF)
	%INCLevel(1CE,1CE,1CE,1CE,FFF,FFF)
	%INCLevel(1CF,1CF,1CF,1CF,FFF,FFF)
	%INCLevel(1D0,1D0,1D0,1D0,FFF,FFF)
	%INCLevel(1D1,1D1,1D1,1D1,FFF,FFF)
	%INCLevel(1D2,1D2,1D2,1D2,FFF,FFF)
	%INCLevel(1D3,1D3,1D3,1D3,FFF,FFF)
	%INCLevel(1D4,1D4,1D4,1D4,FFF,FFF)
	%INCLevel(1D5,1D5,1D5,1D5,FFF,FFF)
	%INCLevel(1D6,1D6,1D6,1D6,FFF,FFF)
	%INCLevel(1D7,1D7,1D7,1D7,FFF,FFF)
	%INCLevel(1D8,1D8,1D8,1D8,FFF,FFF)
	%INCLevel(1D9,1D9,1D9,1D9,FFF,FFF)
	%INCLevel(1DA,1DA,1DA,1DA,FFF,FFF)
	%INCLevel(1DB,1DB,1DB,1DB,FFF,FFF)
	%INCLevel(1DC,1DC,1DC,1DC,FFF,FFF)
	%INCLevel(1DD,1DD,1DD,1DD,FFF,FFF)
	%INCLevel(1DE,1DE,1DE,1DE,FFF,FFF)
	%INCLevel(1DF,1DF,1DF,1DF,FFF,FFF)
	%INCLevel(1E0,1E0,1E0,1E0,FFF,FFF)
	%INCLevel(1E1,1E1,1E1,1E1,FFF,FFF)
	%INCLevel(1E2,1E2,1E2,1E2,FFF,FFF)
	%INCLevel(1E3,1E3,1E3,1E3,FFF,FFF)
	%INCLevel(1E4,1E4,1E4,1E4,FFF,FFF)
	%INCLevel(1E5,1E5,1E5,1E5,FFF,FFF)
	%INCLevel(1E6,1E6,1E6,1E6,FFF,FFF)
	%INCLevel(1E7,1E7,1E7,1E7,FFF,FFF)
	%INCLevel(1E8,1E8,1E8,1E8,FFF,FFF)
	%INCLevel(1E9,1E9,1E9,1E9,FFF,FFF)
	%INCLevel(1EA,1EA,1EA,1EA,FFF,FFF)
	%INCLevel(1EB,1EB,1EB,1EB,FFF,FFF)
	%INCLevel(1EC,1EC,1EC,1EC,FFF,FFF)
	%INCLevel(1ED,1ED,1ED,1ED,FFF,FFF)
	%INCLevel(1EE,1EE,1EE,1EE,FFF,FFF)
	%INCLevel(1EF,1EF,1EF,1EF,FFF,FFF)
	%INCLevel(1F0,1F0,1F0,1F0,FFF,FFF)
	%INCLevel(1F1,1F1,1F1,1F1,FFF,FFF)
	%INCLevel(1F2,1F2,1F2,1F2,FFF,FFF)
	%INCLevel(1F3,1F3,1F3,1F3,FFF,FFF)
	%INCLevel(1F4,1F4,1F4,1F4,FFF,FFF)
	%INCLevel(1F5,1F5,1F5,1F5,FFF,FFF)
	%INCLevel(1F6,1F6,1F6,1F6,FFF,FFF)
	%INCLevel(1F7,1F7,1F7,1F7,FFF,FFF)
	%INCLevel(1F8,1F8,1F8,1F8,FFF,FFF)
	%INCLevel(1F9,1F9,1F9,1F9,FFF,FFF)
	%INCLevel(1FA,1FA,1FA,1FA,FFF,FFF)
	%INCLevel(1FB,1FB,1FB,1FB,FFF,FFF)
	%INCLevel(1FC,1FC,1FC,1FC,FFF,FFF)
	%INCLevel(1FD,1FD,1FD,1FD,FFF,FFF)
	%INCLevel(1FE,1FE,1FE,1FE,FFF,FFF)
	%INCLevel(1FF,1FF,1FF,1FF,FFF,FFF)
