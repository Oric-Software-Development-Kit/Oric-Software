;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Generated by OASIS compiler
; (c) Chema 2016
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


; Object Code 5
.(
.byt RESOURCE_OBJECTCODE
.word (res_end-res_start +4)
.byt 5
res_start
; Response table
.byt VERB_LOOKAT
.word (l_LookAt-res_start)
.byt VERB_USE
.word (l_Use-res_start)
.byt $ff ; End of response table
l_LookAt
.byt SC_CURSOR_ON
.byt 0
.byt SC_ACTOR_TALK
.byt 0
.byt 5
.byt 0
.byt SC_WAIT_FOR_ACTOR
.byt 0
.byt SC_CURSOR_ON
.byt 1
.byt SC_STOP_SCRIPT
l_Use
.byt SC_ACTOR_TALK
.byt 0
.byt 5
.byt 1
.byt SC_STOP_SCRIPT
res_end
.)

; String pack 5
.(
.byt RESOURCE_STRING
.word (res_end-res_start +4)
.byt 5
res_start
.asc "Laxante Ultra-Potente.",0 ; String 0
.asc "No puedo usar el laxante as",93,".",0 ; String 1
res_end
.)
