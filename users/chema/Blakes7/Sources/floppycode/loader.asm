
#define OPCODE_RTS		$60
#define OPCODE_JMP              $4C

#define COLOR(color) pha:lda #16+(color&7):sta $bb80+40*27:pla
#define STOP(color) pha:lda #16+(color&7):sta $bb80+40*27:jmp *:pla

#define TELESTRAT_ALIGN
#ifdef TELESTRAT_ALIGN
#define PROTECT(X)  	.dsb (((X)&3)-((*+3)&3))&3,$ea
#define PROTECT2(X,Y)	.dsb (((X)&3)-((*+(Y)+3)&3))&3,$ea
#else
#define PROTECT(X)
#define PROTECT2(X,Y) 
#endif

;
; VIA registers definition
;
#define via_portb   $0300
#define via_ddrb    $0302
#define via_ddra    $0303
#define via_t1cl    $0304
#define via_t1ch    $0305
#define via_t1ll    $0306
#define via_t1lh    $0307
#define via_t2ll    $0308
#define via_t2ch    $0309
#define via_sr      $030a
#define via_acr     $030b
#define via_pcr     $030c
#define via_ifr     $030d
#define via_ier     $030e
#define via_porta   $030f


;
; Microdisc register values
;
#define FDC_command_register	$0310
#define FDC_status_register	$0310
#define FDC_track_register	$0311
#define FDC_sector_register	$0312
#define FDC_data		$0313
#define FDC_flags		$0314
#define FDC_drq                 $0318	

#define FDC_Flags_Mask          %10000100       ; Disable ROM/EPROM, no FDC interrupt requests, A drive, Side 0
#define FDC_Flag_DiscSide       %00010000       ; Accesses second side of the disk

#define CMD_ReadSector		$80
#define CMD_WriteSector		$a0 
#define CMD_Seek		$1F	; CHEMA: CHECK: Fabrice uses 1C here (6ms stepping rate)

#define wait_status_floppy 	30


;
; Jasmin register values
;
#define FDC_JASMIN_command_register		$03f4
#define FDC_JASMIN_status_register		$03f4
#define FDC_JASMIN_track_register		$03f5
#define FDC_JASMIN_sector_register		$03f6
#define FDC_JASMIN_data				$03f7
#define FDC_JASMIN_flags			$03f8
#define FDC_JASMIN_drq                 		$03FC	

#define FDC_JASMIN_Flag_DiscSide       		%00000001

#define CMD_JASMIN_ReadSector			$8c

#include "floppy_description.h"       ; This file is generated by the floppy builder

;; CHEMA: For the loading picture
; This could be avoided for a general loader
#define PICLOC 35
#define LOADINGCOLOR pha:lda color: and #7: ora #1: inc color: sta $bb80+40*27+PICLOC:sta $bb80+40*26+PICLOC:pla
#define CLEARLOADING pha:lda #0:sta $bb80+40*27+PICLOC:sta $bb80+40*26+PICLOC:pla
//#define LOADINGCOLOR 
//#define CLEARLOADING 

	.zero
	
	*=LOADER_BASE_ZERO_PAGE
; If you add or remove any variables, make sure that LOADER_BASE_ZERO_PAGE is still correct (defined in the floppy builder script) 	
current_track		.dsb 1		; Index of the track being loaded
current_sector		.dsb 1		; Index of the sector being loaded
current_side		.dsb 1		; Has the bit 4 set to 0 or 1 to be used as a mask on the Microdisc control register (other bits have to be set to zero)

ptr_destination		.dsb 2 		; Destination adress where we depack
ptr_destination_end	.dsb 2		; Point on the end of the depacked stuff
ptr_source_back		.dsb 2		; Temporary used to hold a pointer on depacked stuff
offset			.dsb 2
mask_value		.dsb 1
nb_dst			.dsb 1
	.text

	*=FLOPPY_LOADER_ADDRESS

