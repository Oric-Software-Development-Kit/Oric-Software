;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Generated by OASIS compiler
; (c) Chema 2016
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


; String pack 33
.(
.byt RESOURCE_STRING
.word (res_end-res_start +4)
.byt 33
res_start
.asc "Una banda el",91,"stica muy resistente.",0 ; String 0
res_end
.)

; Object Code 33
.(
.byt RESOURCE_OBJECTCODE
.word (res_end-res_start +4)
.byt 33
res_start
; Response table
.byt VERB_LOOKAT
.word (l_LookAt-res_start)
.byt VERB_USE
.word (l_Use-res_start)
.byt $ff ; End of response table
l_LookAt
.byt SC_ACTOR_TALK
.byt 0
.byt 33
.byt 0
.byt SC_WAIT_FOR_ACTOR
.byt 0
.byt SC_STOP_SCRIPT
l_Use
; if
.byt SC_JUMP_REL_IF, SF_NOT
.byt SF_EQ
.byt SF_GET_ACTIONOBJ1
.byt 31
.byt 10
; then part
.byt SC_RUN_OBJECT_CODE
.byt 2
.byt 33
.byt 31
.byt SC_STOP_SCRIPT
res_end
.)
