; human-readable function names for version-exclusive code/data
function ver_is_japanese(v) = equal(v,!__VER_J)
function ver_is_english(v) = notequal(v,!__VER_J)
function ver_is_hires(v) = equal(v,!__VER_E1)
function ver_is_lores(v) = notequal(v,!__VER_E1)
function ver_is_pal(v) = or(equal(v,!__VER_E0),equal(v,!__VER_E1))
function ver_is_ntsc(v) = nor(equal(v,!__VER_E0),equal(v,!__VER_E1))
function ver_is_arcade(v) = equal(v,!__VER_SS)
function ver_is_console(v) = notequal(v,!__VER_SS)
function ver_has_rev_gfx(v) = or(equal(v,!__VER_J),equal(v,!__VER_E1))
function ver_is_english_console(v) = nor(equal(v,!__VER_SS),equal(v,!__VER_J))

; instruction address mode $byte if J, $word otherwise
macro BorW(cmd, addr)
    if ver_is_japanese(!_VER)
        <cmd>.B <addr>
    else
        <cmd>.W <addr>
    endif
endmacro

; instruction address mode $word if J, $byte otherwise
macro WorB(cmd, addr)
    if ver_is_japanese(!_VER)
        <cmd>.W <addr>
    else
        <cmd>.B <addr>
    endif
endmacro

; instruction address mode $word,X if J, $long,X otherwise
macro WorL_X(cmd, addr)
    if ver_is_japanese(!_VER)
        <cmd>.W <addr>,X
    else
        <cmd>.L <addr>,X
    endif
endmacro

; instruction address mode $long,X if J, $word,X otherwise
macro LorW_X(cmd, addr)
    if ver_is_japanese(!_VER)
        <cmd>.L <addr>,X
    else
        <cmd>.W <addr>,X
    endif
endmacro

; instruction address mode $long if J, $word otherwise
macro LorW(cmd, addr)
    if ver_is_japanese(!_VER)
        <cmd>.L <addr>
    else
        <cmd>.W <addr>
    endif
endmacro

; insert freespace into the ROM at the location specified
; J & U: all $FF
; E0 & E1 & SS: alternating $00 and $FF every $20 bytes
; many stray bits are set/reset in the PAL/SS empty pattern.
; All of these fill patterns are found in the /empty/ folder.
; This macro just copies the correct amount of fill from those files.
macro insert_empty(j, u, ss, e0, e1)
    ?start:
    ; Since J and U versions are just plain $FF,
    ; this is faster than reading from a file
    if !_VER == !__VER_J
        rep <j> : db $FF
    elseif !_VER == !__VER_U
        rep <u> : db $FF
    else
        !n = con(<j>,<u>,<ss>,<e0>,<e1>)
        !i = 0
        while !i < !n
            if !_VER == !__VER_J
                !b = readfile1("empty/J_fill.bin", snestopc(?start)+!i)
            elseif !_VER == !__VER_U
                !b = readfile1("empty/U_fill.bin", snestopc(?start)+!i)
            elseif !_VER == !__VER_SS
                !b = readfile1("empty/SS_fill.bin", snestopc(?start)+!i)
            elseif !_VER == !__VER_E0
                !b = readfile1("empty/E0_fill.bin", snestopc(?start)+!i)
            else;if !_VER == !__VER_E1
                !b = readfile1("empty/E1_fill.bin", snestopc(?start)+!i)
            endif
            
            db !b
            !i #= !i+1
        endif
    endif
endmacro

; create an entry to a table of pointers where the high and low bytes are seperated
; this is for 16-bit pointers, where the high bytes are first, then the low bytes
macro Ptr16_Table_Entry(ptr, start, end)
    pushpc
    skip (start-end)/2
    db <ptr>
    pullpc
    db <ptr>>>8
endmacro

; Write a block of DMA settings
macro DMASettings(settings, dest, source, num)
    db <settings>
    db <dest>
    dl <source>
    dw <num>
endmacro

