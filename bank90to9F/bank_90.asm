org $908000

;routine that uploads data to tilemap in VRAM
;--------------------------------------------
vram:
    ; Lunar Magic's modifications only happen in certain gamemodes
    lda $0100
    cmp #$14 : beq .ok
    cmp #$07 : beq .ok
    cmp #$13 : beq .ok
    cmp #$05 : beq .ok
    rtl
.ok:
    rep #$30

    ; Write the stripe table pointer to $00
    lda.w #!stripe_table : sta $00
    lda.w #!stripe_table>>8 : sta $01

    ; Loop through the entire stripe table
    ldy #$0000
.loop:
    ; If the end bit is set, return
    lda [$00],y : bit #$0080 : beq +
    sep #$30
    rtl
+   
    ; Copy the first header word in $03
    xba : sta $03

    ; Set RLE flag in $05
    iny #2
    lda [$00],y : and #$0040 : sta $05

    ; Compute the new VRAM destination
    jmp lm_stripe

.change:
    ; Set the new destination in the stripe table
    dey #2
    xba : sta [$00],y
    iny #2

    ; Check if RLE is used
    lda $05 : bne ..rle
..no_rle:
    ; If not RLE, the data is 2 + (length+1) additional bytes
    lda [$00],y : xba : and #$3FFF
    inc #3
    sta $03
    tya : clc : adc $03 : tay
    bra .loop
..rle:
    ; If RLE, the data is only 4 additional bytes
    iny #4
    bra .loop

; Adapted from Lunar Magic's code
; If it looks bad to you, blame Fusoya :P
lm_stripe:
    ; Skip if destination is not layer 1 tilemap
    lda $03 : and #$7000 : cmp #$2000 : bne .not_layer1

    ; This seems to check if the tile is being drawn outside of the layer 1 tilemap's range or something
    lda $03 : lsr #5 : and #$001F : sta $0B
    lda $03 : and #$0800 : xba : asl #2 : tsb $0B
    lda $1C : lsr #3 : dec #2 : and #$003F : sta $09
    
    sep #$20
    clc : adc #$20 : bit #$40 : bne +
    lda $0B : cmp $09 : bcs ++
    jmp .skip
++  lda $09 : clc : adc #$20 : cmp $0B : bcs ++
    jmp .skip
+   lda $0B : cmp $09 : bcs ++
    lda $09 : clc : adc #$20 : and #$3F : cmp $0B : bcs ++
    jmp .skip
++  rep #$20

    ; Layer 1: $2000 -> $3000
    lda $03 : and #$07FF : ora #$3000
    jmp vram_change

.not_layer1:
    ; Skip if destination is not layer 2 tilemap
    cmp #$3000 : bne .not_layer2

    ; This seems to check if the tile is being drawn outside of the layer 2 tilemap's range or something
    lda $03 : lsr #5 : and #$001F : sta $0B
    lda $03 : and #$0800 : xba : asl #2 : tsb $0B
    lda $20 : lsr #3 : dec #2 : and #$003F : sta $09

    sep #$20
    clc : adc #$20 : bit #$40 : bne +
    lda $0B : cmp $09 : bcs ++
    jmp .skip
++  lda $09 : clc : adc #$20 : cmp $0B : bcs ++
    jmp .skip
+   lda $0B : cmp $09 : bcs ++
    lda $09 : clc : adc #$20 : and #$3F : cmp $0B : bcs ++
    jmp .skip
++  rep #$20

    ; Layer 2: $3000 -> $3800
    lda $03 : and #$07FF : ora #$3800
    jmp vram_change

.not_layer2:
    ; Everything else: don't change
    lda $03
    jmp vram_change

    ; We have to delete this entry from the stripe table
    ; This fixes VRAM updates that happen offscreen vertically, which seems to happen with Mushroom Scales and Growing Pipes, for example
    ; Solution: copy the table from the next entry to this one, and change $7F837B
    ; It can be very time consuming, but this scenario should only happen once or twice per frame in the worst case
    ; The code here also looks kinda bad and you can blame me this time
.skip:
    rep #$20
    phb

    ; Compute next data index in $03 and current data size in $07
    lda $05 : beq +
    lda #$0006
    bra ++
+   lda [$00],y
    xba : and #$03FF : clc : adc #$0005
++  sta $07
    dey #2
    tya : clc : adc $07 : sta $03

    ; Setup source address in X
    clc : adc.w #!stripe_table : tax

    ; Setup size-1 in A
    lda.l !stripe_index : sec : sbc $03 : pha

    ; Update stripe index
    lda.l !stripe_index : sec : sbc $07 : sta.l !stripe_index

    ; Setup destination address in Y
    sty $03
    tya : clc : adc.w #!stripe_table : tay

    ; Transfer bytes -> effectively deletes the current entry
    pla
    mvn !stripe_table>>16,!stripe_table>>16

    plb

    ; Return with the new current index in Y
    ldy $03
    jmp vram_loop

UploadBGData:
	PHP

	LDA $0100	;nintendo presents check
	CMP #$01
	BNE +

;nintendo presents here
	REP #$20	;force disable uploads, easy to way initialise itself
	LDA.w #$0000
	STA !L1r_addr
	STA !L1c_addr
	STA !L2r_addr
	STA !L2c_addr

	PLP		;..and do nothing
	RTL

+	CMP #$20	;ending enemies thing
	BCC +

;ending crap
	JSL UploadL2Map16StripScreenMode	;oiriginal enemies original uploader

	PLP
	RTL

+	SEP #$10
	LDX #$01	;these are common settings for all transfers
	STX $4310
	LDX #$18
	STX $4311

	REP #$20

	LDA.w #!ram_dmavalues&$FF00	;DP = 0600 for faster loads
	TCD

;L1 horizontal upload
	%vramuploadr(!L1r_addr, !L1r_dmavram1, !L1r_dmasize1, !L1r_dmasource1, !L1r_buffer>>16)

;L2 horizontal upload
	%vramuploadr(!L2r_addr, !L2r_dmavram1, !L2r_dmasize1, !L2r_dmasource1, !L2r_buffer>>16)

;L1 vertical upload
	%vramuploadc(!L1c_addr, !L1c_dmavram1, !L1c_dmasize1, !L1c_dmasource1, !L1c_buffer>>16)

;L2 vertical upload
	%vramuploadc(!L2c_addr, !L2c_dmavram1, !L2c_dmasize1, !L2c_dmasource1, !L2c_buffer>>16)

	LDA.w #$0000	;DP = 0000, PHD / PLD is slow so...
	TCD

	PLP
	RTL
L1Load_Hack:
	SEP #$30

	LDX $0100	;ending must rely on its own thing
	CPX #$20
	BCC +
	JML CODE_0588EC	;original loader
	
+	LDA $1925
	JSL !ExecutePtrLong

dl Init_L1Horz	;horizontal level with image BG2
dl Init_L1Horz	;horizontal level with level BG2
dl Init_L1Horz	;horizontal level with level BG2
dl EmptyHandler	;no
dl EmptyHandler	;no
dl EmptyHandler	;no
dl EmptyHandler	;no
dl Init_L1Vert	;vertical level with level BG2
dl Init_L1Vert	;vertical level with level BG2
dl EmptyHandler	;horizontal boss level
dl Init_L1Vert	;vertical level with image BG2
dl EmptyHandler	;horizontal boss level
dl Init_L1Horz	;horizontal level with image BG2
dl Init_L1Vert	;vertical level with image BG2
dl Init_L1Horz	;horizontal level with image BG2
dl Init_L1Horz	;horizontal level with level BG2
dl EmptyHandler	;$10
dl Init_L1Horz	;horizontal level with image BG2
dl EmptyHandler
dl EmptyHandler
dl EmptyHandler
dl EmptyHandler
dl EmptyHandler
dl EmptyHandler
dl EmptyHandler
dl EmptyHandler
dl EmptyHandler
dl EmptyHandler
dl EmptyHandler
dl EmptyHandler
dl Init_L1Horz	;horizontal level with image BG2
dl Init_L1Horz	;horizontal level with level BG2

;init L2 tilemap on level load:
;------------------------------

L2Load_Hack:
	SEP #$30

	LDX $0100	;ending must rely on its own thing
	CPX #$20
	BCC +
	JML CODE_058955	;original loader

+ 	LDA $1925               
	JSL !ExecutePtrLong  

dl Init_BG2	;horizontal level with image BG2
dl Init_L2Horz	;horizontal level with level BG2
dl Init_L2Horz	;horizontal level with level BG2
dl CODE_058B8D	;no
dl CODE_058B8D	;no
dl CODE_058C71	;no
dl CODE_058C71	;no
dl Init_L2Vert	;vertical level with level BG2
dl Init_L2Vert	;vertical level with level BG2
dl Return058C70	;horizontal boss level
dl Init_BG2	;vertical level with image BG2
dl Return058C70	;horizontal boss level
dl Init_BG2	;horizontal level with image BG2
dl Init_BG2	;vertical level with image BG2
dl Init_BG2	;horizontal level with image BG2
dl Init_L2Horz	;horizontal level with level BG2
dl Return058C70	;$10
dl Init_BG2	;horizontal level with image BG2
dl Return058C70
dl Return058C70
dl Return058C70
dl Return058C70
dl Return058C70
dl Return058C70
dl Return058C70
dl Return058C70
dl Return058C70
dl Return058C70
dl Return058C70
dl Return058C70
dl Init_BG2	;horizontal level with image BG2
dl Init_L2Horz	;horizontal level with level BG2

L1GameplayX_Hack:
	SEP #$30
	LDA $1925
	JSL !ExecutePtrLong

dl Update_L1X		;horizontal level with image BG2
dl Update_L1X		;horizontal level with level BG2
dl Update_L1X		;horizontal level with level BG2
dl EmptyHandler		;no
dl EmptyHandler		;no
dl EmptyHandler		;no
dl EmptyHandler		;no
dl EmptyHandler		;vertical level with level BG2
dl EmptyHandler		;vertical level with level BG2
dl EmptyHandler		;horizontal boss level
dl EmptyHandler		;vertical level with image BG2
dl EmptyHandler		;horizontal boss level
dl Update_L1X		;horizontal level with image BG2
dl EmptyHandler		;vertical level with image BG2
dl Update_L1X		;horizontal level with image BG2
dl Update_L1X		;horizontal level with level BG2
dl EmptyHandler		;$10
dl Update_L1X		;horizontal level with image BG2
dl EmptyHandler
dl EmptyHandler
dl EmptyHandler
dl EmptyHandler
dl EmptyHandler
dl EmptyHandler
dl EmptyHandler
dl EmptyHandler
dl EmptyHandler
dl EmptyHandler
dl EmptyHandler
dl EmptyHandler
dl Update_L1X		;horizontal level with image BG2
dl Update_L1X		;horizontal level with level BG2

