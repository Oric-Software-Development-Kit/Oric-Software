;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Generated by OASIS compiler
; (c) Chema 2016
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


; Dialog 200
.(
.byt RESOURCE_DIALOG|$80
.word (res_end-res_start +4)
.byt 200
res_start
.byt 220	; Stringpack with options
.byt 220	; Script with response actions
.byt 1,1,1,1,0,0,0,0,$ff	; Active flags
.word (l_family-script_220_start),(l_food-script_220_start),(l_book-script_220_start),(l_exit1-script_220_start),(l_skeptic-script_220_start),(l_skeptic-script_220_start),(l_air-script_220_start),(l_bye-script_220_start)	; Jump labels
res_end
.)
; String pack for dialog 200
.(
.byt RESOURCE_STRING|$80
.word (res_end-res_start +4)
.byt 220
res_start
.asc "You said you had news about my family.",0 ; String 0
.asc "I haven't taken anything for 36 hours.",0 ; String 1
.asc "I received the book you sent me.",0 ; String 2
.asc "One second. I'll be back.",0 ; String 3
.asc "Is this some kind of practical joke?",0 ; String 4
.asc "No, not that again..",0 ; String 5
.asc "But the outside air is lethal!",0 ; String 6
.asc "See you later, then.",0 ; String 7
res_end
.)

; Script 220
.(
.byt RESOURCE_SCRIPT|$80
.word (res_end-res_start +4)
.byt 220
res_start
+script_220_start
+l_family
.byt SC_WAIT_FOR_ACTOR
.byt 0
.byt SC_ACTOR_TALK
.byt 64, 250
.byt 64, 221
.byt 7
.byt SC_WAIT_FOR_ACTOR
.byt 64, 250
.byt SC_ACTOR_TALK
.byt 64, 250
.byt 64, 221
.byt 8
.byt SC_WAIT_FOR_ACTOR
.byt 64, 250
.byt SC_ACTIVATE_DLGOPT
.byt 0
.byt 0
.byt SC_JUMP
.word (l_common-res_start)
+l_food
.byt SC_WAIT_FOR_ACTOR
.byt 0
.byt SC_ACTOR_TALK
.byt 64, 250
.byt 64, 221
.byt 4
.byt SC_WAIT_FOR_ACTOR
.byt 64, 250
.byt SC_ACTOR_TALK
.byt 0
.byt 64, 221
.byt 3
.byt SC_WAIT_FOR_ACTOR
.byt 0
.byt SC_ACTOR_TALK
.byt 64, 250
.byt 64, 221
.byt 5
.byt SC_WAIT_FOR_ACTOR
.byt 64, 250
.byt SC_ACTOR_TALK
.byt 64, 250
.byt 64, 221
.byt 6
.byt SC_WAIT_FOR_ACTOR
.byt 64, 250
.byt SC_ACTIVATE_DLGOPT
.byt 1
.byt 0
l_act_skeptic
.byt SC_ACTIVATE_DLGOPT
.byt 4
.byt 1
.byt SC_ACTIVATE_DLGOPT
.byt 5
.byt 1
.byt SC_JUMP
.word (l_common-res_start)
+l_book
.byt SC_ACTOR_TALK
.byt 64, 250
.byt 64, 221
.byt 11
.byt SC_WAIT_FOR_ACTOR
.byt 64, 250
.byt SC_ACTOR_TALK
.byt 64, 250
.byt 64, 221
.byt 12
.byt SC_WAIT_FOR_ACTOR
.byt 64, 250
.byt SC_ACTOR_TALK
.byt 64, 250
.byt 64, 221
.byt 13
.byt SC_WAIT_FOR_ACTOR
.byt 64, 250
.byt SC_ACTIVATE_DLGOPT
.byt 6
.byt 1
.byt SC_ACTIVATE_DLGOPT
.byt 2
.byt 0
.byt SC_ACTIVATE_DLGOPT
.byt 3
.byt 0
.byt SC_ACTIVATE_DLGOPT
.byt 7
.byt 1
.byt SC_JUMP
.word (l_act_skeptic-res_start)
+l_skeptic
; if
.byt SC_JUMP_REL_IF, SF_NOT
.byt SF_GT
.byt SF_GETRAND
.byt 64, 128
.byt 27
; then part
.byt SC_ACTOR_TALK
.byt 64, 250
.byt 64, 221
.byt 9
.byt SC_WAIT_FOR_ACTOR
.byt 64, 250
.byt SC_ACTOR_TALK
.byt 64, 250
.byt 64, 221
.byt 10
.byt SC_WAIT_FOR_ACTOR
.byt 64, 250
.byt SC_JUMP_REL, 29
; else part
.byt SC_ACTOR_TALK
.byt 64, 250
.byt 64, 221
.byt 17
.byt SC_WAIT_FOR_ACTOR
.byt 64, 250
.byt SC_ACTOR_TALK
.byt 64, 250
.byt 64, 221
.byt 18
.byt SC_WAIT_FOR_ACTOR
.byt 64, 250
.byt SC_ACTOR_TALK
.byt 64, 250
.byt 64, 221
.byt 19
.byt SC_WAIT_FOR_ACTOR
.byt 64, 250
.byt SC_ACTIVATE_DLGOPT
.byt 4
.byt 0
.byt SC_ACTIVATE_DLGOPT
.byt 5
.byt 0
.byt SC_JUMP
.word (l_common-res_start)
+l_air
.byt SC_ACTOR_TALK
.byt 64, 250
.byt 64, 221
.byt 14
.byt SC_WAIT_FOR_ACTOR
.byt 64, 250
.byt SC_ACTIVATE_DLGOPT
.byt 6
.byt 0
l_common
.byt SC_START_DIALOG
.byt SC_STOP_SCRIPT
+l_bye
.byt SC_ACTOR_TALK
.byt 64, 250
.byt 64, 221
.byt 15
.byt SC_WAIT_FOR_ACTOR
.byt 64, 250
.byt SC_ACTOR_TALK
.byt 64, 250
.byt 64, 221
.byt 20
.byt SC_WAIT_FOR_ACTOR
.byt 64, 250
.byt SC_ACTOR_TALK
.byt 64, 250
.byt 64, 221
.byt 21
.byt SC_WAIT_FOR_ACTOR
.byt 64, 250
.byt SC_ACTOR_TALK
.byt 64, 250
.byt 64, 221
.byt 22
.byt SC_WAIT_FOR_ACTOR
.byt 64, 250
.byt SC_PUT_IN_INVENTORY
.byt 8
.byt SC_SETFLAG, 2	; bMetRavella=true
.byt 1
.byt SC_SAVEGAME
+l_exit1
.byt SC_WAIT_FOR_ACTOR
.byt SF_GET_EGO
.byt SC_LOOK_DIRECTION
.byt 64, 250
.byt 0
.byt SC_END_DIALOG
.byt SC_STOP_SCRIPT
res_end
.)

