
; Tail for program... Let's put some BIG buffers here


//.dsb 256-(*&255)

buffer
_controls

#ifdef OLDFRAME
    .byt  $7f,$7f,$7f,$7f,$7f,$7f,$7f,$7f,$7f,$7f,$7f,$7f,$7f,$7f,$7f,$7f
    .byt  $7f,$7f,$7f,$7f,$7f,$7f,$7f,$7f,$7f,$7f,$7f,$7f,$7f,$7f,$7f,$7f
    .byt  $7f,$7f,$7f,$7f,$7f,$7f,$7f,$7f,$60,$40,$44,$40,$40,$40,$40,$40
    .byt  $40,$50,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40
    .byt  $40,$40,$40,$40,$40,$40,$44,$40,$40,$40,$40,$40,$40,$50,$40,$41
    .byt  $6f,$73,$77,$7f,$7f,$7f,$7f,$7e,$40,$50,$40,$40,$40,$40,$40,$40
    .byt  $40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$5f,$60,$44,$40
    .byt  $40,$40,$40,$40,$40,$53,$7b,$7d,$68,$44,$47,$7f,$7f,$7f,$7f,$7e
    .byt  $40,$50,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40
    .byt  $40,$40,$40,$41,$60,$58,$44,$40,$40,$40,$40,$40,$40,$54,$42,$45
    .byt  $6f,$73,$67,$7f,$7f,$7f,$7f,$7e,$40,$50,$40,$40,$40,$40,$40,$40
    .byt  $40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$42,$40,$44,$44,$40
    .byt  $40,$40,$40,$40,$40,$53,$73,$79,$68,$40,$57,$7f,$7f,$7f,$7f,$7e
    .byt  $40,$50,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40
    .byt  $40,$40,$40,$44,$40,$42,$44,$40,$40,$40,$40,$40,$40,$50,$4a,$41
    .byt  $68,$47,$67,$7f,$7f,$7f,$7f,$7e,$40,$50,$40,$40,$40,$40,$40,$40
    .byt  $40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$48,$40,$41,$44,$40
    .byt  $40,$40,$40,$40,$40,$57,$72,$41,$60,$40,$44,$40,$40,$40,$40,$40
    .byt  $40,$50,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40
    .byt  $40,$40,$40,$50,$40,$40,$64,$40,$40,$40,$40,$40,$40,$50,$40,$41
    .byt  $7f,$7f,$7f,$7f,$7f,$7f,$7f,$7f,$7f,$70,$40,$40,$40,$40,$40,$40
    .byt  $40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$50,$40,$40,$67,$7f
    .byt  $7f,$7f,$7f,$7f,$7f,$7f,$7f,$7f,$60,$40,$44,$40,$40,$40,$40,$40
    .byt  $40,$50,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40
    .byt  $40,$40,$40,$60,$40,$40,$54,$40,$40,$40,$40,$40,$40,$50,$40,$41
    .byt  $6f,$43,$77,$7f,$7f,$40,$40,$40,$40,$50,$40,$40,$40,$40,$40,$40
    .byt  $40,$45,$55,$55,$55,$50,$40,$40,$40,$40,$40,$60,$40,$40,$54,$40
    .byt  $40,$41,$60,$40,$40,$57,$7a,$41,$68,$64,$47,$7f,$7f,$40,$40,$40
    .byt  $40,$50,$40,$40,$40,$40,$40,$40,$45,$50,$40,$40,$40,$45,$50,$40
    .byt  $40,$40,$40,$60,$40,$40,$54,$40,$40,$41,$60,$40,$40,$54,$4a,$41
    .byt  $6f,$63,$67,$7f,$7f,$40,$40,$40,$40,$50,$40,$40,$40,$40,$40,$45
    .byt  $70,$40,$40,$40,$40,$40,$46,$60,$40,$40,$40,$60,$40,$40,$54,$40
    .byt  $40,$41,$60,$40,$40,$57,$72,$41,$68,$60,$57,$7f,$7f,$40,$40,$40
    .byt  $40,$50,$40,$40,$40,$40,$43,$70,$68,$40,$40,$40,$40,$40,$54,$4f
    .byt  $40,$40,$40,$60,$40,$40,$54,$40,$40,$41,$60,$40,$40,$54,$52,$41
    .byt  $68,$67,$67,$7f,$7f,$40,$40,$40,$40,$50,$40,$40,$40,$40,$78,$40
    .byt  $44,$40,$40,$40,$40,$40,$60,$40,$5c,$40,$40,$60,$40,$40,$54,$40
    .byt  $40,$41,$60,$40,$40,$54,$4b,$7d,$60,$40,$44,$40,$40,$40,$40,$40
    .byt  $40,$50,$40,$40,$40,$46,$40,$42,$42,$40,$40,$40,$40,$41,$41,$40
    .byt  $41,$60,$40,$50,$40,$40,$64,$40,$40,$40,$40,$40,$40,$50,$40,$41
    .byt  $7f,$7f,$7f,$7f,$7f,$7f,$7f,$7f,$7f,$70,$40,$40,$40,$70,$40,$40
    .byt  $41,$40,$40,$40,$40,$42,$40,$40,$40,$4c,$40,$50,$40,$40,$67,$7f
    .byt  $7f,$7f,$7f,$7f,$7f,$7f,$7f,$7f,$60,$40,$44,$40,$40,$40,$40,$40
    .byt  $40,$50,$40,$40,$42,$40,$40,$48,$40,$60,$40,$40,$40,$44,$40,$50
    .byt  $40,$41,$40,$48,$40,$41,$44,$40,$40,$40,$40,$40,$40,$50,$40,$41
    .byt  $6f,$74,$57,$7f,$7f,$7f,$7f,$7f,$7f,$50,$40,$40,$48,$40,$40,$40
    .byt  $40,$50,$40,$40,$40,$48,$40,$40,$40,$40,$50,$44,$40,$42,$44,$40
    .byt  $46,$40,$40,$40,$40,$57,$63,$7d,$68,$44,$57,$7f,$7f,$7f,$7f,$7f
    .byt  $7f,$50,$40,$40,$60,$40,$40,$60,$40,$48,$40,$40,$40,$50,$40,$44
    .byt  $40,$40,$44,$42,$40,$44,$44,$40,$46,$40,$40,$40,$40,$54,$52,$41
    .byt  $6f,$74,$57,$7f,$7f,$7f,$7f,$7f,$7f,$50,$40,$42,$48,$62,$48,$44
    .byt  $51,$44,$40,$40,$40,$62,$48,$60,$51,$44,$51,$41,$60,$58,$44,$40
    .byt  $46,$40,$40,$40,$40,$54,$4a,$41,$68,$44,$57,$7f,$7f,$7f,$7f,$7f
    .byt  $7f,$50,$40,$48,$40,$40,$42,$40,$40,$42,$40,$40,$41,$40,$40,$41
    .byt  $40,$40,$40,$50,$5f,$60,$44,$40,$46,$40,$40,$40,$40,$54,$4a,$41
    .byt  $68,$47,$77,$7f,$7f,$7f,$7f,$7f,$7f,$50,$40,$40,$40,$40,$40,$40
    .byt  $40,$41,$40,$40,$42,$40,$40,$40,$40,$40,$40,$40,$40,$40,$44,$40
    .byt  $46,$40,$40,$40,$40,$57,$7b,$7d,$60,$40,$44,$40,$40,$40,$40,$40
    .byt  $40,$50,$40,$60,$40,$40,$48,$40,$40,$40,$60,$40,$44,$40,$40,$40
    .byt  $50,$40,$40,$44,$40,$40,$44,$40,$40,$40,$40,$40,$40,$50,$40,$41
    .byt  $7f,$7f,$7f,$7f,$7f,$7f,$7f,$7f,$7f,$70,$40,$40,$40,$40,$40,$40
    .byt  $40,$40,$50,$40,$48,$40,$40,$40,$40,$40,$40,$40,$40,$40,$47,$7f
    .byt  $7f,$7f,$7f,$7f,$7f,$7f,$7f,$7f,$60,$40,$44,$40,$40,$40,$40,$40
    .byt  $40,$50,$42,$40,$40,$40,$60,$40,$40,$40,$48,$40,$50,$40,$40,$40
    .byt  $44,$40,$40,$41,$40,$40,$44,$40,$40,$40,$40,$40,$40,$50,$40,$41
    .byt  $6f,$77,$77,$60,$40,$40,$40,$40,$40,$50,$40,$40,$40,$40,$40,$40
    .byt  $40,$40,$44,$40,$60,$40,$40,$40,$40,$40,$40,$40,$40,$40,$47,$7f
    .byt  $7f,$7f,$7f,$7f,$70,$50,$4e,$41,$68,$41,$47,$60,$40,$40,$40,$40
    .byt  $40,$50,$44,$40,$40,$42,$40,$40,$40,$40,$42,$41,$40,$40,$40,$40
    .byt  $41,$40,$40,$40,$60,$40,$47,$7f,$7f,$7f,$7f,$7f,$70,$50,$46,$41
    .byt  $68,$41,$47,$60,$40,$40,$40,$40,$40,$50,$48,$40,$40,$40,$40,$40
    .byt  $40,$40,$41,$42,$40,$40,$40,$40,$40,$40,$40,$40,$50,$40,$47,$7f
    .byt  $7f,$7f,$7f,$7f,$70,$50,$46,$41,$68,$41,$47,$60,$40,$40,$40,$40
    .byt  $40,$50,$48,$40,$40,$48,$40,$40,$40,$40,$40,$64,$40,$40,$40,$40
    .byt  $40,$50,$40,$40,$50,$40,$47,$7f,$7f,$7f,$7f,$7f,$70,$50,$46,$41
    .byt  $6f,$71,$47,$60,$40,$40,$40,$40,$40,$50,$4c,$51,$44,$41,$44,$51
    .byt  $44,$51,$44,$58,$62,$48,$62,$48,$62,$41,$44,$51,$50,$40,$47,$7f
    .byt  $7f,$7f,$7f,$7f,$70,$50,$5f,$61,$60,$40,$44,$40,$40,$40,$40,$40
    .byt  $40,$50,$48,$40,$40,$60,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40
    .byt  $40,$44,$40,$40,$50,$40,$44,$40,$40,$40,$40,$40,$40,$50,$40,$41
    .byt  $7f,$7f,$7f,$7f,$7f,$7f,$7f,$7f,$7f,$70,$48,$40,$40,$40,$40,$40
    .byt  $40,$40,$40,$50,$40,$40,$40,$40,$40,$40,$40,$40,$50,$40,$47,$7f
    .byt  $7f,$7f,$7f,$7f,$7f,$7f,$7f,$7f,$60,$40,$44,$40,$40,$40,$40,$40
    .byt  $40,$50,$44,$40,$42,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40
    .byt  $40,$41,$40,$40,$60,$40,$44,$40,$40,$40,$40,$40,$40,$50,$40,$41
    .byt  $68,$47,$74,$40,$40,$40,$40,$40,$40,$50,$44,$40,$40,$40,$40,$40
    .byt  $40,$40,$40,$48,$40,$40,$40,$40,$40,$40,$40,$40,$60,$40,$47,$7f
    .byt  $7f,$7f,$7f,$7f,$7f,$70,$5f,$61,$68,$41,$44,$40,$40,$40,$40,$40
    .byt  $40,$50,$42,$40,$48,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40
    .byt  $40,$40,$50,$41,$40,$40,$47,$7f,$7f,$7f,$7f,$7f,$7f,$70,$41,$61
    .byt  $68,$41,$44,$40,$40,$40,$40,$40,$40,$50,$41,$40,$40,$40,$40,$40
    .byt  $40,$40,$40,$50,$40,$40,$40,$40,$40,$40,$40,$42,$40,$40,$47,$7f
    .byt  $7f,$7f,$7f,$7f,$7f,$70,$5f,$61,$68,$41,$44,$40,$40,$40,$40,$40
    .byt  $40,$50,$40,$60,$60,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40
    .byt  $40,$40,$44,$44,$40,$40,$47,$7f,$7f,$7f,$7f,$7f,$7f,$70,$58,$41
    .byt  $6f,$61,$44,$40,$40,$40,$40,$40,$40,$50,$40,$50,$40,$40,$40,$40
    .byt  $40,$40,$40,$48,$40,$40,$40,$40,$40,$40,$40,$48,$40,$40,$47,$7f
    .byt  $7f,$7f,$7f,$7f,$7f,$70,$5f,$61,$60,$40,$44,$40,$40,$40,$40,$40
    .byt  $40,$50,$40,$4a,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40
    .byt  $40,$40,$41,$50,$40,$40,$44,$40,$40,$40,$40,$40,$40,$50,$40,$41
    .byt  $7f,$7f,$7f,$7f,$7f,$7f,$7f,$7f,$7f,$70,$40,$46,$62,$48,$62,$48
    .byt  $62,$48,$62,$51,$44,$51,$44,$51,$44,$51,$45,$60,$40,$40,$47,$7f
    .byt  $7f,$7f,$7f,$7f,$7f,$7f,$7f,$7f,$60,$40,$44,$40,$40,$40,$40,$40
    .byt  $40,$50,$40,$41,$60,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40
    .byt  $40,$40,$46,$40,$40,$40,$44,$40,$40,$40,$40,$40,$40,$50,$40,$41
    .byt  $6f,$44,$47,$7f,$7f,$7f,$7f,$7f,$7f,$50,$40,$40,$58,$40,$40,$40
    .byt  $40,$40,$40,$48,$40,$40,$40,$40,$40,$40,$58,$40,$40,$40,$47,$7f
    .byt  $7f,$7f,$7f,$7f,$7f,$70,$5f,$61,$68,$64,$47,$7f,$7f,$7f,$7f,$7f
    .byt  $7f,$50,$40,$40,$46,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40
    .byt  $40,$41,$60,$40,$40,$40,$47,$7f,$7f,$7f,$7f,$7f,$7f,$70,$41,$61
    .byt  $6f,$64,$47,$7f,$7f,$7f,$7f,$7f,$7f,$50,$40,$40,$41,$60,$40,$40
    .byt  $40,$40,$40,$50,$40,$40,$40,$40,$40,$46,$40,$40,$40,$40,$47,$7f
    .byt  $7f,$7f,$7f,$7f,$7f,$70,$5f,$61,$68,$64,$47,$7f,$7f,$7f,$7f,$7f
    .byt  $7f,$50,$40,$40,$40,$5c,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40
    .byt  $40,$78,$40,$40,$40,$40,$47,$7f,$7f,$7f,$7f,$7f,$7f,$70,$41,$61
    .byt  $68,$67,$77,$7f,$7f,$7f,$7f,$7f,$7f,$50,$40,$40,$40,$43,$60,$40
    .byt  $40,$40,$40,$48,$40,$40,$40,$40,$47,$40,$40,$40,$40,$40,$47,$7f
    .byt  $7f,$7f,$7f,$7f,$7f,$70,$5f,$61,$60,$40,$44,$40,$40,$40,$40,$40
    .byt  $40,$50,$40,$40,$40,$40,$5c,$40,$40,$40,$40,$40,$40,$40,$40,$40
    .byt  $78,$40,$40,$40,$40,$40,$44,$40,$40,$40,$40,$40,$40,$50,$40,$41
    .byt  $7f,$7f,$7f,$7f,$7f,$7f,$7f,$7f,$7f,$70,$40,$40,$40,$40,$43,$70
    .byt  $40,$40,$40,$50,$40,$40,$40,$4f,$40,$40,$40,$40,$40,$40,$47,$7f
    .byt  $7f,$7f,$7f,$7f,$7f,$7f,$7f,$7f,$60,$40,$44,$40,$40,$40,$40,$40
    .byt  $60,$50,$40,$40,$40,$40,$40,$4f,$60,$40,$40,$40,$40,$40,$47,$70
    .byt  $40,$40,$40,$40,$40,$40,$44,$40,$40,$40,$40,$40,$40,$50,$40,$41
    .byt  $6c,$40,$44,$40,$40,$40,$40,$40,$60,$50,$40,$40,$40,$40,$40,$40
    .byt  $5f,$78,$40,$48,$40,$5f,$78,$40,$40,$40,$40,$40,$40,$40,$47,$7f
    .byt  $7f,$7f,$7f,$7f,$7f,$70,$58,$41,$6b,$7f,$64,$40,$40,$40,$40,$40
    .byt  $60,$50,$40,$40,$40,$40,$40,$40,$40,$47,$7f,$7f,$7f,$60,$40,$40
    .byt  $40,$40,$40,$40,$40,$40,$47,$7f,$7f,$7f,$7f,$7f,$7f,$70,$59,$61
    .byt  $6f,$7f,$74,$40,$40,$40,$40,$40,$60,$50,$40,$40,$40,$40,$40,$40
    .byt  $40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$47,$7f
    .byt  $7f,$7f,$7f,$7f,$7f,$70,$59,$61,$6b,$7f,$64,$40,$40,$40,$40,$40
    .byt  $60,$50,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40
    .byt  $40,$40,$40,$40,$40,$40,$47,$7f,$7f,$7f,$7f,$7f,$7f,$70,$5f,$61
    .byt  $6c,$40,$44,$40,$40,$40,$40,$40,$60,$50,$40,$40,$40,$40,$40,$40
    .byt  $40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$47,$7f
    .byt  $7f,$7f,$7f,$7f,$7f,$70,$41,$61,$60,$40,$44,$40,$40,$40,$40,$40
    .byt  $60,$50,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40
    .byt  $40,$40,$40,$40,$40,$40,$44,$40,$40,$40,$40,$40,$40,$50,$40,$41