; ------------------------------------------------------------------------------
;                                   Startup section
; ------------------------------------------------------------------------------
;
; This section of the loader can be overwritten after the loader has been installed in memory.
; It contains initialization code that just need to be run once at the start of the application.
; If there are specific initialization, setup of video mode, etc... you need to do, that's the place.
;
; By default the Microdisc/Jasmin setup code is performed here: 
; The code of the loader is setup to load things from a Microdisc, but if we are called with X not null,
; then we patch all the values to replace them by Jasmin equivalents
;
_LoaderTemporaryStart
	sei 				; Make sure interrupts are disabled
	cld                                 ; Force decimal mode

	cpx #0                              ; If we are on Jasmin, patch all the FDC related values
	beq end_jasmin_init
    
	lda #<FDC_JASMIN_command_register
	sta 1+__fdc_command_1
	sta 1+__fdc_command_2
	sta 1+__fdc_command_3
	sta 1+__fdc_command_w

	lda #<FDC_JASMIN_status_register
	sta 1+__fdc_status_1
	sta 1+__fdc_status_2
	sta 1+__fdc_status_3
	sta 1+__fdc_status_4
	sta 1+__fdc_status_w
	;sta 1+__fdc_status_w2
	

	lda #<FDC_JASMIN_track_register
	sta 1+__fdc_track_1

	lda #<FDC_JASMIN_sector_register
	sta 1+__fdc_sector_1

	lda #<FDC_JASMIN_data
	sta 1+__fdc_data_1
	sta 1+__fdc_data_2
	sta 1+__fdc_data_w

	lda #<FDC_JASMIN_flags
	sta 1+__fdc_flags_1
	sta 1+__fdc_flags_2

	;lda #<FDC_JASMIN_drq
	;sta 1+__fdc_drq_1
	;sta 1+__fdc_drq_w

	lda #CMD_JASMIN_ReadSector
	sta 1+__fdc_readsector

	lda #FDC_JASMIN_Flag_DiscSide
	sta 1+__fdc_discside
	sta 1+__fdc_discside1

end_jasmin_init	

	ldx #$ff	; Reset the stack pointer
	txs
	lda #$ff	; Initialize the VIA to known values (code is from Atmos ROM)
	sta via_ddra
	lda #$f7
	sta via_ddrb
	lda #$b7
	sta via_portb
	lda #$dd
	sta via_pcr
	lda #$7f
	sta via_ier
	lda #$40 
	sta via_acr
	lda #$c0
	sta via_ier
	lda #$10
	sta via_t1ll
	sta via_t1cl
	lda #$27
	sta via_t1lh
	sta via_t1ch
    
	; Chema: initialize loading graphics
.(   
    	ldy #31
loopimg
	lda loadingimg,y
	sta $9fff-31,y
	dey
	bpl loopimg
	
	ldy #2
loopmsg
	lda loadingmsg,y
	sta $bb80+40*26+PICLOC+1,y
	lda loadingmsg+3,y
	sta $bb80+40*27+PICLOC+1,y	
	dey
	bpl loopmsg
.)

	jsr LoadData		; Load the main game  (parameters are directly initialized in the loader variables at the end of the file)
	; Chema: let's try to enable IRQs again	
	cli
	jmp _LoaderApiJump	; Give control to the application and hope it knows what to do
		
	
; -------------------------------------------------------------------------------
;                                   Resident section
; ------------------------------------------------------------------------------- 
;
; This section of the loader stays in memory at all time.
; It contains all the code for loading, saving, as well as memory areas used by the
; API to communicated between the main application and the loader.
;
_LoaderResidentStart

; CHEMA: made these subroutines so they are re-usable in writting
;--------------------------------
; Sets the side,track and sector
; variables, by using the pair
; track/sector value in the file 
; tables
;--------------------------------
SetSideTrackSector
	lda #FDC_Flags_Mask 		; Disable the FDC (Eprom select + FDC Interrupt request)
__fdc_flags_1
	sta FDC_flags

	; Starting track	
	ldy #%00000000 			; Side 0
	lda _LoaderApiFileStartTrack    ; If the track id is larger than 128, it means it is on the other side of the floppy
	bpl first_side
	; The file starts on the second side
__fdc_discside1	
	ldy #FDC_Flag_DiscSide	    	; Side 1
	and #%01111111              	; Mask out the extra bit
first_side
	sty current_side
	sta current_track

	; First sector
	lda _LoaderApiFileStartSector
	and #%01111111                  ; Clear out the top bit (compressed flag)
	sta current_sector
	rts

;------------------------------------------
; Commands the floppy drive to
; SEEK for the track/sector
; if current_sector is bigger than
; the sectors per track, it automatically
; changes the track too.
;------------------------------------------
PrepareTrack
	lda current_sector			; Check if we have reached the end of the track
	cmp #FLOPPY_SECTOR_PER_TRACK+1
	bne end_change_track
	
	inc current_track			; Move to the next track
	lda current_track
	cmp #FLOPPY_TRACK_NUMBER
	bne end_side_change
	
	lda #0					; Reset to the first track on the other side
	sta current_track
