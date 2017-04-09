
#define OPCODE_RTS				$60
#define OPCODE_JMP              $4C

#define COLOR(color) pha:lda #16+(color&7):sta $bb80+40*27:pla
#define STOP(color) pha:lda #16+(color&7):sta $bb80+40*27:jmp *:pla

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
#define FDC_status_register		$0310
#define FDC_track_register		$0311
#define FDC_sector_register		$0312
#define FDC_data				$0313
#define FDC_flags				$0314
#define FDC_drq                 $0318	

#define FDC_Flags_Mask          %10000100       ; Disable ROM/EPROM, no FDC interrupt requests, A drive, Side 0
#define FDC_Flag_DiscSide       %00010000       ; Accesses second side of the disk

#define CMD_ReadSector			$80

#define CMD_Seek				$1F

#define wait_status_floppy 30


;
; Jasmin register values
;
#define FDC_JASMIN_command_register		$03f4
#define FDC_JASMIN_status_register		$03f4
#define FDC_JASMIN_track_register		$03f5
#define FDC_JASMIN_sector_register		$03f6
#define FDC_JASMIN_data					$03f7
#define FDC_JASMIN_flags				$03f8
#define FDC_JASMIN_drq                 	$03FC	

#define FDC_JASMIN_Flag_DiscSide       	%00000001

#define CMD_JASMIN_ReadSector			$8c


#include "floppy_description.h"       ; This file is generated by the floppy builder

	.zero
	
	*=LOADER_BASE_ZERO_PAGE
; If you add or remove any variables, make sure that LOADER_BASE_ZERO_PAGE is still correct (defined in the floppy builder script) 	
current_track		.dsb 1		; Index of the track being loaded
current_sector		.dsb 1		; Index of the sector being loaded
current_side		.dsb 1		; Has the bit 4 set to 0 or 1 to be used as a mask on the Microdisc control register (other bits have to be set to zero)

ptr_destination		.dsb 2 		; Destination adress where we depack
ptr_destination_end	.dsb 2		; Point on the end of the depacked stuff
ptr_source_back		.dsb 2		; Temporary used to hold a pointer on depacked stuff
offset				.dsb 2
mask_value			.dsb 1
nb_dst				.dsb 1

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
	sei 								; Make sure interrupts are disabled
    cld                                 ; Force decimal mode

	cpx #0                              ; If we are on Jasmin, patch all the FDC related values
	beq end_jasmin_init
    
	lda #<FDC_JASMIN_command_register
	sta 1+__fdc_command_1
	sta 1+__fdc_command_2

	lda #<FDC_JASMIN_status_register
	sta 1+__fdc_status_1
	sta 1+__fdc_status_2

	lda #<FDC_JASMIN_track_register
	sta 1+__fdc_track_1

	lda #<FDC_JASMIN_sector_register
	sta 1+__fdc_sector_1

	lda #<FDC_JASMIN_data
	sta 1+__fdc_data_1
	sta 1+__fdc_data_2

	lda #<FDC_JASMIN_flags
	sta 1+__fdc_flags_1
	sta 1+__fdc_flags_2

	lda #<FDC_JASMIN_drq
	sta 1+__fdc_drq_1

	lda #CMD_JASMIN_ReadSector
	sta 1+__fdc_readsector

	lda #FDC_JASMIN_Flag_DiscSide
	sta 1+__fdc_discside

end_jasmin_init	

    ldx #$ff                            ; Reset the stack pointer
    txs

    lda #$ff                            ; Initialize the VIA to known values (code is from Atmos ROM)
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

forever_loop
	jsr LoadData                       ; Load the main game  (parameters are directly initialized in the loader variables at the end of the file)
	jsr _LoaderApiJump 				   ; Give control to the application and hope it knows what to do
	jmp forever_loop
		
	
; -------------------------------------------------------------------------------
;                                   Resident section
; ------------------------------------------------------------------------------- 
;
; This section of the loader stays in memory at all time.
; It contains all the code for loading, saving, as well as memory areas used by the
; API to communicated between the main application and the loader.
;
_LoaderResidentStart

; X=File index
LoadData
	ldy #0
	sty __fetchByte+1

	; We have to start somewhere no matter what, compressed or not
 	sei

	; Make sure the microdisc IRQ is disabled	
	jsr WaitCompletion

	lda #FDC_Flags_Mask 			; Disable the FDC (Eprom select + FDC Interrupt request)
__fdc_flags_1
	sta FDC_flags

	; Starting track	
	ldy #%00000000 				; Side 0
	lda _LoaderApiFileStartTrack        ; If the track id is larger than 128, it means it is on the other side of the floppy
	bpl first_side
	; The file starts on the second side
	ldy #FDC_Flag_DiscSide	    ; Side 1
	and #%01111111              ; Mask out the extra bit
first_side
	sty current_side
	sta current_track

	; First sector
	lda _LoaderApiFileStartSector
	and #%01111111                     ; Clear out the top bit (compressed flag)
	sta current_sector

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
	cli 							; Data successfully loaded (we hope), so we restore the interrupts
	rts

LoadCompressedData
	cli

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

GetNextByte
	php
	lda __fetchByte+1
	bne __fetchByte
	nop
	nop
	nop
	nop
	sei
	jsr	ReadNextSector
	nop
	nop
	nop
	nop
	cli
	ldx #0
	ldy #0
