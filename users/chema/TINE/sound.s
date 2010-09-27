; sound file



; Routine for dumping registers to AY

#define ayc_Register $FF
#define ayc_Write    $FD
#define ayc_Read	 $FE
#define ayc_Inactive $DD
     
#define via_pcr      $030C
#define via_porta    $030F    


#define AY_AToneLSB		0
#define AY_AToneMSB		1
#define AY_BToneLSB		2
#define AY_BToneMSB		3
#define AY_CToneLSB		4
#define AY_CToneMSB		5
#define AY_Noise		6
#define AY_Status		7
#define AY_AAmplitude	8
#define AY_BAmplitude	9
#define AY_CAmplitude	10
#define AY_EnvelopeLSB	11
#define AY_EnvelopeMSB	12
#define AY_EnvelopeCy	13

silence_sfx .byt 0

; Needs X and Y with the low and high bytes of the
; table with register values
AYRegDump
.(
	lda silence_sfx
	beq dosfx
	rts
dosfx
	sei
	stx loop+1
	sty loop+2

    LDX #13
loop 
	LDA $dead,X
	cpx #13
	beq skip2
    CMP ReferenceBlock,X
    BEQ skip
skip2
    STA ReferenceBlock,X
    STX via_porta
    LDY #ayc_Register
    STY via_pcr
    LDY #ayc_Inactive
    STY via_pcr
    STA via_porta  
    LDA #ayc_Write
    STA via_pcr
    STY via_pcr
skip
	DEX
    BPL loop
	
	cli
    RTS
.)
		 
/*
ReferenceBlock
	.dsb 14,128
*/

SndStop
.(
	sei

    LDX #13
loop 
	LDA #128
    STA ReferenceBlock,X
	cpx #7
	bne not7
	lda #$40
	.byt $2c
not7
	lda #0
    STX via_porta
    LDY #ayc_Register
    STY via_pcr
    LDY #ayc_Inactive
    STY via_pcr
    STA via_porta  
    LDA #ayc_Write
    STA via_pcr
    STY via_pcr
skip
	DEX
    BPL loop
	
	cli
    RTS
.)



InitSound
.(
	jmp SndStop
	;rts
.)



SndExplosion
.(
	ldx #<explosion
	ldy #>explosion
	jmp AYRegDump
explosion
	;.byt 0,0,0,0,0,0,%00010,%1110000,$10,$0,$0,0,$28,0
	.byt 0,$4,0,$4,0,$6,$18,$40,$10,$10,$10,0,$20,0
.)


SndCrash
.(
	ldx #<crash
	ldy #>crash
	jmp AYRegDump
crash
	.byt 0,1,0,2,0,3,$2,$40,$10,$10,$10,0,4,0
.)

SndShoot
.(
	ldx #<shoot
	ldy #>shoot
	jmp AYRegDump
shoot
	.byt $1d,0,$15,0,$10,0,0,$40,$10,$10,$10,$a0,0,$4

.)

SndHit
.(
	ldx #<hit
	ldy #>hit
	jmp AYRegDump
hit
	.byt 0,0,0,0,0,0,%00010,%1110000,$10,$0,$0,0,$05,0
.)

SndHitNoShields
.(
  	ldx #<hit
	ldy #>hit
	jmp AYRegDump
hit
	.byt 0,2,0,0,0,0,%00010,%1110000,$10,$0,$0,0,$05,0
.)

SndSelect
.(
  	ldx #<sel
	ldy #>sel
	jmp AYRegDump
sel
	.byt $18,1,0,0,$18,1,0,$78,$10,0,$10,0,$02,0
.)

SndPic
.(
  	ldx #<pic
	ldy #>pic
	jmp AYRegDump
pic
	.byt $b,0,0,0,0,0,0,$78,$10,0,0,0,$01,0
.)

SndPoc
.(
  	ldx #<pic
	ldy #>pic
	jmp AYRegDump
pic
	.byt $10,0,0,0,0,0,0,$78,$10,0,0,0,$01,0
.)

SndPocLow
.(
  	ldx #<pic
	ldy #>pic
	jmp AYRegDump
pic
	.byt $d,2,0,0,0,0,0,$78,$10,0,0,0,$01,0
.)

