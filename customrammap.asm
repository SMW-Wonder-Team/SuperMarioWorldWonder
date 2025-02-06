

!SampleGroupPtrsLoc	= $008000

!AMKFreeRAM		= $7FB000
!CurrentSong		= !AMKFreeRAM+$00
!NoUploadSamples	= !AMKFreeRAM+$01
!SongPositionLow	= !AMKFreeRAM+$04
!SongPositionHigh	= !AMKFreeRAM+$05
!SPCOutput1		= !SongPositionLow
!SPCOutput2		= !SongPositionHigh
!SPCOutput3		= !AMKFreeRAM+$06
!SPCOutput4		= !AMKFreeRAM+$07
;!MusicBackup		= !AMKFreeRAM+$08
!SampleCount		= !AMKFreeRAM+$09
!SRCNTableBuffer	= !AMKFreeRAM+$0A

!Trick   = !AMKFreeRAM+$08
!Tricker = !BonusEnd
!GlobalMusicCount = #$29

!SFX1DF9Reg = 	$2140
!SpecialReg = 	$2141
!MusicReg = 	$2142
!SFX1DFCReg = 	$2143	


!SFX1DF9Mir = 	$1DF9
!SpecialMir = 	$1DFA
!MusicMir = 	$1DFB
!SFX1DFCMir = 	$1DFC

!MusicBackup = $0DDA


!DefARAMRet = $042F	; This is the address that the SPC will jump to after uploading a block of data normally.
!ExpARAMRet = $0400	; This is the address that the SPC will jump to after uploading a block of data that precedes another block of data (used when uploading multiple blocks).
			; All of these are changed automatically.
!SongCount = $29	; How many songs exist.  Used by the fading routine; changed automatically.
;The following ASM file is shared between the SPC700-side and SNES-side
;code. Some defines will only affect the SPC700 side, and some will only
;affect the SNES-side, but all of them are stored here for the sake of
;having them stored in a consistent location.

includeonce

;=======================================
;---------------
!PSwitchIsSFX = !false

;Default setting: !false
;---------------
; If you set this to true, then the P-switch song will be a sound effect
; instead of a song that interrupts the current music.
; Note, however, that it is hardcoded and cannot be changed unless you
; do it yourself.
; This also enables a hijack on the SNES side to account for the
; modification made on the SPC700-side.
;=======================================

;=======================================
;---------------
!noSFX = !false

;Default setting: !false
;---------------
; Causes the sound driver to have no SFX-related code in it.
;=======================================

;=======================================
;---------------
!noiseFrequencyMatchChecks = !false

;Default setting: !false
;---------------
; Requires SFX code to actually be present (!noSFX is false).
; Adds in code that allows noise frequencies that match to the current noise
; frequency being used to continue to be audible, thus allowing the volume
; of the noise to stack on top of each other. Without this, only one channel
; will be audible at a time for noise, regardless of the circumstance.
;=======================================

;=======================================
;---------------
!noiseFrequencySFXInstanceResolution = !false

;Default setting: !false
;---------------
; Requires SFX code to actually be present (!noSFX is false).
; Adds in code that resolves noise frequency conflicts between SFX
; instances.
; Not needed unless you're using noise SFX across more than one channel.
; Vanilla SMW doesn't use noise SFX across more than one channel.
;=======================================

;=======================================
;---------------
!1DF9SFXChannel = 6

;Default setting: 6
;Vanilla SMW setting: 4
;---------------
; Changes the channel assigned to 1DF9.
; WARNING: This number starts from zero, not 1, like the MML channels!
; Also, please don't include the # sign: this is used for more than just a
; constant number: it's also involved in math operations.
;=======================================

;=======================================
;---------------
!1DFASFXChannel = 7

;Default setting: 7
;Vanilla SMW setting: 7
;---------------
; Changes the channel assigned to 1DFA.
; WARNING: This number starts from zero, not 1, like the MML channels!
; Also, please don't include the # sign: this is used for more than just a
; constant number: it's also involved in math operations.
;=======================================

;=======================================
;---------------
!1DFCSFXChannel = 7

;Default setting: 7
;Vanilla SMW setting: 6
;---------------
; Changes the channel assigned to 1DFC.
; WARNING: This number starts from zero, not 1, like the MML channels!
; Also, please don't include the # sign: this is used for more than just a
; constant number: it's also involved in math operations.
;=======================================

