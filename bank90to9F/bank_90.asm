org $908000
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

org $90FFFE
nop