SndMsg
.(
  	ldx #<msg
	ldy #>msg
	jmp AYRegDump
msg
	.byt $10,0,$19,0,$28,0,0,$78,$10,$10,$10,0,$01,0

.)


// SndBell1 is beautiful, but never used

SndBell1
.(
  	ldx #<bell
	ldy #>bell
	jmp AYRegDump
bell
	.byt 0,1,0,2,0,1,0,$78,$10,$10,$10,0,$a,0
.)

SndBell2
.(
  	ldx #<bell
	ldy #>bell
	jmp AYRegDump
bell
	.byt $fa,0,0,3,$fb,0,0,$78,$10,$10,$10,0,$a,0
.)

SndMissile
.(
  	ldx #<missile
	ldy #>missile
	jmp AYRegDump
missile
	.byt 0,0,0,0,0,0,$6c,$41,$10,0,0,0,$10,9
.)

SndCompass
.(
  	ldx #<msg
	ldy #>msg
	jmp AYRegDump
msg
	.byt $10,0,$10,1,$10,2,0,$78,$10,$10,$10,0,$08,0

.)

InitSndGalHyper
.(
	ldx #<explosion
	ldy #>explosion
	jmp AYRegDump
explosion
;7==77, 8==10, 12==F
	.byt 0,0,0,0,0,0,0,$77,$10,0,0,0,$50,0
.)

SndGalHyper
.(
	pha

	; Register number
	lda #AY_Noise
    sta via_porta
	
	;Set AY Control lines to Register Number 
	lda #ayc_Register
	sta via_pcr
	
	;Set AY Control lines to inactive 
	lda #ayc_Inactive
	sta via_pcr
	
	;Place the Register value into VIA Port A.
    pla
	sta via_porta
	
	;Set AY Control lines to Write 
	lda #ayc_Write
	sta via_pcr
	
	;Set AY Control lines to inactive again 
	lda #ayc_Inactive
	sta via_pcr
	rts
.)



; For WAVE compiled music
#define	VIA_PORTB		$0300
#define	VIA_PCR			$030C
#define	VIA_PORTA		$030F

#define	SYS_IRQPATCH	$FFFE

#define	MUSICBASEADDRESS	MusicData
#define	MUSICTRIGGERLOC	kk

kk .byt 0

.zero
pattern	.dsb 2	;00-01 Current Pattern Row Address
effect
ornament .dsb 2	;02-03 Current Ornament/Effect base Address
header	.dsb 2    ;04-05 Music Header Location
pat	.dsb 2    ;06-07 Pattern Address Table
eat	.dsb 2    ;08-09 Effect Address Table
oat	.dsb 2    ;0A-0B Ornament Address Table

.text
;Ensure this is kept page alligned
InitMusic
.(
	;Patch IRQ Vector
	sei
	lda #<MusicIRQ
	sta SYS_IRQPATCH
	lda #>MusicIRQ
	sta SYS_IRQPATCH+1
	
	lda #<10000;10000 ;9984
	sta via_t1ll 
	lda #>10000;10000 ;9984
	sta via_t1lh
	
	lda #<MUSICBASEADDRESS
	sta header
	lda #>MUSICBASEADDRESS
	sta header+1
	lda #11
	sta ListIndex
	
	;Set up pat
	ldy #2
	lda (header),y
	clc
	adc header
	sta pat
	iny
	lda (header),y
	adc header+1
	sta pat+1
	
	;Set up eat
	ldy #4
	lda (header),y
	clc
	adc header
	sta eat
	iny
	lda (header),y
	adc header+1
	sta eat+1
	
	
	;Set up oat
	ldy #6
	lda (header),y
	clc
	adc header
	sta oat
	iny
	lda (header),y
	adc header+1
	sta oat+1
	
	jsr ProcList
	
	lda #%11000000
	sta MusicActivity
	
	;Set up Music Tempo as 1 so that first irq call pattern
	lda #01
	sta MusicTempoCount
	
	cli	
	rts
.)	


MusicIRQ
.(
	; Genaral purpose counter (counting fps)
	inc counter

	sta RegA+1
	stx RegX+1
	sty RegY+1

	jsr ProcMusic
	jsr SendAY
avoid
       ;Clear IRQ event 
        lda via_t1cl 

        ;Process timer event 
        dec TimerCounter 
        lda TimerCounter 
        and #3        ;Essentially, every 4th irq, call key read 
        bne skip1 
        ;Process keyboard 
        jsr ReadKeyboard 
skip1

RegA	lda #00
RegX	ldx #00
RegY	ldy #00
	rti

.)