; Write a block of HDMA settings
macro HDMASettings(settings, dest, source)
    db <settings>
    db <dest>
    dl <source>
endmacro

; convert a *.pal palette file into SNES 15-bit color and insert it into the ROM.
macro incpal(file)
	!i = 0
	while !i < (filesize("<file>")/3)
		!r = readfile1("<file>", 3*!i)
		!g = readfile1("<file>", 3*!i+1)
		!b = readfile1("<file>", 3*!i+2)
		dw ((!b&$F8)<<7)|((!g&$F8)<<2)|((!r&$F8)>>3)
		!i #= !i+1
	endif
endmacro

; select a constant value depending on the region
; easier to read than an if/else block for a single LDA instruction for example
function con(j, u, ss, e0, e1) = select(equal(!_VER,!__VER_J),j,select(equal(!_VER,!__VER_U),u,select(equal(!_VER,!__VER_SS),ss,select(equal(!_VER,!__VER_E0),e0,e1))))

; convert a decimal scale value to mode 7 scale
function m7scale(val) = $20/val

; convert an offset to mode 7 center value (offset by 128)
function m7center(val) = val-$80

macro verticalL1writer(buffer, step)
	SEP #$20
	LDA [$6E],y	;map16 hi
	XBA
	LDA [$6B],y	;map16 lo
	TYX		;X is never used
	REP #$20
	ASL A
	JSL !LM_GetMap16Pointer
	STA $0A
	LDY.w #$0000	;need first tilemap word
	LDA [$0A],y	;top left
	STA <step>*4+<buffer>
	INY
	INY
	LDA [$0A],y	;bottom left
	STA <step>*4+<buffer>+2
	INY
	INY
	LDA [$0A],y	;top right
	STA <step>*4+<buffer>+64
	INY
	INY
	LDA [$0A],y	;bottom right
	STA <step>*4+<buffer>+66
;adjust Y index
	TXA
	CLC
	ADC.w #$0010	;access next row, 16 bytes each row
	AND #$01FF	;this is needed to handle negative scroll values (haven't found L1 case of this)
	TAY
endmacro

macro horizontalL1writer(buffer, step)
	SEP #$20
	LDA [$6E],y	;map16 hi
	XBA
	LDA [$6B],y	;map16 lo
	TYX
	REP #$20
	ASL A
	JSL !LM_GetMap16Pointer
	STA $0A		;prepared pointer for tilemap data is ready
	LDY.w #$0000	;reset Y index for the first tilemap word
	LDA [$0A],y	;top left
	STA.w <step>*4+<buffer>
	INY
	INY
	LDA [$0A],y	;bottom left
	STA.w <step>*4+<buffer>+128
	INY
	INY
	LDA [$0A],y	;top right
	STA.w <step>*4+<buffer>+2
	INY
	INY
	LDA [$0A],y	;bottom right
	STA.w <step>*4+<buffer>+130
;update Y index, must also wrap around AND adjust screen pointer if required
	INX
	TXA
	BIT.w #$000F	;if it crosses over to the next screen, reset column index and advance the base pointers for map16 lo/hi pointers
	BNE ?noadjust
;map16 pipe update is required due to screen crossing
	INC $06		;update screen select and call
	LDA $06
	JSR UpdatePipeMap16
;adjustment of screen pointers
	;LDA $6B		;map16 lo displaced $1B0 bytes (total bytes for two subscreens)
	;CLC
	;ADC #$01B0
	;STA $6B
	;LDA $6E		;map16 hi
	;CLC
	;ADC #$01B0
	;STA $6E
	;TXA
	;SEC
	;SBC.w #$0010	;reset column index because we are in a new screen (low 4 bits), along with pulling it back to the original row

	TXA
	CLC
	ADC #$01B0-$0010	;the pointers don't have to be adjusted, only the index
?noadjust:
	TAY
endmacro