__fdc_discside
	lda #FDC_Flag_DiscSide
	sta current_side	
end_side_change

	lda #1                                   ; Reset the sector position
	sta current_sector
end_change_track

	lda current_sector			; Update sector to read
	PROTECT(FDC_sector_register)
__fdc_sector_1	
	sta FDC_sector_register
	inc current_sector
		
	lda current_track                        ; Check if the drive is on the correct track		
	; CHEMA: Trying to avoid the Cumulus bug!
	; Description: Cumulus firmware version 0.5 has a bug in the WRITE_SECTOR command which issues 
	; an extra DRQ at the end of the sector. This would not be a problem if it emulated properly
	; the behaviour of the BUSY bit in the STATUS register, but it also doesn't (it is not flagged
	; at all). As a result a tight loop writting several sectors on the same track may en up here before
	; the extra DRQ is flagged. As the Track has not changed, this code is skipped and quickly gets
	; back to the writing loop, which catches this extra DRQ, sending the first byte of the sector, which
	; is not read by the Cumulus, and gets missed.
	; Until a new firmware version is released, the only thing we can do is issuing a SEEK command even when
	; we are on the correct track. As this takes time, a var will be used to flag when this will be done: only
	; when writing.
	ldy avoid_cumulus_bug
	bne retryseek	
	PROTECT(FDC_track_register)
__fdc_track_1
	cmp FDC_track_register
	beq stay_on_the_track
retryseek
	PROTECT(FDC_data)
__fdc_data_1	
	sta FDC_data                             ; Set the new track		
	lda #CMD_Seek
	PROTECT(FDC_command_register)
__fdc_command_1
	sta FDC_command_register	
	jsr WaitCompletion			; CHEMA: Wait for the completion of the command
.(
	; Chema: the same 16 cycle wait as in sector_2-microdisc. I am not sure if this
	; is needed or why, but it was crucial for the disk to boot in sector_2-microdisc
	; so no harm if done here again, I guess..
	ldy #3
waitc
	dey	;2
	bne waitc;2+1
	; = 16 cycles
.)
	; CHEMA: added this
	; What if there is a seek error???
	; Do the restore_track0 code
	PROTECT(FDC_status_register)
__fdc_status_3	
	lda FDC_status_register
	and #$18
	beq stay_on_the_track
restore_track0		
	lda #$0c
	PROTECT(FDC_command_register)
__fdc_command_3
	sta FDC_command_register
	jsr WaitCompletion
	PROTECT(FDC_status_register)
__fdc_status_4	
	lda FDC_status_register
	and #$10
	bne restore_track0
	beq retryseek
	
stay_on_the_track
	lda #FDC_Flags_Mask                      ; Apply the side selection mask
	ora current_side
__fdc_flags_2
	sta FDC_flags
	rts
	
		
;---------------------------------------
; Loads data from a file descriptor
; deals with both compressed and
; uncompressed files
; X=File index
;----------------------------------------
LoadData
	ldy #0
	sty __fetchByte+1

	; We have to start somewhere no matter what, compressed or not
 	;sei
	; Make sure the microdisc IRQ is disabled	
	;jsr WaitCompletion
	jsr SetSideTrackSector
	
	clc
	lda _LoaderApiAddressLow
	sta ptr_destination+0
	adc _LoaderApiFileSizeLow
	sta ptr_destination_end+0

	lda _LoaderApiAddressHigh
	sta ptr_destination+1
	adc _LoaderApiFileSizeHigh
	sta ptr_destination_end+1

	; Now at this stage we have to check if the data is compressed or not
	lda _LoaderApiFileStartSector
	bmi LoadCompressedData
;---------------------------------------
; This loads data which is uncompressed
; It will be loaded in the buffer and
; then copied to the destination.
; this is bad and good. Bad because it
; takes time. Good because it alows for
; loading chunks < 256 bytes :)
;---------------------------------------
LoadUncompressedData	
	ldy #0
read_sectors_loop
	jsr GetNextByte 	; Read from source stream
	sta (ptr_destination),y

	; We increase the current destination pointer, by a given value, white checking if we reach the end of the buffer.
	inc ptr_destination
	bne skip_destination_inc1
	inc ptr_destination+1