SendAY	ldx #13
.(
loop1	lda ayw_Bank,x
	cmp ayr_Bank,x
	beq skip1
	sta ayr_Bank,x
	ldy ayRealRegister,x
	sty VIA_PORTA
	ldy #$FF
	sty VIA_PCR
	ldy #$DD
	sty VIA_PCR
	sta VIA_PORTA
	lda #$FD
	sta VIA_PCR
	sty VIA_PCR
skip1	dex
	bpl loop1
.)
	rts

ProcMusic
	dec MusicTempoCount
	bne ProcSound
	ldy #1
	lda (header),y
	sta MusicTempoCount

	jsr ProcPattern

ProcSound
	ldx #2
.(
loop1	lda MusicActivity
	and NoiseBit,x	;B3 B4 B5
	cmp #1
	lda PatternNote,x
	bcc skip1
	
	;ProcOrnament
	ldy OrnamentID,x
	lda header
	clc
	adc (oat),y
	sta ornament
	lda header+1
	iny
	adc (oat),y
	sta ornament+1
loop2	ldy OrnamentIndex,x
	lda (ornament),y
	bne skip2
	ldy #00
	lda (ornament),y
	bmi skip6
	sta OrnamentIndex,x
	jmp loop2
skip6	lda MusicActivity
	and NoiseMask,x
	sta MusicActivity
	lda #00
skip2	clc
	adc PatternNote,x
	and #127
	inc OrnamentIndex,x

	;Convert to Pitch
skip1	tay
	lda PitchTableLo,y
	sta IntermediatePitchLo
	lda PitchTableHi,y
	sta IntermediatePitchHi

	;Check Effect
	lda MusicActivity
	and EffectBit,x
	beq skip3
	
	;Process Effect
	ldy EffectID,x
	lda header
	clc
	adc (eat),y
	sta effect
	lda header+1
	iny
	adc (eat),y
	sta effect+1
	ldy EffectIndex,x
loop3	lda (effect),y
	and #%11100000
	lsr
	sta vector1+1
	lda (effect),y
	iny
	and #31
	adc #255-15
	sec
vector1	jsr pmeLoopOrEnd
	bcs loop3
	tya
	sta EffectIndex,x

skip3	;Transfer Intermediate Pitch to AY Registers
	lda IntermediatePitchLo
	sta ayw_PitchLo,x
	lda IntermediatePitchHi
	sta ayw_PitchHi,x
	
	;Progress to next Effect/Ornament
	dex
	bmi skip4
	jmp loop1
skip4	rts
.)



ProcPattern
	lda PatternRestCount
.(
	beq skip4
	dec PatternRestCount
	jmp skip3

skip4	lda #00
	sta BarFlag
	sta ChannelID
	;We don't want any new note to adopt the previous effect/ornament if not specified
	sta NewActivity
;	;Reset Music Activity for ornaments and Effects
;	lda MusicActivity
;	and #%11000000
;	sta MusicActivity
	ldy #00
	lda (pattern),y
	cmp #166
	bne loop1
	jsr ProcList
loop1	ldy #00
	lda (pattern),y
	inc pattern
	bne skip2
	inc pattern+1
skip2	ldx #12
loop2	cmp PatternRangeThreshhold-1,x
	bcs skip1
	dex
	bne loop2
	sec
skip1	sbc PatternRangeThreshhold-1,x
	ldy PatternRangeCommandLo,x
	sty vector1+1
	ldy PatternRangeCommandHi,x
	sty vector1+2
	clc
vector1	jsr $dead
	bcc loop1

skip3	dec PatternRow
.)
	bne AvoidList
	
ProcList	;Get next List PatternID
	ldy ListIndex	;Offset by $0B
	lda (header),y
	
	;Check for End