__fetchByte
	lda LOADER_SECTOR_BUFFER
	inc __fetchByte+1
	plp
	rts



ReadNextSector
	lda current_sector                       ; Check if we have reached the end of the track
	cmp #FLOPPY_SECTOR_PER_TRACK+1
	bne end_change_track
	
	inc current_track                        ; Move to the next track
	lda current_track
	cmp #FLOPPY_TRACK_NUMBER
	bne end_side_change
	
	lda #0                                   ; Reset to the first track on the other side
	sta current_track

__fdc_discside
	lda #FDC_Flag_DiscSide
	sta current_side	
end_side_change
	
	lda #1                                   ; Reset the sector position
	sta current_sector
end_change_track

	cli
	jsr WaitCommand
	sei

	lda current_sector
__fdc_sector_1	
	.dsb ((FDC_sector_register&3)-((*+3)&3))&3,$ea
	sta FDC_sector_register
	inc current_sector
		
	lda current_track                        ; Check if the drive is on the correct track		
__fdc_track_1	
	.dsb ((FDC_track_register&3)-((*+3)&3))&3,$ea
	cmp FDC_track_register
	beq stay_on_the_track
			
__fdc_data_1	
	.dsb ((FDC_data&3)-((*+3)&3))&3,$ea
	sta FDC_data                             ; Set the new track
		
	lda #CMD_Seek
__fdc_command_1
	.dsb ((FDC_command_register&3)-((*+3)&3))&3,$ea
	sta FDC_command_register	
	jsr WaitCompletion
stay_on_the_track

	lda #FDC_Flags_Mask                      ; Apply the side selection mask
	ora current_side
__fdc_flags_2
	sta FDC_flags

__fdc_readsector
	lda #CMD_ReadSector
__fdc_command_2
	.dsb ((FDC_command_register&3)-((*+3)&3))&3,$ea
	sta FDC_command_register

	jsr WaitCommand

	; Read the sector data
	ldx #0
loop_read_sector
__fdc_drq_1
	.dsb ((FDC_drq&3)-((*+3)&3))&3,$ea
	lda FDC_drq
    bmi loop_read_sector
__fdc_data_2
	.dsb ((FDC_data&3)-((*+3)&3))&3,$ea    
	lda FDC_data
	sta LOADER_SECTOR_BUFFER,x 		; Store the byte in the sector buffer
	inx
	bne loop_read_sector

__fdc_status_1
	.dsb ((FDC_status_register&3)-((*+3)&3))&3,$ea
	lda FDC_status_register
	and #$1C

	jsr WaitCompletion
	cli
	rts

WaitCommand
	ldx #wait_status_floppy
waitcommand
	nop
	nop
	dex
	bne waitcommand
	rts

WaitCompletion
	txa
	pha

	php
	sei
	nop
	nop
	nop

	ldx #4
r_wait_completion
	dex
	bne r_wait_completion
	plp

r2_wait_completion
__fdc_status_2
	.dsb ((FDC_status_register&3)-((*+3)&3))&3,$ea
	lda FDC_status_register
	lsr
	bcs r2_wait_completion

	pla
	tax
	rts


IrqHandler	
	bit $304
IrqDoNothing
	rti	

_EndLoaderCode

;
; This is free memory that can be used, when it reaches zero then the loader start address should be changed
;

	.dsb $FFEF - _EndLoaderCode

_Vectors

#if ( _Vectors <> $FFEF )
#error - Vector address is incorrect, loader will crash
#else

;
; Here are the functions that the user can call from his own application
;
_LoaderApiFileStartSector 		.byt LOADER_INTRO_PROGRAM_SECTOR            ; $FFEF
_LoaderApiFileStartTrack 		.byt LOADER_INTRO_PROGRAM_TRACK             ; $FFF0

_LoaderApiFileSize
_LoaderApiFileSizeLow 			.byt <LOADER_INTRO_PROGRAM_SIZE             ; $FFF1
_LoaderApiFileSizeHigh 			.byt >LOADER_INTRO_PROGRAM_SIZE             ; $FFF2

; Could have a JMP here as well to launch the loaded program
_LoaderApiJump		    		.byt OPCODE_JMP                            ; $FFF3
_LoaderApiAddress
_LoaderApiAddressLow 			.byt <LOADER_INTRO_PROGRAM_ADDRESS          ; $FFF4
_LoaderApiAddressHigh 			.byt >LOADER_INTRO_PROGRAM_ADDRESS          ; $FFF5
_LoaderXxxxxx_available 		.byt 0                                     ; $FFF6
_LoaderApiLoadFile   		    .byt OPCODE_JMP,<LoadData,>LoadData 	   ; $FFF7-$FFF9

;
; These three HAVE to be at these precise adresses, they map to hardware registers
;
_VectorNMI			.word IrqDoNothing		                   ; $FFFA-$FFFB - NMI Vector (Usually points to $0247)
_VectorReset		.word IrqDoNothing		                   ; $FFFC-$FFFD - RESET Vector (Usually points to $F88F)
_VectorIRQ			.word IrqHandler 		                   ; $FFFE-$FFFF - IRQ Vector (Normally points to $0244)

#echo Remaining space in the loader code:
#print (_Vectors - _EndLoaderCode) 

#endif

; End of the loader - Nothing should come after because it's out of the addressable memory range :)