skip_destination_inc1

	lda ptr_destination
	cmp ptr_destination_end
	lda ptr_destination+1
	sbc ptr_destination_end+1
	bcc read_sectors_loop 
	;cli 			; Data successfully loaded (we hope), so we restore the interrupts
	jmp ClearLoadingPic	; CHEMA: Clears the loading picture
	;rts

;--------------------------------------
; This loads data which is compressed
;--------------------------------------
LoadCompressedData
	;cli
	; Initialise variables
	; We try to keep "y" null during all the code, so the block copy routine has to be sure that Y is null on exit
	lda #1
	sta mask_value
	 
unpack_loop
	; Handle bit mask
	lsr mask_value
	bne end_reload_mask
	
	jsr GetNextByte 	; Read from source stream

	ror 
	sta mask_value   
end_reload_mask
	bcc back_copy

write_byte
	; Copy one byte from the source stream
	jsr GetNextByte 	; Read from source stream
	sta (ptr_destination),y

	lda #1
	sta nb_dst

_UnpackEndLoop
	; We increase the current destination pointer, by a given value, white checking if we reach the end of the buffer.
	clc
	lda ptr_destination
	adc nb_dst
	sta ptr_destination

	bcc skip_destination_inc
	inc ptr_destination+1
skip_destination_inc

	cmp ptr_destination_end
	lda ptr_destination+1
	sbc ptr_destination_end+1
	bcc unpack_loop  
	; CHEMA: Clears the loading picture
	;rts
;-------------------------------
; Clear the loading pic. 
; Called as a subroutine elsewhere
;---------------------------------
ClearLoadingPic	
	CLEARLOADING
	rts	
	
;---------------------------
; Draws the loading pic.
; This is a subroutine, so it is not
; correctly put here, but this way
; I can keep Clear/Put together.
; If the bcc above gets out of range
; this can be moved.
;---------------------------	
PutLoadPic
	LOADINGCOLOR				; CHEMA: loading picture
	rts
	
back_copy
	;BreakPoint jmp BreakPoint	
	; Copy a number of bytes from the already unpacked stream
	; Here we know that Y is null. So no need for clearing it: Just be sure it's still null at the end.
	; At this point, the source pointer points to a two byte value that actually contains a 4 bits counter, and a 12 bit offset to point back into the depacked stream.
	; The counter is in the 4 high order bits.
	;clc  <== No need, since we access this routie from a BCC
	jsr GetNextByte 	; Read from source stream
	adc #1
	sta offset
	jsr GetNextByte 	; Read from source stream
	tax
	and #$0f
	adc #0
	sta offset+1

	txa
	lsr
	lsr
	lsr
	lsr
	clc
	adc #3
	sta nb_dst

	sec
	lda ptr_destination
	sbc offset
	sta ptr_source_back
	lda ptr_destination+1
	sbc offset+1
	sta ptr_source_back+1

	; Beware, in that loop, the direction is important since RLE like depacking is done by recopying the
	; very same byte just copied... Do not make it a reverse loop to achieve some speed gain...
	.(
copy_loop
	lda (ptr_source_back),y	; Read from already unpacked stream
	sta (ptr_destination),y	; Write to destination buffer
	iny
	cpy nb_dst
	bne copy_loop
	.)
	ldy #0
	beq _UnpackEndLoop
	rts

; Chema: Removed the nops and IRQ sei/cli
;-----------------------------------------
; Gets the next byte from the stream,
; reading data from disk to the buffer
; if necessary.
;-----------------------------------------
GetNextByte
	php
	lda __fetchByte+1
	bne __fetchByte
	jsr ReadNextSector
	ldx #0
	ldy #0
__fetchByte
	lda LOADER_SECTOR_BUFFER
	inc __fetchByte+1
	plp
	rts
	
;--------------------------------------------
; Reads the next sector of the current file
;---------------------------------------------
ReadNextSector
	; CHEMA: loading picture
	jsr PutLoadPic
	jsr PrepareTrack
	
	; CHEMA: this is the critical section. Disable IRQs here
	sei
RetryRead
__fdc_readsector
	lda #CMD_ReadSector
	PROTECT(FDC_command_register)