.(
	bmi skip1
	
	;Calculate address of Pattern
	asl
	tay
	lda header
	adc (pat),y
	sta pattern
	lda header+1
	iny
	adc (pat),y
	sta pattern+1
	
	;Progress List Index
	inc ListIndex
	
	;Check for forced end
	bmi EndMusic
	
	;Reset Pattern Stuff
	lda #64
	sta PatternRow
	lda #00
	sta PatternRestCount

	rts

skip1	;Check for loop
	ldy #10
	lda (header),y
	bmi EndMusic
	sta ListIndex
	jmp ProcList

EndMusic	;Terminate Music
.)
TerminateMusic
	lda #00
	sta ayw_Volume
	sta ayw_Volume+1
	sta ayw_Volume+2
	sta MusicActivity
	jsr SendAY
	lda #$40
	sta SYS_IRQPATCH
AvoidList	rts

PatternRangeThreshhold
;The above loop searches and exits on 0 defaulting to Sample so we can save
;a massive one byte here!
; .byt 0	;00 prcSample      
 .byt 6   ;06 01 prcEGPeriod    
 .byt 69  ;45 02 prcCycle       
 .byt 72  ;48 03 prcNoise       
 .byt 103 ;67 04 prcNote        
 .byt 165 ;A5 05 prcRest        
 .byt 166 ;A6 06 prcBar         
 .byt 167 ;A7 07 prcVolume      
 .byt 171 ;AB 08 prcEffect      
 .byt 186 ;BA 09 prcOrnament    
 .byt 201 ;C9 10 prcCommand     
 .byt 208 ;D0 11 prcLongRowRest 
 .byt 209 ;D1 12 prcShortRowRest

PatternRangeCommandLo
 .byt <prcSample
 .byt <prcEGPeriod
 .byt <prcCycle
 .byt <prcNoise
 .byt <prcNote
 .byt <prcRest
 .byt <prcBar
 .byt <prcVolume
 .byt <prcEffect
 .byt <prcOrnament
 .byt <prcCommand
 .byt <prcLongRowRest	;(Second byte holds period)
 .byt <prcShortRowRest



prcCycle	tax
	lda CycleCode,x
	sta ayw_Cycle
	lda #128
	sta ayr_Cycle
	rts


prcNote	ldx ChannelID
	adc #11
	sta PatternNote,x
	;If Note specified always default to Noise Off, Tone On
	lda ayw_Status
	and ToneMask,x
	ora NoiseBit,x
	sta ayw_Status
	inc ChannelID
	lda ChannelID
	cmp #3	;If end of Row then indicate with Carry
	;If effect/Ornament not set and note then reset in musicactivity	
	lda NewActivity
	and EffectBit,x
	beq NoteDisableEffect 
	lda NewActivity
	and OrnamentBit,x
	beq NoteDisableOrnament
	rts

prcRest	ldx ChannelID
	inx
	stx ChannelID
	cpx #3
	rts

NoteDisableEffect
	lda MusicActivity
	and ToneMask,x
	sta MusicActivity
	;If no effect (And EG not set) ensure Pattern Volume gets into AY
	lda EGActiveFlag,x
.(
	bne skip1
	lda PatternVolume,x
	sta ayw_Volume,x
skip1	rts
.)

NoteDisableOrnament
	lda MusicActivity
	and NoiseMask,x
	sta MusicActivity
	rts


prcVolume
	tax
	lda RealVolume,x
	ldx ChannelID
	sta PatternVolume,x
	rts

prcEffect
	ldx ChannelID
	;Shift left so it can directly index eat
	asl
	sta EffectID,x
	lda #01
	sta EffectIndex,x
	lda NewActivity
	ora ToneBit,x
	sta NewActivity
	lda MusicActivity
	ora ToneBit,x
	sta MusicActivity
	rts
	
prcOrnament
	ldx ChannelID
	;Shift left so it can directly index oat
	asl
	sta OrnamentID,x
	lda #01
	sta OrnamentIndex,x
	lda NewActivity
	ora NoiseBit,x
	sta NewActivity
	lda MusicActivity
	ora NoiseBit,x
	sta MusicActivity
	rts

prcCommand
	tax
	ldy #00
	lda (pattern),y
	inc pattern
.(
	bne skip1
	inc pattern+1
skip1	ldy CommandVectorLo,x
.)
	sty vector1+1
	ldy CommandVectorHi,x
	sty vector1+2
vector1	jmp $DEAD


prcLongRowRest	;(Second byte holds period)
	ldy #00
	lda (pattern),y
	inc pattern
	bne prcShortRowRest
	inc pattern+1
