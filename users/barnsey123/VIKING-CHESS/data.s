



/* Populate array with tile types
Tile types:
0=blank
1=attacker square
2=defender square
3=king square
*/
_tiles
	.byt 4,0,0,1,1,1,1,1,0,0,4
	.byt 0,0,0,0,0,1,0,0,0,0,0
	.byt 0,0,0,0,0,0,0,0,0,0,0
	.byt 1,0,0,0,0,2,0,0,0,0,1
	.byt 1,0,0,0,2,2,2,0,0,0,1
	.byt 1,1,0,2,2,3,2,2,0,1,1
	.byt 1,0,0,0,2,2,2,0,0,0,1
	.byt 1,0,0,0,0,2,0,0,0,0,1
	.byt 0,0,0,0,0,0,0,0,0,0,0
	.byt 0,0,0,0,0,1,0,0,0,0,0
	.byt 4,0,0,1,1,1,1,1,0,0,4

; uninitialized variable (will calc on fly) - target values of square 
_target
	.dsb 11*11		

_enemy
	.dsb 11*11
  
	
/*	
for (ctns=0;ctns<11;ctns++)
	{
	for (ctew=0;ctew<11;ctew++) 
		{
		target[ctns][ctew]=0;
		enemy[ctns][ctew]=0;
		}
	}
*/	
_ClearTargetAndEnemy
.(
	lda #0
	ldx #0
loop_clear
	sta _target,x
	sta _enemy,x
	inx
	cpx #11*11
	bne loop_clear	
	rts
.)	