; String pack 221
.(
.byt RESOURCE_STRING|$80
.word (res_end-res_start +4)
.byt 221
res_start
.asc "Hello Ravella.",0 ; String 0
.asc "Did you have any trouble?",0 ; String 1
.asc "No. Nothing strange.",0 ; String 2
.asc "Hungry and thirsty of course!",0 ; String 3
.asc "And how do you feel?",0 ; String 4
.asc "Well done.",0 ; String 5
.asc "The food is full of suppressants.",0 ; String 6
.asc "Not me.",0 ; String 7
.asc "The man we are meeting tonight.",0 ; String 8
.asc "We need to be careful.",0 ; String 9
.asc "The Federation has eyes everywhere.",0 ; String 10
.asc "Good. The book hides important info.",0 ; String 11
.asc "They tell us about the door to use",0 ; String 12
.asc "to exit the city that way.",0 ; String 13
.asc "That is what they want you to think.",0 ; String 14
.asc "Just one last thing.",0 ; String 15
.asc "That is Ravella.",0 ; String 16
.asc "Doesn't it bother you that you spend",0 ; String 17
.asc "your life in a state of drug-induced",0 ; String 18
.asc "tranquility?",0 ; String 19
.asc "Take this key. Room 2, locker 3B.",0 ; String 20
.asc "There is something for you inside.",0 ; String 21
.asc "I'll wait here.",0 ; String 22
.asc "I've already talk to her.",0 ; String 23
.asc "Now I've got things to do.",0 ; String 24
res_end
.)