#else
    .byt  $40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40
    .byt  $40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$06,$4f,$40,$40,$40
    .byt  $40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40
    .byt  $40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40
    .byt  $40,$40,$06,$41,$70,$78,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40
    .byt  $02,$5f,$7c,$5f,$7c,$5f,$7c,$5f,$7c,$40,$40,$40,$40,$40,$40,$40
    .byt  $40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$06,$46,$40,$46,$40,$00
    .byt  $12,$47,$40,$47,$40,$47,$40,$47,$40,$40,$40,$40,$40,$40,$40,$40
    .byt  $40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40
    .byt  $40,$40,$06,$48,$40,$41,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40
    .byt  $02,$5f,$7c,$5f,$7c,$5f,$7c,$5f,$7c,$40,$40,$40,$40,$40,$40,$40
    .byt  $40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$06,$50,$40,$40,$60,$00
    .byt  $12,$47,$40,$47,$40,$47,$40,$47,$40,$40,$40,$40,$40,$40,$40,$40
    .byt  $40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40
    .byt  $40,$40,$06,$60,$40,$40,$50,$40,$40,$40,$40,$40,$40,$40,$40,$40
    .byt  $02,$5f,$7c,$5f,$7c,$5f,$7c,$5f,$7c,$40,$40,$40,$40,$40,$40,$40
    .byt  $40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$06,$60,$40,$40,$50,$00
    .byt  $12,$47,$40,$47,$40,$47,$40,$47,$40,$40,$40,$40,$40,$40,$40,$40
    .byt  $40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40
    .byt  $40,$06,$41,$40,$40,$40,$48,$40,$40,$40,$40,$40,$40,$40,$40,$40
    .byt  $02,$5f,$7c,$5f,$7c,$5f,$7c,$5f,$7c,$40,$40,$40,$40,$40,$40,$40
    .byt  $40,$40,$40,$40,$40,$40,$40,$40,$40,$06,$41,$40,$40,$40,$48,$00
    .byt  $12,$47,$40,$47,$40,$47,$40,$47,$40,$40,$40,$40,$40,$40,$40,$40
    .byt  $40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40
    .byt  $40,$06,$42,$40,$40,$40,$44,$40,$40,$40,$40,$40,$40,$40,$40,$40
    .byt  $02,$5f,$7c,$5f,$7c,$5f,$7c,$5f,$7c,$40,$40,$40,$40,$40,$40,$40
    .byt  $06,$45,$55,$55,$55,$50,$40,$40,$40,$40,$42,$40,$40,$40,$44,$00
    .byt  $12,$47,$40,$47,$40,$47,$40,$47,$40,$40,$40,$40,$40,$40,$40,$40
    .byt  $40,$40,$40,$40,$40,$40,$40,$06,$45,$50,$40,$40,$40,$45,$50,$40
    .byt  $40,$40,$42,$40,$40,$40,$44,$40,$40,$40,$40,$40,$40,$40,$40,$40
    .byt  $03,$5f,$7c,$5f,$7c,$5f,$7c,$5f,$7c,$40,$40,$40,$40,$40,$06,$45
    .byt  $71,$40,$40,$40,$40,$42,$46,$60,$40,$40,$42,$40,$40,$40,$44,$00
    .byt  $13,$47,$40,$47,$40,$47,$40,$47,$40,$40,$40,$40,$40,$40,$40,$40
    .byt  $40,$40,$40,$40,$40,$06,$43,$70,$60,$60,$40,$40,$40,$44,$44,$4f
    .byt  $40,$40,$42,$40,$40,$40,$44,$40,$40,$40,$40,$40,$40,$40,$40,$40
    .byt  $03,$5f,$7c,$5f,$7c,$5f,$7c,$5f,$7c,$40,$40,$40,$40,$06,$78,$40
    .byt  $40,$50,$40,$40,$40,$48,$40,$40,$5c,$40,$42,$40,$40,$40,$44,$00
    .byt  $13,$47,$40,$47,$40,$47,$40,$47,$40,$40,$40,$40,$40,$40,$40,$40
    .byt  $40,$40,$40,$40,$06,$46,$40,$42,$40,$48,$40,$40,$40,$50,$41,$40
    .byt  $41,$60,$41,$40,$40,$40,$48,$40,$40,$40,$40,$40,$40,$40,$40,$40
    .byt  $03,$5f,$7c,$5f,$7c,$5f,$7c,$5f,$7c,$40,$40,$40,$06,$70,$40,$40
    .byt  $40,$44,$40,$40,$40,$60,$40,$40,$40,$4c,$41,$40,$40,$40,$48,$00
    .byt  $13,$47,$40,$47,$40,$47,$40,$47,$40,$40,$40,$40,$40,$40,$40,$40
    .byt  $40,$40,$40,$06,$42,$40,$40,$48,$40,$42,$40,$40,$41,$40,$40,$50
    .byt  $40,$41,$40,$60,$40,$40,$50,$40,$40,$40,$40,$40,$40,$40,$40,$40
    .byt  $03,$5f,$7c,$5f,$7c,$5f,$7c,$5f,$7c,$40,$40,$06,$48,$40,$40,$40
    .byt  $40,$41,$40,$40,$42,$40,$40,$40,$40,$40,$50,$60,$40,$40,$50,$00
    .byt  $13,$47,$40,$47,$40,$47,$40,$47,$40,$40,$40,$40,$40,$40,$40,$40
    .byt  $40,$40,$40,$06,$60,$40,$40,$60,$40,$40,$60,$40,$44,$40,$40,$44
    .byt  $40,$40,$44,$50,$40,$40,$60,$40,$40,$40,$40,$40,$40,$40,$40,$40
    .byt  $03,$5f,$7c,$5f,$7c,$5f,$7c,$5f,$7c,$40,$06,$42,$48,$62,$48,$44
    .byt  $51,$44,$50,$40,$48,$62,$48,$60,$51,$44,$51,$48,$40,$41,$40,$00
    .byt  $13,$47,$40,$47,$40,$47,$40,$47,$40,$40,$40,$40,$40,$40,$40,$40
    .byt  $40,$40,$06,$48,$40,$40,$42,$40,$40,$40,$48,$40,$50,$40,$40,$41
    .byt  $40,$40,$40,$56,$40,$46,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40
    .byt  $01,$5f,$7c,$5f,$7c,$5f,$7c,$5f,$7c,$40,$40,$40,$40,$40,$40,$40
    .byt  $40,$06,$44,$40,$60,$40,$40,$40,$40,$40,$40,$41,$70,$78,$40,$00
    .byt  $11,$47,$40,$47,$40,$47,$40,$47,$40,$40,$40,$40,$40,$40,$40,$40
    .byt  $40,$40,$06,$60,$40,$40,$48,$40,$40,$40,$42,$41,$40,$40,$40,$40
    .byt  $50,$40,$40,$44,$4f,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40
    .byt  $01,$5f,$7c,$5f,$7c,$5f,$7c,$5f,$7c,$40,$40,$40,$40,$40,$40,$40
    .byt  $40,$06,$41,$42,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$00
    .byt  $11,$47,$40,$47,$40,$47,$40,$47,$40,$40,$40,$40,$40,$40,$40,$40
    .byt  $40,$06,$42,$40,$40,$40,$60,$40,$40,$40,$40,$64,$40,$40,$40,$40
    .byt  $44,$40,$40,$41,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40
    .byt  $01,$5f,$7c,$5f,$7c,$5f,$7c,$5f,$7c,$40,$40,$40,$40,$40,$40,$40
    .byt  $40,$40,$06,$58,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$00
    .byt  $11,$47,$40,$47,$40,$47,$40,$47,$40,$40,$40,$40,$40,$40,$40,$40
    .byt  $40,$06,$44,$40,$40,$42,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40
    .byt  $41,$40,$40,$40,$60,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40
    .byt  $01,$5f,$7c,$5f,$7c,$5f,$7c,$5f,$7c,$06,$48,$40,$40,$40,$40,$40
    .byt  $40,$40,$40,$50,$40,$40,$40,$40,$40,$40,$40,$40,$50,$40,$40,$00
    .byt  $11,$47,$40,$47,$40,$47,$40,$47,$40,$40,$40,$40,$40,$40,$40,$40
    .byt  $40,$06,$4c,$51,$44,$49,$44,$51,$44,$51,$44,$40,$62,$48,$62,$48
    .byt  $62,$51,$44,$51,$50,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40
    .byt  $01,$5f,$7c,$5f,$7c,$5f,$7c,$5f,$7c,$06,$48,$40,$40,$40,$40,$40
    .byt  $40,$40,$40,$48,$40,$40,$40,$40,$40,$40,$40,$40,$50,$40,$40,$00
    .byt  $11,$47,$40,$47,$40,$47,$40,$47,$01,$5f,$7c,$5f,$7c,$5f,$7c,$5f
    .byt  $7c,$06,$48,$40,$40,$60,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40
    .byt  $40,$44,$40,$40,$50,$40,$40,$00,$11,$47,$40,$47,$40,$47,$40,$47
    .byt  $40,$40,$40,$40,$40,$40,$40,$40,$40,$06,$48,$40,$40,$40,$40,$40
    .byt  $40,$40,$40,$50,$40,$40,$40,$40,$40,$40,$40,$40,$50,$40,$40,$40
    .byt  $40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40
    .byt  $40,$06,$4c,$40,$42,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40
    .byt  $40,$41,$40,$40,$70,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40
    .byt  $06,$5e,$5c,$5c,$5c,$51,$7c,$4e,$78,$40,$4c,$40,$40,$40,$40,$40
    .byt  $40,$40,$40,$48,$40,$40,$40,$40,$40,$40,$40,$40,$70,$40,$40,$40
    .byt  $47,$40,$4f,$70,$4f,$70,$4c,$40,$06,$50,$60,$52,$60,$50,$50,$50
    .byt  $64,$40,$4e,$40,$48,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40
    .byt  $40,$40,$50,$41,$70,$40,$40,$40,$43,$40,$40,$70,$40,$70,$4c,$70
    .byt  $06,$5c,$58,$5c,$58,$50,$50,$4c,$78,$40,$4f,$40,$40,$40,$40,$40
    .byt  $40,$40,$40,$50,$40,$40,$40,$40,$40,$40,$40,$43,$70,$40,$40,$40
    .byt  $43,$40,$4f,$70,$47,$70,$4c,$70,$06,$50,$44,$52,$44,$50,$50,$42
    .byt  $60,$40,$47,$60,$60,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40
    .byt  $40,$40,$44,$47,$60,$40,$40,$40,$43,$40,$4e,$40,$40,$70,$4f,$70
    .byt  $06,$50,$78,$52,$78,$5e,$50,$5c,$60,$40,$47,$70,$40,$40,$40,$40
    .byt  $40,$40,$40,$48,$40,$40,$40,$40,$40,$40,$40,$4f,$60,$40,$40,$40
    .byt  $4f,$70,$4f,$70,$4f,$70,$40,$70,$40,$40,$40,$40,$40,$40,$40,$40
    .byt  $40,$06,$43,$7a,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40
    .byt  $40,$40,$41,$5f,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40
    .byt  $40,$40,$40,$40,$40,$40,$40,$40,$40,$06,$41,$7e,$62,$48,$62,$48
    .byt  $62,$48,$62,$51,$44,$51,$44,$51,$44,$51,$45,$7e,$40,$40,$40,$40
    .byt  $40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40
    .byt  $40,$40,$40,$91,$df,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
    .byt  $ff,$ff,$f8,$c3,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
    .byt  $40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$06,$5f,$78,$40,$40,$40
    .byt  $40,$40,$40,$48,$40,$40,$40,$40,$40,$40,$5f,$78,$40,$40,$40,$40
    .byt  $40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40
    .byt  $40,$40,$06,$4f,$7e,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40
    .byt  $40,$41,$7f,$70,$40,$40,$40,$40,$40,$47,$69,$5e,$78,$7a,$48,$40
    .byt  $40,$02,$4c,$40,$4c,$40,$4c,$40,$4c,$40,$06,$47,$7f,$60,$40,$40
    .byt  $40,$40,$40,$50,$40,$40,$40,$40,$40,$47,$7f,$60,$40,$40,$40,$40
    .byt  $40,$44,$4d,$50,$65,$41,$50,$40,$40,$02,$54,$40,$54,$40,$54,$40
    .byt  $54,$40,$06,$41,$7f,$7c,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40
    .byt  $40,$7f,$7e,$40,$40,$40,$40,$40,$40,$47,$4b,$5c,$79,$58,$60,$40
    .byt  $40,$02,$68,$40,$68,$40,$68,$40,$68,$40,$40,$06,$5f,$7f,$60,$40
    .byt  $40,$40,$40,$48,$40,$40,$40,$40,$47,$7f,$78,$40,$40,$40,$40,$40
    .byt  $40,$44,$49,$50,$65,$48,$60,$40,$02,$41,$50,$41,$50,$41,$50,$41
    .byt  $50,$40,$40,$06,$47,$7f,$7c,$40,$40,$40,$40,$40,$40,$40,$40,$40
    .byt  $7f,$7f,$60,$40,$40,$40,$40,$40,$40,$47,$69,$5e,$64,$78,$60,$40
    .byt  $02,$42,$60,$42,$60,$42,$60,$42,$60,$40,$40,$06,$41,$7f,$7f,$70
    .byt  $40,$40,$40,$50,$40,$40,$40,$4f,$7f,$7e,$40,$40,$40,$40,$40,$40
    .byt  $40,$40,$40,$40,$40,$40,$40,$40,$02,$4d,$40,$4d,$40,$4d,$40,$4d
    .byt  $40,$40,$40,$40,$06,$5f,$7f,$7f,$60,$40,$40,$40,$40,$40,$47,$7f
    .byt  $7f,$78,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40
    .byt  $02,$5a,$40,$5a,$40,$5a,$40,$5a,$40,$40,$40,$40,$06,$43,$7f,$7f
    .byt  $7f,$78,$40,$48,$40,$5f,$7f,$7f,$7f,$40,$40,$40,$40,$40,$40,$40
    .byt  $40,$40,$40,$40,$40,$40,$40,$40,$02,$76,$40,$76,$40,$76,$40,$76
    .byt  $40,$40,$40,$40,$40,$06,$5f,$7f,$7f,$7f,$7f,$7f,$7f,$7f,$7f,$7f
    .byt  $78,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40
    .byt  $02,$5c,$40,$5c,$40,$5c,$40,$5c,$40,$40,$40,$40,$40,$06,$43,$7f
    .byt  $7f,$7f,$7f,$7f,$7f,$7f,$7f,$7f,$40,$40,$40,$40,$40,$40,$40,$40
    .byt  $40,$40,$40,$40,$40,$40,$40,$40,$02,$48,$40,$48,$40,$48,$40,$48
    .byt  $40,$40,$40,$40,$40,$40,$06,$4f,$7f,$7f,$7f,$7f,$7f,$7f,$7f,$78
    .byt  $40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40
    .byt  $40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$06
    .byt  $5f,$7f,$7f,$7f,$7f,$7f,$78,$40,$40,$40,$40,$40,$40,$40,$40,$40
    .byt  $40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40
    .byt  $40,$40,$40,$40,$40,$40,$40,$40,$06,$47,$7f,$7f,$7f,$60,$40,$40
    .byt  $40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40
#endif
    .dsb 256
    .dsb 256
    .dsb 256
    .dsb 256
    .dsb 256
    .dsb 256
    .dsb 256
    .dsb 256
    .dsb 256
    .dsb 256
    .dsb 256
    .dsb 256
//    .dsb 256
//    .dsb 256
//    .dsb 256
//    .dsb 256
//    .dsb 256
//    .dsb 256
//    .dsb 256
//    .dsb 256


osdk_stack .dsb 20


osdk_end 

; End of program