;custom handler for L1 update for change in Y scroll
;---------------------------------------------------

L1GameplayY_Hack:
	SEP #$30
	LDA $1925
	JSL !ExecutePtrLong

dl Update_L1Y		;horizontal level with image BG2
dl Update_L1Y		;horizontal level with level BG2
dl Update_L1Y		;horizontal level with level BG2
dl EmptyHandler		;no
dl EmptyHandler		;no
dl EmptyHandler		;no
dl EmptyHandler		;no
dl Update_L1Vert	;vertical level with level BG2
dl Update_L1Vert	;vertical level with level BG2
dl EmptyHandler		;horizontal boss level
dl Update_L1Vert	;vertical level with image BG2
dl EmptyHandler		;horizontal boss level
dl Update_L1Y		;horizontal level with image BG2
dl Update_L1Vert	;vertical level with image BG2
dl Update_L1Y		;horizontal level with image BG2
dl Update_L1Y		;horizontal level with level BG2
dl EmptyHandler		;$10
dl Update_L1Y		;horizontal level with image BG2
dl EmptyHandler
dl EmptyHandler
dl EmptyHandler
dl EmptyHandler
dl EmptyHandler
dl EmptyHandler
dl EmptyHandler
dl EmptyHandler
dl EmptyHandler
dl EmptyHandler
dl EmptyHandler
dl EmptyHandler
dl Update_L1Y		;horizontal level with image BG2
dl Update_L1Y		;horizontal level with level BG2

;custom handler for L2 update for change in X scroll
;---------------------------------------------------

L2GameplayX_Hack:
	SEP #$30
	LDA $1925
	JSL !ExecutePtrLong

dl EmptyHandler	;horizontal level with image BG2
dl Update_L2X	;horizontal level with level BG2
dl Update_L2X	;horizontal level with level BG2
dl EmptyHandler	;no
dl EmptyHandler	;no
dl EmptyHandler	;no
dl EmptyHandler	;no
dl EmptyHandler	;vertical level with level BG2
dl EmptyHandler	;vertical level with level BG2
dl EmptyHandler	;horizontal boss level
dl EmptyHandler	;vertical level with image BG2
dl EmptyHandler	;horizontal boss level
dl EmptyHandler	;horizontal level with image BG2
dl EmptyHandler	;vertical level with image BG2
dl EmptyHandler	;horizontal level with image BG2
dl Update_L2X	;horizontal level with level BG2
dl EmptyHandler	;$10
dl EmptyHandler	;horizontal level with image BG2
dl EmptyHandler
dl EmptyHandler
dl EmptyHandler
dl EmptyHandler
dl EmptyHandler
dl EmptyHandler
dl EmptyHandler
dl EmptyHandler
dl EmptyHandler
dl EmptyHandler
dl EmptyHandler
dl EmptyHandler
dl EmptyHandler	;horizontal level with image BG2
dl Update_L2X	;horizontal level with level BG2
 
;custom handler for L2 update for change in Y scroll
;---------------------------------------------------

L2GameplayY_Hack:
	SEP #$30
	LDA $1925
	JSL !ExecutePtrLong

dl Update_BG2Y		;horizontal level with image BG2
dl Update_L2Y		;horizontal level with level BG2
dl Update_L2Y		;horizontal level with level BG2
dl EmptyHandler		;no
dl EmptyHandler		;no
dl EmptyHandler		;no
dl EmptyHandler		;no
dl Update_L2Vert	;vertical level with level BG2
dl Update_L2Vert	;vertical level with level BG2
dl EmptyHandler		;horizontal boss level
dl Update_BG2Y		;vertical level with image BG2
dl EmptyHandler		;horizontal boss level
dl Update_BG2Y		;horizontal level with image BG2
dl Update_BG2Y		;vertical level with image BG2
dl Update_BG2Y		;horizontal level with image BG2
dl Update_L2Y		;horizontal level with level BG2
dl EmptyHandler		;$10
dl Update_BG2Y		;horizontal level with image BG2
dl EmptyHandler
dl EmptyHandler
dl EmptyHandler
dl EmptyHandler
dl EmptyHandler
dl EmptyHandler
dl EmptyHandler
dl EmptyHandler
dl EmptyHandler
dl EmptyHandler
dl EmptyHandler
dl EmptyHandler
dl Update_BG2Y		;horizontal level with image BG2
dl Update_L2Y		;horizontal level with level BG2

;-----

EmptyHandler:
	RTL

;-----

Update_L1X:
	PHP

;base pointer calculation      
	JSR CalculateBasePointerL1

;VRAM calculation + column select calculatio
	SEP #$10
	LDA !L1x_direction
	TAX
	REP #$20
	LDA !L1xScroll		;column based on xscroll /16
	LSR #4
	CLC
	ADC.l BG_XDisp,x	;now have finalised column select
	PHA
	ASL A			;since we are writing columns, only need to mult col select by two
	AND.w #$003F		;tilemap can only hold 64 columns horizontally
	ORA #$3000		;tilemap base if on left side
	BIT.w #$0020		;depends on bit 5 of column select obv.
	BEQ +
	ORA #$0400		;+$400 if on right side
+	AND.w #$341F		;force within tilemap width
	STA !L1c_addr
	
;pipe map16 update forced
	LDA $01,s	;column select / 16 = screen #
	LSR #4
	REP #$10
	JSR UpdatePipeMap16
	
;map16 hi/lo pointer calculation
	REP #$20
	LDA $01,s	;column select can also contain the screen # to start uploading from
	LSR #4
	AND.w #$001F	;32 screens tops
	STA $00		;have to x3
	ASL A		;x2
	CLC
	ADC $00		;x3
	TAY		;screen x3 all done, now load 24bit pointer
	LDA [$0A],y	;map16 lo pointer
	STA $6B
	LDA [$0D],y	;map16 hi pointer
	STA $6E
	SEP #$20              
	LDA #$7E	;7E = bank byte of map16 lo pointer
	STA $6D
	INC A		;7F = "" map16 hi pointer
	STA $70

;prepare initial index based on both existing column select and row select
	REP #$20
	LDA !L1yScroll	;yscroll /16 = row
	AND #$01F0	;column select is bits 0-3, row select is bits 4-8
	PHA

;addition of row select in VRAM address
	ASL #2		;yyyyy000000	
	AND.w #$03C0	;-yyyy000000 (high bit would send it to next tilemap, unwanted)
	ORA !L1c_addr
	STA !L1c_addr

	PLA
	STA $08
	LDA $01,s	;grab column select
	AND.w #$000F	;only low 4 bits are significant
	ORA $08
	TAY		;Y must be preloaded

	JSR Macro_VerticalWriterL1
	JSR CalculateVRAML1C

	PLA	;get that column select off the stack before returninf
	PLP
	RTL

;-----

;FFFF underflow in L2Y scroll at one point, the same point where it glitches

Update_L2X:
	PHP

;base pointer calculation      
	JSR CalculateBasePointerL2

;it's layer 2, so SMW does special palette handling with cave tileset
	REP #$10
	LDY.w #$0000	;OR argument outside of caves
	LDA $1931	;tileset == 3? then we're in a cave
	CMP #$03
	BNE +
	LDY #$1000	;OR argument inside of caves
+	STY $03
	
;VRAM calculation + column select calculatio
	SEP #$10
	LDA !L2x_direction
	TAX
	REP #$20
	LDA !L2xScroll		;column based on xscroll /16
	LSR #4
	CLC
	ADC.l BG_XDisp,x	;now have finalised column select
	PHA
	ASL A			;since we are writing columns, only need to mult col select by two
	AND.w #$003F		;tilemap can only hold 64 columns horizontally
	ORA #$3800		;tilemap base if on left side
	BIT.w #$0020		;depends on bit 5 of column select obv.
	BEQ +
	ORA #$0400		;+$400 if on right side
+	AND.w #$3C1F		;force within tilemap width
	STA !L2c_addr
	
;column select decides pipe map 16
	LDA $01,s	;row select / 16 = screen #
	LSR #4
	REP #$10
	JSR UpdatePipeMap16

;map16 hi/lo pointer calculation
	REP #$20
	LDA $01,s	;column select can also contain the screen # to start uploading from
	LSR #4
	AND.w #$001F	;32 screens tops
	STA $00		;have to x3
	ASL A		;x2
	CLC
	ADC $00		;x3
	TAY		;screen x3 all done, now load 24bit pointer
	LDA [$0A],y	;map16 lo pointer
	STA $6B
	LDA [$0D],y	;map16 hi pointer
	STA $6E
	SEP #$20              
	LDA #$7E	;7E = bank byte of map16 lo pointer
	STA $6D
	INC A		;7F = "" map16 hi pointer
	STA $70

;prepare initial index based on both existing column select and row select
	REP #$20
	LDA !L2yScroll	;yscroll /16 = row
	AND #$01F0	;column select is bits 0-3, row select is bits 4-8
	PHA

;addition of row select in VRAM address
	ASL #2		;yyyyy000000	
	AND.w #$03C0	;-yyyy000000 (high bit would send it to next tilemap, unwanted)
	ORA !L2c_addr
	STA !L2c_addr

	PLA
	STA $08
	LDA $01,s	;grab column select
	AND.w #$000F	;only low 4 bits are significant
	ORA $08
	TAY		;Y must be preloaded

	JSR Macro_VerticalWriterL2
	JSR CalculateVRAML2C
	
	PLA	;get that column select off the stack before returninf
	PLP
	RTL

;-----

Update_L1Y:
	PHP

	JSR CalculateBasePointerL1	;setup the simple pointers required

;row select / VRAM calculation
	SEP #$10        ;fusoya: seems to have been missing...
	LDA !L1y_direction
	TAX
	REP #$20
	LDA !L1yScroll		;scroll + current iteration gives value to base itself from
	LSR #4			;/16 to get into row units
	CLC
	ADC.l BG_YDisp,x	;row select is calculated
	PHA
	ASL #6			;*64 for VRAM double rows
	AND #$03FF		;force within tilemap size
	ORA #$3000		;BG1 tilemap base
	STA !L1r_addr		;destination VRAM address stored
	
;calculate column select
	LDA !L1xScroll	;xscroll requires adjustment
	LSR #4		;get into column units
	DEC #2		;two row to the left (make sure this works right)
	BPL +		;if it fell into a negative, bump it up to zero
	LDA.w #$0000
+	PHA		;now col sel is $01,s and row sel is $03,s

;initial map16 pipe update
	LDA $01,s	;column select / 16 = screen #
	LSR #4
	REP #$10
	JSR UpdatePipeMap16