; Object Code 250
.(
.byt RESOURCE_OBJECTCODE|$80
.word (res_end-res_start +4)
.byt 250
res_start
; Response table
.byt VERB_LOOKAT
.word (l_LookAt-res_start)
.byt VERB_TALKTO
.word (l_TalkTo-res_start)
.byt $ff ; End of response table
l_LookAt
.byt SC_ASSIGN, 64, 200	; actor=sfGetActorExecutingAction()
.byt SF_GET_ACTIONACTOR
.byt SC_ACTOR_TALK
.byt SF_GETVAL,64, 200	; actor
.byt 64, 221
.byt 16
.byt SC_WAIT_FOR_ACTOR
.byt SF_GETVAL,64, 200	; actor
.byt SC_STOP_SCRIPT
l_TalkTo
; if
.byt SC_JUMP_REL_IF, SF_NOT
.byt SF_GETFLAG,2	; bMetRavella
.byt 36
; then part
.byt SC_CURSOR_ON
.byt 0
.byt SC_ASSIGN, 64, 200	; actor=sfGetActorExecutingAction()
.byt SF_GET_ACTIONACTOR
.byt SC_ACTOR_TALK
.byt SF_GETVAL,64, 200	; actor
.byt 64, 221
.byt 23
.byt SC_WAIT_FOR_ACTOR
.byt SF_GETVAL,64, 200	; actor
.byt SC_ACTOR_TALK
.byt SF_GETVAL,64, 200	; actor
.byt 64, 221
.byt 24
.byt SC_WAIT_FOR_ACTOR
.byt SF_GETVAL,64, 200	; actor
.byt SC_CURSOR_ON
.byt 1
.byt SC_STOP_SCRIPT
.byt SC_CURSOR_ON
.byt 0
.byt SC_ASSIGN, 64, 200	; actor=sfGetActorExecutingAction()
.byt SF_GET_ACTIONACTOR
.byt SC_ACTOR_TALK
.byt SF_GETVAL,64, 200	; actor
.byt 64, 221
.byt 0
.byt SC_WAIT_FOR_ACTOR
.byt SF_GETVAL,64, 200	; actor
.byt SC_LOOK_DIRECTION
.byt 64, 250
.byt 1
.byt SC_ACTOR_TALK
.byt 64, 250
.byt 64, 221
.byt 1
.byt SC_WAIT_FOR_ACTOR
.byt 64, 250
.byt SC_ACTOR_TALK
.byt SF_GETVAL,64, 200	; actor
.byt 64, 221
.byt 2
.byt SC_WAIT_FOR_ACTOR
.byt SF_GETVAL,64, 200	; actor
.byt SC_CURSOR_ON
.byt 1
.byt SC_LOAD_DIALOG
.byt 64, 200
.byt SC_START_DIALOG
.byt SC_STOP_SCRIPT
res_end
.)

; Object Code 201
.(
.byt RESOURCE_OBJECTCODE|$80
.word (res_end-res_start +4)
.byt 201
res_start
; Response table
.byt VERB_LOOKAT
.word (l_LookAt-res_start)
.byt $ff ; End of response table
l_LookAt
.byt SC_ACTOR_TALK
.byt 0
.byt 64, 200
.byt 0
.byt SC_STOP_SCRIPT
.byt SC_STOP_SCRIPT
res_end
.)

; Object Code 202
.(
.byt RESOURCE_OBJECTCODE|$80
.word (res_end-res_start +4)
.byt 202
res_start
; Response table
.byt VERB_LOOKAT
.word (l_LookAt-res_start)
.byt $ff ; End of response table
l_LookAt
.byt SC_ACTOR_TALK
.byt 0
.byt 64, 200
.byt 1
.byt SC_WAIT_FOR_ACTOR
.byt 0
; if
.byt SC_JUMP_REL_IF, SF_NOT
.byt SF_NOT
.byt SF_GETFLAG,21	; bCamCodeSeen
.byt 10
; then part
.byt SC_SAVEGAME
.byt SC_SETFLAG, 21	; bCamCodeSeen=true
.byt 1
; if
.byt SC_JUMP_REL_IF, SF_NOT
.byt SF_GETFLAG,20	; bCamDeactivated
.byt 12
; then part
.byt SC_ACTOR_TALK
.byt 0
.byt 64, 200
.byt 9
.byt SC_WAIT_FOR_ACTOR
.byt 0
.byt SC_STOP_SCRIPT
.byt SC_STOP_SCRIPT
res_end
.)

