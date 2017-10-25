#define MICRODISC_LOADER
#include "disk_info.h"

//#define COLOR(color) pha:lda #16+(color&7):sta $bb80+40*27:pla
//#define COLOR(color) ;
//#define STOP(color) pha:lda #16+(color&7):sta $bb80+40*27:jmp *:pla
#define STOP(color);

#define PICLOC 35
#define LOADINGCOLOR pha:lda color: and #7: ora #1: inc color: sta $bb80+40*27+PICLOC:sta $bb80+40*26+PICLOC:pla
#define CLEARLOADING pha:lda #0:sta $bb80+40*27+PICLOC:sta $bb80+40*26+PICLOC:pla

	.zero
	
	*=$ff-17
	
retry_counter		.dsb 1		; Number of attempts at loading data (ie: not quite clear what happens when this fails...)
sectors_to_go		.dsb 1		; How many sectors do we still need to load for this file
current_track		.dsb 1		; Index of the track being loaded
current_sector		.dsb 1		; Index of the sector being loaded
current_side		.dsb 1		; Has the bit 4 set to 0 or 1 to be used as a mask on the Microdisc control register (other bits have to be set to zero)
irq_save_a		.dsb 1  	    ; To preserve the accumulator value in the IRQ code

; Unpack test
ptr_source		.dsb 2		; Packed source data adress
ptr_destination		.dsb 2 		; Destination adress where we depack
ptr_destination_end	.dsb 2		; Point on the end of the depacked stuff
ptr_source_back		.dsb 2		; Temporary used to hold a pointer on depacked stuff

offset			.dsb 2
mask_value		.dsb 1
nb_dst			.dsb 1

	.text

	*=location_loader

;
; This is called from the bootsectors with the X register containing the fdc offset;
; +$00 = Microdisc
; +$e4 = Jasmin
;
Initialize
	;jmp Initialize
	jmp StartUp

#define LOADER

; This file is generated by the floppy builder
#include "floppy_description.h"

; Some local variables we need
fdc_register_offset		.dsb 1

color		.byt 1

loadingmsg	.byt 9,124,125
		.byt 9,126,127
loadingimg	
	.byt $7F, $60, $6F, $6E, $6E, $6F, $60, $60	; tile #1
	.byt $78, $44, $72, $51, $51, $71, $41, $41	; tile #2
	.byt $60, $60, $60, $6F, $6F, $6F, $6F, $7F	; tile #3
	.byt $41, $41, $41, $7D, $7D, $7D, $7D, $7F	; tile #4

StartUp
	stx fdc_register_offset				; Store the FDC offset value

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
	
loop_forever
	; Load the first part
	ldx #LOADER_PROGRAM_FIRST
	jsr LoadData
	jsr __auto_execute_address

	; Give control to the application and hope it knows what to do
__auto_execute_address
	jmp $a000
				
IrqHandler
	sta irq_save_a
	pla
	pha
	and #%00010000	; Check the saved B flag to detect a BRK
	bne from_brk
	
from_irq
#ifdef LOADER_SHOW_DEBUGINFO	
	lda $bfdf
	eor #1
	ora #16
	sta $bfdf
#endif
	lda irq_save_a
	bit $304
IrqDoNothing
	rti	
	
from_brk	
	lda #16+1
	sta $bb80+40*27	
	nop
	nop
	nop
	lda #16+2
	sta $bb80+40*27
	bne from_brk


		
	
; X=File index
; A=Low
; Y=High
SetLoadAddress
	sta FileLoadAdressLow,x
	tya
	sta FileLoadAdressHigh,x
	rts


; X=File index
LoadData
	;STOP(2)

	; We have to start somewhere no matter what, compressed or not
	jsr StartReadOperation

	; Now at this stage we have to check if the data is compressed or not
	lda FileStoredSizeLow,x
	cmp FileSizeLow,x
	sta __siz+1
	bne LoadCompressedData

	lda FileStoredSizeHigh,x
	cmp FileSizeHigh,x
	bne LoadCompressedData

LoadUncompressedData	
	lda #0
	sta __kludge+1
	;
	; Loop to read all the sectors	
	;