;horizontal screen calculation
	LDA $01,s	;column select /16 = x screen #
	LSR #4
	STA $00		;need to multiply by 3
	ASL A		;x2
	CLC
	ADC $00		;x3
	TAY		;now is ready to access a 24bit entry
	LDA [$0A],y	;map16 lo pointer
	STA $6B
	LDA [$0D],y	;map16 hi pointer
	STA $6E
	SEP #$20
	LDA #$7E	;bank bytes, always 7E and 7F
	STA $6D
	INC A
	STA $70

;prepare column select base index
	REP #$30
	LDA $01,s	;column select is the initial index, since column bytes of the same row are adjacent anyway
	AND.w #$000F	;only 16 columns per screen
	STA $08		;store current index ot $08 as is the convention
;add row select (just *16) to this
	LDA $03,s
	ASL #4		;16 bytes per row
	TSB $08

;vram address adjustment, column select bits 0-3 and bit 4 are relevant
	LDY #$0400	;OR value if bit 4 set
	LDA $01,s
	AND.w #$0010	;check bit 4, which tilemap does it go to
	BNE +
	LDY.w #$0000	;OR value if bit 4 clear
+	STY $00
	LDA $01,s	;bit 0-3 of column select are required
	AND.w #$000F
	ASL A
	ORA $00
	ORA !L1r_addr	;updated VRAM address
	STA !L1r_addr
	
	LDY $08		;Y must be preloaded
	LDA $01,s	;column select original
	LSR #4		;but only screens numbers, make screen select
	STA $06		;the original also must be saved!

	JSR Macro_HorizontalWriterL1
	JSR CalculateVRAML1R

	PLA		;get both selects off the stack before returning ofcourse
	PLA
	PLP
	RTL

;-----

Update_L1Vert:
	PHP

;base pointer calculation      
	JSR CalculateBasePointerL1

;VRAM calculation + row select calculation
	SEP #$10
	LDA !L1y_direction
	TAX
	REP #$20
	LDA !L1yScroll	;convert current y scroll into block units
	LSR #4		;get into row select form
	CLC
	ADC.l BG_YDisp,x	
	PHA
	ASL #6		;must be *64 to access VRAM (*32 for a single row, *64 for double rows)
	AND #$03FF	;force it within the tilemap size
	ORA #$3000	;tilemap base for BG1
	STA !L1r_addr	;destination VRAM address stored

;row select defines where to load map16 pipe colors from
	LDA $01,s	;row select / 16 = screen #
	LSR #4
	REP #$10
	JSR UpdatePipeMap16

;map16 hi/lo pointer calculation
	LDA $01,s	;row select going to decide which 24bit map16 pointer to used                 
	AND.w #$01F0	;bits 4-8 hold the screen number
	LSR #4
	STA $00		;x1
	ASL 		;x2
	CLC
	ADC $00		;x3
	TAY		;screen x3 all done, index prepared
	LDA [$0A],y	;map16 lo pointer
	STA $6B
	LDA [$0D],y	;map16 hi pointer
	STA $6E
	SEP #$20              
	LDA #$7E	;7E = bank byte of map16 lo pointer
	STA $6D
	INC A		;7F = "" map16 hi pointer
	STA $70

;about to enter loop
	REP #$30
	LDA $01,s	;row select * 16 (16 byte rows in screen tables for map16) decides where ot starting reading map16hi/lo data from             
	AND.w #$000F              
	ASL #4                                     
	STA $08
	TAY		;Y must be preloaded               

	JSR Macro_HorizontalWriterFullL1
	JSR CalculateVRAML1R

	PLA		;get that address off the stack before returning
	PLP
	RTL

;-----

;using 16 horizontal strip uploads

;this one had to be made ground up because SMW doesn't even used horizontal uploads to update horizontal levels

Init_L1Horz:
	LDA $1928	;only proceed if it's the first 16 rows to upload
	AND #$10
	BEQ .proceed

	RTL

.proceed
	PHP

	JSR CalculateBasePointerL1	;setup the simple pointers required

;row select / VRAM calculation
	REP #$20

	LDA !L1yScroll	;scroll + current iteration gives value to base itself from
	LSR #4		;/16 to get into row units
	DEC A		;one row above
	PHA
	LDA $1928
	AND.w #$000F	;low byte only
	CLC
	ADC $01,s	;row select is calculated
	STA $01,s
	ASL #6		;*64 for VRAM double rows
	AND #$03FF	;force within tilemap size
	ORA #$3000	;BG1 tilemap base
	STA !L1r_addr	;destination VRAM address stored
	
;calculate column select
	LDA !L1xScroll	;xscroll requires adjustment
	LSR #4		;get into column units
	DEC #2		;two row to the left (make sure this works right)
	BPL +		;if it fell into a negative, bump it up to zero
	LDA.w #$0000
+	PHA		;now col sel is $01,s and row sel is $03,s

;initial map16 pipe update
	LDA $01,s	;column select / 16 = screen #
	LSR #4
	REP #$10
	JSR UpdatePipeMap16

;horizontal screen calculation
	LDA $01,s	;column select /16 = x screen #
	LSR #4
	STA $00		;need to multiply by 3
	ASL A		;x2
	CLC
	ADC $00		;x3
	TAY		;now is ready to access a 24bit entry
	LDA [$0A],y	;map16 lo pointer
	STA $6B
	LDA [$0D],y	;map16 hi pointer
	STA $6E
	SEP #$20
	LDA #$7E	;bank bytes, always 7E and 7F
	STA $6D
	INC A
	STA $70

;prepare column select base index
	REP #$30
	LDA $01,s	;column select is the initial index, since column bytes of the same row are adjacent anyway
	AND.w #$000F	;only 16 columns per screen
	STA $08		;store current index ot $08 as is the convention

;vram address adjustment, column select bits 0-3 and bit 4 are relevant
	LDY #$0400	;OR value if bit 4 set
	LDA $01,s
	AND.w #$0010	;check bit 4, which tilemap does it go to
	BNE +
	LDY.w #$0000	;OR value if bit 4 clear
+	STY $00
	LDA $01,s	;bit 0-3 of column select are required
	AND.w #$000F
	ASL A
	ORA $00
	ORA !L1r_addr	;updated VRAM address
	STA !L1r_addr
	
;add row select (just *16) to this
	LDA $03,s
	ASL #4		;16 bytes per row
	ORA $08
	TAY		;Y must be preloaded
	LDA $01,s	
	LSR #4		;screen select...
	STA $06

	JSR Macro_HorizontalWriterL1
	JSR CalculateVRAML1R

	PLA		;get both selects off the stack before returning ofcourse
	PLA
	PLP
	RTL

;-----

;058A9B
Init_L1Vert:
	LDA $1928	;only the first 16 rows matter for this
	AND #$10
	BEQ .proceed

	RTL
	
.proceed
	PHP

;base pointer calculation      
	JSR CalculateBasePointerL1

;VRAM calculation + row select calculation
	REP #$20
	LDA !L1yScroll	;convert current y scroll into block units
	LSR #4		;get into row select form
	DEC A		;1 row above...
	PHA
	LDA $1928	;current iteration
	AND.w #$000F	;only care about first 16 rows (even less, actually)
	CLC
	ADC $01,s
	STA $01,s	;finialised row select (in level)
	ASL #6		;must be *64 to access VRAM (*32 for a single row, *64 for double rows)
	AND #$03FF	;force it within the tilemap size
	ORA #$3000	;tilemap base for BG1
	STA !L1r_addr	;destination VRAM address stored

;initial pipe map 16 load
	LDA $01,s	;row select / 16 = screen #
	LSR #4
	REP #$10
	JSR UpdatePipeMap16

;map16 hi/lo pointer calculation
	LDA $01,s	;row select going to decide which 24bit map16 pointer to used                 
	AND.w #$01F0	;bits 4-8 hold the screen number
	LSR #4
	STA $00		;x1
	ASL 		;x2
	CLC
	ADC $00		;x3
	TAY		;screen x3 all done, index prepared
	LDA [$0A],y	;map16 lo pointer
	STA $6B
	LDA [$0D],y	;map16 hi pointer
	STA $6E
	SEP #$20              
	LDA #$7E	;7E = bank byte of map16 lo pointer
	STA $6D
	INC A		;7F = "" map16 hi pointer
	STA $70

;about to enter loop
	REP #$30
	LDA $01,s	;row select * 16 (16 byte rows in screen tables for map16) decides where ot starting reading map16hi/lo data from             
	AND.w #$000F              
	ASL #4                                     
	STA $08
	TAY		;Y must be preloaded                 

	JSR Macro_HorizontalWriterFullL1
	JSR CalculateVRAML1R

	PLA		;get that address off the stack before returning
	PLP
	RTL

;-----

Init_L2Horz:
	LDA $1928	;only proceed if it's the first 16 rows to upload
	AND #$10
	BEQ .proceed

	RTL

.proceed
	PHP

	JSR CalculateBasePointerL2	;setup the simple pointers required

;it's layer 2, so SMW does special palette handling with cave tileset
	REP #$10
	LDY.w #$0000	;OR argument outside of caves
	LDA $1931	;tileset == 3? then we're in a cave
	CMP #$03
	BNE +
	LDY #$1000	;OR argument inside of caves
+	STY $03

;row select / VRAM calculation
	REP #$20

	LDA !L2yScroll	;scroll + current iteration gives value to base itself from
	LSR #4		;/16 to get into row units
	DEC A		;one row above
	PHA
	LDA $1928
	AND.w #$000F	;low byte only
	CLC
	ADC $01,s	;row select is calculated
	STA $01,s
	ASL #6		;*64 for VRAM double rows
	AND #$03FF	;force within tilemap size
	ORA #$3800	;BG2 tilemap base
	STA !L2r_addr	;destination VRAM address stored
	
;calculate column select
	LDA !L2xScroll	;xscroll requires adjustment
	LSR #4		;get into column units
	DEC #2		;two row to the left (make sure this works right)
	BPL +		;if it fell into a negative, bump it up to zero
	LDA.w #$0000
+	PHA		;now col sel is $01,s and row sel is $03,s

;horizontal screen calculation
	LDA $01,s	;column select /16 = x screen #
	LSR #4
	STA $00		;need to multiply by 3
	ASL A		;x2
	CLC
	ADC $00		;x3
	TAY		;now is ready to access a 24bit entry
	LDA [$0A],y	;map16 lo pointer
	STA $6B
	LDA [$0D],y	;map16 hi pointer
	STA $6E
	SEP #$20
	LDA #$7E	;bank bytes, always 7E and 7F
	STA $6D
	INC A
	STA $70

;prepare column select base index
	REP #$30
	LDA $01,s	;column select is the initial index, since column bytes of the same row are adjacent anyway
	AND.w #$000F	;only 16 columns per screen
	STA $08		;store current index ot $08 as is the convention

;vram address adjustment, column select bits 0-3 and bit 4 are relevant
	LDY #$0C00	;OR value if bit 4 set
	LDA $01,s
	AND.w #$0010	;check bit 4, which tilemap does it go to
	BNE +
	LDY.w #$0800	;OR value if bit 4 clear
