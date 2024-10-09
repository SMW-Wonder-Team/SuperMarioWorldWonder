!ram_base 	= $7F8183	;350~ BYTES FREE SPACE RAM

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