read_sectors_loop
	lda sectors_to_go
	cmp #1
	bne skip2
__siz
	lda #0
	sta __kludge+1
skip2
	jsr	ReadNextSector

	; Try to let time to an IRQ to play, and during that time copy the sector to the final location
	cli

	ldy #0
loop_copy
	lda $200,y 			; Load the byte from page 2
__auto_write_address
	sta $c000,y 		; Store it to the final location
	iny
__kludge
	cpy #0
	bne loop_copy

	nop
	nop
	sei

	; Next sector
	inc __auto_write_address+2
	dec sectors_to_go
	bne read_sectors_loop

	; Data successfully loaded (we hope), so we restore the interrupts
	jsr ClearLoadingPic
	cli
	rts


LoadCompressedData
	clc
	lda FileLoadAdressLow,x
	sta ptr_destination+0
	adc FileSizeLow,x
	sta ptr_destination_end+0

	lda FileLoadAdressHigh,x
	sta ptr_destination+1
	adc FileSizeHigh,x
	sta ptr_destination_end+1

	;STOP(2)

	jsr UnpackData
	jsr ClearLoadingPic
	cli
	rts

ClearLoadingPic
	CLEARLOADING
	rts
	
StartReadOperation	
 	sei

 	ldy fdc_register_offset

	; Make sure the microdisc IRQ is disabled	
	jsr WaitCompletion

	lda #%10000100 			; Disable the FDC (Eprom select + FDC Interrupt request)
	sta FDC_flags,y

	;jsr WaitCompletion

	;
	; Setup, we use the table to find out where the file is located on the floppy,
	; where to write it in memory, and how large it is.
	;
	lda FileLoadAdressHigh,x
	sta __auto_execute_address+2
	sta __auto_write_address+2

	lda FileLoadAdressLow,x
	sta __auto_execute_address+1
	sta __auto_write_address+1

	; Starting track	
	ldy #%00000000 				; Side 0
	lda FileStartTrack,x        ; If the track id is larger than 128, it means it is on the other side of the floppy
	bpl first_side
	; The file starts on the second side
	ldy #FDC_Flag_DiscSide	    ; Side 1
	and #%01111111              ; Mask out the extra bit
first_side
	sty current_side
	sta current_track

 	ldy fdc_register_offset

	; First sector
	lda FileStartSector,x
	sta current_sector

	; FileSizeLow/FileSizeHigh
	; Number of sectors to load
	.(
	lda FileStoredSizeHigh,x 	
	sta sectors_to_go
	lda FileStoredSizeLow,x
	beq skip
	inc sectors_to_go
skip
	.)	
	rts


ReadNextSector
	cli
	;COLOR(5)
	LOADINGCOLOR
	
 	ldy fdc_register_offset

	; Check if we have reached the end of the track
	lda current_sector
	cmp #FLOPPY_SECTOR_PER_TRACK+1
	bne same_track

	; Next track
	inc current_track
	lda current_track
	cmp #FLOPPY_TRACK_NUMBER
	bne stay_on_same_side

	; Reset to the first track on the other side
	lda #0
	sta current_track

	sei

	lda #FDC_Flag_DiscSide
	sta current_side	
stay_on_same_side

	
	; Reset the sector position
	lda #1
	sta current_sector
same_track

#ifdef LOADER_SHOW_DEBUGINFO	
	; Display debug info
	cli
	jsr DisplayPosition
	sei
#else
	cli
	jsr WaitCommand
	sei
#endif

	lda current_sector
	sta FDC_sector_register,y
	inc current_sector
	
	; Check if the drive is on the correct track		
	lda current_track
	cmp FDC_track_register,y	
	beq stay_on_the_track
		
	; Set the new track
	sta FDC_data,y
		
	lda #CMD_Seek
	sta FDC_command_register,y	
	jsr WaitCompletion
	
stay_on_the_track
	lda #%10000100 ; on force les le Microdisk en side0, drive A ... Set le bit de donn�es !!!
	ora current_side
	sta FDC_flags,y