prcShortRowRest
	sta PatternRestCount
	sec
	rts

CommandVectorLo
 .byt <prcCom_Tempo
 .byt <prcCom_TriggerOut
 .byt <prcCom_Pitchbend
 .byt <prcCom_SlideUp
 .byt <prcCom_SlideDown
 .byt <prcCom_SampleType
 .byt <prcCom_CopyLeftSibling

CommandVectorHi
 .byt >prcCom_Tempo
 .byt >prcCom_TriggerOut
 .byt >prcCom_Pitchbend
 .byt >prcCom_SlideUp
 .byt >prcCom_SlideDown
 .byt >prcCom_SampleType
 .byt >prcCom_CopyLeftSibling


	
prcCom_TriggerOut
	sta MUSICTRIGGERLOC
	rts

ayw_Bank
ayw_PitchLo	.byt 0,0,0
ayw_PitchHi	.byt 0,0,0
ayw_Noise		.byt 0
ayw_Status	.byt %01111000
ayw_Volume	.byt 0,0,0
ayw_EGPeriod	.byt 0,0
ayw_Cycle		.byt 0

ReferenceBlock
ayr_Bank
ayr_PitchLo	.byt 128,128,128
ayr_PitchHi	.byt 128,128,128
ayr_Noise		.byt 128
ayr_Status	.byt 128
ayr_Volume	.byt 128,128,128
ayr_EGPeriod	.byt 128,128
ayr_Cycle		.byt 128

BarFlag		.byt 0
Temp01		.byt 0

;These routines(pme) have calculated low addresses
;So are page alligned and spaced 16 bytes apart.
;To save space the gaps hold other subroutines,
;music vars and tables

;PageAllignedEffectCommands
.dsb 256-(*&255)
pmeLoopOrEnd	;XX00
 	ldy #00		;2
 	lda (effect),y      ;2
 	bpl pmeLoop         ;2
 	jmp EndEffect       ;3
pmeLoop 	tay                 ;1
	rts                 ;1

prcEGPeriod
	sta ayw_EGPeriod
	rts
	
MusicTempoCount	.byt 0

pmeNoiseOff	;XX10
	lda ayw_Status	;3
	ora NoiseBit,x      ;3
	sta ayw_Status      ;3
	rts                 ;1
	
prcBar	inc BarFlag
	sec
	rts
	
PatternRow	.byt 0

pmeEGOff		;XX20
	lda ayw_Volume,x	;3
	and #15             ;2
	sta ayw_Volume,x    ;3
	lda #00             ;2
	sta EGActiveFlag,x	;3
	rts                 ;1
	
NewActivity	.byt 0
PatternRestCount	.byt 0

pmeToneOff	;XX30
	lda ayw_Status	;3
	ora ToneBit,x       ;3
	sta ayw_Status      ;3
	rts                 ;1
	
prcNoise
	sta ayw_Noise
	rts

ChannelID		.byt 0
ListIndex		.byt 0

pmeVolumeOFS	;XX40
	clc
	adc PatternVolume,x	;3
	cmp #16             ;2
	bcs EndEffect       ;2
	sta PatternVolume,x ;3
	sta ayw_Volume,x    ;3
	rts                 ;1
	
MusicActivity	.byt 0

pmeNoiseOFS	;XX50
	clc
	adc ayw_Noise	;3
	and #31             ;2
	sta ayw_Noise       ;3
	jsr NoiseOn	;3
	rts                 ;1
EffectBit
ToneBit
 .byt %00000001
 .byt %00000010
 .byt %00000100
	



pmeEGPerOFS	;XX60
	clc
	adc ayw_EGPeriod	;3
	sta ayw_EGPeriod    ;3
	jmp EGOn		;3
	

EffectMask
ToneMask
 .byt %11111110
 .byt %11111101
 .byt %11111011
OrnamentBit
NoiseBit
 .byt %00001000
 .byt %00010000
 .byt %00100000
	
	
pmePitchOFS	;XX70
.(
	;A pitch offset is always relative to the Intermediate Pitch
	sta Temp01
	clc
	adc IntermediatePitchLo
	sta IntermediatePitchLo
	bit Temp01
	bmi skip2
	bcc skip1
	inc IntermediatePitchHi
	jmp skip1
skip2	bcs skip1
	dec IntermediatePitchHi
skip1	lda ayw_Status
.)
	and ToneMask,x
	sta ayw_Status
	sec
	rts