macro horizontalBG2writer(buffer, step)
	SEP #$20
	LDA [$6E],y	;map16 hi
	XBA
	LDA [$6B],y	;map16 lo
	TYX		;X is never used
	REP #$20
	ASL #3		;*8, since that's the tilemap byte count per map 16
	TAY		;get map16*8 into Y index
	LDA [$0A],y	;top left
	STA.w <step>*4+<buffer>
	LDA [$0D],y	;bottom left
	STA.w <step>*4+<buffer>+128
	LDA [$00],y	;top right
	STA.w <step>*4+<buffer>+2
	LDA [$03],y	;bottom right
	STA.w <step>*4+<buffer>+130
	TXY
	INY
endmacro

macro horizontalL2writer(buffer, step)
	SEP #$20
	LDA [$6E],y	;map16 hi
	XBA
	LDA [$6B],y	;map16 lo
	TYX
	REP #$20
	ASL A
	JSL !LM_GetMap16Pointer
	STA $0A		;prepared pointer for tilemap data is ready
	LDY.w #$0000	;reset Y index for the first tilemap word
	LDA [$0A],y	;top left
	ORA $03
	STA.w <step>*4+<buffer>
	INY
	INY
	LDA [$0A],y	;bottom left
	ORA $03
	STA.w <step>*4+<buffer>+128
	INY
	INY
	LDA [$0A],y	;top right
	ORA $03
	STA.w <step>*4+<buffer>+2
	INY
	INY
	LDA [$0A],y	;bottom right
	ORA $03
	STA.w <step>*4+<buffer>+130
;update Y index, must also wrap around AND adjust screen pointer if required
	INX
	TXA
	BIT.w #$000F	;if it crosses over to the next screen, reset column index and advance the base pointers for map16 lo/hi pointers
	BNE ?noadjust
;map16 pipe update is required due to screen crossing
	INC $06		;update screen select and call
	LDA $06
	JSR UpdatePipeMap16
;adjustment of screen pointers
	;LDA $6B		;map16 lo displaced $1B0 bytes (total bytes for two subscreens)
	;CLC
	;ADC #$01B0
	;STA $6B
	;LDA $6E		;map16 hi
	;CLC
	;ADC #$01B0
	;STA $6E
	;TXA		;reset column index because we are in a new screen (low 4 bits), along with pulling it back to the original row
	;SEC
	;SBC.w #$0010

	TXA
	CLC
	ADC #$01B0-$0010	;the pointers don't have to be adjusted, only the index
?noadjust:
	TAY
endmacro

macro verticalL2writer(buffer, step)
	SEP #$20
	LDA [$6E],y	;map16 hi
	XBA
	LDA [$6B],y	;map16 lo
	TYX		;X is never used
	REP #$20
	ASL A
	JSL !LM_GetMap16Pointer
	STA $0A
	LDY.w #$0000	;need first tilemap word
	LDA [$0A],y	;top left
	ORA $03
	STA <step>*4+<buffer>
	INY
	INY
	LDA [$0A],y	;bottom left
	ORA $03
	STA <step>*4+<buffer>+2
	INY
	INY
	LDA [$0A],y	;top right
	ORA $03
	STA <step>*4+<buffer>+64
	INY
	INY
	LDA [$0A],y	;bottom right
	ORA $03
	STA <step>*4+<buffer>+66
;adjust Y index
	TXA
	CLC
	ADC.w #$0010	;access next row, 16 bytes each row
	AND #$01FF	;this is needed to handle negative scroll values (smwbugged.smc)
	TAY
endmacro

macro horizontalL1writerfull(buffer, step)
	SEP #$20
	LDA [$6E],y	;hi
	XBA
	LDA [$6B],y	;lo
	REP #$20
	TYX		;X is never used
	ASL A		;last instruction for LM hack jump
	JSL !LM_GetMap16Pointer
	STA $0A		;store returned low 16bits pointer for tilemap data
	LDY.w #$0000	;reset index for reading tilemap data
	LDA [$0A],y	;top left
	STA.w <step>*4+<buffer>
	INY
	INY
	LDA [$0A],y	;bottom left
	STA.w <step>*4+<buffer>+128
	INY
	INY
	LDA [$0A],y	;top right
	STA.w <step>*4+<buffer>+2
	INY
	INY
	LDA [$0A],y	;bottom right
	STA.w <step>*4+<buffer>+130
	TXY
	INY