; String pack 200
.(
.byt RESOURCE_STRING|$80
.word (res_end-res_start +4)
.byt 200
res_start
.asc "Omnipresent.",0 ; String 0
.asc "The camera code is CH-1337.",0 ; String 1
.asc "That is a door to the service area.",0 ; String 2
.asc "Looks confortable...",0 ; String 3
.asc "Not the right time for rest.",0 ; String 4
.asc "My back hurts. Not again.",0 ; String 5
.asc "It is quite heavy, but I'll try..",0 ; String 6
.asc "Nope... it's too heavy to move.",0 ; String 7
.asc "Hey! Look what's down here!",0 ; String 8
.asc "This camera seems to be off.",0 ; String 9
.asc "That's not a good idea.",0 ; String 10
.asc "That camera there would notice me",0 ; String 11
.asc "and the automatic detection system",0 ; String 12
.asc "would issue an alarm.",0 ; String 13
.asc "Why? That's only a service corridor.",0 ; String 14
.asc "And heavy too...",0 ; String 15
.asc "I bet nobody cleans beneath it.",0 ; String 16
res_end
.)

; Object Code 203
.(
.byt RESOURCE_OBJECTCODE|$80
.word (res_end-res_start +4)
.byt 203
res_start
; Response table
.byt VERB_LOOKAT
.word (l_LookAt-res_start)
.byt VERB_USE
.word (l_Use-res_start)
.byt VERB_OPEN
.word (l_Open-res_start)
.byt VERB_WALKTO
.word (l_WalkTo-res_start)
.byt $ff ; End of response table
l_LookAt
.byt SC_ACTOR_TALK
.byt 0
.byt 64, 200
.byt 2
.byt SC_STOP_SCRIPT
l_Use
; if
.byt SC_JUMP_REL_IF, SF_NOT
.byt SF_NOT, SF_EQ
.byt SF_GET_ACTIONOBJ2
.byt 64, 255
.byt 11
; then part
.byt SC_SPAWN_SCRIPT
.byt 1
.byt SC_STOP_SCRIPT
l_Open
l_WalkTo
; if
.byt SC_JUMP_REL_IF, SF_NOT
.byt SF_NOT
.byt SF_GETFLAG,8	; bGotMap
.byt 14
; then part
.byt SC_ACTOR_TALK
.byt 0
.byt 64, 200
.byt 14
.byt SC_WAIT_FOR_ACTOR
.byt 0
.byt SC_STOP_SCRIPT
; if
.byt SC_JUMP_REL_IF, SF_NOT
.byt SF_GETFLAG,20	; bCamDeactivated
.byt 15
; then part
.byt SC_SET_OBJECT_POS
.byt 0
.byt 7
.byt 14
.byt 64, 67
.byt SC_CHANGE_ROOM_AND_STOP
.byt 7
.byt SC_JUMP_REL, 34
; else part
.byt SC_CURSOR_ON
.byt 0
.byt SC_ACTOR_TALK
.byt 0
.byt 64, 200
.byt 10
.byt SC_WAIT_FOR_ACTOR
.byt 0
.byt SC_ACTOR_TALK
.byt 0
.byt 64, 200
.byt 11
.byt SC_WAIT_FOR_ACTOR
.byt 0
.byt SC_ACTOR_TALK
.byt 0
.byt 64, 200
.byt 12
.byt SC_WAIT_FOR_ACTOR
.byt 0
.byt SC_ACTOR_TALK
.byt 0
.byt 64, 200
.byt 13
.byt SC_WAIT_FOR_ACTOR
.byt 0
.byt SC_CURSOR_ON
.byt 1
.byt SC_STOP_SCRIPT
res_end
.)