+	STY $00
	LDA $01,s	;bit 0-3 of column select are required
	AND.w #$000F
	ASL A
	ORA $00
	ORA !L2r_addr	;updated VRAM address
	STA !L2r_addr
	
;add row select (just *16) to this
	LDA $03,s
	ASL #4		;16 bytes per row
	ORA $08
	TAY		;Y has to be pre-loaded
	LDA $01,s	;screen select
	LSR #4
	STA $06

	JSR Macro_HorizontalWriterL2
	JSR CalculateVRAML2R

	PLA		;get both selects off the stack before returning ofcourse
	PLA
	PLP
	RTL

;----

Update_L2Vert:
	PHP

;base pointer calculation      
	JSR CalculateBasePointerL2

;it's layer 2, so SMW does special palette handling with cave tileset
	REP #$10
	LDY.w #$0000	;OR argument outside of caves
	LDA $1931	;tileset == 3? then we're in a cave
	CMP #$03
	BNE +
	LDY #$1000	;OR argument inside of caves
+	STY $03

;VRAM calculation + row select calculation
	SEP #$10
	LDA !L2y_direction
	TAX
	REP #$20
	LDA !L2yScroll	;convert current y scroll into block units
	LSR #4		;get into row select form
	CLC
	ADC.l BG_YDisp,x	
	PHA
	ASL #6		;must be *64 to access VRAM (*32 for a single row, *64 for double rows)
	AND #$03FF	;force it within the tilemap size
	ORA #$3800	;tilemap base for BG2
	STA !L2r_addr	;destination VRAM address stored

;map16 hi/lo pointer calculation
	LDA $01,s	;row select going to decide which 24bit map16 pointer to used                 
	AND.w #$01F0	;bits 4-8 hold the screen number
	LSR #4
	STA $00		;x1
	ASL 		;x2
	CLC
	ADC $00		;x3
	TAY		;screen x3 all done, index prepared
	LDA [$0A],y	;map16 lo pointer
	STA $6B
	LDA [$0D],y	;map16 hi pointer
	STA $6E
	SEP #$20              
	LDA #$7E	;7E = bank byte of map16 lo pointer
	STA $6D
	INC A		;7F = "" map16 hi pointer
	STA $70

;about to enter loop
	REP #$30
	LDA $01,s	;row select * 16 (16 byte rows in screen tables for map16) decides where ot starting reading map16hi/lo data from             
	AND.w #$000F              
	ASL #4                                     
	STA $08
	TAY		;Y must be preloaded                  

	JSR Macro_HorizontalWriterFullL2
	JSR CalculateVRAML2R

	PLA		;get that address off the stack before returning
	PLP
	RTL

;----

;058C71
Init_L2Vert:
	LDA $1928	;only the first 16 rows matter for this
	AND #$10
	BEQ .proceed

	RTL
	
.proceed
	PHP

;base pointer calculation      
	JSR CalculateBasePointerL2

;it's layer 2, so SMW does special palette handling with cave tileset
	REP #$10
	LDY.w #$0000	;OR argument outside of caves
	LDA $1931	;tileset == 3? then we're in a cave
	CMP #$03
	BNE +
	LDY #$1000	;OR argument inside of caves
+	STY $03

;VRAM calculation + row select calculation
	REP #$20
	LDA !L2yScroll	;convert current y scroll into block units
	LSR #4		;get into row select form
	DEC A		;1 row above...
	PHA
	LDA $1928	;current iteration
	AND.w #$000F	;only care about first 16 rows (even less, actually)
	CLC
	ADC $01,s
	STA $01,s	;finialised row select (in level)
	ASL #6		;must be *64 to access VRAM (*32 for a single row, *64 for double rows)
	AND #$03FF	;force it within the tilemap size
	ORA #$3800	;tilemap base for BG2
	STA !L2r_addr	;destination VRAM address stored

;map16 hi/lo pointer calculation
	LDA $01,s	;row select going to decide which 24bit map16 pointer to used                 
	AND.w #$01F0	;bits 4-8 hold the screen number
	LSR #4
	STA $00		;x1
	ASL 		;x2
	CLC
	ADC $00		;x3
	TAY		;screen x3 all done, index prepared
	LDA [$0A],y	;map16 lo pointer
	STA $6B
	LDA [$0D],y	;map16 hi pointer
	STA $6E
	SEP #$20              
	LDA #$7E	;7E = bank byte of map16 lo pointer
	STA $6D
	INC A		;7F = "" map16 hi pointer
	STA $70

;about to enter loop
	REP #$30
	LDA $01,s	;row select * 16 (16 byte rows in screen tables for map16) decides where ot starting reading map16hi/lo data from             
	AND.w #$000F              
	ASL #4                                     
	STA $08
	TAY		;Y must be preloaded

	JSR Macro_HorizontalWriterFullL2
	JSR CalculateVRAML2R

	PLA		;get that address off the stack before returning
	PLP
	RTL

;-----

Update_L2Y:
	PHP

	JSR CalculateBasePointerL2	;setup the simple pointers required

;it's layer 2, so SMW does special palette handling with cave tileset
	REP #$10
	LDY.w #$0000	;OR argument outside of caves
	LDA $1931	;tileset == 3? then we're in a cave
	CMP #$03
	BNE +
	LDY #$1000	;OR argument inside of caves
+	STY $03

;row select / VRAM calculation
	SEP #$10        ;fusoya: seems to have been missing...
	LDA !L2y_direction
	TAX
	REP #$20
	LDA !L2yScroll		;scroll + current iteration gives value to base itself from
	LSR #4			;/16 to get into row units
	CLC
	ADC.l BG_YDisp,x	;row select is calculated
	PHA
	ASL #6			;*64 for VRAM double rows
	AND #$03FF		;force within tilemap size
	ORA #$3800		;BG2 tilemap base
	STA !L2r_addr		;destination VRAM address stored
	
;calculate column select
	LDA !L2xScroll	;xscroll requires adjustment
	LSR #4		;get into column units
	DEC #2		;two row to the left (make sure this works right)
	BPL +		;if it fell into a negative, bump it up to zero
	LDA.w #$0000
+	PHA		;now col sel is $01,s and row sel is $03,s

;row select decides pipe map 16 load
	LDA $01,s	;row select / 16 = screen #
	LSR #4
	REP #$10
	JSR UpdatePipeMap16

;horizontal screen calculation
	LDA $01,s	;column select /16 = x screen #
	LSR #4
	STA $00		;need to multiply by 3
	ASL A		;x2
	CLC
	ADC $00		;x3
	TAY		;now is ready to access a 24bit entry
	LDA [$0A],y	;map16 lo pointer
	STA $6B
	LDA [$0D],y	;map16 hi pointer
	STA $6E
	SEP #$20
	LDA #$7E	;bank bytes, always 7E and 7F
	STA $6D
	INC A
	STA $70

;prepare column select base index
	REP #$30
	LDA $01,s	;column select is the initial index, since column bytes of the same row are adjacent anyway
	AND.w #$000F	;only 16 columns per screen
	STA $08		;store current index ot $08 as is the convention
;add row select (just *16) to this
	LDA $03,s
	ASL #4		;16 bytes per row
	TSB $08

;vram address adjustment, column select bits 0-3 and bit 4 are relevant
	LDY #$0C00	;OR value if bit 4 set
	LDA $01,s
	AND.w #$0010	;check bit 4, which tilemap does it go to
	BNE +
	LDY.w #$0800	;OR value if bit 4 clear
+	STY $00
	LDA $01,s	;bit 0-3 of column select are required
	AND.w #$000F
	ASL A
	ORA $00
	ORA !L2r_addr	;updated VRAM address
	STA !L2r_addr
	
	LDY $08		;Y must be preloaded
	LDA $01,s	;column select to screen select...
	LSR #4
	STA $06

	JSR Macro_HorizontalWriterL2
	JSR CalculateVRAML2R

	PLA		;get both selects off the stack before returning ofcourse
	PLA
	PLP
	RTL

;-----

CalculateBasePointerL1:
	REP #$30
	LDA $1925        ;level mode decides what base pointers to load...
	AND.w #$00FF
	ASL
	TAX
	LDA Ptrs00BDA8,x  	;for map16 lo
	STA $0A
	LDA Ptrs00BE28,x 	;for map16 hi
	STA $0D
	SEP #$20
	LDA.b #$00  ;LM 1.70, bank is 00 for SMW, 30 for SMAS+W
	STA $0C   	;24bit pointers
	STA $0F

	RTS

;	SEP #$20            
;	LDA $00BDA8,x  	;for map16 lo      
;	STA $0A                   
;	LDA $00BDA8+1,x      
;	STA $0B                   
;	LDA $00BE28,x 	;for map16 hi       
;	STA $0D                   
;	LDA $00BE28+1,x      
;	STA $0E                         	      
;	STZ $0C   	;24bit pointers, so force banks on both to the original (00)                    
;	STZ $0F
;
;	RTS

CalculateBasePointerL2:
	REP #$30
	LDA $1925        ;level mode decides what base pointers to load...
	AND.w #$00FF
	ASL
	TAX
	LDA Ptrs00BDE8,x  	;for map16 lo      
	STA $0A                   
	LDA Ptrs00BE68,x 	;for map16 hi       
	STA $0D
	SEP #$20
	LDA.b #$00  ;LM 1.70, bank is 00 for SMW, 30 for SMAS+W
	STA $0C   	;24bit pointers
	STA $0F

	RTS


;	SEP #$20            
;	LDA $00BDE8,x  	;for map16 lo      
;	STA $0A                   
;	LDA $00BDE8+1,x      
;	STA $0B                   
;	LDA $00BE68,x 	;for map16 hi       
;	STA $0D                   
;	LDA $00BE68+1,x      
;	STA $0E                         	      
;	STZ $0C   	;24bit pointers, so force banks on both to the original (00)                    
;	STZ $0F
;
;	RTS

;-----

;CODE_058DC8:        A0 0D         LDY.B #$0D                
;CODE_058DCA:        84 0C         STY $0C 	;<-lunar magic changes the operand to the bank # where the map16 data is
;$05/8DA1 A9 00 80    LDA #$8000              A:BD00 X:006C Y:0030 D:0000 DB:00 S:01F3 P:eNvmXdizcHC:1248 VC:192 00 FL:301 ;<-this is originally $9100 in ROM, changes to $8000 with lunar magic possibly
;$05/8DA4 85 0A       STA $0A    [$00:000A]   A:8000 X:006C Y:0030 D:0000 DB:00 S:01F3 P:eNvmXdizcHC:1280 VC:192 00 FL:301

;058D7A



Init_BG2:
	LDA $1928	;do not care beyond the first 16 since that's all the tilemap can fit anyway, plus screen is too small
	AND #$10
	BEQ .proceed

	RTL		

