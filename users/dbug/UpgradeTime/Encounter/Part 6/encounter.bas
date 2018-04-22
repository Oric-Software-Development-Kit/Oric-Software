 

  10 PRINT CHR$(6);CHR$(20)                 ' Disable key click, lower case
  15 CLS:PAPER 4:INK 3
  20 PRINT "Oric Test Soundboard - q:Quit"
  25 PRINT "space:silence"
  30 PRINT "z:ZAP p:PING s:SHOOT x:EXPLODE"
  35 PRINT "k:click K:KLICK"
  40 PRINT "d:dog w:waves j:jackhammer"
  42 PRINT "b:bourdon r:running"
  45 K$="":GOSUB 100
  50 GOTO 45

 100 Z$=KEY$:IF Z$<>"" THEN K$=Z$
 110 IF K$="q" THEN PLAY 0,0,0,0:PRINT CHR$(20):END  ' Restore upper case and quit
 115 IF K$=" " THEN PLAY 0,0,0,0:RETURN
 120 IF K$="z" THEN ZAP:RETURN
 130 IF K$="s" THEN SHOOT:RETURN
 140 IF K$="p" THEN PING:RETURN
 150 IF K$="x" THEN EXPLODE:RETURN
 160 IF K$="k" THEN CALL#FB14:RETURN
 170 IF K$="K" THEN CALL#FB2A:RETURN
 180 IF K$="d" THEN GOSUB 11000
 190 IF K$="w" THEN GOSUB 400
 200 IF K$="b" THEN GOSUB 299
 210 IF K$="j" THEN GOSUB 500
 220 IF K$="r" THEN GOSUB 800
 250 GOTO 100


  200 ' 
  210 FOR P=1 TO 3
  220 REM PLAY 0,1,1,250
  230 SOUND 1,8+P,6
  240 WAIT 5
  250 SOUND 1,3+P,3
  260 WAIT 20
  270 REM PLAY 0,0,0,0
  280 NEXT P
  290 GOTO 110

  299 PLAY 1,0,0,0' Le vol du bourdon
  300 READ A
  310 MUSIC 1,3,A,10
  320 IF A=11 THEN RESTORE:RETURN
  330 WAIT 25
  340 GOTO 300
  350 DATA 3,5,6,8,10,6,10,10,9,5,9,9,8,4,8,11

  400 ' Waves
  410 PLAY 0,1,0,0
  420 Z%=RND(1)*20
  430 FOR I=0 TO 31
  440 SOUND 4,I,7
  450 WAIT Z%
  460 NEXT I
  470 RETURN

  500 ' jackhammer
  510 PLAY 7,0,0,0
  520 PLAY 1,1,3,180
  525 SOUND 4,1000,0
  530 K$=""
  540 RETURN

  600 ' Enveloppes
  610 INPUT"WHICH CHANEL (1,2,3)";C
  620 IF C<1 OR C>3 THEN 610
  630 INPUT"ENVELOPPE TYPE (1 to 7)";E 
  640 IF E<1 OR E>7 THEN 630
  650 INPUT"WHICH DURECTION (0 to 32767)";T
  660 IF T<0 OR T>32767 THEN 650
  670 MUSIC C,3,4,0
  680 PLAY C,0,E,T 
  690 GET K$
  700 PLAY0,0,0,0
  710 GOTO 610

  800 ' Running footsteps in the snow
  810 FOR P=1 TO 3
  820 PLAY 0,1,1,250
  830 SOUND 4,8+P,6
  840 WAIT 5
  850 SOUND 4,3+P,3
  860 WAIT 20
  870 PLAY 0,0,0,0
  880 NEXT P
  890 RETURN



11000 FORI=1TO12 
11005 MUSIC1,3,I,0 
11006 PLAY1,I,I,6 
11010 NEXT 
11020 PLAY0,0,0,0 
11030 WAITINT(RND(1)*35+4) 
11040 RETURN