; Object Code 200
.(
.byt RESOURCE_OBJECTCODE|$80
.word (res_end-res_start +4)
.byt 200
res_start
; Response table
.byt VERB_WALKTO
.word (l_WalkTo-res_start)
.byt $ff ; End of response table
l_WalkTo
.byt SC_SET_OBJECT_POS
.byt 0
.byt 3
.byt 13
.byt 64, 124
.byt SC_CHANGE_ROOM_AND_STOP
.byt 3
.byt SC_STOP_SCRIPT
res_end
.)

; Object Code 204
.(
.byt RESOURCE_OBJECTCODE|$80
.word (res_end-res_start +4)
.byt 204
res_start
; Response table
.byt VERB_LOOKAT
.word (l_LookAt-res_start)
.byt VERB_USE
.word (l_Use-res_start)
.byt VERB_PUSH
.word (l_Push-res_start)
.byt $ff ; End of response table
l_LookAt
.byt SC_CURSOR_ON
.byt 0
.byt SC_ACTOR_TALK
.byt 0
.byt 64, 200
.byt 3
.byt SC_WAIT_FOR_ACTOR
.byt 0
.byt SC_ACTOR_TALK
.byt 0
.byt 64, 200
.byt 15
.byt SC_WAIT_FOR_ACTOR
.byt 0
.byt SC_ACTOR_TALK
.byt 0
.byt 64, 200
.byt 16
.byt SC_WAIT_FOR_ACTOR
.byt 0
.byt SC_CURSOR_ON
.byt 1
.byt SC_STOP_SCRIPT
l_Use
; if
.byt SC_JUMP_REL_IF, SF_NOT
.byt SF_NOT, SF_EQ
.byt SF_GET_ACTIONOBJ2
.byt 64, 255
.byt 11
; then part
.byt SC_SPAWN_SCRIPT
.byt 1
.byt SC_STOP_SCRIPT
.byt SC_ACTOR_TALK
.byt 0
.byt 64, 200
.byt 4
.byt SC_STOP_SCRIPT
l_Push
; if
.byt SC_JUMP_REL_IF, SF_NOT
.byt SF_GETFLAG,11	; bCouchPushed
.byt 13
; then part
.byt SC_ACTOR_TALK
.byt 0
.byt 64, 200
.byt 5
.byt SC_JUMP_REL, 64, 65
; else part
.byt SC_CURSOR_ON
.byt 0
.byt SC_ACTOR_TALK
.byt 0
.byt 64, 200
.byt 6
.byt SC_WAIT_FOR_ACTOR
.byt 0
.byt SC_ASSIGN, 64, 200	; tmpanimstate=sfGetAnimstate(0)
.byt SF_GET_ANIMSTATE
.byt 0
.byt SC_SET_ANIMSTATE
.byt 0
.byt 3
.byt SC_DELAY
.byt 10
.byt SC_SET_ANIMSTATE
.byt 0
.byt SF_GETVAL,64, 200	; tmpanimstate
.byt SC_DELAY
.byt 20
.byt SC_SET_ANIMSTATE
.byt 0
.byt 3
.byt SC_DELAY
.byt 10
.byt SC_SET_ANIMSTATE
.byt 0
.byt SF_GETVAL,64, 200	; tmpanimstate
.byt SC_DELAY
.byt 5
.byt SC_ACTOR_TALK
.byt 0
.byt 64, 200
.byt 7
.byt SC_WAIT_FOR_ACTOR
.byt 0
.byt SC_DELAY
.byt 5
.byt SC_ACTOR_TALK
.byt 0
.byt 64, 200
.byt 8
.byt SC_WAIT_FOR_ACTOR
.byt 0
.byt SC_PUT_IN_INVENTORY
.byt 6
.byt SC_SETFLAG, 11	; bCouchPushed=true
.byt 1
.byt SC_SAVEGAME
.byt SC_CURSOR_ON
.byt 1
.byt SC_STOP_SCRIPT
res_end
.)