;=======================================
;---------------
!JumpSFXOn1DF9 = !false

;Default setting: !false
;Vanilla SMW setting: !false
;---------------
; Change this to !true to move the jump sound effect to 1DF9.
;=======================================

;=======================================
;---------------
!JumpSFXOn1DFC = !true

;Default setting: !true
;Vanilla SMW setting: !false
;---------------
; Change this to !true to move the jump sound effect to 1DFC.
;=======================================

;=======================================
;---------------
!GrinderSFXOn1DF9 = !true

;Default setting: !true
;Vanilla SMW setting: !false
;---------------
; Change this to !true to move the grinder sound effect to 1DF9.
;=======================================

;=======================================
;---------------
!GrinderSFXOn1DFC = !false

;Default setting: !false
;Vanilla SMW setting: !false
;---------------
; Change this to !true to move the grinder sound effect to 1DFC.
;=======================================

;=======================================
;---------------
!JumpSFX1DFAPriority = $20

;Default setting: $00
;Vanilla SMW setting: $20
;---------------
; Sets the priority for the jump SFX in 1DFA.
;=======================================

;=======================================
;---------------
!GirderSFX1DFAPriority = $00

;Default setting: $00
;Vanilla SMW setting: $10
;---------------
; Sets the priority for the girder SFX in 1DFA.
;=======================================

;=======================================
;---------------
!useSFXSequenceFor1DFASFX = !true

;Default setting: !true
;Vanilla SMW setting: !false
;---------------
; Replaces the hard-coded 1DFA SFX with a standard sequence used for 1DF9
; and 1DFB.
;=======================================

;=======================================
;---------------
!PSwitchSFXCh0ID = 5

;Default setting: 5
;---------------
; Requires !PSwitchIsSFX to be true to do anything.
; Changes the channel assigned to the first channel of the P-Switch SFX.
; WARNING: This number starts from zero, not 1, like the MML channels!
; Also, please don't include the # sign: this is used for more than just a
; constant number: it's also involved in math operations.
;=======================================

;=======================================
;---------------
!PSwitchSFXCh1ID = 6

;Default setting: 6
;---------------
; Requires !PSwitchIsSFX to be true to do anything.
; Changes the channel assigned to the second channel of the P-Switch SFX.
; WARNING: This number starts from zero, not 1, like the MML channels!
; Also, please don't include the # sign: this is used for more than just a
; constant number: it's also involved in math operations.
;=======================================

;=======================================
;---------------
!PSwitchSFXCh2ID = 7

;Default setting: 7
;---------------
; Requires !PSwitchIsSFX to be true to do anything.
; Changes the channel assigned to the third channel of the P-Switch SFX.
; WARNING: This number starts from zero, not 1, like the MML channels!
; Also, please don't include the # sign: this is used for more than just a
; constant number: it's also involved in math operations.
;=======================================

;=======================================
;---------------
!PSwitchSFXTriggerChID = 4

;Default setting: 4
;---------------
; Requires !PSwitchIsSFX to be true to do anything.
; Changes the channel assigned to the trigger SFX for the P-Switch.
; WARNING: This number starts from zero, not 1, like the MML channels!
; Also, please don't include the # sign: this is used for more than just a
; constant number: it's also involved in math operations.
;=======================================

;=======================================
;---------------
!PSwitchStarRestart = !true

;Default setting: !true (!false in AddmusicK 1.0.8 and earlier)
;Vanilla SMW setting: !true
;---------------
; If you set this to true, then the P-switch and star global songs will 
; restart whenever they're called again (i.e., by pressing another P-switch
; or collecting another star).
;=======================================

;=======================================
;---------------
!BowserSongOverride = !false

;Default setting: !false
;Vanilla SMW setting: !true
;---------------
; When set to true, the !Bowser song overrides the default level song on
; load during the Bowser fight.
;=======================================

;=======================================
;---------------
!WelcomeSongOverride = !false

;Default setting: !false
;Vanilla SMW setting: !true
;---------------
; When set to true, the !Welcome song overrides the default level song on
; load during the intro level after loading a new file.
;=======================================