;base pointer setup
.proceed

	LDA $7FC00B	;LM, low bit enabled means direct tilemap
	LSR A
	BCC +
	BRL BG2_DirectInit

+	REP #$20	;base pointers for map16 for backgrounds	
	LDA #$B900	;map16 lo              
	STA $6B                   
	LDA #$BD00 	;map16 high             
	STA $6E

;	LDA $058DA2	;map16 tilemap data location in ROM...changes with hack!
;	STA $0A
	JSL GetBGMap16Page	;LM 1.67, get BG Map16 pointer

	LDA $05		;copy size of BG over to free RAM
	STA !BG2_size

	LDA $0A		;each pointer below is offset by 2 bytes to avoid the constant double INY
	INC A		
	INC A
	STA $0D
	INC A
	INC A
	STA $00
	INC A
	INC A
	STA $03

 	SEP #$20
	LDA #$7E	;bank bytes for map16 data are the same for the initialisation      
	STA $6D                       
	STA $70
;	LDA $058DC9	;bank byte for the map16 tilemap data...changes with hack!
;	STA $0C
	LDA $0C		;LM 1.67, bank byte is already there
	STA $0F
	STA $02
	STA $05
 
;copy both 1KB tables in chunks because they're potentially getting trashed
	REP #$30	;slow loop doesn't matter, it's literally unnoticable
	LDY.w #$0040/2	;64 * 16 = 1024 table in whole
	LDA $1928	;current iteration * 64
	AND.w #$000F
	ASL #6
	TAX
-	LDA $7EB900,x	;save a word from each
	STA !ram_bgA,x
	LDA $7EBD00,x
	STA !ram_bgB,x
	INX
	INX
	DEY
	BNE -

;address for VRAM and level source setup
	LDA !L2yScroll	;convert current y scroll into block units
	SEC
	SBC.w #$0010	;one tile higher, to cover entire display area
	PHA
	LDA $1928	;current iteration
	AND.w #$000F
	ASL #4		;*16 for 16 byte rows
	CLC
	ADC $01,s	;add with prepared yscroll

	AND #$01F0

	STA $01,s	;row index is ready now
	ASL #2		;currently *16 for accessing map16 table, must be *64 to access VRAM (*32 for a single row, *64 for double rows)
	AND #$03FF	;force it within the tilemap size
	ORA #$3800		;tilemap base for BG2
	STA !L2r_addr	;destination VRAM address stored

	;LDA $01,s	;simple mod $1B0 to force tilemap within range

	;SEC
-	;SBC #$01B0
	;BCS -
	;ADC #$01B0

	;STA $08
	LDA $01,s
	STA $08		;recalculated scroll index

	REP #$10
	TAY		;Y must be preloaded

	JSR Macro_HorizontalBG2Writer
	JSR CalculateVRAML2R

	PLA		;get that address off stack before returning
	SEP #$30
	RTL

;-----

Update_BG2Y:
	LDA $7FC00B	;LM, low bit enabled means direct tilemap
	LSR A
	BCC +
	BRL BG2_DirectUpdate_Y

+	REP #$20		;base pointers for map16 for backgrounds	
	LDA.w #!ram_bgA		;map16 lo              
	STA $6B                   
	LDA.w #!ram_bgB		;map16 high             
	STA $6E

;	LDA $058DA2		;map16 tilemap data location in ROM...changes with hack!
;	STA $0A
	JSL GetBGMap16Page		;LM 1.67, get BG Map16 pointer
	LDA $0A			;
	INC A			;each pointer below is offset by 2 bytes to avoid the constant double INY
	INC A
	STA $0D
	INC A
	INC A
	STA $00
	INC A
	INC A
	STA $03

 	SEP #$20
	LDA.b #!ram_bgA>>16	;different bank bytes from initialisation    
	STA $6D
	LDA.b #!ram_bgB>>16                             
	STA $70
;	LDA $058DC9		;bank byte for the map16 tilemap data...changes with hack!
;	STA $0C
	LDA $0C		;LM 1.67, bank byte is already there
	STA $0F
	STA $02
	STA $05

;address for VRAM and level source setup
	LDA !L2y_direction	;direction decides displacement
	SEP #$10
	TAX
	REP #$20
	LDA !L2yScroll	;convert current y scroll into block units
	AND #$FFF0	;/16 and then *16 so
	PHA
	LDA.l BG_YDisp,x	;add displacement based on where we are headed
	ASL #4			;*16 for 16 byte rows
	CLC
	ADC $01,s

	AND #$01F0

	STA $01,s
	ASL #2		;currently *16 for accessing map16 table, must be *64 to access VRAM (*32 for a single row, *64 for double rows)
	AND #$03FF	;force it within the tilemap size
	ORA #$3800	;tilemap base for BG2
	STA !L2r_addr	;destination VRAM address stored (this responds on vertical scrolling BUT the VRAM upload is horizontal strips)

	;LDA $01,s	;simple mod $1B0 to force tilemap within range

	;SEC
-	;SBC #$01B0
	;BCS -
	;ADC #$01B0

	;STA $08		;recalculated scroll index
	LDA $01,s
	STA $08

	REP #$10
	TAY		;Y must be preloaded

	JSR Macro_HorizontalBG2Writer
	JSR CalculateVRAML2R

	PLA		;get that address off stack before returning
	SEP #$30

	RTL

;-----

BG_YDisp:
	dw $0000,$000E	;moving up, moving down
BG_XDisp:
	dw $FFFF,$0011	;moving left, moving right

;manually force an update of the pipe map16 colors according to screen # in 16bit A
;----------------------------------------------------------------------------------

;just a macro to make stuff run faster

macro map16pipechange(step)
	STA.w ((<step>+$0133)*2)+Map16Pointers
	ADC.w #$0008
endmacro

UpdatePipeMap16:
	PHX

	ASL A		;x2 for each pointer
	AND.w #$0006	;four 16bit pointers	
	TAX
	LDA MAP16AppTable,x
	CLC		;carry need only be cleared a single time

	%map16pipechange(0)
	%map16pipechange(1)
	%map16pipechange(2)
	%map16pipechange(3)
	%map16pipechange(4)
	%map16pipechange(5)
	%map16pipechange(6)
	%map16pipechange(7)

	PLX
	RTS
;store scrolls values -> previous values address in RAM
;------------------------------------------------------

StorePreviousScroll:
	SBC.w #$000C	;restored code
	STA $142C
	PHA		;have to preserve this...

	LDX #$06	;loop count
-	LDA !L1xScroll,x
	STA !L1x_prevscroll,x
	DEX
	DEX
	BPL -

	PLA		;...and restore it
	JML UpdateScreenPosition2	;back to SMW
;	RTL
;calculate scroll direction based on (expected to be) current values and previous values
;---------------------------------------------------------------------------------------

CalculateScrollDirection:	;this MUST run after all changes to the scroll values have been made
	LDX #$07 		;restored code         
-	LDA !L1xScroll,x  
	STA $1462,X             
	DEX                       
	BPL -			;end restored code 

	PHP

	LDX #$06		;read index
	LDY #$03		;write index
-	REP #$20
	LDA !L1xScroll,x	;current scroll value...
	CMP !L1x_prevscroll,x	;subtracting previous means carry is set if previous was smaller i.e. if current >= previous (going right or going down)
	BEQ .next		;do not set direction if equal, there is no point in that
	SEP #$20
	ROL A			;need to get carry into bit 1
	ASL A
	AND #$02		;and only bit 1 (00 or 02 only possible values)
	PHX
	TYX
	STA !L1x_direction,x
	PLX
.next
	DEX
	DEX
	DEY
	BPL -

	PLP
;	JML $00F7F2	;back to SMW
	PLB : RTL
;sets the last updated scroll addresses to FFFF (force update)
;-------------------------------------------------------------
ScreenSetupHack:
	STZ $143A	;-restored code-

	JSR CustomScreenSetup

	JML AfterScreenSetup
CustomScreenSetup:
;custom version of SetUpScreen
	STZ $2133               ; Set "Screen Initial Settings" to x00 ; Screen Initial Settings
	STZ $2106               ; Turn off mosaic ; Mosaic Size and BG Enable

	;LDA #$23         
	LDA #$31	;$3000 and 64x32 tilemap       
	STA $2107               ; BG 1 Address and Size
	;LDA #$33	;original value for BG2
	LDA #$39	;$3800 and 64x32 tilemap   
	STA $2108               ; ; BG 2 Address and Size

	LDA #$53                
	STA $2109               ; BG 3 Address and Size
	LDA #$00                
	STA $210B               ; BG 1 & 2 Tile Data Designation
	LDA #$04                
	STA $210C               ; BG 3 & 4 Tile Data Designation
	STZ $41                   
	STZ $42                   
	STZ $43                   
	STZ $212A               ; BG 1, 2, 3 and 4 Window Logic Settings
	STZ $212B               ; Color and OBJ Window Logic Settings
	STZ $212E               ; Window Mask Designation for Main Screen
	STZ $212F               ; Window Mask Designation for Sub Screen
	LDA #$02                
	STA $44                   
	LDA #$80                ; \ Set Mode7 "Screen Over" to %10000000, disable Mode7 flipping 
	STA $211A               ; /  ; Initial Setting for Mode 7

	RTS
InitLastUpdates:
	STA $4D	;restored code
	STA $4F

	LDX.w #$000E
-	STA !L1x_lastupdate,x	;since A already contains FFFF...
	DEX
	DEX
	BPL -

	LDA.w #$0202		;also initialise direction, just forcing it down/right.  titlescreen ends up looking wierd without doing this
	STA !L1x_direction
	STA !L2x_direction

	JML ReturnInitLastUpdates	;back to SMW
RTL
;checks layers for possible updates, updates if necessary
;--------------------------------------------------------

!mask = $FFF0

CheckLayerUpdates:
	SEP #$30		;restored code

	LDX $0100		;ending credits?
	CPX #$20
	BCC +

;ending, don't deviate from original code
	LDA $5B			;restoring code..
	JML CODE_0586F1_Part2		;back to SMW
;TL
;L1 x axis
+	LDA.l !L1x_direction	;test x first..
	TAX
	REP #$20
	LDA !L1xScroll		;compare the current xscroll to the last updated one...
	AND #!mask 
	CMP !L1x_lastupdate,x
	BEQ +			;branch if no update needed.
	STA !L1x_lastupdate,x
	TXA
	EOR.w #$0002		;modify opposite direction word
	TAX
	LDA #$FFFF
	STA !L1x_lastupdate,x	;so forcing update when opposite direction happens

	PHP
	JSL L1GameplayX_Hack
	PLP