endmacro

macro horizontalL2writerfull(buffer, step)
	SEP #$20
	LDA [$6E],y	;hi
	XBA
	LDA [$6B],y	;lo
	TYX		;since X is never used...
	REP #$20
	ASL A		;last instruction for LM hack jump
	JSL !LM_GetMap16Pointer
	STA $0A		;store returned low 16bits pointer for tilemap data
	LDY.w #$0000	;reset index for reading tilemap data
	LDA [$0A],y	;top left
	ORA $03
	STA.w <step>*4+<buffer>
	INY
	INY
	LDA [$0A],y	;bottom left
	ORA $03
	STA.w <step>*4+<buffer>+128
	INY
	INY
	LDA [$0A],y	;top right
	ORA $03
	STA.w <step>*4+<buffer>+2
	INY
	INY
	LDA [$0A],y	;bottom right
	ORA $03
	STA.w <step>*4+<buffer>+130
	TXY		;restore Y index for another go around
	INY
endmacro

macro fullwriteradjustment()
	TYA
	CLC
	ADC #$0100-$10	;would have dropped into next column, so -$10 compensates for that
	TAY
endmacro

macro BG2writeradjustment()
	TYA		;adjust index to pull it back to the original row
	SEC
	SBC.w #$0010
	CLC
	ADC !BG2_size	;I liked the alternate suggestion: add the size in bytes to get into the next table, on the same row
	TAY

	;LDA $7FC00B	;LM 1.67, test if this is old 432 bg or new 512 bg
	;AND.w #$0004	;note: the JSL $0EFD00 already stores 0x1B0 or 0x200 to $05 which you could move to another RAM location and use instead of testing directly and adding a constant like this
	;BEQ +

	;LDA $6E		;advance respective pointers 512 bytes
	;CLC
	;ADC #$0200
	;STA $6E
	;LDA $6B
	;CLC
	;ADC #$0200
	;BRA ++

;+	LDA $6E		;advance respective pointers 432 bytes
	;CLC
	;ADC #$01B0
	;STA $6E
	;LDA $6B
	;CLC
	;ADC #$01B0
;++	;STA $6B
endmacro

macro uploadbuffercheck(vramoriginal, vrambase, scroll)
	AND #$7000		;only high nybble is necessary to figure where it's headed
	CMP #<vramoriginal>	;original L1 tilemap
	BNE ?skip

	LDA $03
;VRAM-YX yyyyy xxxxx
	LSR #5		;get 'y' bits only they matter
	AND.w #$001F
	STA !block_y
	LDA $03
	AND.w #$0800	;get 'Y' tilemap select bit
	XBA
	ASL #2		;Y yyyyy
	TSB !block_y
;yscroll
	LDA.b <scroll>	;get actual scroll into a 6 bit row select like the above
	LSR #3
	DEC A		;vanilla secret
	DEC A
	AND.w #$003F	;0-63
	STA !screen_y
	SEP #$20	;only 8 bit math required for now
;which case to handle?
	LDA !screen_y	;if adding screen height to current y scroll causes wrap around in a 64 row map, handle case #2
	CLC
	ADC #!screen_rows
	BIT #$40	;bit 6 set = overflow from 64
	BNE ?case2

;case1
;screen does not wrap around
	LDA !block_y	;block Y >= screen top?
	CMP !screen_y	;carry clear if block Y < screen top
	BCS +
	JMP .cancelupload
+	LDA !screen_y	;add screen height to screen top
	CLC
	ADC #!screen_rows
	CMP !block_y	;carry clear if block Y > screen bottom
	BCS ?commitlx
	JMP .cancelupload

?case2:
;screen wraps around
	LDA !block_y	;block Y >= screen top?
	CMP !screen_y	;carry clear if block Y < screen top
	BCC +		;attempt other condition, EITHER is valid
	BRA ?commitlx