;=======================================
; If you've changed list.txt and plan on using the original SMW songs
; change these constants to whatever they are in list.txt
; For example, if you changed the "Stage Clear" music to be number 9,
; Then you'd change "!StageClear = $04" to "!StageClear = $09".
!Starman	= $05
!Miss		= $01			
!GameOver	= $02			
!BossClear	= $03			
!StageClear	= $04			
!PSwitch	= $06
!Keyhole	= $07
!IrisOut	= $08
!BonusEnd	= $09
!Piano		= $0A
!HereWeGo	= $0B
!Water		= $0C
!Bowser		= $0D
!Boss		= $0E
!Cave		= $0F
!GhostHouse	= $10
!Castle		= $11
!SwitchPalace	= $12
!CastleDestructionFanfare = $13
!Welcome	= $13
!RescueEgg	= $14
!Title		= $15
!VoBAppears	= $16
!Overworld	= $17
!YoshisIsland	= $18
!VanillaDome	= $19
!StarRoad	= $1A
!ForestOfIllusion = $1B
!ValleyOfBowser	= $1C
!SpecialWorld	= $1D
!NintPresents   = $1E		; Note that this is a song, not a sound effect!

!Bowser2	= $1F		;
!Bowser3	= $20
!BowserDefeated = $21
!BowserIntrlude = $22
!BowserZoomIn	= $23
!BowserZoomOut	= $24
!PrincessSaved	= $25
!StaffRoll	= $26
!YoshisAreHome	= $27
!CastList	= $28
;=======================================
!ram_base 	= $7F8183	;350~ BYTES FREE SPACE RAM
!stripe_index = $7F837B
!stripe_table = $7F837D
!L1r_addr	= !ram_base	;VRAM address (equivalent to $1BE4-$1BE5)
!L1r_buffer	= $1BE6		;256 byte buffer for horizontal writes, using the original L1 buffer for this
!L2r_addr	= !ram_base+2	;VRAM address
!L2r_buffer	= $1CE8		;256 byte buffer as above, but for L2, using the original L2 buffer for this

;*is this really OK?
!L1c_addr	= !ram_base+4	;these are like the above, except buffers are 128 bytes each and they used the free RAM too
!L1c_buffer	= !ram_base+136
!L2c_addr	= !ram_base+6
!L2c_buffer	= !ram_base+264

;custom copies of $4D-$50 and $51-$54
!L1x_lastupdate	= !L2c_buffer+128	;4 bytes (either direction) last updated position for L1 horizontal scroll
!L1y_lastupdate	= !L2c_buffer+132	;"" L1 vertical scroll
!L2x_lastupdate	= !L2c_buffer+136	;"" L2 horizontal scroll
!L2y_lastupdate	= !L2c_buffer+140	;"" L2 vertical scroll

;custom direction variables for each possible direction
!L1x_direction	= !L2y_lastupdate+4	;1 byte, 00 for left, 02 for right
!L1y_direction	= !L2y_lastupdate+5	;"" 00 for up, 02 for down
!L2x_direction	= !L2y_lastupdate+6	;...
!L2y_direction	= !L2y_lastupdate+7

;custom variables to hold the previous X/Y scrolls for each layer
!L1x_prevscroll	= !L2y_direction+1	;2 bytes, simply the value it was on the previous frame ($7F831D atm)
!L1y_prevscroll	= !L2y_direction+3	;...
!L2x_prevscroll	= !L2y_direction+5
!L2y_prevscroll	= !L2y_direction+7

;other misc. variables
!BG2_size	= !L2y_prevscroll+2	;2 bytes, either $01B0 or $0200 depending on the size

;precalculated DMA values

!ram_dmavalues = $0695		;bunch of extra RAM for speedups, it barely fits here.  Required to be in shadow ram for best performance in vblank

;L1r
!L1r_dmavram1	= !ram_dmavalues	;l1 dma row vram for 4 row updates (30 byte)
!L1r_dmavram2	= !ram_dmavalues+2
!L1r_dmavram3	= !ram_dmavalues+4
!L1r_dmavram4	= !ram_dmavalues+6
!L1r_dmavram5	= !ram_dmavalues+8
!L1r_dmavram6	= !ram_dmavalues+10

!L1r_dmasize1	= !L1r_dmavram6+2	;l1 dma row size
!L1r_dmasize2	= !L1r_dmavram6+3
!L1r_dmasize3	= !L1r_dmavram6+4
!L1r_dmasize4	= !L1r_dmavram6+5
!L1r_dmasize5	= !L1r_dmavram6+6
!L1r_dmasize6	= !L1r_dmavram6+7

