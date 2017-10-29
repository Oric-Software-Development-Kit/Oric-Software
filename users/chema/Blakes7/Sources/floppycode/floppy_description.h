//
// Floppy layout generated by FloppyBuilder 1.1
//

#ifdef ASSEMBLER
//
// Information for the Assembler
//
#ifdef LOADER
FileStartSector .byt 135,137,131,13,142,143,145,130,136,142,143,144,129,132,135,141,131,10,11,141,145,130,136,140,142,129,132,136,138,140,141,133,143,145,137,144,131,135,139,130,139,130,139,130,136,142,136,145,129,3,4,5,6,7,136,138,140,141,143,145,3,4,5,6,135,136,11,140,13,142,16,145,3,4,5,6,7,8,9,10,139,12,13,14,143,17,129,3,132,133,134,138,139,136,143,142,140,134,129,140,135,133,145,138,140,132,132,129,144,133,143,143,137,136,129,137,130,139,132,144,136,131,138,132,140,133,136,129,141,137,145,138,138,145,135,137,1
FileStartTrack .byt 0,3,4,4,4,4,4,5,5,5,5,5,6,6,6,6,7,7,7,7,7,8,8,8,8,9,9,9,9,9,9,10,10,10,11,11,12,12,12,13,13,14,14,15,15,15,16,16,17,17,17,17,17,17,17,17,17,17,17,17,18,18,18,18,18,18,18,18,18,18,18,18,19,19,19,19,19,19,19,19,19,19,19,19,19,19,20,20,20,20,20,21,22,23,24,25,26,27,28,28,29,30,30,31,32,33,34,35,35,36,36,37,38,39,128,128,129,129,130,130,131,132,132,134,134,135,136,137,137,138,138,139,140,140,142,143,144
FileSizeLow .byt <15360,<4000,<3053,<166,<89,<550,<555,<2029,<1725,<88,<105,<282,<838,<650,<1541,<2325,<2273,<104,<324,<1219,<553,<1810,<1218,<285,<1185,<965,<932,<369,<642,<199,<3967,<4367,<679,<4571,<2911,<1615,<1663,<1647,<4015,<3775,<3887,<4399,<3394,<2655,<2364,<4933,<3871,<223,<305,<89,<68,<87,<111,<133,<310,<387,<108,<340,<461,<928,<135,<199,<136,<64,<157,<772,<82,<138,<53,<274,<42,<612,<88,<79,<95,<160,<83,<105,<250,<132,<190,<117,<161,<52,<305,<94,<376,<53,<231,<143,<9189,<7163,<5150,<12700,<7481,<5665,<4719,<4659,<4447,<4544,<5686,<4450,<3649,<7195,<4322,<6409,<4928,<5087,<2182,<3569,<7967,<4028,<6905,<4896,<3443,<3999,<3786,<4546,<5028,<3631,<4406,<2808,<11582,<2817,<3733,<8154,<3822,<6931,<5037,<2915,<3829,<6152,<2397,<10686,<8293,<2988,<1792
FileSizeHigh .byt >15360,>4000,>3053,>166,>89,>550,>555,>2029,>1725,>88,>105,>282,>838,>650,>1541,>2325,>2273,>104,>324,>1219,>553,>1810,>1218,>285,>1185,>965,>932,>369,>642,>199,>3967,>4367,>679,>4571,>2911,>1615,>1663,>1647,>4015,>3775,>3887,>4399,>3394,>2655,>2364,>4933,>3871,>223,>305,>89,>68,>87,>111,>133,>310,>387,>108,>340,>461,>928,>135,>199,>136,>64,>157,>772,>82,>138,>53,>274,>42,>612,>88,>79,>95,>160,>83,>105,>250,>132,>190,>117,>161,>52,>305,>94,>376,>53,>231,>143,>9189,>7163,>5150,>12700,>7481,>5665,>4719,>4659,>4447,>4544,>5686,>4450,>3649,>7195,>4322,>6409,>4928,>5087,>2182,>3569,>7967,>4028,>6905,>4896,>3443,>3999,>3786,>4546,>5028,>3631,>4406,>2808,>11582,>2817,>3733,>8154,>3822,>6931,>5037,>2915,>3829,>6152,>2397,>10686,>8293,>2988,>1792
#undef LOADER
#endif // LOADER
#undef ASSEMBLER
#else
//
// Information for the Compiler
//
#endif