EndEffect	lda MusicActivity
	and EffectMask,x
	sta MusicActivity
	clc
	rts

PatternNote
 .dsb 3,0
PatternVolume
 .dsb 3,0
EffectID
 .dsb 3,0
ayRealRegister
 .byt 0,2,4,1,3,5,6,7,8,9,10,11,12,13
EffectIndex
 .dsb 3,0

NoiseOn	lda ayw_Status        
	and NoiseMask,x   
	sta ayw_Status        
	rts

EGOn	lda ayw_Volume,x      
	ora #16             
	sta ayw_Volume,x      
	sta EGActiveFlag,x
	clc                 
	rts                 

prcCom_Tempo
	sta MusicTempoCount
	;Also store into compiled header
	ldy #01
	sta (header),y
	rts
CycleCode
 .byt 8,10,0
OrnamentMask
NoiseMask
 .byt %11110111
 .byt %11101111
 .byt %11011111
OrnamentID
 .dsb 3,0
OrnamentIndex
 .dsb 3,0
RealVolume
 .byt 0,4,8,15
EGActiveFlag
 .byt 0,0,0
IntermediatePitchLo	.byt 0
IntermediatePitchHi	.byt 0
;The following Commands are not supported
prcSample
prcCom_Pitchbend
prcCom_SlideUp
prcCom_SlideDown
prcCom_SampleType
prcCom_CopyLeftSibling
	rts
PatternRangeCommandHi
 .byt >prcSample
 .byt >prcEGPeriod
 .byt >prcCycle
 .byt >prcNoise
 .byt >prcNote
 .byt >prcRest
 .byt >prcBar
 .byt >prcVolume
 .byt >prcEffect
 .byt >prcOrnament
 .byt >prcCommand
 .byt >prcLongRowRest	;(Second byte holds period)
 .byt >prcShortRowRest

PitchTableLo
 .byt <3822,<3606,<3404,<3214,<3032,<2862,<2702,<2550,<2406,<2272,<2144,<2024
 .byt <1911,<1803,<1702,<1607,<1516,<1431,<1351,<1275,<1203,<1136,<1072,<1012
 .byt <955,<901,<851,<803,<758,<715,<675,<637,<601,<568,<536,<506
 .byt <477,<450,<425,<401,<379,<357,<337,<318,<300,<284,<268,<253
 .byt <238,<225,<212,<200,<189,<178,<168,<159,<150,<142,<134,<126
 .byt <119,<112,<106,<100,<94,<89,<84,<79,<75,<71,<67,<63
 .byt <59,<56,<53,<50,<47,<44,<42,<39,<37,<35,<33,<31
 .byt <29,<28,<26,<25,<23,<22,<21,<19,<18,<17,<16,<15
 .byt <14,<14,<13,<12,<11,<11,<10,<9,<9,<8,<8,<7
 .byt 7,7,6,6,5,5,5,4,4,4,4,3
 .byt 3,3,3,3,2,2,2,2
PitchTableHi
 .byt >3822,>3606,>3404,>3214,>3032,>2862,>2702,>2550,>2406,>2272,>2144,>2024
 .byt >1911,>1803,>1702,>1607,>1516,>1431,>1351,>1275,>1203,>1136,>1072,>1012
 .byt >955,>901,>851,>803,>758,>715,>675,>637,>601,>568,>536,>506
 .byt >477,>450,>425,>401,>379,>357,>337,>318,>300,>284,>268,>253
 .byt >238,>225,>212,>200,>189,>178,>168,>159,>150,>142,>134,>126
 .byt >119,>112,>106,>100,>94,>89,>84,>79,>75,>71,>67,>63
 .byt >59,>56,>53,>50,>47,>44,>42,>39,>37,>35,>33,>31
 .byt >29,>28,>26,>25,>23,>22,>21,>19,>18,>17,>16,>15
 .byt >14,>14,>13,>12,>11,>11,>10,>9,>9,>8,>8,>7
 .byt 0,0,0,0,0,0,0,0,0,0,0,0
 .byt 0,0,0,0,0,0,0,0
EndOfPlayer
 .byt 0