; Script 200
.(
.byt RESOURCE_SCRIPT|$80
.word (res_end-res_start +4)
.byt 200
res_start
+script_200_start
; if
.byt SC_JUMP_REL_IF, SF_NOT
.byt SF_NOT
.byt SF_GETFLAG,2	; bMetRavella
.byt 9
; then part
.byt SC_LOAD_OBJECT
.byt 64, 250
.byt SC_ASSIGN, 0	; tmpParam1=201
.byt 64, 201
.byt SC_CLEAR_EVENTS
.byt 1
.byt SC_SPAWN_SCRIPT
.byt 64, 201
.byt SC_WAIT_EVENT
.byt 1
; if
.byt SC_JUMP_REL_IF, SF_NOT
.byt SF_NOT
.byt SF_GETFLAG,20	; bCamDeactivated
.byt 13
; then part
.byt SC_ASSIGN, 0	; tmpParam1=202
.byt 64, 202
.byt SC_SPAWN_SCRIPT
.byt 64, 201
.byt SC_STOP_SCRIPT
.byt SC_STOP_SCRIPT
res_end
.)

; Script 201
.(
.byt RESOURCE_SCRIPT|$80
.word (res_end-res_start +4)
.byt 201
res_start
+script_201_start
.byt SC_ASSIGN, 64, 200	; CameraID=tmpParam1
.byt SF_GETVAL,0	; tmpParam1
.byt SC_SET_EVENTS
.byt 1
.byt SC_ASSIGN, 64, 202	; cc=sfGetCol(CameraID)
.byt SF_GET_COL
.byt SF_GETVAL,64, 200	; CameraID
l_loop
.byt SC_DELAY
.byt SF_GETRANDINT
.byt 64, 80
.byt 64, 110
.byt SC_ASSIGN, 64, 201	; bc=sfGetCol(0)
.byt SF_GET_COL
.byt 0
; if
.byt SC_JUMP_REL_IF, SF_NOT
.byt SF_OR
.byt SF_AND
.byt SF_GT
.byt SF_GETVAL,64, 201	; bc
.byt SF_GETVAL,64, 202	; cc
.byt SF_LT
.byt SF_SUB
.byt SF_GETVAL,64, 201	; bc
.byt SF_GETVAL,64, 202	; cc
.byt 18
.byt SF_AND
.byt SF_LT
.byt SF_GETVAL,64, 201	; bc
.byt SF_GETVAL,64, 202	; cc
.byt SF_LT
.byt SF_SUB
.byt SF_GETVAL,64, 202	; cc
.byt SF_GETVAL,64, 201	; bc
.byt 18
.byt 40
; then part
.byt SC_PLAYSFX
.byt 17
.byt SC_SET_ANIMSTATE
.byt SF_GETVAL,64, 200	; CameraID
.byt 1
.byt SC_DELAY
.byt 5
.byt SC_SET_ANIMSTATE
.byt SF_GETVAL,64, 200	; CameraID
.byt 2
.byt SC_DELAY
.byt 5
.byt SC_SET_ANIMSTATE
.byt SF_GETVAL,64, 200	; CameraID
.byt 3
.byt SC_DELAY
.byt SF_GETRANDINT
.byt 64, 80
.byt 64, 110
; if
.byt SC_JUMP_REL_IF, SF_NOT
.byt SF_OR
.byt SF_AND
.byt SF_GT
.byt SF_GETVAL,64, 201	; bc
.byt SF_GETVAL,64, 202	; cc
.byt SF_LT
.byt SF_SUB
.byt SF_GETVAL,64, 201	; bc
.byt SF_GETVAL,64, 202	; cc
.byt 38
.byt SF_AND
.byt SF_LT
.byt SF_GETVAL,64, 201	; bc
.byt SF_GETVAL,64, 202	; cc
.byt SF_LT
.byt SF_SUB
.byt SF_GETVAL,64, 202	; cc
.byt SF_GETVAL,64, 201	; bc
.byt 38
.byt 40
; then part
.byt SC_PLAYSFX
.byt 17
.byt SC_SET_ANIMSTATE
.byt SF_GETVAL,64, 200	; CameraID
.byt 2
.byt SC_DELAY
.byt 5
.byt SC_SET_ANIMSTATE
.byt SF_GETVAL,64, 200	; CameraID
.byt 1
.byt SC_DELAY
.byt 5
.byt SC_SET_ANIMSTATE
.byt SF_GETVAL,64, 200	; CameraID
.byt 0
.byt SC_JUMP
.word (l_loop-res_start)
.byt SC_STOP_SCRIPT
res_end
.)