!L1r_dmasource1	= !L1r_dmasize6+1	;l1 dma source
!L1r_dmasource2	= !L1r_dmasize6+3
!L1r_dmasource3	= !L1r_dmasize6+5
!L1r_dmasource4	= !L1r_dmasize6+7
!L1r_dmasource5	= !L1r_dmasize6+9
!L1r_dmasource6	= !L1r_dmasize6+11

;L2r
!L2r_dmavram1	= !L1r_dmasource6+2	;l1 dma row vram for 4 row updates (30 byte)
!L2r_dmavram2	= !L1r_dmasource6+4
!L2r_dmavram3	= !L1r_dmasource6+6
!L2r_dmavram4	= !L1r_dmasource6+8
!L2r_dmavram5	= !L1r_dmasource6+10
!L2r_dmavram6	= !L1r_dmasource6+12

!L2r_dmasize1	= !L2r_dmavram6+2	;l1 dma row size
!L2r_dmasize2	= !L2r_dmavram6+3
!L2r_dmasize3	= !L2r_dmavram6+4
!L2r_dmasize4	= !L2r_dmavram6+5
!L2r_dmasize5	= !L2r_dmavram6+6
!L2r_dmasize6	= !L2r_dmavram6+7

!L2r_dmasource1	= !L2r_dmasize6+1	;l1 dma source
!L2r_dmasource2	= !L2r_dmasize6+3
!L2r_dmasource3	= !L2r_dmasize6+5
!L2r_dmasource4	= !L2r_dmasize6+7
!L2r_dmasource5	= !L2r_dmasize6+9
!L2r_dmasource6	= !L2r_dmasize6+11

;L1c
!L1c_dmavram1	= !L2r_dmasource6+2	;l1 dma row vram for 4 column updates (20 byte)
!L1c_dmavram2	= !L2r_dmasource6+4
!L1c_dmavram3	= !L2r_dmasource6+6
!L1c_dmavram4	= !L2r_dmasource6+8

!L1c_dmasize1	= !L1c_dmavram4+2	;l1 dma column size
!L1c_dmasize2	= !L1c_dmavram4+3
!L1c_dmasize3	= !L1c_dmavram4+4
!L1c_dmasize4	= !L1c_dmavram4+5

!L1c_dmasource1	= !L1c_dmasize4+1	;l1 dma source
!L1c_dmasource2	= !L1c_dmasize4+3
!L1c_dmasource3	= !L1c_dmasize4+5
!L1c_dmasource4	= !L1c_dmasize4+7

;L2c
!L2c_dmavram1	= !L1c_dmasource4+2	;l2 dma row vram for 4 column updates (20 byte)
!L2c_dmavram2	= !L1c_dmasource4+4
!L2c_dmavram3	= !L1c_dmasource4+6
!L2c_dmavram4	= !L1c_dmasource4+8

!L2c_dmasize1	= !L2c_dmavram4+2	;l2 dma column size
!L2c_dmasize2	= !L2c_dmavram4+3
!L2c_dmasize3	= !L2c_dmavram4+4
!L2c_dmasize4	= !L2c_dmavram4+5

!L2c_dmasource1	= !L2c_dmasize4+1	;l2 dma source
!L2c_dmasource2	= !L2c_dmasize4+3
!L2c_dmasource3	= !L2c_dmasize4+5
!L2c_dmasource4	= !L2c_dmasize4+7

;100 bytes total for the above table, $695-$6FF is 107 bytes, is possible to use DP to optimize which has been done

;2KB space for the table that's trashed by LM
;--------------------------------------------

!ram_bgA	= $7FBC00	;1kb for map16 lo
!ram_bgB	= $7FC300	;1kb for map16 hi LM 1.70, SMAS+W's level map starts at 7F:C700 for some reason
;!ram_bgB	= $7FC400	;1kb for map16 hi
	
;existing scroll mirrors

!L1xScroll	= $1A
!L1yScroll	= $1C
!L2xScroll	= $1E
!L2yScroll	= $20

;other essential stuff

!verticalflags	= $5B	;bit 0 vertical L1, bit 1 vertical L2

;borrwed routines:

!ExecutePtrLong		= ExecutePtrLong
!LM_GetMap16Pointer 	= CODE_06F540

!screen_rows = 32	;how high in tile rows + 2 either direction

!screen_y	= $09	;unused DP RAM
!block_y	= $0B