;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Generated by OASIS compiler
; (c) Chema 2016
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


; String pack 49
.(
.byt RESOURCE_STRING
.word (res_end-res_start +4)
.byt 49
res_start
.asc "Una taza de caf",92," grande.",0 ; String 0
.asc "Est",91," vac",93,"a.",0 ; String 1
.asc "Est",91," llena de agua.",0 ; String 2
.asc "Est",91," llena de caf",92,".",0 ; String 3
.asc "No puedo usar la taza as",93,".",0 ; String 4
res_end
.)

; Object Code 49
.(
.byt RESOURCE_OBJECTCODE
.word (res_end-res_start +4)
.byt 49
res_start
; Response table
.byt VERB_LOOKAT
.word (l_LookAt-res_start)
.byt VERB_USE
.word (l_Use-res_start)
.byt $ff ; End of response table
l_LookAt
.byt SC_ASSIGN, 64, 200	; a=sfGetEgo()
.byt SF_GET_EGO
.byt SC_ACTOR_TALK
.byt SF_GETVAL,64, 200	; a
.byt 49
.byt 0
.byt SC_WAIT_FOR_ACTOR
.byt SF_GETVAL,64, 200	; a
; if
.byt SC_JUMP_REL_IF, SF_NOT
.byt SF_EQ
.byt SF_GET_STATE
.byt 49
.byt 0
.byt 13
; then part
.byt SC_ACTOR_TALK
.byt SF_GETVAL,64, 200	; a
.byt 49
.byt 1
; if
.byt SC_JUMP_REL_IF, SF_NOT
.byt SF_EQ
.byt SF_GET_STATE
.byt 49
.byt 1
.byt 13
; then part
.byt SC_ACTOR_TALK
.byt SF_GETVAL,64, 200	; a
.byt 49
.byt 2
; if
.byt SC_JUMP_REL_IF, SF_NOT
.byt SF_EQ
.byt SF_GET_STATE
.byt 49
.byt 2
.byt 13
; then part
.byt SC_ACTOR_TALK
.byt SF_GETVAL,64, 200	; a
.byt 49
.byt 3
.byt SC_STOP_SCRIPT
l_Use
; if
.byt SC_JUMP_REL_IF, SF_NOT
.byt SF_OR
.byt SF_NOT, SF_EQ
.byt SF_GET_ACTIONOBJ2
.byt 15
.byt SF_NOT, SF_EQ
.byt SF_GET_STATE
.byt 49
.byt 2
.byt 18
; then part
.byt SC_ACTOR_TALK
.byt 0
.byt 49
.byt 4
.byt SC_STOP_SCRIPT
.byt SC_STOP_SCRIPT
res_end
.)