__fdc_command_2
	sta FDC_command_register

	; CHEMA: This is not needed
	; jsr WaitCommand
	
	; Chema: this loop is needed if checking for partial
	; loading of a sector, as we cannot check the STATUS
	; directly after issuing a command. 
	; Fabrice provided this table and the code, which takes 21 cycles+extra (ldx and lda below) :
	; Operation		Next Operation		Delay required (MFM mode)
	; Write to Command Reg.	Read Busy Bit (bit 0)	24 µsec
	; Write to Command Reg.	Read Status bits 1-7	32 µsec
	; Write Register	Read Same Register	16 µsec
	ldy #4	
tempoloop 
	dey
	bne tempoloop 	

	; Read the sector data

	; This is the code suggested by Fabrice, which
	; makes use of the STATUS bit to check when the command
	; finishes, so not only the status flags are correct after
	; computing CRC, but also if it is aborted due to a read error.
	; Additionaly, to support the Jasmin, DRQ at FDC_drq cannot be polled
	; as this signal is not exhibited in any address. One should use bit 1 
	; of the Status register. BTW, Fabrice provided a code that, after aligning
	; the first access to the status register, does not need more nops for the data register
	; so timing for the read loop is correct. In his own words:
	; Worst case delay :
	; lda status (2), lsr (2), ror (2), bcc (3), bpl (2), lda status (4), lsr (2), ror (2), bcc (2), lda data (4)
	; => 25 cycles, that's not bad !
	; (yeap, I tweaked the code for proper alignment :-)

	ldx #0
	beq waitdrq   ;<--- always jumps
	PROTECT2(FDC_status_register,2)
checkbusy
	bpl end_of_command
waitdrq
__fdc_status_1
	lda FDC_status_register
	lsr
	ror
	bcc checkbusy
	
	PROTECT(FDC_data)
__fdc_data_2    
	lda FDC_data
	sta LOADER_SECTOR_BUFFER,x ; Store the byte in the sector buffer
	inx
	jmp waitdrq
end_of_command
	and #($7c>>2) ; Chema changed the original vaue: 1C
	
	; Chema: If error repeat forever:
	bne RetryRead
	
	; CHEMA commented this: 
	;jsr WaitCompletion
	cli
	rts

;-------------------------------
; Simple waiting loop
;-------------------------------
; CHEMA: This is unused now
/*
WaitCommand
	ldx #wait_status_floppy
waitcommand
	nop
	nop
	dex
	bne waitcommand
	rts
*/

; CHEMA: Made several changes here. Removed the nops, did not disable interrupts for the loop.
;---------------------------------------------
; Waits for the completion of a command
; As we have not set the FDC IRQ we cannot simply
; poll bit 7 in $318, we have to check the busy
; bit on the status register.
; According to the datasheet we have to wait 24us
; before reading the status after a write to a command register.
; The loop takes a bit longer: 26 us (see sector_2-microdisc)
;------------------------------------------------
WaitCompletion
	txa
	pha
	ldx #5
r_wait_completion
	dex
	bne r_wait_completion
	PROTECT(FDC_status_register)
r2_wait_completion
__fdc_status_2
	lda FDC_status_register
	lsr
	bcs r2_wait_completion	; If s0 (busy) is not zero, wait.
	pla
	tax
	rts