again
	lda #CMD_ReadSector
	sta FDC_command_register,y

	;cli
	jsr WaitCommand
	;sei

	;
	; Read the sector data
	;
	ldx #0
microdisc_read_data
	lda $0318,y	; CHEMA ADDED THIS
	bmi microdisc_read_data

	lda FDC_data,y
	sta $200,x 		; Store the byte in page 2
	inx
	bne microdisc_read_data

	lda FDC_status_register,y
	and #$1C
	bne again

	;jsr WaitCompletion
	;COLOR(0)
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
	lda FDC_status_register,y
	lsr
	bcs r2_wait_completion

	;asl
	pla
	tax
	rts

#ifdef LOADER_SHOW_DEBUGINFO	
HexData	.byt "0123456789ABCDEF"

DisplayPosition	
	.(
	lda current_side	
	lsr
	lsr
	lsr
	lsr
	tax
	lda HexData,x
	sta $bb80+40*27+0

	lda #3
	sta $bb80+40*27+1
		
	lda current_track
	lsr
	lsr
	lsr
	lsr
	tax
	lda HexData,x
	sta $bb80+40*27+2
	
	lda current_track
	and #15
	tax
	lda HexData,x
	sta $bb80+40*27+3

	lda #2	
	sta $bb80+40*27+4
		
	lda current_sector
	lsr
	lsr
	lsr
	lsr
	tax
	lda HexData,x
	sta $bb80+40*27+5
	
	lda current_sector
	and #15
	tax
	lda HexData,x
	sta $bb80+40*27+6
	
	;jsr WaitLoop
	rts
	.)
#endif
	

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
	lda $200
	inc __fetchByte+1
	plp
	rts



; void file_unpack(void *ptr_dst,void *ptr_src)

; Need to be called with valid values in:
; ptr_destination
; ptr_source
; ptr_destination_end (Destination + size)
UnpackData
	;jmp UnpackData
.(
	cli

	; Initialise variables
	; We try to keep "y" null during all the code,
	; so the block copy routine has to be sure that
	; y is null on exit
	ldy #0
	sty __fetchByte+1
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
	;// We increase the current destination pointer,
	;// by a given value, white checking if we reach
	;// the end of the buffer.
	clc
	lda ptr_destination
	adc nb_dst
	sta ptr_destination

	.(
	bcc skip
	inc ptr_destination+1
skip
	.)
	cmp ptr_destination_end
	lda ptr_destination+1
	sbc ptr_destination_end+1
	bcc unpack_loop  
	rts
	

back_copy
	;BreakPoint jmp BreakPoint	
	; Copy a number of bytes from the already unpacked stream
	; Here we know that y is null. So no need for clearing it.
	; Just be sure it's still null at the end.
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

	; Beware, in that loop, the direction is important
	; since RLE like depacking is done by recopying the
	; very same byte just copied... Do not make it a 
	; reverse loop to achieve some speed gain...
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
.)

_EndLoaderCode

;
; This is free memory that can be used, when it reaches zero then the loader start address should be changed
;

	.dsb $FFF4 - _EndLoaderCode

_Vectors

#if ( _Vectors <> $FFF4 )
#error - Vector address is incorrect, loader will crash
#else

;
; Here are the functions that the user can call from his own application
;
_ApiSetLoadAddress	.byt $4c,<SetLoadAddress,>SetLoadAddress 	; $FFF4
_ApiSetLoadData		.byt $4c,<LoadData,>LoadData 				; $FFF7

;
; These three HAVE to be at these precise adresses, they map to hardware registers
;
_VectorNMI			.word IrqDoNothing		; FFFA-FFFB - NMI Vector (Usually points to $0247)
_VectorReset		.word IrqDoNothing		; FFFC-FFFD - RESET Vector (Usually points to $F88F)
_VectorIRQ			.word IrqHandler 		; FFFE-FFFF - IRQ Vector (Normally points to $0244)

#echo Remaining space in the loader code:
#print (_Vectors - _EndLoaderCode) 

#endif

; End of the loader - Nothing should come after because it's out of the addressable memory range :)

