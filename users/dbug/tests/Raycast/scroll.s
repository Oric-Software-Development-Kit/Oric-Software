





Accu
	.byt 0

_DrawCompleteColumn
	;jmp _DrawCompleteColumn
	;brk	
	;.byt $a0

	ldy	_YPos
	clc
	lda _TableMul6Low,y
	adc #<_DrawColumn
	sta modif_draw+1

	lda _TableMul6High,y
	adc #>_DrawColumn
	sta modif_draw+2

	;lda #64+128+1+4+16	;_ColorDraw		;#64+1+2+4+8+16+32
	lda _ColorDraw
	ldx _XPos

modif_draw
	jsr _DrawColumn




	sec
	lda #100	
	sbc	_YPos
	tay
	clc
	lda _TableMul6Low,y
	adc #<_EraseColumn
	sta modif_erase+1

	lda _TableMul6High,y
	adc #>_EraseColumn
	sta modif_erase+2

	lda #64+1+2+4+8+16+32+128
	ldx _XPos
	
modif_erase
	jsr _EraseColumn

	;ldx _XPos
	;jsr _DrawColumn
	rts





_Labyrinthe
	.byt 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
	.byt 1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1
	.byt 1,0,1,0,0,0,0,0,0,0,0,0,0,1,0,1
	.byt 1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1
	.byt 1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1
	.byt 1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1
	.byt 1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1
	.byt 1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1
	.byt 1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1
	.byt 1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1
	.byt 1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1
	.byt 1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1
	.byt 1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1
	.byt 1,0,1,0,0,0,0,0,0,0,0,0,0,1,0,1
	.byt 1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1
	.byt 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1

_Labyrinthe2
	.byt 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
	.byt 1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1
	.byt 1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1
	.byt 1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1
	.byt 1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1
	.byt 1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1
	.byt 1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1
	.byt 1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1
	.byt 1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1
	.byt 1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1
	.byt 1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1
	.byt 1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1
	.byt 1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1
	.byt 1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1
	.byt 1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1
	.byt 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1


_Labyrinthe1
	.byt 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
	.byt 1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1
	.byt 1,0,1,1,1,1,1,1,1,1,1,1,1,1,0,1
	.byt 1,0,1,0,0,0,0,0,0,0,0,0,0,1,0,1
	.byt 1,0,1,0,1,1,0,0,0,0,0,1,0,1,0,1
	.byt 1,0,1,0,1,0,0,0,0,0,0,1,0,1,0,1
	.byt 1,0,0,0,1,0,0,1,1,1,1,1,0,0,0,1
	.byt 1,0,1,0,1,0,0,1,0,0,0,0,0,1,0,1
	.byt 1,0,1,0,1,0,0,1,0,1,1,1,1,1,0,1
	.byt 1,0,1,0,1,0,0,1,0,1,0,1,0,1,0,1
	.byt 1,0,0,0,1,0,0,1,0,0,0,1,0,0,0,1
	.byt 1,0,1,1,1,1,1,1,1,1,1,1,0,1,1,1
	.byt 1,0,1,0,0,0,0,0,0,0,0,0,0,1,0,1
	.byt 1,0,1,0,1,1,1,1,1,1,1,1,1,1,0,1
	.byt 1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1
	.byt 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1


