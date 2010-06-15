
;; Mission 8. Asteroid sower at Edorqu (10) in galaxy 4


.(
// Jump table to mission functions    
// These are kind of event handlers  
// OnPlayerXXX. The idea is patching these with the necessary jumps. If returns C=1 it means
// that text is to be plotted to screen (brief or debrief). 

OnPlayerLaunch
	clc
	rts
	.byt 00
OnPlayerDock
    jmp CheckSuccess
OnPlayerHyper
    jmp CheckSuccess
OnExplodeShip
	jmp CheckAsteroid
OnDockedShip
	jmp CheckImpact
OnHyperShip
	clc
	rts
	.byt 00
OnEnteringSystem
	jmp LaunchMission
OnNewEncounter
	clc
	rts
	.byt 00


// OnScoopObject return with carry =1 if it has handled the scooping, so the main program
// avoids doing so.

OnScoopObject		
	clc
	rts
	.byt 00

// OnGameLoaded, called whenever the game has been loaded from disk, for initializing things...
OnGameLoaded
	clc
	rts
	.byt 00
	
// Some public variables 
NeedsDiskLoad		.byt 0	; Will be set to $ff when a new mission needs to be loaded from disk
MissionSummary		.word str_Summary
MissionCargo		.byt 0	; Cargo for this mission
AvoidOtherShips		.byt 0	; If not zero, no other ships are created

// Some internal variables and code 

Asteroids			.dsb 3
NAsteroids			.byt 5
DAsteroids			.byt 8
Failure				.byt 0

LaunchMission
.(
	lda _mission
	cmp #THISMISSION
	bne next

	; Will we launch it?
	jsr IndRnd
	cmp #40
	bcs nolaunch

	inc _mission

	lda #<str_MissionBrief1
	sta TXTPTRLO
	lda #>str_MissionBrief1
	sta TXTPTRHI
	sec
	rts


next
	; Maybe at destination
	lda _mission
	cmp #THISMISSION+1
	bne nolaunch


	lda _galaxynum
	cmp #4 
	bne nolaunch

	lda _currentplanet
	cmp #10
	bne nolaunch

	inc _mission

	inc AvoidOtherShips

	jsr CreateAsteroids

	lda #<str_MissionBrief
	sta TXTPTRLO
	lda #>str_MissionBrief
	sta TXTPTRHI
	sec
	rts

.)
nolaunch
	clc
	rts

CheckSuccess
.(
 	lda _mission
	; 0=Not launched yet, 1=Launched but never arrived at system
	cmp #THISMISSION+2
	bcc nolaunch	

	; Mission has been launched
	; and asteroids created.. check success
	; If state is 2 then not all asteroids have been destroyed
	; If state is 3 then success

	cmp #THISMISSION+3
	bne MissionFailed

	lda #NEXTMISSION
	sta _mission

	dec AvoidOtherShips	; This may not be necessary

	lda #<str_MissionDebrief
	sta TXTPTRLO
	lda #>str_MissionDebrief
	sta TXTPTRHI

	dec NeedsDiskLoad
	sec
	rts
.)
MissionFailed
.(
	lda #NEXTMISSIONFAIL
	sta _mission

	dec AvoidOtherShips	

	lda #<str_MissionDebriefFail
	sta TXTPTRLO
	lda #>str_MissionDebriefFail
	sta TXTPTRHI

	sec
	rts

.)


CheckAsteroid
.(
	lda Failure
	bne isnot

	jsr IsAsteroid
	beq isnot

	dec DAsteroids
	beq last

	lda NAsteroids
	beq isnot

	; Not the last one... create
	sty sav_y+1
	jsr IndRnd
	and #%11
	tay
	lda pos_tabhi,y
	tax
	lda pos_tablo,y
	jsr Create1Asteroid
	txa
	beq isnot
sav_y
	ldy #0	; SMC
	sta Asteroids,y
	dec NAsteroids
	clc
	rts

last
	inc _mission
	lda #<str_Done
	sta tmp0
	lda #>str_Done
	sta tmp0+1
	ldx #0
	jsr IndFlightMessage

isnot
	clc
	rts
.)

CheckImpact
.(
	jsr IsAsteroid
	beq isnot
	dec Failure
	lda #<str_Impact
	sta tmp0
	lda #>str_Impact
	sta tmp0+1
	ldx #0
	jsr IndFlightMessage
isnot
	clc
	rts
.)

IsAsteroid
.(
	txa
	ldy #2
loop
	cmp Asteroids,y
	beq positive
	dey
	bpl loop
negative
	tax
	lda #0
	rts
positive
	tax
	lda #0
	sta Asteroids,y
	lda #$ff
	rts
.)


POS1
	.word -4000
	.word -4000
	.word -9000
POS2
	.word 4000
	.word -4000
	.word -9000
POS3
	.word 4000
	.word 4000
	.word -9000
POS4
	.word -4000
	.word 4000
	.word -9000

pos_tablo 
	.byt <POS1,<POS2,<POS3,<POS4
pos_tabhi 
	.byt >POS1,>POS2,>POS3,>POS4


CreateAsteroids
.(
    lda #<POS1
    ldx #>POS1   
	jsr Create1Asteroid
	stx Asteroids
    lda #<POS2
    ldx #>POS2   
	jsr Create1Asteroid
	stx Asteroids+1
    lda #<POS3
    ldx #>POS3   
	jsr Create1Asteroid
	stx Asteroids+2
	rts
.)


Create1Asteroid
.(
    sta tmp0
	stx tmp0+1

    lda #(SHIP_ASTEROID)
    jsr IndAddSpaceObject
	cpx #0
	beq end

	lda #(FLG_FLY_TO_PLANET)
	sta _flags,x
	lda #(IS_AICONTROLED|FLG_DEFENCELESS)
	sta _ai_state,x
	lda #2
	sta _target,x
	; Make it rotate
	lda #3
	sta _rotz,x
end
	rts
.)


str_Done
	.asc "Well done! You saved us"
	.byt 0

str_Impact
	.asc "IMPACT! Mission Failed"
	.byt 0

str_Summary
	.byt 2
	.asc "Current mission:"
	.byt 13
	.byt 2 
	.asc "Go to Edorqu (gal 4) and"
	.byt 13
	.byt 2 
	.asc "ask for Marcus Thaid."
	.byt 0

str_MissionBrief1
	.asc "Greetings. Hasler here."
	.byt 13
	.asc "I got some more info for you."
	.byt 13
	.asc "I know where the secret lab where"
	.byt 13
	.asc "Dr. Zantor worked is located."
	.byt 13
	.asc "You should go to Edorqu (gal 4),"
	.byt 13
	.asc "visit UH-Investments and ask for"
	.byt 13
	.asc "Marcus Thaid."
	.byt 0

str_MissionBrief
	.asc "S.O.S -- S.O.S"
	.byt 13
	.byt 13
	.asc "Several asteroids are on"
	.byt 13
	.asc "collision course to the planet."
	.byt 13
	.byt 13
	.asc "Destroy them before their impact!"
	.byt 0


str_MissionDebriefFail
	.asc "Due to the impact, millions"
	.byt 13
	.asc "died. UH-Investments was"
	.byt 13
	.asc "totally devasted."
	.byt 0


str_MissionDebrief
	.asc "Dr. Thaid here. What you saw was"
	.byt 13
	.asc "a deliberate attack! And they"
	.byt 13
	.asc "used our tech! but Zantor was not"
	.byt 13
	.asc "a traitor, for sure. I found a"
	.byt 13
	.asc "possible countermeasure for these"
	.byt 13
	.asc "attacks. Carry this data to the"
	.byt 13
	.asc "intel center at Usaorer (gal 5)." 
	.byt 11
	.asc "More things here..."
	.byt 13
	.asc "More things here..."
	.byt 13
	.asc "More things here..."
	.byt 13
	.asc "More things here..."

	.byt 0
.)