+	LDA !screen_y	;add screen height, it will wrap around
	CLC
	ADC #!screen_rows
	AND #$3F	;just keeping it within 0-63
	CMP !block_y	;carry clear if block Y > screen bottom after wrapping
	BCS ?commitlx
	JMP .cancelupload
	
?commitlx:
	REP #$20
	LDA $03
	AND #$07FF	;force into $3000 tilemap and clip Y tilemap select
	ORA #<vrambase>
	STA $03		;it might use this address again..
	JML $008755	;straight to VRAM address store

?skip:
endmacro

macro calculatevramr(dest, buffer, vram, size, source)
	REP #$20
	SEP #$10

	LDA <dest>	;start address
	STA.w <vram>

	LSR A		;-xxxx0 containing the column select
	AND.w #$000F
	STA $00
	LDA.w #$0010	;16 columns per tilemap
	SEC
	SBC $00
	ASL #2		;suitable for byte sizes
	STA $00

;round 1
;top row one part
	LDA.w #<buffer>
	STA.w <source>
	LDX $00		;variable size here
	STX <size>

;top row other part
	LDA <dest>	;toggle tilemap select bit
	EOR #$0400
	AND #$FFC0	;clear out the column select
	STA.w <vram>+2

	LDA.w #<buffer>	;add the variable size previously used to the base address
	CLC
	ADC $00
	STA.w <source>+2
	LDX #$40		;64 bytes, fill everything
	STX <size>+1

;bottom row one part
	LDA <dest>	;access next row for VRAM
	ORA.w #$0020
	STA.w <vram>+4

	LDA.w #<buffer>+128
	STA.w <source>+4
	LDX $00
	STX <size>+2

;bottom row other part
	LDA <dest>
	EOR #$0400
	AND #$FFC0
	ORA.w #$0020
	STA.w <vram>+6

	LDA.w #<buffer>+128
	CLC
	ADC $00
	STA.w <source>+6
	LDX #$40
	STX <size>+3

	LDX $00		;if it was a clean multiple of 64, don't do it, will try to upload 64KB, *or don't try to prepare data*
	CPX #$40
	BEQ ?finish

;round2
;top row
	LDA <dest>	;get original address, with the original tilemap
	AND #$FFC0	;reset the column select, same tilemap
	STA.w <vram>+8

	LDA.w #<buffer>
	CLC
	ADC.w #$0040	;64 bytes were already transferred (no possibility of carry: no CLC)
	ADC $00		;additional offset by the bytes that WERE transferred (what is left?)
	STA.w <source>+8
	LDA.w #$0040	;64 byte minus bytes originally transferred into this tilemap
	SEC
	SBC $00
	TAX
	STX <size>+4

;bottom row
	LDA <dest>
	AND #$FFC0
	ORA.w #$0020
	STA.w <vram>+10

	LDA.w #<buffer>+128
	CLC
	ADC.w #$0040	;(no possibility of carry: no CLC)
	ADC $00
	STA.w <source>+10
	LDA.w #$0040
	SEC
	SBC $00
	TAX
	STX <size>+5
?finish:
endmacro

macro calculatevramc(dest, buffer, vram, size, source)
	REP #$20
	SEP #$10

	LDA <dest>
	STA.w <vram>

	LSR #6		;bitmap is yyyy0xxxx0, we want the 'y' bits
	AND.w #$000F
	STA $00		;temporary store for block row select
	LDA.w #$0010	;this many blocks to upload vertically
	SEC
	SBC $00		;this many block to upload before having to wrap around
	ASL #2		;yyyy00 (byte length suitable)
	STA $00
;round 1
;left
	LDA.w #<buffer>
	STA.w <source>
	LDX $00		;the length varies for these
	STX <size>