;L1 y axis	
+	LDA !L1y_direction	;as above, just with Y this time (yes it's 16bit A but it doesn't matter for this actually
	TAX
	LDA !L1yScroll
	AND #!mask 
	CMP !L1y_lastupdate,x
	BEQ +
	STA !L1y_lastupdate,x
	TXA
	EOR.w #$0002
	TAX
	LDA #$FFFF
	STA !L1y_lastupdate,x

	PHP
	JSL L1GameplayY_Hack
	PLP

;L2 x axis
+	LDA !L2x_direction
	TAX
	LDA !L2xScroll
	AND #!mask 
	CMP !L2x_lastupdate,x
	BEQ +
	STA !L2x_lastupdate,x
	TXA
	EOR.w #$0002
	TAX
	LDA #$FFFF
	STA !L2x_lastupdate,x

	PHP
	JSL L2GameplayX_Hack
	PLP

;L2 y axis
+	LDA !L2y_direction
	TAX
	LDA !L2yScroll
	AND #!mask 
	CMP !L2y_lastupdate,x
	BEQ .return
	STA !L2y_lastupdate,x
	TXA
	EOR.w #$0002
	TAX
	LDA #$FFFF
	STA !L2y_lastupdate,x

	PHP
	JSL L2GameplayY_Hack
	PLP

.return
	JML CODE_058774	;back to SMW

;-----

CalculateVRAML1R:
	%calculatevramr(!L1r_addr, !L1r_buffer, !L1r_dmavram1, !L1r_dmasize1, !L1r_dmasource1)
	RTS
CalculateVRAML2R:
	%calculatevramr(!L2r_addr, !L2r_buffer, !L2r_dmavram1, !L2r_dmasize1, !L2r_dmasource1)
	RTS

CalculateVRAML1C:
	%calculatevramc(!L1c_addr, !L1c_buffer, !L1c_dmavram1, !L1c_dmasize1, !L1c_dmasource1)
	RTS
CalculateVRAML2C:
	%calculatevramc(!L2c_addr, !L2c_buffer, !L2c_dmavram1, !L2c_dmasize1, !L2c_dmasource1)
	RTS




BG2_DirectUpdate_Y:
;address for VRAM and level source setup
	LDA !L2y_direction	;direction decides displacement
	SEP #$10
	TAX
	REP #$20
	LDA !L2yScroll	;convert current y scroll into block units
	AND #$FFF0	;/16 and then *16 so
	PHA
	LDA.l BG_YDisp,x	;add displacement based on where we are headed

	REP #$10
	BRA DoRestBG2


BG2_DirectInit:
;address for VRAM and level source setup
	REP #$30
	LDA !L2yScroll	;convert current y scroll into block units
	SEC
	SBC.w #$0010	;one tile higher, to cover entire display area
	PHA
	LDA $1928	;current iteration
	AND.w #$000F
DoRestBG2:
	ASL #4		;*16 for 16 byte rows
	CLC
	ADC $01,s	;add with prepared yscroll

	AND #$01F0

	STA $01,s	;row index is ready now
	ASL #2		;currently *16 for accessing map16 table, must be *64 to access VRAM (*32 for a single row, *64 for double rows)
	AND #$03FF	;force it within the tilemap size
	ORA #$3800		;tilemap base for BG2
	STA !L2r_addr	;destination VRAM address stored

	LDA $01,s
	STA $08		;recalculated scroll index

;	TAY		;Y must be preloaded

	PHB    ;save DB from MVN, dest already bank 0 but is 30 in SMAS+W so required
	ASL #3 ;16->128
	CMP.w #$0800
	BCC +
	CLC
	ADC.w #$0800 ;access second part of tilemap
+	ADC.w #$2000 ;add offset of src (use 7F:2000)
	TAX          ;src
	LDY.w #!L2r_buffer ;dest
	LDA.w #$0040-1     ;32 tiles *2 for tilemap data
	MVN $7F00    ;src,dest

	TXA
	CLC
	ADC.w #$0800-64 ;next half of row on right side of tilemap
	TAX
	LDA.w #$0040-1     ;32 tiles *2 for tilemap data
	MVN $7F00     ;src,dest

	TXA
	SEC
	SBC.w #$0800 ;second row on lower left of tilemap
	TAX
	LDA.w #$0040-1     ;32 tiles *2 for tilemap data
	MVN $7F00     ;src,dest

	TXA
	CLC
	ADC.w #$0800-64 ;next half of row on right side of tilemap
	TAX
	LDA.w #$0040-1     ;32 tiles *2 for tilemap data
	MVN $7F00      ;src,dest

	PLB    ;restore DB from MVN

;	LDX.w #$0100-2	;test loop to convert overworld tiles to use GFX tiles 0x200+
;	LDY.w #$0200
;-	TYA
;	ORA.w !L2r_buffer,x
;	STA.w !L2r_buffer,x
;	DEX
;	DEX
;	BPL -

;	JSR Macro_HorizontalBG2Writer
	JSR CalculateVRAML2R

	PLA		;get that address off stack before returning
	SEP #$30
	RTL
Macro_HorizontalWriterL1:
	%horizontalL1writer(!L1r_buffer, $00)	;$14 TIMES
	%horizontalL1writer(!L1r_buffer, $01)
	%horizontalL1writer(!L1r_buffer, $02)
	%horizontalL1writer(!L1r_buffer, $03)
	%horizontalL1writer(!L1r_buffer, $04)
	%horizontalL1writer(!L1r_buffer, $05)
	%horizontalL1writer(!L1r_buffer, $06)
	%horizontalL1writer(!L1r_buffer, $07)
	%horizontalL1writer(!L1r_buffer, $08)
	%horizontalL1writer(!L1r_buffer, $09)
	%horizontalL1writer(!L1r_buffer, $0A)
	%horizontalL1writer(!L1r_buffer, $0B)
	%horizontalL1writer(!L1r_buffer, $0C)
	%horizontalL1writer(!L1r_buffer, $0D)
	%horizontalL1writer(!L1r_buffer, $0E)
	%horizontalL1writer(!L1r_buffer, $0F)
	%horizontalL1writer(!L1r_buffer, $10)
	%horizontalL1writer(!L1r_buffer, $11)
	%horizontalL1writer(!L1r_buffer, $12)
	%horizontalL1writer(!L1r_buffer, $13)

	RTS

Macro_VerticalWriterL1:
	%verticalL1writer(!L1c_buffer, $00)	;$0F TIMES
	%verticalL1writer(!L1c_buffer, $01)
	%verticalL1writer(!L1c_buffer, $02)
	%verticalL1writer(!L1c_buffer, $03)
	%verticalL1writer(!L1c_buffer, $04)
	%verticalL1writer(!L1c_buffer, $05)
	%verticalL1writer(!L1c_buffer, $06)
	%verticalL1writer(!L1c_buffer, $07)
	%verticalL1writer(!L1c_buffer, $08)
	%verticalL1writer(!L1c_buffer, $09)
	%verticalL1writer(!L1c_buffer, $0A)
	%verticalL1writer(!L1c_buffer, $0B)
	%verticalL1writer(!L1c_buffer, $0C)
	%verticalL1writer(!L1c_buffer, $0D)
	%verticalL1writer(!L1c_buffer, $0E)
	%verticalL1writer(!L1c_buffer, $0F)

	RTS

Macro_HorizontalWriterL2:
	%horizontalL2writer(!L2r_buffer, $00)	;$14 TIMES
	%horizontalL2writer(!L2r_buffer, $01)
	%horizontalL2writer(!L2r_buffer, $02)
	%horizontalL2writer(!L2r_buffer, $03)
	%horizontalL2writer(!L2r_buffer, $04)
	%horizontalL2writer(!L2r_buffer, $05)
	%horizontalL2writer(!L2r_buffer, $06)
	%horizontalL2writer(!L2r_buffer, $07)
	%horizontalL2writer(!L2r_buffer, $08)
	%horizontalL2writer(!L2r_buffer, $09)
	%horizontalL2writer(!L2r_buffer, $0A)
	%horizontalL2writer(!L2r_buffer, $0B)
	%horizontalL2writer(!L2r_buffer, $0C)
	%horizontalL2writer(!L2r_buffer, $0D)
	%horizontalL2writer(!L2r_buffer, $0E)
	%horizontalL2writer(!L2r_buffer, $0F)
	%horizontalL2writer(!L2r_buffer, $10)
	%horizontalL2writer(!L2r_buffer, $11)
	%horizontalL2writer(!L2r_buffer, $12)
	%horizontalL2writer(!L2r_buffer, $13)

	RTS

Macro_VerticalWriterL2:
	%verticalL2writer(!L2c_buffer, $00)	;$0F TIMES
	%verticalL2writer(!L2c_buffer, $01)
	%verticalL2writer(!L2c_buffer, $02)
	%verticalL2writer(!L2c_buffer, $03)
	%verticalL2writer(!L2c_buffer, $04)
	%verticalL2writer(!L2c_buffer, $05)
	%verticalL2writer(!L2c_buffer, $06)
	%verticalL2writer(!L2c_buffer, $07)
	%verticalL2writer(!L2c_buffer, $08)
	%verticalL2writer(!L2c_buffer, $09)
	%verticalL2writer(!L2c_buffer, $0A)
	%verticalL2writer(!L2c_buffer, $0B)
	%verticalL2writer(!L2c_buffer, $0C)
	%verticalL2writer(!L2c_buffer, $0D)
	%verticalL2writer(!L2c_buffer, $0E)
	%verticalL2writer(!L2c_buffer, $0F)

	RTS

Macro_HorizontalWriterFullL1:
	%horizontalL1writerfull(!L1r_buffer, $00)	;$20 TIMES
	%horizontalL1writerfull(!L1r_buffer, $01)
	%horizontalL1writerfull(!L1r_buffer, $02)
	%horizontalL1writerfull(!L1r_buffer, $03)
	%horizontalL1writerfull(!L1r_buffer, $04)
	%horizontalL1writerfull(!L1r_buffer, $05)
	%horizontalL1writerfull(!L1r_buffer, $06)
	%horizontalL1writerfull(!L1r_buffer, $07)
	%horizontalL1writerfull(!L1r_buffer, $08)
	%horizontalL1writerfull(!L1r_buffer, $09)
	%horizontalL1writerfull(!L1r_buffer, $0A)
	%horizontalL1writerfull(!L1r_buffer, $0B)
	%horizontalL1writerfull(!L1r_buffer, $0C)
	%horizontalL1writerfull(!L1r_buffer, $0D)
	%horizontalL1writerfull(!L1r_buffer, $0E)
	%horizontalL1writerfull(!L1r_buffer, $0F)
	%fullwriteradjustment()
	%horizontalL1writerfull(!L1r_buffer, $10)
	%horizontalL1writerfull(!L1r_buffer, $11)
	%horizontalL1writerfull(!L1r_buffer, $12)
	%horizontalL1writerfull(!L1r_buffer, $13)
	%horizontalL1writerfull(!L1r_buffer, $14)
	%horizontalL1writerfull(!L1r_buffer, $15)
	%horizontalL1writerfull(!L1r_buffer, $16)
	%horizontalL1writerfull(!L1r_buffer, $17)
	%horizontalL1writerfull(!L1r_buffer, $18)
	%horizontalL1writerfull(!L1r_buffer, $19)
	%horizontalL1writerfull(!L1r_buffer, $1A)
	%horizontalL1writerfull(!L1r_buffer, $1B)
	%horizontalL1writerfull(!L1r_buffer, $1C)
	%horizontalL1writerfull(!L1r_buffer, $1D)
	%horizontalL1writerfull(!L1r_buffer, $1E)
	%horizontalL1writerfull(!L1r_buffer, $1F)

	RTS

Macro_HorizontalWriterFullL2:
	%horizontalL2writerfull(!L2r_buffer, $00)	;$20 TIMES
	%horizontalL2writerfull(!L2r_buffer, $01)
	%horizontalL2writerfull(!L2r_buffer, $02)
	%horizontalL2writerfull(!L2r_buffer, $03)
	%horizontalL2writerfull(!L2r_buffer, $04)
	%horizontalL2writerfull(!L2r_buffer, $05)
	%horizontalL2writerfull(!L2r_buffer, $06)
	%horizontalL2writerfull(!L2r_buffer, $07)
	%horizontalL2writerfull(!L2r_buffer, $08)
	%horizontalL2writerfull(!L2r_buffer, $09)
	%horizontalL2writerfull(!L2r_buffer, $0A)
	%horizontalL2writerfull(!L2r_buffer, $0B)
	%horizontalL2writerfull(!L2r_buffer, $0C)
	%horizontalL2writerfull(!L2r_buffer, $0D)
	%horizontalL2writerfull(!L2r_buffer, $0E)
	%horizontalL2writerfull(!L2r_buffer, $0F)
	%fullwriteradjustment()
	%horizontalL2writerfull(!L2r_buffer, $10)
	%horizontalL2writerfull(!L2r_buffer, $11)
	%horizontalL2writerfull(!L2r_buffer, $12)
	%horizontalL2writerfull(!L2r_buffer, $13)
	%horizontalL2writerfull(!L2r_buffer, $14)
	%horizontalL2writerfull(!L2r_buffer, $15)
	%horizontalL2writerfull(!L2r_buffer, $16)
	%horizontalL2writerfull(!L2r_buffer, $17)
	%horizontalL2writerfull(!L2r_buffer, $18)
	%horizontalL2writerfull(!L2r_buffer, $19)
	%horizontalL2writerfull(!L2r_buffer, $1A)
	%horizontalL2writerfull(!L2r_buffer, $1B)
	%horizontalL2writerfull(!L2r_buffer, $1C)
	%horizontalL2writerfull(!L2r_buffer, $1D)
	%horizontalL2writerfull(!L2r_buffer, $1E)
	%horizontalL2writerfull(!L2r_buffer, $1F)

	RTS

Macro_HorizontalBG2Writer:
	%horizontalBG2writer(!L2r_buffer, $00)	;$20 TIMES
	%horizontalBG2writer(!L2r_buffer, $01)
	%horizontalBG2writer(!L2r_buffer, $02)
	%horizontalBG2writer(!L2r_buffer, $03)
	%horizontalBG2writer(!L2r_buffer, $04)
	%horizontalBG2writer(!L2r_buffer, $05)
	%horizontalBG2writer(!L2r_buffer, $06)
	%horizontalBG2writer(!L2r_buffer, $07)
	%horizontalBG2writer(!L2r_buffer, $08)
	%horizontalBG2writer(!L2r_buffer, $09)
	%horizontalBG2writer(!L2r_buffer, $0A)
	%horizontalBG2writer(!L2r_buffer, $0B)
	%horizontalBG2writer(!L2r_buffer, $0C)
	%horizontalBG2writer(!L2r_buffer, $0D)
	%horizontalBG2writer(!L2r_buffer, $0E)
	%horizontalBG2writer(!L2r_buffer, $0F)
	%BG2writeradjustment()
	%horizontalBG2writer(!L2r_buffer, $10)
	%horizontalBG2writer(!L2r_buffer, $11)
	%horizontalBG2writer(!L2r_buffer, $12)
	%horizontalBG2writer(!L2r_buffer, $13)
	%horizontalBG2writer(!L2r_buffer, $14)
	%horizontalBG2writer(!L2r_buffer, $15)
	%horizontalBG2writer(!L2r_buffer, $16)
	%horizontalBG2writer(!L2r_buffer, $17)
	%horizontalBG2writer(!L2r_buffer, $18)
	%horizontalBG2writer(!L2r_buffer, $19)
	%horizontalBG2writer(!L2r_buffer, $1A)
	%horizontalBG2writer(!L2r_buffer, $1B)
	%horizontalBG2writer(!L2r_buffer, $1C)
	%horizontalBG2writer(!L2r_buffer, $1D)
	%horizontalBG2writer(!L2r_buffer, $1E)
	%horizontalBG2writer(!L2r_buffer, $1F)

	RTS
WallKickAbility:
		STZ $1888
		STZ $1889
		
		LDA $77
		AND #$04
		BEQ .in_air
		
		STZ !WallKickFlags
		RTL
		
	.in_air	LDA !WallKickFlags
		AND #$03
		BNE .slide
		
		LDA !WallKick_no_back_timer
		BEQ +
		
		DEC !WallKick_no_back_timer
		LDA !WallKickFlags
		LSR
		LSR
		TRB $15
		TRB $16
		
	+	LDA $7D
		BMI .return	
		LDA $71
		ORA $73
		ORA $74
		ORA $75
		ORA $1407
		ORA $140D
		ORA $1470
		ORA $1493
		ORA $187A
		BNE .return
		LDA $7E
		CMP #$0B
		BCC .return
		CMP #$E6
		BCS .return
		LDA !WallKickFlags
		LSR
		LSR
		AND $77
		BNE .return
		LDA $15
		AND #$03
		CMP #$03
		BEQ .return
		LDA $15
		AND $77
		BEQ .return
		
		STA !WallKickFlags
		LDA $7D
		STA !WallKick_temp_y_spd
	.return	RTL

	.stop	STZ !WallKickFlags
		RTL
	
	.slide	LDA $71
		ORA $75
		ORA $1470
		ORA $187A
		BNE .stop
		LDA $7B
		CLC
		ADC #$07
		CMP #$0F
		BCS .stop
		LDA $15
		AND #$03
		CMP #$03
		BEQ .stop
		LDA $15
		AND !WallKickFlags
		BEQ .stop
		
		LDA #$40
		TRB $15
		TRB $16
		
		LDA !WallKickFlags
		DEC
		STA $76
		
		LDA $16
		BMI .kick
		LDA $14
		AND #$07
		BNE ++
		
		LDX $76
		LDY #$03
	-	LDA $17C0,y
		BNE +
		
		LDA #$03
		STA $17C0,y
		LDA $94
		CLC
		ADC.l smoke_x_offsets,x
		STA $17C8,y
		LDA $96
		CLC
		ADC #$10
		STA $17C4,y
		LDA #$13
		STA $17CC,y
		BRA ++
		
	+	DEY
		BPL -

	++	LDA #$0D
		STA $13E0
		
		LDA !WallKick_temp_y_spd
		CLC
		ADC #!slide_accel
		STA $7D
		STA !WallKick_temp_y_spd
		BMI .return2
		CMP #!slide_speed
		BCC .return2
		LDA #!slide_speed
		STA $7D
		STA !WallKick_temp_y_spd
.return2
		RTL
 
	.kick
    LDA #!JumpSFX
		STA !JumpSFXPort
	+++	INC $1406
	        LDA #!WallSFX
		STA !WallSFXPort
		
		
		LDA #$0B
		STA $72
		LDA #!kick_y_speed
		STA $7D
		
		LDX $76
		LDA.l wall_kick_x_speeds,x
		STA $7B
		
		LDA !WallKickFlags
		TRB $15
		TRB $16
		ASL
		ASL
		STA !WallKickFlags
		
		LDA #!no_back_time
		STA !WallKick_no_back_timer
		
		LDY #$03
	-	LDA $17C0,y
		BNE +
		
		INC
		STA $17C0,y
		LDA $94
		STA $17C8,y
		LDA $96
		CLC
		ADC #$10
		STA $17C4,y
		LDA #$10
		STA $17CC,y
		RTL
		
	+	DEY
		BPL -
		RTL

smoke_x_offsets:
		db $0C,$FE

wall_kick_x_speeds:
		db !kick_x_speed^$FF+1,!kick_x_speed

NoPoundAndDelay:
STZ !GroundPndTimer

NoPound:
STZ !GroundPndFlag		;disable ground pound (branch out of bounds edition).
RTL

GroundPoundAbility:
LDA $9D				;freeze flag (hurt, pickup power-up, growing yoshi, etc.)
LDA $13D4			;no pause
ORA $1426			;no message box (which stops action)
ORA !WallKickFlags
BNE .Re

LDA $74				;no climbing
ORA $1407			;no flying
ORA $75				;can't ground pound underwater
ORA $1470			;\not when carrying an item
ORA $148F			;/
ORA $187A			;not when riding a yoshi (don't feel like offsetting position + yellow shell/yoshi shenanigans)
ORA $1493			;not when goal
BNE NoPound			;reset ground pound state if any of this is true

LDA $71				;check various player animations, like death, entering level via pipe, door, and etc.
BNE NoPound 			;

LDA !GroundPndFlag		;
BNE .GroundPoundin		;

LDA $72				;can only ground pound when in air
BEQ NoPoundAndDelay		;

LDA !GroundPndTimer		;delay
BNE .ReTimer			;

LDA !GPControllerTrigger		;check for controller input that triggers ground pound
AND #!GPButtonTrigger		;
BEQ .Re				;

LDA #!GroundPndAirStay		;
STA !GroundPndTimer		;set short timer to stay in air

if !MaxSpeed > !GroundPndSpeed && !GPCancelButton != !Down
  LDA #!GroundPndSpeed
  STA !GroundPndFlag		;
else
  INC !GroundPndFlag		;
endif

STZ $140D			;disable spinjump
STZ $73				;no duck jump
LDA #$24
STA $72					;break sprint jump state
STZ $13E4			;something about run-jumping
STZ $14A6			;no cape swinging allowed
JSR DisableSomeButtons		;frame perfect cape swing

LDA #!GroundPndStartSound	;play sound
STA !GroundPndStartBank		;

STZ $7D				;no Y Spd

.Re
RTL				;

.ReTimer
DEC !GroundPndTimer		;
RTL				;

.GroundPoundin
STZ $7B				;no X Spd

JSR DisableSomeButtons		;no X/Y and left/right input

LDA #!GroundPndFrame		;set ground pound frame
STA $13E0			;

LDA !GroundPndTimer		;stay in air for a little bit
BEQ .Move			;untill timer is zero
DEC !GroundPndTimer		;tick timer

LDA $7D				;chuck and disco shell
BMI .NoPoundAndDelay		;

STZ $7D				;
BRA .CheckGround		;fix ground rising up thing

.Move
LDA !GPCancelControllerTrigger	;can cancel out with a button
AND #!GPCancelButtonTrigger	;
BNE .NoPoundAndDelay		;

.Checks
LDA $7D				;if we stomped something or gained upward speed in any way...
BMI .NoPoundAndDelay		;stop ground pound

if !MaxSpeed > !GroundPndSpeed && !GPCancelButton != !Down
  ;LDA !GroundPndTimer
  ;BNE .CheckGround

  LDA $15
  AND #$04
  BNE .MoveFaster

;natural force's at work.
  DEC !GroundPndFlag
  LDA !GroundPndFlag
  CMP #!GroundPndSpeed
  BCS .Skip			;keep speed consistent

  LDA #!GroundPndSpeed		;set downward speed
  STA !GroundPndFlag		;
  BRA .Skip

.MoveFaster
  LDA !GroundPndFlag
  CMP #!MaxSpeed
  BCS .Skip

  INC !GroundPndFlag

.Skip
LDA !GroundPndFlag
STA $7D

else
  ;LDA !GroundPndTimer
  ;BNE .CheckGround

  LDA #!GroundPndSpeed
  STA $7D				;
endif

.CheckGround
LDA $77				;check if we touch a ground
AND #$04			;
BEQ .Re				;

;perform stomp man
;before we do that offset player's pos so it looks correct
;JSL.l DisplaySpinJumpSmoke

.NoPoundAndDelay
STZ !GroundPndFlag		;disable ground pound.

LDA #!GroundPoundDelay
STA !GroundPndTimer
RTL

;.NoPoundNoRunFrame
;STZ $13E4		;doesn't fix run-jumping frame.
;LDA #$24			;run jump cancel
;STA $13E0		;(graphical)
;BRA .NoPoundAndDelay		;

DisableSomeButtons:
LDA #$43			;disable left and right direction buttons
TRB $16				;
TRB $15				;can't hold X/Y (to make sure player doesn't grab anything during ground pound and cancel it)
RTS



CODE_03BCE0:
	JSL.l CODE_05DC80
	TAY
	AND.b #$87
	TSB.w $192A
	TYA
	AND.b #$08
	LSR
	LSR
	LSR
	STA.b $0F
	JSL.l CODE_05DC85
	STA.b $02
	AND.b #$7F
	STA.b $04
	JSL.l CODE_05DC8A
	TAX
	AND.b #$C0
	STA.w $13CD
	TXA
	AND.b #$20
	ASL
	TSB.w $192A
	LDX.b $0E
	LDA.l DATA_06FC00,x
	AND.b #$80
	TSB.b $04
	LDA.l DATA_06FE00,x
	AND.b #$3F
	TSB.w $13CD
	TYA
	BIT.b #$40
	BEQ.b CODE_03BD44
	AND.b #$30
	ASL
	ASL
	ASL
	STA.b $94
	ROL
	STA.b $95
	LDA.b $01
	LSR
	AND.b #$70
	TSB.b $94
	LDA.b $00
	ASL
	ASL
	ASL
	ASL
	STA.b $96
	LDA.b $02
	AND.b #$3F
	STA.b $97
CODE_03BD44:
	LDA.b $02
	BMI.b CODE_03BD51
	LDA.b $00
	LSR
	LSR
	LSR
	LSR
	STA.b $02
	RTL

CODE_03BD51:
	LDA.b #$0C
	STA.w $0100
	STZ.w $0DAE
	STZ.w $0DAF
	STZ.w $0DB0
	TYA
	BIT.b #$10
	BEQ.b CODE_03BD6D
	LDA.b $00
	STA.w $1DF6
	INC.w $1B9C
	TYA
CODE_03BD6D:
	BIT.b #$20
	BEQ.b CODE_03BD77
	LDA.b $01
	STA.w $1DEA
	TYA
CODE_03BD77:
	AND.b #$07
	CMP.b #$07
	BNE.b CODE_03BD7F
	LDA.b #$80
CODE_03BD7F:
	STA.w $0DD5
	ASL
	BEQ.b CODE_03BD8B
	INC.w $13CE
	INC.w $1DE9
CODE_03BD8B:
	PLX
	PLA
	PLB
	PLX
	PLA
	SEP.b #$30
	JML.l $0093F7

	db $FF,$FF,$FF,$FF,$FF,$FF
	db $4C,$4D,$10,$01

; org $0583B8
; 	JSL.l CODE_0FF7F0 ;integrate these
; 	NOP

; org $05D836
; 	TYX
; 	JSL.l CODE_03BCE0

CODE_05DC80:
	LDA.l DATA_05FE00,x
	RTL

CODE_05DC85:
	LDA.l DATA_1083E0,x
	RTL

CODE_05DC8A:
	LDA.l DATA_1085E6,x
	RTL

DATA_0FF200:									; Note: Old GFX Bypass list data.
	db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00

	db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00

	db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00

	db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00


CODE_0FF7D0:
	SEP.b #$30
	LDA.l $7FC00B
	LSR
	BCC.b CODE_0FF7DE
	LDA.b #$01
	JSR.w CODE_0FF840
CODE_0FF7DE:
	RTS

CODE_0FF7F0:
	PHP
	REP.b #$30
	LDA.b $FE
	BEQ.b CODE_0FF824
	DEC
	ASL
	ASL
	ASL
	ASL
	ASL
	TAX
	LDA.l DATA_0FF200,x
	PHA
	TXA
	CLC
	ADC.w #DATA_0FF200
	STA.l $7FC006
	SEP.b #$20
	LDA.b #DATA_0FF200>>16
	STA.l $7FC008
	PLA
	PLA
	ASL
	LDA.b #$41
	ADC.b #$00
	STA.l $7FC009
	JSR.w CODE_0FF7D0
	BRA.b CODE_0FF82C

CODE_0FF824:
	SEP.b #$20
	LDA.b #$FF
	STA.l $7FC009
CODE_0FF82C:
	PLP
	LDA.w $1925
	CMP.b #$09
	RTL

CODE_0FF840:
	PHA
	LDA.l $7FC009
	CMP.b #$42
	BEQ.b CODE_0FF84D
	PLA
	LDA.b #$00
	RTS

CODE_0FF84D:
	PLA
CODE_0FF84E:
	PHX
	PHY
	PHP
	ASL
	TAY
	REP.b #$30
	LDA.l $7FC006
	STA.b $8A
	LDA.l $7FC007
	STA.b $8B
	LDA.b [$8A],y
	AND.w #$0FFF
	JSR.w CODE_0FF8CB
	PLP
	PLY
	PLX
	LDA.b #$01
	RTS

DATA_0FF86F:
	db $65,$8A,$AA,$BF
	dl ExGfxPtrTableExt				; This is a pointer to the ExGFX table, entries 100-FFF

CODE_0FF8A0:
	PHX
	PHP
	REP.b #$30
	AND.w #$00FF
	DEC
	ASL
	ASL
	STA.b $8A
	TXA
	CLC
	ADC.b $8A
	TAX
	LDA.l DATA_0FF200,x
	PLP
	PLX
	RTS

CODE_0FF8B8:
	XBA
	STZ.b $00
	LDA.b #$AD
	STA.b $01
	LDA.b #$7E
	STA.b $02
	LDA.b #$00
	XBA
CODE_0FF8C6:
	JSL.l CODE_0FF900
	RTS

CODE_0FF8CB:
	STZ.b $00
	LDX.w #$7EAD
	STX.b $01
	CPY.w #$0002
	BNE.b CODE_0FF8C6
	TAX
	LDA.l $7FC00B
	LSR
	TXA
	BCC.b CODE_0FF8C6
	LDX.w #$7F20
	STX.b $01
	BRA.b CODE_0FF8C6

CODE_0FF900:
	PHX
	PHY
	PHP
	REP.b #$30
	CMP.w #$0100
	BCS.b CODE_0FF92B
	CMP.w #$0080
	BCS.b CODE_0FF944
	CMP.w #$007F
	BEQ.b CODE_0FF96B
	TAX
	SEP.b #$30
	LDA.l $00B992,x
	STA.b $8A
	LDA.l $00B9C4,x
	STA.b $8B
	LDA.l $00B9F6,x
	STA.b $8C
	BRA.b CODE_0FF95A

CODE_0FF92B:
	SEC
	SBC.w #$0100
	STA.b $8A
	ASL
	CLC
	ADC.b $8A
	TAX
	LDA.l ExGfxPtrTableExt,x			; This is a pointer to the ExGFX table, entries 100-FFF
	STA.b $8A
	LDA.l ExGfxPtrTableExt+$01,x
	STA.b $8B
	BRA.b CODE_0FF95A

CODE_0FF944:
	AND.w #$007F
	STA.b $8A
	ASL
	CLC
	ADC.b $8A
	TAX
	LDA.l ExGfxPtrTable,x
	STA.b $8A
	LDA.l ExGfxPtrTable+$01,x
	STA.b $8B
CODE_0FF95A:
	SEP.b #$30
	PHK
	PER.w $0005
	PHB
	PHY
	JML.l $00BA47
	REP.b #$30
	LDA.w #$0100
CODE_0FF96B:
	PLP
	PLY
	PLX
	RTL


CODE_0EF570:
	REP.b #$30
	LDA.b $FE
	BEQ.b CODE_0EF57C
	DEC
	JSR.w CODE_0EF583
	STZ.b $FE
CODE_0EF57C:
	SEP.b #$30
	JSL.l $05BE8A
	RTL

CODE_0EF583:
	SEP.b #$10
	PHB
	PHK
	PLB
	REP.b #$10
	STA.b $00
	ASL
	CLC
	ADC.b $00
	TAX
	LDY.w ColorPtrTable,x				;\ Custom level palette pointers
	LDA.w ColorPtrTable+$02,x				;/
	AND.w #$00FF
	BNE.b +
	PLB
	RTS

+:
	PLB
	STZ.b $04
	SEP.b #$20
	STA.b $06
	LDX.w #$0000
-:
	LDA.b [$04],y
	INY
	BNE.b +
	LDY.w #$8000
	INC.b $06
+:
	STA.w $0701,x
	INX
	CPX.w #$0202
	BNE.b -
	RTS
	
DATA_0FFEB4:
	db $00,$20,$00,$10,$00,$08,$00,$00

DATA_0FFEBC:
	db $A0,$50,$00,$50,$80,$50,$00,$58

DATA_0FFEC4:
	db $40,$01,$00,$00,$00,$01,$00,$00