;-----------------------------
; Default ISRs for vectors.
;-----------------------------
IrqHandler	
	bit $304
	;bit $03F7 Chema trying to make Jasmin work :(
IrqDoNothing
	rti	
	
;-------------------------------------
; Write data. Uncompressed and
; directly to disk (no buffering)
; so deals with 256-byte chunks only
;-------------------------------------	
; CHEMA: I am re-using the var ptr_destination, though it
; is now the ptr to the buffer to write.
WriteData
	; Flag we want to start avoiding the cumulus bug in the write sector command
	inc avoid_cumulus_bug
	
	jsr SetSideTrackSector
	lda _LoaderApiAddressLow
	sta ptr_destination+0
	lda _LoaderApiAddressHigh
	sta ptr_destination+1
loopwrite	
	jsr PutLoadPic
	jsr PrepareTrack

	; Begin of critical section
	sei
retrywrite	
	; Writes a sector to disk.
__fdc_writesector
	lda #CMD_WriteSector
	PROTECT(FDC_command_register)
__fdc_command_w
	sta FDC_command_register
	
	; According to the datasheet table of needed delays:
	; Write to Command Reg.	Read Status bits 1-7	32 µsec
	; The next loop is 23, plus some extra due to the beq / lda /tax /jmp (3+5+2+3=13)
	; Total is 36... could do with 4 iterations... perhaps
	ldy #5	;2
w_wait_completion
	dey	;2
	bne w_wait_completion ;2+1
	; = 23 cycles	
	
	; This is the correct loop, which keeps track of all kind
	; of errors, as it is done when reading data.
	; It is necessary to feed data at the disk
	; rate, which is (in double density) 250 Kbps, that is
	; 1 byte ~every 30 usec.

	;ldy #0
	beq next_byte
	PROTECT2(FDC_status_register,2)	
check_busy2
	bpl end_of_commandw
waitdrqw
__fdc_status_w
	lda FDC_status_register
	; Check DRQ & BUSY
	lsr 
	ror
	bcc check_busy2
	PROTECT(FDC_data)
__fdc_data_w	
	stx FDC_data
	iny
next_byte
	lda (ptr_destination),y
	tax
	jmp waitdrqw
end_of_commandw
	and #($3c>>2) ; Chema changed the original vaue: 1C
	bne retrywrite ; Chema: If error repeat forever:


	cli	
	; Now onto next sector
	inc ptr_destination+1
	dec _LoaderApiFileSizeHigh
	bne loopwrite
	
	; Flag we want to stop avoiding the cumulus bug in the write sector command
	dec avoid_cumulus_bug
	
	; Clear loading pic and return
	jmp ClearLoadingPic	; This is jsr/rts


;****************** CHEMA added these variables ****************
; I ran out of space in ZP for the var needed to avoid
; the Cumulus Bug, so I'll define it here. Besides,
; this way I can give it a default value
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
avoid_cumulus_bug	.byt 0

; Chema: And now some data for the loading picture
; this is not necessary for a general loading routine 

color		.byt 1

loadingmsg	.byt 9,124,125
		.byt 9,126,127
loadingimg	
	.byt $7F, $60, $6F, $6E, $6E, $6F, $60, $60	; tile #1
	.byt $78, $44, $72, $51, $51, $71, $41, $41	; tile #2
	.byt $60, $60, $60, $6F, $6F, $6F, $6F, $7F	; tile #3
	.byt $41, $41, $41, $7D, $7D, $7D, $7D, $7F	; tile #4

_EndLoaderCode

;
; This is free memory that can be used, when it reaches zero then the loader start address should be changed
;


	.dsb $FFEF - 3 - _EndLoaderCode

_Vectors

#if ( _Vectors <> $FFEF-3 )
#error - Vector address is incorrect, loader will crash
#else

;
; Here are the functions that the user can call from his own application
;

; Chema: WriteSupport
_LoaderApiSaveData			.byt OPCODE_JMP,<WriteData,>WriteData	   ; $FFEC-$FFEE

_LoaderApiFileStartSector 		.byt LOADER_GAME_PROGRAM_SECTOR            ; $FFEF
_LoaderApiFileStartTrack 		.byt LOADER_GAME_PROGRAM_TRACK             ; $FFF0

_LoaderApiFileSize
_LoaderApiFileSizeLow 			.byt <LOADER_GAME_PROGRAM_SIZE             ; $FFF1
_LoaderApiFileSizeHigh 			.byt >LOADER_GAME_PROGRAM_SIZE             ; $FFF2

; Could have a JMP here as well to launch the loaded program
_LoaderApiJump		    		.byt OPCODE_JMP                            ; $FFF3
_LoaderApiAddress
_LoaderApiAddressLow 			.byt <LOADER_GAME_PROGRAM_ADDRESS          ; $FFF4
_LoaderApiAddressHigh 			.byt >LOADER_GAME_PROGRAM_ADDRESS          ; $FFF5
_LoaderXxxxxx_available 		.byt 0                                     ; $FFF6
_LoaderApiLoadFile   		    	.byt OPCODE_JMP,<LoadData,>LoadData 	   ; $FFF7-$FFF9

;
; These three HAVE to be at these precise adresses, they map to hardware registers
;
_VectorNMI			.word IrqDoNothing		                   ; $FFFA-$FFFB - NMI Vector (Usually points to $0247)
_VectorReset			.word IrqDoNothing		                   ; $FFFC-$FFFD - RESET Vector (Usually points to $F88F)
_VectorIRQ			.word IrqHandler 		                   ; $FFFE-$FFFF - IRQ Vector (Normally points to $0244)

#echo Remaining space in the loader code:
#print (_Vectors - _EndLoaderCode) 

#endif

; End of the loader - Nothing should come after because it's out of the addressable memory range :)
