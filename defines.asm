; Wall Kick Stuff
!no_back_time		= $10		; The time to disable moving back after a wall kick. The smaller the value, the higher the control of the player over Mario's movement while wall jumping, but it also makes it harder to do big wall jumps.
!kick_x_speed		= $20		; The wall kick X speed.
!kick_y_speed		= $B8		; The wall kick Y speed.
!slide_accel		= $04		; The sliding acceleration.
!slide_speed		= $24		; The sliding speed.

!SpinJumpSFX 		= $04	; Spin jump sound effect. 1DFC
!SpinJumpSFXPort	= $1DFC
!JumpSFX 		= $01	; Regular jump sound effect. 1DFA
!JumpSFXPort		= $1DFA
!WallSFX		= $01	; Sound effect to make when jumping off of a wall. 1DF9
!WallSFXPort		= $1DF9

!WallKickFlags			= $0DC3	; The wallkick flags. (RAM)
!WallKick_no_back_timer		= $0DC4	; The timer for not moving back. (RAM)
!WallKick_temp_y_spd		= $0DC5	; The temporary Y speed. (RAM)

; Ground Pound Stuff
!GPButton = !L

;Button used to cancel out of ground pound
!GPCancelButton = !Up

;Frame used during ground pound
!GroundPndFrame = $1C		;

!GroundPndSpeed = $40		;downward speed during ground pound
!MaxSpeed = $50			;Smibbix: Maybe there could be a couple options like having Mario also fall a little quicker when holding down, to give a cool heavy effect.
				;if less than !GroundPndSpeed or !CancelButton is down, this won't work.

!GroundPndAirStay = $10		;how long stay in air before dropping
!GroundPoundDelay = $0A		;how long player is unable to activate ground pound again after cancelling

!GroundPndStartSound = $23
!GroundPndStartBank = $1DF9

!GroundPndFlag = $1869	;also acts like speed container for faster fall. RAM reusin' rules
!GroundPndTimer = $186A	;how long to stay in air after pressing trigger button. also used for delay before player can re-activate ground pound again.

; CPU Meter
!cpu_meter_dim_screen     = 0
!cpu_meter_have_star      = 1

!cpu_meter_star_x_pos     = $00
!cpu_meter_star_tile      = $EF
!cpu_meter_star_props     = %00110100

;Thwomps
!ThwompSmokeTimer = $1B		;How many frames the smoke effect lasts

;Button Events
!Up = $01;%00000001
!Down = $02;%00000010
!L = $04;%00000100
!R = $08;%00001000
!A = $10;%00010000
!B = $20;%00100000

if !GPButton = !Up
  !GPControllerTrigger = $16
elseif !GPButton = !Down
  !GPControllerTrigger = $16
elseif !GPButton = !B
  !GPControllerTrigger = $16
else
  !GPControllerTrigger = $18
endif

;same but for cancel input
;if and(!CancelButton,(!Up|!Down|!B))
if !GPCancelButton = !Up
  !GPCancelControllerTrigger = $16
elseif !GPCancelButton = !Down
  !GPCancelControllerTrigger = $16
elseif !GPCancelButton = !B
  !GPCancelControllerTrigger = $16
else
  !GPCancelControllerTrigger = $18
endif

;probably a better way to do this but eh
if !GPButton = !Up
  !GPButtonTrigger = $08
elseif !GPButton = !Down
  !GPButtonTrigger = $04
elseif !GPButton = !L
  !GPButtonTrigger = $20
elseif !GPButton = !R
  !GPButtonTrigger = $10
else;if !Button = or(!B, !A)	;otherwise it's either A or B
  !GPButtonTrigger = $80
endif

;same but for cancel
if !GPCancelButton = !Up
  !GPCancelButtonTrigger = $08
elseif !GPCancelButton = !Down
  !GPCancelButtonTrigger = $04
elseif !GPCancelButton = !L
  !GPCancelButtonTrigger = $20
elseif !GPCancelButton = !R
  !GPCancelButtonTrigger = $10
else;if !CancelButton = or(!B, !A)
  !GPCancelButtonTrigger = $80
endif
!sprite_y_low = $D8
!sprite_y_high = $14D4