;right
	LDA <dest>	;VRAM column is right next to it
	INC A
	STA.w <vram>+2

	LDA.w #<buffer>+64
	STA.w <source>+2
	LDX $00
	STX <size>+1

	LDX $00		;if previous length was $40 (entire column then DON'T attempt the second (will attempt to write 64KB))
	CPX #$40
	BEQ ?finish

;round2
;left
	LDA <dest>	;reset row select, so start from the top
	AND #$FC1F
	STA.w <vram>+4
	PHA		;may aswell save it
	
	LDA $00		;source must have previous length added to it
	CLC
	ADC.w #<buffer>
	STA.w <source>+4
	LDA.w #$0040	;length must have previous length subtracted from it
	SEC
	SBC $00
	TAX
	STX <size>+2

;right
	PLA
	INC A
	STA.w <vram>+6

	LDA $00
	CLC
	ADC.w #<buffer>+64
	STA.w <source>+6
	LDA.w #$0040
	SEC
	SBC $00
	TAX
	STX <size>+3
?finish:
endmacro

macro vramuploadr(dest, vram, size, source, bank)
	LDA <dest>	;test high byte VRAM addr for data to upload
	BNE +
	JMP ?finish

+	LDA.b <vram>	;start address
	STA $2116

	LDY #$80	;word uploads
	STY $2115
	LDY.b #<bank>	;common bank for all of these
	STY $4314
	LDY #$02	;CH 2 used throughout

;round 1
;top row one part
	LDA.b <source>
	STA $4312
	LDX.b <size>	;variable size here
	STX $4315
	STY $420B	;go

;top row other part
	LDA.b <vram>+2
	STA $2116

	LDA.b <source>+2
	STA $4312
	LDX.b <size>+1
	STX $4315
	STY $420B

;bottom row one part
	LDA.b <vram>+4
	STA $2116

	LDA.b <source>+4
	STA $4312
	LDX.b <size>+2
	STX $4315
	STY $420B

;bottom row other part
	LDA.b <vram>+6
	STA $2116

	LDA.b <source>+6
	STA $4312
	LDX.b <size>+3
	STX $4315
	STY $420B

	LDX.b <size>		;if it was a clean multiple of 64, don't do it, will try to upload 64KB and it wasn't even configured anyway
	CPX #$40
	BEQ ?finish

;round2
;top row
	LDA.b <vram>+8
	STA $2116

	LDA.b <source>+8
	STA $4312
	LDX.b <size>+4
	STX $4315
	STY $420B

;bottom row
	LDA.b <vram>+10
	STA $2116

	LDA.b <source>+10
	STA $4312
	LDX.b <size>+5
	STX $4315
	STY $420B

?finish:
	LDA.w #$0000	;don't do next frame unless required
	STA <dest>
endmacro

macro localJSL(dest, rtlop, db)
	PHB			;first save our own DB
	PHK			;first form 24bit return address
	PEA.w ?return-1
	PEA.w <rtlop>-1		;second comes 16bit return address
	PEA.w <db><<8|<db>	;change db to desired value
	PLB
	PLB
	JML <dest>
?return:
	PLB			;restore our own DB
endmacro

macro vramuploadc(dest, vram, size, source, bank)
	LDA <dest>	;test high byte VRAM addr for data to upload
	BNE +
	JMP ?finish

+	LDX #$81	;vertical tilemap updates
	STX $2115
	LDX.b #<bank>
	STX $4314
	LDY #$02	;CH2

	LDA.b <vram>
	STA $2116

;round 1
;left
	LDA.b <source>
	STA $4312
	LDX.b <size>
	STX $4315
	STY $420B

;right
	LDA.b <vram>+2
	STA $2116

	LDA.b <source>+2
	STA $4312
	LDX.b <size>+1
	STX $4315
	STY $420B

	LDX.b <size>
	CPX #$40
	BEQ ?finish

;round2
;left
	LDA.b <vram>+4
	STA $2116
	
	LDA.b <source>+4
	STA $4312
	LDX.b <size>+2
	STX $4315
	STY $420B

;right
	LDA.b <vram>+6
	STA $2116

	LDA.b <source>+6
	STA $4312
	LDX.b <size>+3
	STX $4315
	STY $420B

?finish:
	LDA.w #$0000
	STA <dest>
endmacro