//
// Summary for this floppy building session:
//
#define FLOPPY_SIDE_NUMBER 2    // Number of sides
#define FLOPPY_TRACK_NUMBER 40    // Number of tracks
#define FLOPPY_SECTOR_PER_TRACK 17   // Number of sectors per track

#define FLOPPY_LOADER_TRACK 0   // Track where the loader is stored
#define FLOPPY_LOADER_SECTOR 4   // Sector where the loader is stored
#define FLOPPY_LOADER_ADDRESS 64768   // Address where the loader is loaded on boot ($fd00)

//
// List of files written to the floppy
//
// Entry #0 '..\build\final.out'
// - Starts on  track 0 sector 7 and is 53 sectors long (13410 compressed bytes: 87% of 15360 bytes).
// Entry #1 '..\build\files\tables.o'
// - Starts on  track 3 sector 9 and is 11 sectors long (2758 compressed bytes: 68% of 4000 bytes).
// Entry #2 '..\build\files\auxiliar.o'
// - Starts on  track 4 sector 3 and is 10 sectors long (2367 compressed bytes: 77% of 3053 bytes).
// Entry #3 '..\build\files\script_0.o'
// - Starts on  track 4 sector 13 and is 1 sectors long (166 bytes).
// Entry #4 '..\build\files\script_1.o'
// - Starts on  track 4 sector 14 and is 1 sectors long (87 compressed bytes: 97% of 89 bytes).
// Entry #5 '..\build\files\script_2.o'
// - Starts on  track 4 sector 15 and is 2 sectors long (374 compressed bytes: 68% of 550 bytes).
// Entry #6 '..\build\files\script_3.o'
// - Starts on  track 4 sector 17 and is 2 sectors long (451 compressed bytes: 81% of 555 bytes).
// Entry #7 '..\build\files\script_4.o'
// - Starts on  track 5 sector 2 and is 6 sectors long (1498 compressed bytes: 73% of 2029 bytes).
// Entry #8 '..\build\files\script_5.o'
// - Starts on  track 5 sector 8 and is 6 sectors long (1323 compressed bytes: 76% of 1725 bytes).
// Entry #9 '..\build\files\script_6.o'
// - Starts on  track 5 sector 14 and is 1 sectors long (80 compressed bytes: 90% of 88 bytes).
// Entry #10 '..\build\files\script_7.o'
// - Starts on  track 5 sector 15 and is 1 sectors long (93 compressed bytes: 88% of 105 bytes).
// Entry #11 '..\build\files\script_8.o'
// - Starts on  track 5 sector 16 and is 2 sectors long (270 compressed bytes: 95% of 282 bytes).
// Entry #12 '..\build\files\script_9.o'
// - Starts on  track 6 sector 1 and is 3 sectors long (719 compressed bytes: 85% of 838 bytes).
// Entry #13 '..\build\files\script_10.o'
// - Starts on  track 6 sector 4 and is 3 sectors long (554 compressed bytes: 85% of 650 bytes).
// Entry #14 '..\build\files\script_11.o'
// - Starts on  track 6 sector 7 and is 6 sectors long (1286 compressed bytes: 83% of 1541 bytes).
// Entry #15 '..\build\files\script_15.o'
// - Starts on  track 6 sector 13 and is 7 sectors long (1653 compressed bytes: 71% of 2325 bytes).
// Entry #16 '..\build\files\script_16.o'
// - Starts on  track 7 sector 3 and is 7 sectors long (1740 compressed bytes: 76% of 2273 bytes).
// Entry #17 '..\build\files\script_17.o'
// - Starts on  track 7 sector 10 and is 1 sectors long (104 bytes).
// Entry #18 '..\build\files\script_18.o'
// - Starts on  track 7 sector 11 and is 2 sectors long (324 bytes).
// Entry #19 '..\build\files\script_19.o'
// - Starts on  track 7 sector 13 and is 4 sectors long (1002 compressed bytes: 82% of 1219 bytes).
// Entry #20 '..\build\files\script_20.o'
// - Starts on  track 7 sector 17 and is 2 sectors long (477 compressed bytes: 86% of 553 bytes).
// Entry #21 '..\build\files\script_21.o'
// - Starts on  track 8 sector 2 and is 6 sectors long (1501 compressed bytes: 82% of 1810 bytes).
// Entry #22 '..\build\files\script_30.o'
// - Starts on  track 8 sector 8 and is 4 sectors long (956 compressed bytes: 78% of 1218 bytes).
// Entry #23 '..\build\files\string_main.o'
// - Starts on  track 8 sector 12 and is 2 sectors long (261 compressed bytes: 91% of 285 bytes).
// Entry #24 '..\build\files\string_introsvila.o'
// - Starts on  track 8 sector 14 and is 4 sectors long (959 compressed bytes: 80% of 1185 bytes).
// Entry #25 '..\build\files\string_londonplan.o'
// - Starts on  track 9 sector 1 and is 3 sectors long (759 compressed bytes: 78% of 965 bytes).
// Entry #26 '..\build\files\string_londondlg.o'
// - Starts on  track 9 sector 4 and is 4 sectors long (783 compressed bytes: 84% of 932 bytes).
// Entry #27 '..\build\files\obj_blake.o'
// - Starts on  track 9 sector 8 and is 2 sectors long (271 compressed bytes: 73% of 369 bytes).
// Entry #28 '..\build\files\obj_ep2.o'
// - Starts on  track 9 sector 10 and is 2 sectors long (483 compressed bytes: 75% of 642 bytes).
// Entry #29 '..\build\files\obj_ep3.o'
// - Starts on  track 9 sector 12 and is 1 sectors long (168 compressed bytes: 84% of 199 bytes).
// Entry #30 '..\build\files\cos_blake.o'
// - Starts on  track 9 sector 13 and is 9 sectors long (2148 compressed bytes: 54% of 3967 bytes).
// Entry #31 '..\build\files\cos_jenna.o'
// - Starts on  track 10 sector 5 and is 10 sectors long (2317 compressed bytes: 53% of 4367 bytes).
// Entry #32 '..\build\files\cos_camera.o'
// - Starts on  track 10 sector 15 and is 2 sectors long (468 compressed bytes: 68% of 679 bytes).
// Entry #33 '..\build\files\cos_guard.o'
// - Starts on  track 10 sector 17 and is 9 sectors long (2173 compressed bytes: 47% of 4571 bytes).
// Entry #34 '..\build\files\cos_techcam.o'
// - Starts on  track 11 sector 9 and is 7 sectors long (1542 compressed bytes: 52% of 2911 bytes).
// Entry #35 '..\build\files\cos_man.o'
// - Starts on  track 11 sector 16 and is 4 sectors long (792 compressed bytes: 49% of 1615 bytes).
// Entry #36 '..\build\files\cos_man2.o'
// - Starts on  track 12 sector 3 and is 4 sectors long (917 compressed bytes: 55% of 1663 bytes).
// Entry #37 '..\build\files\cos_travis.o'
// - Starts on  track 12 sector 7 and is 4 sectors long (832 compressed bytes: 50% of 1647 bytes).
// Entry #38 '..\build\files\cos_servalan.o'
// - Starts on  track 12 sector 11 and is 8 sectors long (2005 compressed bytes: 49% of 4015 bytes).
// Entry #39 '..\build\files\cos_vila.o'
// - Starts on  track 13 sector 2 and is 9 sectors long (2066 compressed bytes: 54% of 3775 bytes).
// Entry #40 '..\build\files\cos_avon.o'
// - Starts on  track 13 sector 11 and is 8 sectors long (1885 compressed bytes: 48% of 3887 bytes).
// Entry #41 '..\build\files\cos_gan.o'
// - Starts on  track 14 sector 2 and is 9 sectors long (2155 compressed bytes: 48% of 4399 bytes).
// Entry #42 '..\build\files\cos_cally.o'
// - Starts on  track 14 sector 11 and is 8 sectors long (1829 compressed bytes: 53% of 3394 bytes).
// Entry #43 '..\build\files\cos_bextras.o'
// - Starts on  track 15 sector 2 and is 6 sectors long (1439 compressed bytes: 54% of 2655 bytes).
// Entry #44 '..\build\files\cos_ball.o'
// - Starts on  track 15 sector 8 and is 6 sectors long (1313 compressed bytes: 55% of 2364 bytes).
// Entry #45 '..\build\files\cos_vargas.o'
// - Starts on  track 15 sector 14 and is 11 sectors long (2564 compressed bytes: 51% of 4933 bytes).
// Entry #46 '..\build\files\cos_monk.o'
// - Starts on  track 16 sector 8 and is 9 sectors long (2161 compressed bytes: 55% of 3871 bytes).
// Entry #47 '..\build\files\ocode_guard.o'
// - Starts on  track 16 sector 17 and is 1 sectors long (207 compressed bytes: 92% of 223 bytes).
// Entry #48 '..\build\files\ocode_sandwich.o'
// - Starts on  track 17 sector 1 and is 2 sectors long (298 compressed bytes: 97% of 305 bytes).
// Entry #49 '..\build\files\ocode_mug.o'
// - Starts on  track 17 sector 3 and is 1 sectors long (89 bytes).
// Entry #50 '..\build\files\ocode_key.o'
// - Starts on  track 17 sector 4 and is 1 sectors long (68 bytes).
// Entry #51 '..\build\files\ocode_laxative.o'
// - Starts on  track 17 sector 5 and is 1 sectors long (87 bytes).
// Entry #52 '..\build\files\ocode_coin.o'
// - Starts on  track 17 sector 6 and is 1 sectors long (111 bytes).
// Entry #53 '..\build\files\ocode_decaf.o'
// - Starts on  track 17 sector 7 and is 1 sectors long (133 bytes).
// Entry #54 '..\build\files\ocode_map.o'
// - Starts on  track 17 sector 8 and is 2 sectors long (275 compressed bytes: 88% of 310 bytes).
// Entry #55 '..\build\files\ocode_techcam.o'
// - Starts on  track 17 sector 10 and is 2 sectors long (362 compressed bytes: 93% of 387 bytes).
// Entry #56 '..\build\files\ocode_man.o'
// - Starts on  track 17 sector 12 and is 1 sectors long (105 compressed bytes: 97% of 108 bytes).
// Entry #57 '..\build\files\ocode_vila.o'
// - Starts on  track 17 sector 13 and is 2 sectors long (328 compressed bytes: 96% of 340 bytes).
// Entry #58 '..\build\files\ocode_jenna.o'
// - Starts on  track 17 sector 15 and is 2 sectors long (453 compressed bytes: 98% of 461 bytes).
// Entry #59 '..\build\files\ocode_avon.o'
// - Starts on  track 17 sector 17 and is 3 sectors long (764 compressed bytes: 82% of 928 bytes).
// Entry #60 '..\build\files\ocode_gan.o'
// - Starts on  track 18 sector 3 and is 1 sectors long (135 bytes).
// Entry #61 '..\build\files\ocode_ypipe.o'
// - Starts on  track 18 sector 4 and is 1 sectors long (199 bytes).
// Entry #62 '..\build\files\ocode_bearing.o'
// - Starts on  track 18 sector 5 and is 1 sectors long (136 bytes).
// Entry #63 '..\build\files\ocode_cinch.o'
// - Starts on  track 18 sector 6 and is 1 sectors long (64 bytes).
// Entry #64 '..\build\files\ocode_catpult.o'
// - Starts on  track 18 sector 7 and is 1 sectors long (155 compressed bytes: 98% of 157 bytes).
// Entry #65 '..\build\files\ocode_bracelet.o'
// - Starts on  track 18 sector 8 and is 3 sectors long (590 compressed bytes: 76% of 772 bytes).
// Entry #66 '..\build\files\ocode_gun.o'
// - Starts on  track 18 sector 11 and is 1 sectors long (82 bytes).
// Entry #67 '..\build\files\ocode_bracelets.o'
// - Starts on  track 18 sector 12 and is 1 sectors long (134 compressed bytes: 97% of 138 bytes).
// Entry #68 '..\build\files\ocode_transmitter.o'
// - Starts on  track 18 sector 13 and is 1 sectors long (53 bytes).
// Entry #69 '..\build\files\ocode_drone.o'
// - Starts on  track 18 sector 14 and is 2 sectors long (260 compressed bytes: 94% of 274 bytes).
// Entry #70 '..\build\files\ocode_wswitch.o'
// - Starts on  track 18 sector 16 and is 1 sectors long (42 bytes).
// Entry #71 '..\build\files\ocode_ballrobot.o'
// - Starts on  track 18 sector 17 and is 3 sectors long (520 compressed bytes: 84% of 612 bytes).
// Entry #72 '..\build\files\ocode_pliers.o'
// - Starts on  track 19 sector 3 and is 1 sectors long (88 bytes).
// Entry #73 '..\build\files\ocode_scissors.o'
// - Starts on  track 19 sector 4 and is 1 sectors long (79 bytes).
// Entry #74 '..\build\files\ocode_wrench.o'
// - Starts on  track 19 sector 5 and is 1 sectors long (95 bytes).
// Entry #75 '..\build\files\ocode_spray.o'
// - Starts on  track 19 sector 6 and is 1 sectors long (160 bytes).
// Entry #76 '..\build\files\ocode_rope.o'
// - Starts on  track 19 sector 7 and is 1 sectors long (83 bytes).
// Entry #77 '..\build\files\ocode_lamp.o'
// - Starts on  track 19 sector 8 and is 1 sectors long (105 bytes).
// Entry #78 '..\build\files\ocode_vargas.o'
// - Starts on  track 19 sector 9 and is 1 sectors long (250 bytes).
// Entry #79 '..\build\files\ocode_log.o'
// - Starts on  track 19 sector 10 and is 1 sectors long (132 bytes).
// Entry #80 '..\build\files\ocode_cup.o'
// - Starts on  track 19 sector 11 and is 1 sectors long (156 compressed bytes: 82% of 190 bytes).
// Entry #81 '..\build\files\ocode_guard2.o'
// - Starts on  track 19 sector 12 and is 1 sectors long (117 bytes).
// Entry #82 '..\build\files\ocode_uniform.o'
// - Starts on  track 19 sector 13 and is 1 sectors long (161 bytes).
// Entry #83 '..\build\files\ocode_cally.o'
// - Starts on  track 19 sector 14 and is 1 sectors long (52 bytes).
// Entry #84 '..\build\files\ocode_trasponder.o'
// - Starts on  track 19 sector 15 and is 2 sectors long (262 compressed bytes: 85% of 305 bytes).
// Entry #85 '..\build\files\ocode_ecell.o'
// - Starts on  track 19 sector 17 and is 1 sectors long (94 bytes).
// Entry #86 '..\build\files\main_theme.o'
// - Starts on  track 20 sector 1 and is 2 sectors long (350 compressed bytes: 93% of 376 bytes).
// Entry #87 '..\build\files\endep_theme.o'
// - Starts on  track 20 sector 3 and is 1 sectors long (53 bytes).
// Entry #88 '..\build\files\final_theme.o'
// - Starts on  track 20 sector 4 and is 1 sectors long (202 compressed bytes: 87% of 231 bytes).
// Entry #89 '..\build\files\fedmarch_theme.o'
// - Starts on  track 20 sector 5 and is 1 sectors long (141 compressed bytes: 98% of 143 bytes).
// Entry #90 '..\build\files\room_intro.o'
// - Starts on  track 20 sector 6 and is 21 sectors long (5267 compressed bytes: 57% of 9189 bytes).
// Entry #91 '..\build\files\room_episode1.o'
// - Starts on  track 21 sector 10 and is 18 sectors long (4491 compressed bytes: 62% of 7163 bytes).
// Entry #92 '..\build\files\room_blakesroom.o'
// - Starts on  track 22 sector 11 and is 14 sectors long (3360 compressed bytes: 65% of 5150 bytes).
// Entry #93 '..\build\files\room_dchallway.o'
// - Starts on  track 23 sector 8 and is 24 sectors long (5910 compressed bytes: 46% of 12700 bytes).
// Entry #94 '..\build\files\room_foyerA.o'
// - Starts on  track 24 sector 15 and is 16 sectors long (3991 compressed bytes: 53% of 7481 bytes).
// Entry #95 '..\build\files\room_maproom.o'
// - Starts on  track 25 sector 14 and is 15 sectors long (3598 compressed bytes: 63% of 5665 bytes).
// Entry #96 '..\build\files\room_infoarea.o'
// - Starts on  track 26 sector 12 and is 11 sectors long (2708 compressed bytes: 57% of 4719 bytes).
// Entry #97 '..\build\files\room_servicecorr.o'
// - Starts on  track 27 sector 6 and is 12 sectors long (2961 compressed bytes: 63% of 4659 bytes).
// Entry #98 '..\build\files\room_serviceexit.o'
// - Starts on  track 28 sector 1 and is 11 sectors long (2658 compressed bytes: 59% of 4447 bytes).
// Entry #99 '..\build\files\room_nursery.o'
// - Starts on  track 28 sector 12 and is 12 sectors long (3022 compressed bytes: 66% of 4544 bytes).
// Entry #100 '..\build\files\room_camcontrol.o'
// - Starts on  track 29 sector 7 and is 15 sectors long (3804 compressed bytes: 66% of 5686 bytes).
// Entry #101 '..\build\files\room_exterior.o'
// - Starts on  track 30 sector 5 and is 12 sectors long (2871 compressed bytes: 64% of 4450 bytes).
// Entry #102 '..\build\files\room_guilty.o'
// - Starts on  track 30 sector 17 and is 10 sectors long (2517 compressed bytes: 68% of 3649 bytes).
// Entry #103 '..\build\files\room_locker.o'
// - Starts on  track 31 sector 10 and is 19 sectors long (4653 compressed bytes: 64% of 7195 bytes).
// Entry #104 '..\build\files\room_episode2.o'
// - Starts on  track 32 sector 12 and is 9 sectors long (2223 compressed bytes: 51% of 4322 bytes).
// Entry #105 '..\build\files\room_londoncell.o'
// - Starts on  track 33 sector 4 and is 17 sectors long (4287 compressed bytes: 66% of 6409 bytes).
// Entry #106 '..\build\files\room_londoncomp.o'
// - Starts on  track 34 sector 4 and is 14 sectors long (3459 compressed bytes: 70% of 4928 bytes).
// Entry #107 '..\build\files\room_londondeck.o'
// - Starts on  track 35 sector 1 and is 15 sectors long (3657 compressed bytes: 71% of 5087 bytes).
// Entry #108 '..\build\files\room_liberatorpass.o'
// - Starts on  track 35 sector 16 and is 6 sectors long (1486 compressed bytes: 68% of 2182 bytes).
// Entry #109 '..\build\files\room_liberatorworkshop.o'
// - Starts on  track 36 sector 5 and is 10 sectors long (2503 compressed bytes: 70% of 3569 bytes).
// Entry #110 '..\build\files\room_liberatordeck.o'
// - Starts on  track 36 sector 15 and is 17 sectors long (4141 compressed bytes: 51% of 7967 bytes).
// Entry #111 '..\build\files\room_liberatorzen.o'
// - Starts on  track 37 sector 15 and is 11 sectors long (2755 compressed bytes: 68% of 4028 bytes).
// Entry #112 '..\build\files\room_liberatorteleport.o'
// - Starts on  track 38 sector 9 and is 16 sectors long (3956 compressed bytes: 57% of 6905 bytes).
// Entry #113 '..\build\files\room_liberatorcargo.o'
// - Starts on  track 39 sector 8 and is 10 sectors long (2371 compressed bytes: 48% of 4896 bytes).
// Entry #114 '..\build\files\room_caexterior.o'
// - Starts on the second side on track 0 sector 1 and is 8 sectors long (2047 compressed bytes: 59% of 3443 bytes).
// Entry #115 '..\build\files\room_capit.o'
// - Starts on the second side on track 0 sector 9 and is 10 sectors long (2373 compressed bytes: 59% of 3999 bytes).
// Entry #116 '..\build\files\room_cacaveentry.o'
// - Starts on the second side on track 1 sector 2 and is 9 sectors long (2176 compressed bytes: 57% of 3786 bytes).
// Entry #117 '..\build\files\room_cacave.o'
// - Starts on the second side on track 1 sector 11 and is 10 sectors long (2469 compressed bytes: 54% of 4546 bytes).
// Entry #118 '..\build\files\room_cabackentry.o'
// - Starts on the second side on track 2 sector 4 and is 12 sectors long (2881 compressed bytes: 57% of 5028 bytes).
// Entry #119 '..\build\files\room_cahall.o'
// - Starts on the second side on track 2 sector 16 and is 9 sectors long (2156 compressed bytes: 59% of 3631 bytes).
// Entry #120 '..\build\files\room_cabuilding.o'
// - Starts on the second side on track 3 sector 8 and is 12 sectors long (2926 compressed bytes: 66% of 4406 bytes).
// Entry #121 '..\build\files\room_cacells.o'
// - Starts on the second side on track 4 sector 3 and is 7 sectors long (1596 compressed bytes: 56% of 2808 bytes).
// Entry #122 '..\build\files\room_episode3.o'
// - Starts on the second side on track 4 sector 10 and is 28 sectors long (7061 compressed bytes: 60% of 11582 bytes).
// Entry #123 '..\build\files\room_forest.o'
// - Starts on the second side on track 6 sector 4 and is 8 sectors long (2005 compressed bytes: 71% of 2817 bytes).
// Entry #124 '..\build\files\room_swamp.o'
// - Starts on the second side on track 6 sector 12 and is 10 sectors long (2529 compressed bytes: 67% of 3733 bytes).
// Entry #125 '..\build\files\room_hideout.o'
// - Starts on the second side on track 7 sector 5 and is 20 sectors long (4870 compressed bytes: 59% of 8154 bytes).
// Entry #126 '..\build\files\room_tunnel.o'
// - Starts on the second side on track 8 sector 8 and is 10 sectors long (2467 compressed bytes: 64% of 3822 bytes).
// Entry #127 '..\build\files\room_corridor.o'
// - Starts on the second side on track 9 sector 1 and is 12 sectors long (3028 compressed bytes: 43% of 6931 bytes).
// Entry #128 '..\build\files\room_cellcorridor.o'
// - Starts on the second side on track 9 sector 13 and is 13 sectors long (3180 compressed bytes: 63% of 5037 bytes).
// Entry #129 '..\build\files\room_service.o'
// - Starts on the second side on track 10 sector 9 and is 8 sectors long (1803 compressed bytes: 61% of 2915 bytes).
// Entry #130 '..\build\files\room_toilet.o'
// - Starts on the second side on track 10 sector 17 and is 10 sectors long (2550 compressed bytes: 66% of 3829 bytes).
// Entry #131 '..\build\files\room_common.o'
// - Starts on the second side on track 11 sector 10 and is 17 sectors long (4124 compressed bytes: 67% of 6152 bytes).
// Entry #132 '..\build\files\room_laundry.o'
// - Starts on the second side on track 12 sector 10 and is 7 sectors long (1570 compressed bytes: 65% of 2397 bytes).
// Entry #133 '..\build\files\room_cellentry.o'
// - Starts on the second side on track 12 sector 17 and is 24 sectors long (5941 compressed bytes: 55% of 10686 bytes).
// Entry #134 '..\build\files\room_cellentry2.o'
// - Starts on the second side on track 14 sector 7 and is 19 sectors long (4771 compressed bytes: 57% of 8293 bytes).
// Entry #135 '..\build\files\room_epilogue.o'
// - Starts on the second side on track 15 sector 9 and is 9 sectors long (2090 compressed bytes: 69% of 2988 bytes).
// Entry #136 'Reserved sectors'
// - Starts on the second side on track 16 sector 1 and is 7 sectors long (1792 bytes).
//
// 959 sectors used, out of 1360. (70% of the total disk size used)
//
#define LOADER_SECTOR_BUFFER $200
#define LOADER_BASE_ZERO_PAGE $F2
#define LOADER_GAME_PROGRAM 0
#define LOADER_GAME_PROGRAM_ADDRESS $c000
#define LOADER_GAME_PROGRAM_TRACK 0
#define LOADER_GAME_PROGRAM_SECTOR 135
#define LOADER_GAME_PROGRAM_SIZE 15360
#define LOADER_GAME_PROGRAM_SIZE_COMPRESSED 13410
#define LOADER_TABLES 1
#define LOADER_AUXILIAR 2
#define LOADER_SCRIPT0 3
#define LOADER_SCRIPT1 4
#define LOADER_SCRIPT2 5
#define LOADER_SCRIPT3 6
#define LOADER_SCRIPT4 7
#define LOADER_SCRIPT5 8
#define LOADER_SCRIPT6 9
#define LOADER_SCRIPT7 10
#define LOADER_SCRIPT8 11
#define LOADER_SCRIPT9 12
#define LOADER_SCRIPT10 13
#define LOADER_SCRIPT11 14
#define LOADER_SCRIPT15 15
#define LOADER_SCRIPT16 16
#define LOADER_SCRIPT17 17
#define LOADER_SCRIPT18 18
#define LOADER_SCRIPT19 19
#define LOADER_SCRIPT20 20
#define LOADER_SCRIPT21 21
#define LOADER_SCRIPT30 22
#define LOADER_STRINGS 23
#define LOADER_STRINGSINTROSVILA 24
#define LOADER_STRINGSLONDONPLAN 25
#define LOADER_STRINGSLONDONDLG 26
#define LOADER_OBJBLAKE 27
#define LOADER_OBJEP2 28
#define LOADER_OBJEP3 29
#define LOADER_COSBLAKE 30
#define LOADER_COSJENNA 31
#define LOADER_COSCAMERA 32
#define LOADER_COSGUARD 33
#define LOADER_COSTECHCAM 34
#define LOADER_COSMAN 35
#define LOADER_COSMAN2 36
#define LOADER_COSTRAVIS 37
#define LOADER_COSSERVALAN 38
#define LOADER_COSVILA 39
#define LOADER_COSAVON 40
#define LOADER_COSGAN 41
#define LOADER_COSCALLY 42
#define LOADER_COSBEXTRAS 43
#define LOADER_COSBALL 44
#define LOADER_COSVARGAS 45
#define LOADER_COSMONK 46
#define LOADER_OCODEGUARD 47
#define LOADER_OCODESANDWICH 48
#define LOADER_OCODEMUG 49
#define LOADER_OCODEKEY 50
#define LOADER_OCODELAXATIVE 51
#define LOADER_OCODECOIN 52
#define LOADER_OCODEDECAF 53
#define LOADER_OCODEMAP 54
#define LOADER_OCODETECHCAM 55
#define LOADER_OCODEMAN 56
#define LOADER_OCODEVILA 57
#define LOADER_OCODEJENNA 58
#define LOADER_OCODEAVON 59
#define LOADER_OCODEGAN 60
#define LOADER_OCODEYPIPE 61
#define LOADER_OCODEBEARING 62
#define LOADER_OCODECINCH 63
#define LOADER_OCODECATPULT 64
#define LOADER_OCODEBRACELET 65
#define LOADER_OCODEGUN 66
#define LOADER_OCODEBRACELETS 67
#define LOADER_OCODETRANSMITTER 68
#define LOADER_OCODEDRONE 69
#define LOADER_OCODEWSWITCH 70
#define LOADER_OCODEBALLROBOT 71
#define LOADER_OCODEPLIERS 72
#define LOADER_OCODESCISSORS 73
#define LOADER_OCODEWRENCH 74
#define LOADER_OCODESPRAY 75
#define LOADER_OCODEROPE 76
#define LOADER_OCODELAMP 77
#define LOADER_OCODEVARGAS 78
#define LOADER_OCODELOG 79
#define LOADER_OCODECUP 80
#define LOADER_OCODEGUARD2 81
#define LOADER_OCODEUNIFORM 82
#define LOADER_OCODECALLY 83
#define LOADER_OCODETRASPONDER 84
#define LOADER_OCODEECELL 85
#define LOADER_MAINTHEME 86
#define LOADER_ENDEPTHEME 87
#define LOADER_FINALTHEME 88
#define LOADER_FEDMARCHTHEME 89
#define LOADER_ROOM0 90
#define LOADER_ROOM1 91
#define LOADER_ROOM2 92
#define LOADER_ROOM3 93
#define LOADER_ROOM4 94
#define LOADER_ROOM5 95
#define LOADER_ROOM6 96
#define LOADER_ROOM7 97
#define LOADER_ROOM8 98
#define LOADER_ROOM9 99
#define LOADER_ROOM10 100
#define LOADER_ROOM11 101
#define LOADER_ROOM12 102
#define LOADER_ROOM13 103
#define LOADER_ROOM14 104
#define LOADER_ROOM15 105
#define LOADER_ROOM17 106
#define LOADER_ROOM18 107
#define LOADER_ROOM20 108
#define LOADER_ROOM21 109
#define LOADER_ROOM22 110
#define LOADER_ROOM23 111
#define LOADER_ROOM24 112
#define LOADER_ROOM25 113
#define LOADER_ROOM30 114
#define LOADER_ROOM31 115
#define LOADER_ROOM32 116
#define LOADER_ROOM33 117
#define LOADER_ROOM34 118
#define LOADER_ROOM35 119
#define LOADER_ROOM36 120
#define LOADER_ROOM37 121
#define LOADER_ROOM40 122
#define LOADER_ROOM41 123
#define LOADER_ROOM42 124
#define LOADER_ROOM43 125
#define LOADER_ROOM44 126
#define LOADER_ROOM45 127
#define LOADER_ROOM47 128
#define LOADER_ROOM49 129
#define LOADER_ROOM50 130
#define LOADER_ROOM51 131
#define LOADER_ROOM52 132
#define LOADER_ROOM53 133
#define LOADER_ROOM54 134
#define LOADER_ROOM55 135
#define LOADER_SAVESPACE 136

//
// Metadata
//
#ifdef METADATA_STORAGE

#endif // METADATA_STORAGE
