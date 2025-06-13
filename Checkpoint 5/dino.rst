                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ISO C Compiler
                                      3 ; Version 4.5.0 #15242 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module dino
                                      6 	
                                      7 	.optsdcc -mmcs51 --model-small
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _cactus_patterns
                                     12 	.globl _cactus
                                     13 	.globl _dinosaur
                                     14 	.globl _timer0_ISR
                                     15 	.globl __mcs51_genXRAMCLEAR
                                     16 	.globl __mcs51_genXINIT
                                     17 	.globl __mcs51_genRAMCLEAR
                                     18 	.globl __sdcc_gsinit_startup
                                     19 	.globl _main
                                     20 	.globl _game_ctrl
                                     21 	.globl _render_task
                                     22 	.globl _keypad_ctrl
                                     23 	.globl _LCD_set_symbol
                                     24 	.globl _LCD_write_char
                                     25 	.globl _LCD_IRWrite
                                     26 	.globl _LCD_Init
                                     27 	.globl _AnyKeyPressed
                                     28 	.globl _KeyToChar
                                     29 	.globl _Init_Keypad
                                     30 	.globl _ThreadYield
                                     31 	.globl _ThreadCreate
                                     32 	.globl _CY
                                     33 	.globl _AC
                                     34 	.globl _F0
                                     35 	.globl _RS1
                                     36 	.globl _RS0
                                     37 	.globl _OV
                                     38 	.globl _F1
                                     39 	.globl _P
                                     40 	.globl _PS
                                     41 	.globl _PT1
                                     42 	.globl _PX1
                                     43 	.globl _PT0
                                     44 	.globl _PX0
                                     45 	.globl _RD
                                     46 	.globl _WR
                                     47 	.globl _T1
                                     48 	.globl _T0
                                     49 	.globl _INT1
                                     50 	.globl _INT0
                                     51 	.globl _TXD
                                     52 	.globl _RXD
                                     53 	.globl _P3_7
                                     54 	.globl _P3_6
                                     55 	.globl _P3_5
                                     56 	.globl _P3_4
                                     57 	.globl _P3_3
                                     58 	.globl _P3_2
                                     59 	.globl _P3_1
                                     60 	.globl _P3_0
                                     61 	.globl _EA
                                     62 	.globl _ES
                                     63 	.globl _ET1
                                     64 	.globl _EX1
                                     65 	.globl _ET0
                                     66 	.globl _EX0
                                     67 	.globl _P2_7
                                     68 	.globl _P2_6
                                     69 	.globl _P2_5
                                     70 	.globl _P2_4
                                     71 	.globl _P2_3
                                     72 	.globl _P2_2
                                     73 	.globl _P2_1
                                     74 	.globl _P2_0
                                     75 	.globl _SM0
                                     76 	.globl _SM1
                                     77 	.globl _SM2
                                     78 	.globl _REN
                                     79 	.globl _TB8
                                     80 	.globl _RB8
                                     81 	.globl _TI
                                     82 	.globl _RI
                                     83 	.globl _P1_7
                                     84 	.globl _P1_6
                                     85 	.globl _P1_5
                                     86 	.globl _P1_4
                                     87 	.globl _P1_3
                                     88 	.globl _P1_2
                                     89 	.globl _P1_1
                                     90 	.globl _P1_0
                                     91 	.globl _TF1
                                     92 	.globl _TR1
                                     93 	.globl _TF0
                                     94 	.globl _TR0
                                     95 	.globl _IE1
                                     96 	.globl _IT1
                                     97 	.globl _IE0
                                     98 	.globl _IT0
                                     99 	.globl _P0_7
                                    100 	.globl _P0_6
                                    101 	.globl _P0_5
                                    102 	.globl _P0_4
                                    103 	.globl _P0_3
                                    104 	.globl _P0_2
                                    105 	.globl _P0_1
                                    106 	.globl _P0_0
                                    107 	.globl _B
                                    108 	.globl _ACC
                                    109 	.globl _PSW
                                    110 	.globl _IP
                                    111 	.globl _P3
                                    112 	.globl _IE
                                    113 	.globl _P2
                                    114 	.globl _SBUF
                                    115 	.globl _SCON
                                    116 	.globl _P1
                                    117 	.globl _TH1
                                    118 	.globl _TH0
                                    119 	.globl _TL1
                                    120 	.globl _TL0
                                    121 	.globl _TMOD
                                    122 	.globl _TCON
                                    123 	.globl _PCON
                                    124 	.globl _DPH
                                    125 	.globl _DPL
                                    126 	.globl _SP
                                    127 	.globl _P0
                                    128 	.globl _last_cactus_row
                                    129 	.globl _cactus_timer
                                    130 	.globl _game_speed
                                    131 	.globl _mask
                                    132 	.globl _carry_bit
                                    133 	.globl _time
                                    134 	.globl _map_btm
                                    135 	.globl _map_top
                                    136 	.globl _score
                                    137 	.globl _game_over
                                    138 	.globl _game_start
                                    139 	.globl _dino_position
                                    140 	.globl _pressed_key
                                    141 	.globl _difficulty_input
                                    142 ;--------------------------------------------------------
                                    143 ; special function registers
                                    144 ;--------------------------------------------------------
                                    145 	.area RSEG    (ABS,DATA)
      000000                        146 	.org 0x0000
                           000080   147 _P0	=	0x0080
                           000081   148 _SP	=	0x0081
                           000082   149 _DPL	=	0x0082
                           000083   150 _DPH	=	0x0083
                           000087   151 _PCON	=	0x0087
                           000088   152 _TCON	=	0x0088
                           000089   153 _TMOD	=	0x0089
                           00008A   154 _TL0	=	0x008a
                           00008B   155 _TL1	=	0x008b
                           00008C   156 _TH0	=	0x008c
                           00008D   157 _TH1	=	0x008d
                           000090   158 _P1	=	0x0090
                           000098   159 _SCON	=	0x0098
                           000099   160 _SBUF	=	0x0099
                           0000A0   161 _P2	=	0x00a0
                           0000A8   162 _IE	=	0x00a8
                           0000B0   163 _P3	=	0x00b0
                           0000B8   164 _IP	=	0x00b8
                           0000D0   165 _PSW	=	0x00d0
                           0000E0   166 _ACC	=	0x00e0
                           0000F0   167 _B	=	0x00f0
                                    168 ;--------------------------------------------------------
                                    169 ; special function bits
                                    170 ;--------------------------------------------------------
                                    171 	.area RSEG    (ABS,DATA)
      000000                        172 	.org 0x0000
                           000080   173 _P0_0	=	0x0080
                           000081   174 _P0_1	=	0x0081
                           000082   175 _P0_2	=	0x0082
                           000083   176 _P0_3	=	0x0083
                           000084   177 _P0_4	=	0x0084
                           000085   178 _P0_5	=	0x0085
                           000086   179 _P0_6	=	0x0086
                           000087   180 _P0_7	=	0x0087
                           000088   181 _IT0	=	0x0088
                           000089   182 _IE0	=	0x0089
                           00008A   183 _IT1	=	0x008a
                           00008B   184 _IE1	=	0x008b
                           00008C   185 _TR0	=	0x008c
                           00008D   186 _TF0	=	0x008d
                           00008E   187 _TR1	=	0x008e
                           00008F   188 _TF1	=	0x008f
                           000090   189 _P1_0	=	0x0090
                           000091   190 _P1_1	=	0x0091
                           000092   191 _P1_2	=	0x0092
                           000093   192 _P1_3	=	0x0093
                           000094   193 _P1_4	=	0x0094
                           000095   194 _P1_5	=	0x0095
                           000096   195 _P1_6	=	0x0096
                           000097   196 _P1_7	=	0x0097
                           000098   197 _RI	=	0x0098
                           000099   198 _TI	=	0x0099
                           00009A   199 _RB8	=	0x009a
                           00009B   200 _TB8	=	0x009b
                           00009C   201 _REN	=	0x009c
                           00009D   202 _SM2	=	0x009d
                           00009E   203 _SM1	=	0x009e
                           00009F   204 _SM0	=	0x009f
                           0000A0   205 _P2_0	=	0x00a0
                           0000A1   206 _P2_1	=	0x00a1
                           0000A2   207 _P2_2	=	0x00a2
                           0000A3   208 _P2_3	=	0x00a3
                           0000A4   209 _P2_4	=	0x00a4
                           0000A5   210 _P2_5	=	0x00a5
                           0000A6   211 _P2_6	=	0x00a6
                           0000A7   212 _P2_7	=	0x00a7
                           0000A8   213 _EX0	=	0x00a8
                           0000A9   214 _ET0	=	0x00a9
                           0000AA   215 _EX1	=	0x00aa
                           0000AB   216 _ET1	=	0x00ab
                           0000AC   217 _ES	=	0x00ac
                           0000AF   218 _EA	=	0x00af
                           0000B0   219 _P3_0	=	0x00b0
                           0000B1   220 _P3_1	=	0x00b1
                           0000B2   221 _P3_2	=	0x00b2
                           0000B3   222 _P3_3	=	0x00b3
                           0000B4   223 _P3_4	=	0x00b4
                           0000B5   224 _P3_5	=	0x00b5
                           0000B6   225 _P3_6	=	0x00b6
                           0000B7   226 _P3_7	=	0x00b7
                           0000B0   227 _RXD	=	0x00b0
                           0000B1   228 _TXD	=	0x00b1
                           0000B2   229 _INT0	=	0x00b2
                           0000B3   230 _INT1	=	0x00b3
                           0000B4   231 _T0	=	0x00b4
                           0000B5   232 _T1	=	0x00b5
                           0000B6   233 _WR	=	0x00b6
                           0000B7   234 _RD	=	0x00b7
                           0000B8   235 _PX0	=	0x00b8
                           0000B9   236 _PT0	=	0x00b9
                           0000BA   237 _PX1	=	0x00ba
                           0000BB   238 _PT1	=	0x00bb
                           0000BC   239 _PS	=	0x00bc
                           0000D0   240 _P	=	0x00d0
                           0000D1   241 _F1	=	0x00d1
                           0000D2   242 _OV	=	0x00d2
                           0000D3   243 _RS0	=	0x00d3
                           0000D4   244 _RS1	=	0x00d4
                           0000D5   245 _F0	=	0x00d5
                           0000D6   246 _AC	=	0x00d6
                           0000D7   247 _CY	=	0x00d7
                                    248 ;--------------------------------------------------------
                                    249 ; overlayable register banks
                                    250 ;--------------------------------------------------------
                                    251 	.area REG_BANK_0	(REL,OVR,DATA)
      000000                        252 	.ds 8
                                    253 ;--------------------------------------------------------
                                    254 ; internal ram data
                                    255 ;--------------------------------------------------------
                                    256 	.area DSEG    (DATA)
                           000020   257 _pressed_key	=	0x0020
                           000021   258 _dino_position	=	0x0021
                           000022   259 _game_start	=	0x0022
                           000023   260 _game_over	=	0x0023
                           000024   261 _score	=	0x0024
                           000025   262 _map_top	=	0x0025
                           000027   263 _map_btm	=	0x0027
                           000029   264 _time	=	0x0029
                           00002A   265 _carry_bit	=	0x002a
                           00002B   266 _mask	=	0x002b
                           00002C   267 _game_speed	=	0x002c
                           00002D   268 _cactus_timer	=	0x002d
                           00002E   269 _last_cactus_row	=	0x002e
                                    270 ;--------------------------------------------------------
                                    271 ; overlayable items in internal ram
                                    272 ;--------------------------------------------------------
                                    273 ;--------------------------------------------------------
                                    274 ; Stack segment in internal ram
                                    275 ;--------------------------------------------------------
                                    276 	.area SSEG
      000021                        277 __start__stack:
      000021                        278 	.ds	1
                                    279 
                                    280 ;--------------------------------------------------------
                                    281 ; indirectly addressable internal ram data
                                    282 ;--------------------------------------------------------
                                    283 	.area ISEG    (DATA)
                                    284 ;--------------------------------------------------------
                                    285 ; absolute internal ram data
                                    286 ;--------------------------------------------------------
                                    287 	.area IABS    (ABS,DATA)
                                    288 	.area IABS    (ABS,DATA)
                                    289 ;--------------------------------------------------------
                                    290 ; bit data
                                    291 ;--------------------------------------------------------
                                    292 	.area BSEG    (BIT)
                                    293 ;--------------------------------------------------------
                                    294 ; paged external ram data
                                    295 ;--------------------------------------------------------
                                    296 	.area PSEG    (PAG,XDATA)
                                    297 ;--------------------------------------------------------
                                    298 ; uninitialized external ram data
                                    299 ;--------------------------------------------------------
                                    300 	.area XSEG    (XDATA)
                                    301 ;--------------------------------------------------------
                                    302 ; absolute external ram data
                                    303 ;--------------------------------------------------------
                                    304 	.area XABS    (ABS,XDATA)
                                    305 ;--------------------------------------------------------
                                    306 ; initialized external ram data
                                    307 ;--------------------------------------------------------
                                    308 	.area XISEG   (XDATA)
                                    309 	.area HOME    (CODE)
                                    310 	.area GSINIT0 (CODE)
                                    311 	.area GSINIT1 (CODE)
                                    312 	.area GSINIT2 (CODE)
                                    313 	.area GSINIT3 (CODE)
                                    314 	.area GSINIT4 (CODE)
                                    315 	.area GSINIT5 (CODE)
                                    316 	.area GSINIT  (CODE)
                                    317 	.area GSFINAL (CODE)
                                    318 	.area CSEG    (CODE)
                                    319 ;--------------------------------------------------------
                                    320 ; interrupt vector
                                    321 ;--------------------------------------------------------
                                    322 	.area HOME    (CODE)
      000000                        323 __interrupt_vect:
      000000 02 04 50         [24]  324 	ljmp	__sdcc_gsinit_startup
      000003 32               [24]  325 	reti
      000004                        326 	.ds	7
      00000B 02 04 57         [24]  327 	ljmp	_timer0_ISR
                                    328 ; restartable atomic support routines
      00000E                        329 	.ds	2
      000010                        330 sdcc_atomic_exchange_rollback_start::
      000010 00               [12]  331 	nop
      000011 00               [12]  332 	nop
      000012                        333 sdcc_atomic_exchange_pdata_impl:
      000012 E2               [24]  334 	movx	a, @r0
      000013 FB               [12]  335 	mov	r3, a
      000014 EA               [12]  336 	mov	a, r2
      000015 F2               [24]  337 	movx	@r0, a
      000016 80 2C            [24]  338 	sjmp	sdcc_atomic_exchange_exit
      000018 00               [12]  339 	nop
      000019 00               [12]  340 	nop
      00001A                        341 sdcc_atomic_exchange_xdata_impl:
      00001A E0               [24]  342 	movx	a, @dptr
      00001B FB               [12]  343 	mov	r3, a
      00001C EA               [12]  344 	mov	a, r2
      00001D F0               [24]  345 	movx	@dptr, a
      00001E 80 24            [24]  346 	sjmp	sdcc_atomic_exchange_exit
      000020                        347 sdcc_atomic_compare_exchange_idata_impl:
      000020 E6               [12]  348 	mov	a, @r0
      000021 B5 02 02         [24]  349 	cjne	a, ar2, .+#5
      000024 EB               [12]  350 	mov	a, r3
      000025 F6               [12]  351 	mov	@r0, a
      000026 22               [24]  352 	ret
      000027 00               [12]  353 	nop
      000028                        354 sdcc_atomic_compare_exchange_pdata_impl:
      000028 E2               [24]  355 	movx	a, @r0
      000029 B5 02 02         [24]  356 	cjne	a, ar2, .+#5
      00002C EB               [12]  357 	mov	a, r3
      00002D F2               [24]  358 	movx	@r0, a
      00002E 22               [24]  359 	ret
      00002F 00               [12]  360 	nop
      000030                        361 sdcc_atomic_compare_exchange_xdata_impl:
      000030 E0               [24]  362 	movx	a, @dptr
      000031 B5 02 02         [24]  363 	cjne	a, ar2, .+#5
      000034 EB               [12]  364 	mov	a, r3
      000035 F0               [24]  365 	movx	@dptr, a
      000036 22               [24]  366 	ret
      000037                        367 sdcc_atomic_exchange_rollback_end::
                                    368 
      000037                        369 sdcc_atomic_exchange_gptr_impl::
      000037 30 F6 E0         [24]  370 	jnb	b.6, sdcc_atomic_exchange_xdata_impl
      00003A A8 82            [24]  371 	mov	r0, dpl
      00003C 20 F5 D3         [24]  372 	jb	b.5, sdcc_atomic_exchange_pdata_impl
      00003F                        373 sdcc_atomic_exchange_idata_impl:
      00003F EA               [12]  374 	mov	a, r2
      000040 C6               [12]  375 	xch	a, @r0
      000041 F5 82            [12]  376 	mov	dpl, a
      000043 22               [24]  377 	ret
      000044                        378 sdcc_atomic_exchange_exit:
      000044 8B 82            [24]  379 	mov	dpl, r3
      000046 22               [24]  380 	ret
      000047                        381 sdcc_atomic_compare_exchange_gptr_impl::
      000047 30 F6 E6         [24]  382 	jnb	b.6, sdcc_atomic_compare_exchange_xdata_impl
      00004A A8 82            [24]  383 	mov	r0, dpl
      00004C 20 F5 D9         [24]  384 	jb	b.5, sdcc_atomic_compare_exchange_pdata_impl
      00004F 80 CF            [24]  385 	sjmp	sdcc_atomic_compare_exchange_idata_impl
                                    386 ;--------------------------------------------------------
                                    387 ; global & static initialisations
                                    388 ;--------------------------------------------------------
                                    389 	.area HOME    (CODE)
                                    390 	.area GSINIT  (CODE)
                                    391 	.area GSFINAL (CODE)
                                    392 	.area GSINIT  (CODE)
                                    393 	.globl __sdcc_gsinit_startup
                                    394 	.globl __sdcc_program_startup
                                    395 	.globl __start__stack
                                    396 	.globl __mcs51_genXINIT
                                    397 	.globl __mcs51_genXRAMCLEAR
                                    398 	.globl __mcs51_genRAMCLEAR
                                    399 	.area GSFINAL (CODE)
      00007E 02 00 51         [24]  400 	ljmp	__sdcc_program_startup
                                    401 ;--------------------------------------------------------
                                    402 ; Home
                                    403 ;--------------------------------------------------------
                                    404 	.area HOME    (CODE)
                                    405 	.area HOME    (CODE)
      000051                        406 __sdcc_program_startup:
      000051 02 03 E7         [24]  407 	ljmp	_main
                                    408 ;	return from main will return to caller
                                    409 ;--------------------------------------------------------
                                    410 ; code
                                    411 ;--------------------------------------------------------
                                    412 	.area CSEG    (CODE)
                                    413 ;------------------------------------------------------------
                                    414 ;Allocation info for local variables in function 'keypad_ctrl'
                                    415 ;------------------------------------------------------------
                                    416 ;	dino.c:33: void keypad_ctrl(void)
                                    417 ;	-----------------------------------------
                                    418 ;	 function keypad_ctrl
                                    419 ;	-----------------------------------------
      000081                        420 _keypad_ctrl:
                           000007   421 	ar7 = 0x07
                           000006   422 	ar6 = 0x06
                           000005   423 	ar5 = 0x05
                           000004   424 	ar4 = 0x04
                           000003   425 	ar3 = 0x03
                           000002   426 	ar2 = 0x02
                           000001   427 	ar1 = 0x01
                           000000   428 	ar0 = 0x00
                                    429 ;	dino.c:36: while (AnyKeyPressed() == 0);
      000081                        430 00101$:
      000081 12 08 9E         [24]  431 	lcall	_AnyKeyPressed
      000084 E5 82            [12]  432 	mov	a, dpl
      000086 60 F9            [24]  433 	jz	00101$
                                    434 ;	dino.c:37: EA = 0;
                                    435 ;	assignBit
      000088 C2 AF            [12]  436 	clr	_EA
                                    437 ;	dino.c:38: pressed_key = KeyToChar();
      00008A 12 08 AB         [24]  438 	lcall	_KeyToChar
      00008D 85 82 20         [24]  439 	mov	_pressed_key,dpl
                                    440 ;	dino.c:39: EA = 1;
                                    441 ;	assignBit
      000090 D2 AF            [12]  442 	setb	_EA
                                    443 ;	dino.c:41: if (pressed_key == '2') {
      000092 74 32            [12]  444 	mov	a,#0x32
      000094 B5 20 2D         [24]  445 	cjne	a,_pressed_key,00109$
                                    446 ;	dino.c:42: EA = 0;                           
                                    447 ;	assignBit
      000097 C2 AF            [12]  448 	clr	_EA
                                    449 ;	dino.c:43: if(dino_position == 1) {
      000099 74 01            [12]  450 	mov	a,#0x01
      00009B B5 21 26         [24]  451 	cjne	a,_dino_position,00109$
                                    452 ;	dino.c:44: if(map_top[0] & 0x80) {
      00009E E5 25            [12]  453 	mov	a,_map_top
      0000A0 30 E7 06         [24]  454 	jnb	acc.7,00105$
                                    455 ;	dino.c:45: game_over = 1;
      0000A3 75 23 01         [24]  456 	mov	_game_over,#0x01
                                    457 ;	dino.c:46: ThreadYield();
      0000A6 12 05 09         [24]  458 	lcall	_ThreadYield
      0000A9                        459 00105$:
                                    460 ;	dino.c:49: dino_position = 0;
      0000A9 75 21 00         [24]  461 	mov	_dino_position,#0x00
                                    462 ;	dino.c:50: LCD_cursorGoTo(1, 0);
      0000AC 75 82 C0         [24]  463 	mov	dpl, #0xc0
      0000AF 12 06 3B         [24]  464 	lcall	_LCD_IRWrite
                                    465 ;	dino.c:51: LCD_write_char(' ');
      0000B2 75 82 20         [24]  466 	mov	dpl, #0x20
      0000B5 12 06 87         [24]  467 	lcall	_LCD_write_char
                                    468 ;	dino.c:52: LCD_cursorGoTo(0, 0);
      0000B8 75 82 80         [24]  469 	mov	dpl, #0x80
      0000BB 12 06 3B         [24]  470 	lcall	_LCD_IRWrite
                                    471 ;	dino.c:53: LCD_write_char('\1');               
      0000BE 75 82 01         [24]  472 	mov	dpl, #0x01
      0000C1 12 06 87         [24]  473 	lcall	_LCD_write_char
      0000C4                        474 00109$:
                                    475 ;	dino.c:56: EA = 1;
                                    476 ;	assignBit
      0000C4 D2 AF            [12]  477 	setb	_EA
                                    478 ;	dino.c:58: if(pressed_key == '8'){
      0000C6 74 38            [12]  479 	mov	a,#0x38
      0000C8 B5 20 2C         [24]  480 	cjne	a,_pressed_key,00115$
                                    481 ;	dino.c:59: EA = 0;
                                    482 ;	assignBit
      0000CB C2 AF            [12]  483 	clr	_EA
                                    484 ;	dino.c:60: if(dino_position == 0){
      0000CD E5 21            [12]  485 	mov	a,_dino_position
      0000CF 70 26            [24]  486 	jnz	00115$
                                    487 ;	dino.c:61: if(map_btm[0] & 0x80){
      0000D1 E5 27            [12]  488 	mov	a,_map_btm
      0000D3 30 E7 06         [24]  489 	jnb	acc.7,00111$
                                    490 ;	dino.c:62: game_over = 1;
      0000D6 75 23 01         [24]  491 	mov	_game_over,#0x01
                                    492 ;	dino.c:63: ThreadYield();
      0000D9 12 05 09         [24]  493 	lcall	_ThreadYield
      0000DC                        494 00111$:
                                    495 ;	dino.c:66: dino_position = 1;
      0000DC 75 21 01         [24]  496 	mov	_dino_position,#0x01
                                    497 ;	dino.c:67: LCD_cursorGoTo(0, 0);
      0000DF 75 82 80         [24]  498 	mov	dpl, #0x80
      0000E2 12 06 3B         [24]  499 	lcall	_LCD_IRWrite
                                    500 ;	dino.c:68: LCD_write_char(' ');
      0000E5 75 82 20         [24]  501 	mov	dpl, #0x20
      0000E8 12 06 87         [24]  502 	lcall	_LCD_write_char
                                    503 ;	dino.c:69: LCD_cursorGoTo(1, 0);
      0000EB 75 82 C0         [24]  504 	mov	dpl, #0xc0
      0000EE 12 06 3B         [24]  505 	lcall	_LCD_IRWrite
                                    506 ;	dino.c:70: LCD_write_char('\1'); 
      0000F1 75 82 01         [24]  507 	mov	dpl, #0x01
      0000F4 12 06 87         [24]  508 	lcall	_LCD_write_char
      0000F7                        509 00115$:
                                    510 ;	dino.c:73: EA = 1;
                                    511 ;	assignBit
      0000F7 D2 AF            [12]  512 	setb	_EA
                                    513 ;	dino.c:75: while (AnyKeyPressed());
      0000F9                        514 00116$:
      0000F9 12 08 9E         [24]  515 	lcall	_AnyKeyPressed
      0000FC E5 82            [12]  516 	mov	a, dpl
      0000FE 70 F9            [24]  517 	jnz	00116$
                                    518 ;	dino.c:77: }
      000100 02 00 81         [24]  519 	ljmp	00101$
                                    520 ;------------------------------------------------------------
                                    521 ;Allocation info for local variables in function 'render_task'
                                    522 ;------------------------------------------------------------
                                    523 ;	dino.c:79: void render_task(void){
                                    524 ;	-----------------------------------------
                                    525 ;	 function render_task
                                    526 ;	-----------------------------------------
      000103                        527 _render_task:
                                    528 ;	dino.c:80: while(1){
      000103                        529 00121$:
                                    530 ;	dino.c:81: EA = 0;
                                    531 ;	assignBit
      000103 C2 AF            [12]  532 	clr	_EA
                                    533 ;	dino.c:83: if (game_over) ThreadYield();
      000105 E5 23            [12]  534 	mov	a,_game_over
      000107 60 03            [24]  535 	jz	00102$
      000109 12 05 09         [24]  536 	lcall	_ThreadYield
      00010C                        537 00102$:
                                    538 ;	dino.c:85: if ((dino_position == 0 && (map_top[0] & 0x40)) ||
      00010C E5 21            [12]  539 	mov	a,_dino_position
      00010E 70 05            [24]  540 	jnz	00107$
      000110 E5 25            [12]  541 	mov	a,_map_top
      000112 20 E6 0A         [24]  542 	jb	acc.6,00103$
      000115                        543 00107$:
                                    544 ;	dino.c:86: (dino_position == 1 && (map_btm[0] & 0x40))) {
      000115 74 01            [12]  545 	mov	a,#0x01
      000117 B5 21 0B         [24]  546 	cjne	a,_dino_position,00104$
      00011A E5 27            [12]  547 	mov	a,_map_btm
      00011C 30 E6 06         [24]  548 	jnb	acc.6,00104$
      00011F                        549 00103$:
                                    550 ;	dino.c:87: game_over = 1;
      00011F 75 23 01         [24]  551 	mov	_game_over,#0x01
                                    552 ;	dino.c:88: ThreadYield();
      000122 12 05 09         [24]  553 	lcall	_ThreadYield
      000125                        554 00104$:
                                    555 ;	dino.c:91: carry_bit = (map_top[0] & 0x80) ? 1 : 0;
      000125 E5 25            [12]  556 	mov	a,_map_top
      000127 30 E7 04         [24]  557 	jnb	acc.7,00137$
      00012A 7F 01            [12]  558 	mov	r7,#0x01
      00012C 80 02            [24]  559 	sjmp	00138$
      00012E                        560 00137$:
      00012E 7F 00            [12]  561 	mov	r7,#0x00
      000130                        562 00138$:
      000130 8F 2A            [24]  563 	mov	_carry_bit,r7
                                    564 ;	dino.c:92: map_top[0] <<= 1;
      000132 E5 25            [12]  565 	mov	a,_map_top
      000134 25 25            [12]  566 	add	a,_map_top
      000136 F5 25            [12]  567 	mov	_map_top, a
                                    568 ;	dino.c:93: if (map_top[1] & 0x80) map_top[0]++;
      000138 E5 26            [12]  569 	mov	a,(_map_top + 0x0001)
      00013A 30 E7 05         [24]  570 	jnb	acc.7,00109$
      00013D E5 25            [12]  571 	mov	a,_map_top
      00013F 04               [12]  572 	inc	a
      000140 F5 25            [12]  573 	mov	_map_top,a
      000142                        574 00109$:
                                    575 ;	dino.c:94: map_top[1] <<= 1;
      000142 E5 26            [12]  576 	mov	a,(_map_top + 0x0001)
      000144 25 E0            [12]  577 	add	a,acc
      000146 F5 26            [12]  578 	mov	(_map_top + 0x0001), a
                                    579 ;	dino.c:95: if (carry_bit) { 
      000148 E5 2A            [12]  580 	mov	a,_carry_bit
      00014A 60 0A            [24]  581 	jz	00111$
                                    582 ;	dino.c:96: score++; 
      00014C E5 24            [12]  583 	mov	a,_score
      00014E 04               [12]  584 	inc	a
      00014F F5 24            [12]  585 	mov	_score,a
                                    586 ;	dino.c:97: map_top[1]++; 
      000151 E5 26            [12]  587 	mov	a,(_map_top + 0x0001)
      000153 04               [12]  588 	inc	a
      000154 F5 26            [12]  589 	mov	(_map_top + 0x0001),a
      000156                        590 00111$:
                                    591 ;	dino.c:100: carry_bit = (map_btm[0] & 0x80) ? 1 : 0;
      000156 E5 27            [12]  592 	mov	a,_map_btm
      000158 30 E7 04         [24]  593 	jnb	acc.7,00139$
      00015B 7F 01            [12]  594 	mov	r7,#0x01
      00015D 80 02            [24]  595 	sjmp	00140$
      00015F                        596 00139$:
      00015F 7F 00            [12]  597 	mov	r7,#0x00
      000161                        598 00140$:
      000161 8F 2A            [24]  599 	mov	_carry_bit,r7
                                    600 ;	dino.c:101: map_btm[0] <<= 1;
      000163 E5 27            [12]  601 	mov	a,_map_btm
      000165 25 27            [12]  602 	add	a,_map_btm
      000167 F5 27            [12]  603 	mov	_map_btm, a
                                    604 ;	dino.c:102: if (map_btm[1] & 0x80) map_btm[0]++;
      000169 E5 28            [12]  605 	mov	a,(_map_btm + 0x0001)
      00016B 30 E7 05         [24]  606 	jnb	acc.7,00113$
      00016E E5 27            [12]  607 	mov	a,_map_btm
      000170 04               [12]  608 	inc	a
      000171 F5 27            [12]  609 	mov	_map_btm,a
      000173                        610 00113$:
                                    611 ;	dino.c:103: map_btm[1] <<= 1;
      000173 E5 28            [12]  612 	mov	a,(_map_btm + 0x0001)
      000175 25 E0            [12]  613 	add	a,acc
      000177 F5 28            [12]  614 	mov	(_map_btm + 0x0001), a
                                    615 ;	dino.c:104: if (carry_bit) { 
      000179 E5 2A            [12]  616 	mov	a,_carry_bit
      00017B 60 0A            [24]  617 	jz	00115$
                                    618 ;	dino.c:105: score++; 
      00017D E5 24            [12]  619 	mov	a,_score
      00017F 04               [12]  620 	inc	a
      000180 F5 24            [12]  621 	mov	_score,a
                                    622 ;	dino.c:106: map_btm[1]++; 
      000182 E5 28            [12]  623 	mov	a,(_map_btm + 0x0001)
      000184 04               [12]  624 	inc	a
      000185 F5 28            [12]  625 	mov	(_map_btm + 0x0001),a
      000187                        626 00115$:
                                    627 ;	dino.c:109: LCD_cursorGoTo(0, 0);
      000187 75 82 80         [24]  628 	mov	dpl, #0x80
      00018A 12 06 3B         [24]  629 	lcall	_LCD_IRWrite
                                    630 ;	dino.c:110: for(mask = 0x80; mask; mask >>= 1){ 
      00018D 75 2B 80         [24]  631 	mov	_mask,#0x80
      000190                        632 00124$:
      000190 E5 2B            [12]  633 	mov	a,_mask
      000192 60 19            [24]  634 	jz	00116$
                                    635 ;	dino.c:111: LCD_write_char((map_top[0] & mask) ? '\2' : ' '); 
      000194 E5 2B            [12]  636 	mov	a,_mask
      000196 55 25            [12]  637 	anl	a,_map_top
      000198 60 04            [24]  638 	jz	00141$
      00019A 7F 02            [12]  639 	mov	r7,#0x02
      00019C 80 02            [24]  640 	sjmp	00142$
      00019E                        641 00141$:
      00019E 7F 20            [12]  642 	mov	r7,#0x20
      0001A0                        643 00142$:
      0001A0 8F 82            [24]  644 	mov	dpl,r7
      0001A2 12 06 87         [24]  645 	lcall	_LCD_write_char
                                    646 ;	dino.c:110: for(mask = 0x80; mask; mask >>= 1){ 
      0001A5 E5 2B            [12]  647 	mov	a,_mask
      0001A7 C3               [12]  648 	clr	c
      0001A8 13               [12]  649 	rrc	a
      0001A9 F5 2B            [12]  650 	mov	_mask,a
      0001AB 80 E3            [24]  651 	sjmp	00124$
      0001AD                        652 00116$:
                                    653 ;	dino.c:114: for(mask = 0x80; mask != 1; mask >>= 1){
      0001AD 75 2B 80         [24]  654 	mov	_mask,#0x80
      0001B0                        655 00127$:
      0001B0 74 01            [12]  656 	mov	a,#0x01
      0001B2 B5 2B 02         [24]  657 	cjne	a,_mask,00295$
      0001B5 80 19            [24]  658 	sjmp	00117$
      0001B7                        659 00295$:
                                    660 ;	dino.c:115: LCD_write_char((map_top[1] & mask) ? '\2' : ' ');
      0001B7 E5 2B            [12]  661 	mov	a,_mask
      0001B9 55 26            [12]  662 	anl	a,(_map_top + 0x0001)
      0001BB 60 04            [24]  663 	jz	00143$
      0001BD 7F 02            [12]  664 	mov	r7,#0x02
      0001BF 80 02            [24]  665 	sjmp	00144$
      0001C1                        666 00143$:
      0001C1 7F 20            [12]  667 	mov	r7,#0x20
      0001C3                        668 00144$:
      0001C3 8F 82            [24]  669 	mov	dpl,r7
      0001C5 12 06 87         [24]  670 	lcall	_LCD_write_char
                                    671 ;	dino.c:114: for(mask = 0x80; mask != 1; mask >>= 1){
      0001C8 E5 2B            [12]  672 	mov	a,_mask
      0001CA C3               [12]  673 	clr	c
      0001CB 13               [12]  674 	rrc	a
      0001CC F5 2B            [12]  675 	mov	_mask,a
      0001CE 80 E0            [24]  676 	sjmp	00127$
      0001D0                        677 00117$:
                                    678 ;	dino.c:118: LCD_cursorGoTo(1, 0);
      0001D0 75 82 C0         [24]  679 	mov	dpl, #0xc0
      0001D3 12 06 3B         [24]  680 	lcall	_LCD_IRWrite
                                    681 ;	dino.c:119: for(mask = 0x80; mask; mask >>= 1){
      0001D6 75 2B 80         [24]  682 	mov	_mask,#0x80
      0001D9                        683 00130$:
      0001D9 E5 2B            [12]  684 	mov	a,_mask
      0001DB 60 19            [24]  685 	jz	00118$
                                    686 ;	dino.c:120: LCD_write_char((map_btm[0] & mask) ? '\2' : ' ');
      0001DD E5 2B            [12]  687 	mov	a,_mask
      0001DF 55 27            [12]  688 	anl	a,_map_btm
      0001E1 60 04            [24]  689 	jz	00145$
      0001E3 7F 02            [12]  690 	mov	r7,#0x02
      0001E5 80 02            [24]  691 	sjmp	00146$
      0001E7                        692 00145$:
      0001E7 7F 20            [12]  693 	mov	r7,#0x20
      0001E9                        694 00146$:
      0001E9 8F 82            [24]  695 	mov	dpl,r7
      0001EB 12 06 87         [24]  696 	lcall	_LCD_write_char
                                    697 ;	dino.c:119: for(mask = 0x80; mask; mask >>= 1){
      0001EE E5 2B            [12]  698 	mov	a,_mask
      0001F0 C3               [12]  699 	clr	c
      0001F1 13               [12]  700 	rrc	a
      0001F2 F5 2B            [12]  701 	mov	_mask,a
      0001F4 80 E3            [24]  702 	sjmp	00130$
      0001F6                        703 00118$:
                                    704 ;	dino.c:122: for(mask = 0x80; mask != 1; mask >>= 1){
      0001F6 75 2B 80         [24]  705 	mov	_mask,#0x80
      0001F9                        706 00133$:
      0001F9 74 01            [12]  707 	mov	a,#0x01
      0001FB B5 2B 02         [24]  708 	cjne	a,_mask,00299$
      0001FE 80 19            [24]  709 	sjmp	00119$
      000200                        710 00299$:
                                    711 ;	dino.c:123: LCD_write_char((map_btm[1] & mask) ? '\2' : ' ');
      000200 E5 2B            [12]  712 	mov	a,_mask
      000202 55 28            [12]  713 	anl	a,(_map_btm + 0x0001)
      000204 60 04            [24]  714 	jz	00147$
      000206 7F 02            [12]  715 	mov	r7,#0x02
      000208 80 02            [24]  716 	sjmp	00148$
      00020A                        717 00147$:
      00020A 7F 20            [12]  718 	mov	r7,#0x20
      00020C                        719 00148$:
      00020C 8F 82            [24]  720 	mov	dpl,r7
      00020E 12 06 87         [24]  721 	lcall	_LCD_write_char
                                    722 ;	dino.c:122: for(mask = 0x80; mask != 1; mask >>= 1){
      000211 E5 2B            [12]  723 	mov	a,_mask
      000213 C3               [12]  724 	clr	c
      000214 13               [12]  725 	rrc	a
      000215 F5 2B            [12]  726 	mov	_mask,a
      000217 80 E0            [24]  727 	sjmp	00133$
      000219                        728 00119$:
                                    729 ;	dino.c:126: LCD_cursorGoTo(dino_position, 0);
      000219 E5 21            [12]  730 	mov	a,_dino_position
      00021B 03               [12]  731 	rr	a
      00021C 03               [12]  732 	rr	a
      00021D 54 C0            [12]  733 	anl	a,#0xc0
      00021F FF               [12]  734 	mov	r7,a
      000220 74 80            [12]  735 	mov	a,#0x80
      000222 4F               [12]  736 	orl	a,r7
      000223 F5 82            [12]  737 	mov	dpl,a
      000225 12 06 3B         [24]  738 	lcall	_LCD_IRWrite
                                    739 ;	dino.c:127: LCD_write_char('\1');
      000228 75 82 01         [24]  740 	mov	dpl, #0x01
      00022B 12 06 87         [24]  741 	lcall	_LCD_write_char
                                    742 ;	dino.c:129: EA = 1;
                                    743 ;	assignBit
      00022E D2 AF            [12]  744 	setb	_EA
                                    745 ;	dino.c:130: ThreadYield();
      000230 12 05 09         [24]  746 	lcall	_ThreadYield
                                    747 ;	dino.c:132: }
      000233 02 01 03         [24]  748 	ljmp	00121$
                                    749 ;------------------------------------------------------------
                                    750 ;Allocation info for local variables in function 'game_ctrl'
                                    751 ;------------------------------------------------------------
                                    752 ;pattern       Allocated to registers r7 
                                    753 ;i             Allocated to registers r7 
                                    754 ;------------------------------------------------------------
                                    755 ;	dino.c:134: void game_ctrl(void)
                                    756 ;	-----------------------------------------
                                    757 ;	 function game_ctrl
                                    758 ;	-----------------------------------------
      000236                        759 _game_ctrl:
                                    760 ;	dino.c:136: while (1){
      000236                        761 00113$:
                                    762 ;	dino.c:137: if(game_over){
      000236 E5 23            [12]  763 	mov	a,_game_over
      000238 70 03            [24]  764 	jnz	00162$
      00023A 02 03 1E         [24]  765 	ljmp	00102$
      00023D                        766 00162$:
                                    767 ;	dino.c:138: EA = 0;
                                    768 ;	assignBit
      00023D C2 AF            [12]  769 	clr	_EA
                                    770 ;	dino.c:139: LCD_cursorGoTo(0, 0);
      00023F 75 82 80         [24]  771 	mov	dpl, #0x80
      000242 12 06 3B         [24]  772 	lcall	_LCD_IRWrite
                                    773 ;	dino.c:140: LCD_write_char(' ');
      000245 75 82 20         [24]  774 	mov	dpl, #0x20
      000248 12 06 87         [24]  775 	lcall	_LCD_write_char
                                    776 ;	dino.c:141: LCD_write_char(' ');
      00024B 75 82 20         [24]  777 	mov	dpl, #0x20
      00024E 12 06 87         [24]  778 	lcall	_LCD_write_char
                                    779 ;	dino.c:142: LCD_write_char(' ');
      000251 75 82 20         [24]  780 	mov	dpl, #0x20
      000254 12 06 87         [24]  781 	lcall	_LCD_write_char
                                    782 ;	dino.c:143: LCD_write_char(' ');
      000257 75 82 20         [24]  783 	mov	dpl, #0x20
      00025A 12 06 87         [24]  784 	lcall	_LCD_write_char
                                    785 ;	dino.c:144: LCD_write_char('G');
      00025D 75 82 47         [24]  786 	mov	dpl, #0x47
      000260 12 06 87         [24]  787 	lcall	_LCD_write_char
                                    788 ;	dino.c:145: LCD_write_char('A');
      000263 75 82 41         [24]  789 	mov	dpl, #0x41
      000266 12 06 87         [24]  790 	lcall	_LCD_write_char
                                    791 ;	dino.c:146: LCD_write_char('M');
      000269 75 82 4D         [24]  792 	mov	dpl, #0x4d
      00026C 12 06 87         [24]  793 	lcall	_LCD_write_char
                                    794 ;	dino.c:147: LCD_write_char('E');
      00026F 75 82 45         [24]  795 	mov	dpl, #0x45
      000272 12 06 87         [24]  796 	lcall	_LCD_write_char
                                    797 ;	dino.c:148: LCD_write_char(' ');
      000275 75 82 20         [24]  798 	mov	dpl, #0x20
      000278 12 06 87         [24]  799 	lcall	_LCD_write_char
                                    800 ;	dino.c:149: LCD_write_char('O');
      00027B 75 82 4F         [24]  801 	mov	dpl, #0x4f
      00027E 12 06 87         [24]  802 	lcall	_LCD_write_char
                                    803 ;	dino.c:150: LCD_write_char('V');
      000281 75 82 56         [24]  804 	mov	dpl, #0x56
      000284 12 06 87         [24]  805 	lcall	_LCD_write_char
                                    806 ;	dino.c:151: LCD_write_char('E');
      000287 75 82 45         [24]  807 	mov	dpl, #0x45
      00028A 12 06 87         [24]  808 	lcall	_LCD_write_char
                                    809 ;	dino.c:152: LCD_write_char('R');
      00028D 75 82 52         [24]  810 	mov	dpl, #0x52
      000290 12 06 87         [24]  811 	lcall	_LCD_write_char
                                    812 ;	dino.c:153: LCD_write_char(' ');
      000293 75 82 20         [24]  813 	mov	dpl, #0x20
      000296 12 06 87         [24]  814 	lcall	_LCD_write_char
                                    815 ;	dino.c:154: LCD_write_char(' ');
      000299 75 82 20         [24]  816 	mov	dpl, #0x20
      00029C 12 06 87         [24]  817 	lcall	_LCD_write_char
                                    818 ;	dino.c:155: LCD_write_char(' ');
      00029F 75 82 20         [24]  819 	mov	dpl, #0x20
      0002A2 12 06 87         [24]  820 	lcall	_LCD_write_char
                                    821 ;	dino.c:156: LCD_cursorGoTo(1, 0);
      0002A5 75 82 C0         [24]  822 	mov	dpl, #0xc0
      0002A8 12 06 3B         [24]  823 	lcall	_LCD_IRWrite
                                    824 ;	dino.c:157: LCD_write_char(' ');
      0002AB 75 82 20         [24]  825 	mov	dpl, #0x20
      0002AE 12 06 87         [24]  826 	lcall	_LCD_write_char
                                    827 ;	dino.c:158: LCD_write_char(' ');
      0002B1 75 82 20         [24]  828 	mov	dpl, #0x20
      0002B4 12 06 87         [24]  829 	lcall	_LCD_write_char
                                    830 ;	dino.c:159: LCD_write_char(' ');
      0002B7 75 82 20         [24]  831 	mov	dpl, #0x20
      0002BA 12 06 87         [24]  832 	lcall	_LCD_write_char
                                    833 ;	dino.c:160: LCD_write_char(' ');
      0002BD 75 82 20         [24]  834 	mov	dpl, #0x20
      0002C0 12 06 87         [24]  835 	lcall	_LCD_write_char
                                    836 ;	dino.c:161: LCD_write_char('S');
      0002C3 75 82 53         [24]  837 	mov	dpl, #0x53
      0002C6 12 06 87         [24]  838 	lcall	_LCD_write_char
                                    839 ;	dino.c:162: LCD_write_char('C');
      0002C9 75 82 43         [24]  840 	mov	dpl, #0x43
      0002CC 12 06 87         [24]  841 	lcall	_LCD_write_char
                                    842 ;	dino.c:163: LCD_write_char('O');
      0002CF 75 82 4F         [24]  843 	mov	dpl, #0x4f
      0002D2 12 06 87         [24]  844 	lcall	_LCD_write_char
                                    845 ;	dino.c:164: LCD_write_char('R');
      0002D5 75 82 52         [24]  846 	mov	dpl, #0x52
      0002D8 12 06 87         [24]  847 	lcall	_LCD_write_char
                                    848 ;	dino.c:165: LCD_write_char('E');
      0002DB 75 82 45         [24]  849 	mov	dpl, #0x45
      0002DE 12 06 87         [24]  850 	lcall	_LCD_write_char
                                    851 ;	dino.c:166: LCD_write_char(':');
      0002E1 75 82 3A         [24]  852 	mov	dpl, #0x3a
      0002E4 12 06 87         [24]  853 	lcall	_LCD_write_char
                                    854 ;	dino.c:167: LCD_write_char(' ');
      0002E7 75 82 20         [24]  855 	mov	dpl, #0x20
      0002EA 12 06 87         [24]  856 	lcall	_LCD_write_char
                                    857 ;	dino.c:168: LCD_write_char(score/10 + '0');
      0002ED AF 24            [24]  858 	mov	r7,_score
      0002EF 75 F0 0A         [24]  859 	mov	b,#0x0a
      0002F2 EF               [12]  860 	mov	a,r7
      0002F3 84               [48]  861 	div	ab
      0002F4 24 30            [12]  862 	add	a,#0x30
      0002F6 F5 82            [12]  863 	mov	dpl,a
      0002F8 12 06 87         [24]  864 	lcall	_LCD_write_char
                                    865 ;	dino.c:169: LCD_write_char(score%10 + '0');
      0002FB AF 24            [24]  866 	mov	r7,_score
      0002FD 75 F0 0A         [24]  867 	mov	b,#0x0a
      000300 EF               [12]  868 	mov	a,r7
      000301 84               [48]  869 	div	ab
      000302 AF F0            [24]  870 	mov	r7,b
      000304 74 30            [12]  871 	mov	a,#0x30
      000306 2F               [12]  872 	add	a, r7
      000307 F5 82            [12]  873 	mov	dpl,a
      000309 12 06 87         [24]  874 	lcall	_LCD_write_char
                                    875 ;	dino.c:170: LCD_write_char(' ');
      00030C 75 82 20         [24]  876 	mov	dpl, #0x20
      00030F 12 06 87         [24]  877 	lcall	_LCD_write_char
                                    878 ;	dino.c:171: LCD_write_char(' ');
      000312 75 82 20         [24]  879 	mov	dpl, #0x20
      000315 12 06 87         [24]  880 	lcall	_LCD_write_char
                                    881 ;	dino.c:172: LCD_write_char(' ');
      000318 75 82 20         [24]  882 	mov	dpl, #0x20
                                    883 ;	dino.c:173: return;
      00031B 02 06 87         [24]  884 	ljmp	_LCD_write_char
      00031E                        885 00102$:
                                    886 ;	dino.c:176: cactus_timer++;
      00031E E5 2D            [12]  887 	mov	a,_cactus_timer
      000320 04               [12]  888 	inc	a
      000321 F5 2D            [12]  889 	mov	_cactus_timer,a
                                    890 ;	dino.c:177: if (cactus_timer >= (10 - game_speed)) {  
      000323 AE 2C            [24]  891 	mov	r6,_game_speed
      000325 7F 00            [12]  892 	mov	r7,#0x00
      000327 74 0A            [12]  893 	mov	a,#0x0a
      000329 C3               [12]  894 	clr	c
      00032A 9E               [12]  895 	subb	a,r6
      00032B FE               [12]  896 	mov	r6,a
      00032C E4               [12]  897 	clr	a
      00032D 9F               [12]  898 	subb	a,r7
      00032E FF               [12]  899 	mov	r7,a
      00032F AC 2D            [24]  900 	mov	r4,_cactus_timer
      000331 7D 00            [12]  901 	mov	r5,#0x00
      000333 C3               [12]  902 	clr	c
      000334 EC               [12]  903 	mov	a,r4
      000335 9E               [12]  904 	subb	a,r6
      000336 ED               [12]  905 	mov	a,r5
      000337 64 80            [12]  906 	xrl	a,#0x80
      000339 8F F0            [24]  907 	mov	b,r7
      00033B 63 F0 80         [24]  908 	xrl	b,#0x80
      00033E 95 F0            [12]  909 	subb	a,b
      000340 40 4B            [24]  910 	jc	00126$
                                    911 ;	dino.c:178: cactus_timer = 0;
      000342 75 2D 00         [24]  912 	mov	_cactus_timer,#0x00
                                    913 ;	dino.c:180: unsigned char pattern = cactus_patterns[(score + last_cactus_row) % 8];
      000345 AE 24            [24]  914 	mov	r6,_score
      000347 7F 00            [12]  915 	mov	r7,#0x00
      000349 AC 2E            [24]  916 	mov	r4,_last_cactus_row
      00034B 7D 00            [12]  917 	mov	r5,#0x00
      00034D EC               [12]  918 	mov	a,r4
      00034E 2E               [12]  919 	add	a, r6
      00034F F5 82            [12]  920 	mov	dpl,a
      000351 ED               [12]  921 	mov	a,r5
      000352 3F               [12]  922 	addc	a, r7
      000353 F5 83            [12]  923 	mov	dph,a
      000355 75 0B 08         [24]  924 	mov	__modsint_PARM_2,#0x08
      000358 8F 0C            [24]  925 	mov	(__modsint_PARM_2 + 1),r7
      00035A 12 09 90         [24]  926 	lcall	__modsint
      00035D AE 82            [24]  927 	mov	r6, dpl
      00035F AF 83            [24]  928 	mov	r7, dph
      000361 EE               [12]  929 	mov	a,r6
      000362 24 D6            [12]  930 	add	a, #_cactus_patterns
      000364 F5 82            [12]  931 	mov	dpl,a
      000366 EF               [12]  932 	mov	a,r7
      000367 34 09            [12]  933 	addc	a, #(_cactus_patterns >> 8)
      000369 F5 83            [12]  934 	mov	dph,a
      00036B E4               [12]  935 	clr	a
      00036C 93               [24]  936 	movc	a,@a+dptr
      00036D FF               [12]  937 	mov	r7,a
                                    938 ;	dino.c:182: if (pattern == 1) {
      00036E BF 01 0B         [24]  939 	cjne	r7,#0x01,00107$
                                    940 ;	dino.c:183: map_top[1] |= 0x01;  
      000371 74 01            [12]  941 	mov	a,#0x01
      000373 45 26            [12]  942 	orl	a,(_map_top + 0x0001)
      000375 F5 26            [12]  943 	mov	(_map_top + 0x0001),a
                                    944 ;	dino.c:184: last_cactus_row = 1;
      000377 75 2E 01         [24]  945 	mov	_last_cactus_row,#0x01
      00037A 80 11            [24]  946 	sjmp	00126$
      00037C                        947 00107$:
                                    948 ;	dino.c:185: } else if (pattern == 2) {
      00037C BF 02 0B         [24]  949 	cjne	r7,#0x02,00104$
                                    950 ;	dino.c:186: map_btm[1] |= 0x01;  
      00037F 74 01            [12]  951 	mov	a,#0x01
      000381 45 28            [12]  952 	orl	a,(_map_btm + 0x0001)
      000383 F5 28            [12]  953 	mov	(_map_btm + 0x0001),a
                                    954 ;	dino.c:187: last_cactus_row = 2;
      000385 75 2E 02         [24]  955 	mov	_last_cactus_row,#0x02
      000388 80 03            [24]  956 	sjmp	00126$
      00038A                        957 00104$:
                                    958 ;	dino.c:189: last_cactus_row = 0;  
      00038A 75 2E 00         [24]  959 	mov	_last_cactus_row,#0x00
                                    960 ;	dino.c:194: for (i = 0; i < game_speed; i++) {
      00038D                        961 00126$:
      00038D 7F 00            [12]  962 	mov	r7,#0x00
      00038F                        963 00116$:
      00038F C3               [12]  964 	clr	c
      000390 EF               [12]  965 	mov	a,r7
      000391 95 2C            [12]  966 	subb	a,_game_speed
      000393 40 03            [24]  967 	jc	00168$
      000395 02 02 36         [24]  968 	ljmp	00113$
      000398                        969 00168$:
                                    970 ;	dino.c:195: ThreadYield();
      000398 C0 07            [24]  971 	push	ar7
      00039A 12 05 09         [24]  972 	lcall	_ThreadYield
      00039D D0 07            [24]  973 	pop	ar7
                                    974 ;	dino.c:194: for (i = 0; i < game_speed; i++) {
      00039F 0F               [12]  975 	inc	r7
                                    976 ;	dino.c:198: }
      0003A0 80 ED            [24]  977 	sjmp	00116$
                                    978 ;------------------------------------------------------------
                                    979 ;Allocation info for local variables in function 'difficulty_input'
                                    980 ;------------------------------------------------------------
                                    981 ;input_time    Allocated to registers r7 
                                    982 ;key           Allocated to registers r6 
                                    983 ;------------------------------------------------------------
                                    984 ;	dino.c:203: unsigned char difficulty_input() {
                                    985 ;	-----------------------------------------
                                    986 ;	 function difficulty_input
                                    987 ;	-----------------------------------------
      0003A2                        988 _difficulty_input:
                                    989 ;	dino.c:204: unsigned char input_time = 0;
      0003A2 7F 00            [12]  990 	mov	r7,#0x00
                                    991 ;	dino.c:207: while (!AnyKeyPressed());
      0003A4                        992 00101$:
      0003A4 C0 07            [24]  993 	push	ar7
      0003A6 12 08 9E         [24]  994 	lcall	_AnyKeyPressed
      0003A9 E5 82            [12]  995 	mov	a, dpl
      0003AB D0 07            [24]  996 	pop	ar7
      0003AD 60 F5            [24]  997 	jz	00101$
                                    998 ;	dino.c:208: key = KeyToChar();
      0003AF C0 07            [24]  999 	push	ar7
      0003B1 12 08 AB         [24] 1000 	lcall	_KeyToChar
      0003B4 AE 82            [24] 1001 	mov	r6, dpl
      0003B6 D0 07            [24] 1002 	pop	ar7
                                   1003 ;	dino.c:209: while (AnyKeyPressed());
      0003B8                       1004 00104$:
      0003B8 C0 07            [24] 1005 	push	ar7
      0003BA C0 06            [24] 1006 	push	ar6
      0003BC 12 08 9E         [24] 1007 	lcall	_AnyKeyPressed
      0003BF E5 82            [12] 1008 	mov	a, dpl
      0003C1 D0 06            [24] 1009 	pop	ar6
      0003C3 D0 07            [24] 1010 	pop	ar7
      0003C5 70 F1            [24] 1011 	jnz	00104$
                                   1012 ;	dino.c:211: if (key == '#') {
      0003C7 BE 23 05         [24] 1013 	cjne	r6,#0x23,00111$
                                   1014 ;	dino.c:212: if (input_time == 0)
      0003CA EF               [12] 1015 	mov	a,r7
      0003CB 70 17            [24] 1016 	jnz	00119$
                                   1017 ;	dino.c:213: continue;
                                   1018 ;	dino.c:215: break;
      0003CD 80 D5            [24] 1019 	sjmp	00101$
      0003CF                       1020 00111$:
                                   1021 ;	dino.c:218: if (key == '*') {
      0003CF BE 2A 02         [24] 1022 	cjne	r6,#0x2a,00181$
      0003D2 80 D0            [24] 1023 	sjmp	00101$
      0003D4                       1024 00181$:
                                   1025 ;	dino.c:222: if (key >= '1' && key <= '9') {
      0003D4 BE 31 00         [24] 1026 	cjne	r6,#0x31,00182$
      0003D7                       1027 00182$:
      0003D7 40 CB            [24] 1028 	jc	00101$
      0003D9 EE               [12] 1029 	mov	a,r6
      0003DA 24 C6            [12] 1030 	add	a,#0xff - 0x39
      0003DC 40 C6            [24] 1031 	jc	00101$
                                   1032 ;	dino.c:223: input_time = (key - '0');
      0003DE EE               [12] 1033 	mov	a,r6
      0003DF 24 D0            [12] 1034 	add	a,#0xd0
      0003E1 FF               [12] 1035 	mov	r7,a
      0003E2 80 C0            [24] 1036 	sjmp	00101$
      0003E4                       1037 00119$:
                                   1038 ;	dino.c:226: return input_time;
      0003E4 8F 82            [24] 1039 	mov	dpl, r7
                                   1040 ;	dino.c:227: }
      0003E6 22               [24] 1041 	ret
                                   1042 ;------------------------------------------------------------
                                   1043 ;Allocation info for local variables in function 'main'
                                   1044 ;------------------------------------------------------------
                                   1045 ;	dino.c:237: void main(void)
                                   1046 ;	-----------------------------------------
                                   1047 ;	 function main
                                   1048 ;	-----------------------------------------
      0003E7                       1049 _main:
                                   1050 ;	dino.c:239: Init_Keypad();
      0003E7 12 08 98         [24] 1051 	lcall	_Init_Keypad
                                   1052 ;	dino.c:240: LCD_Init();
      0003EA 12 06 28         [24] 1053 	lcall	_LCD_Init
                                   1054 ;	dino.c:241: LCD_set_symbol('\10', dinosaur); 
      0003ED 75 08 C6         [24] 1055 	mov	_LCD_set_symbol_PARM_2,#_dinosaur
      0003F0 75 09 09         [24] 1056 	mov	(_LCD_set_symbol_PARM_2 + 1),#(_dinosaur >> 8)
      0003F3 75 0A 80         [24] 1057 	mov	(_LCD_set_symbol_PARM_2 + 2),#0x80
      0003F6 75 82 08         [24] 1058 	mov	dpl, #0x08
      0003F9 12 06 EA         [24] 1059 	lcall	_LCD_set_symbol
                                   1060 ;	dino.c:242: LCD_set_symbol('\20', cactus);   
      0003FC 75 08 CE         [24] 1061 	mov	_LCD_set_symbol_PARM_2,#_cactus
      0003FF 75 09 09         [24] 1062 	mov	(_LCD_set_symbol_PARM_2 + 1),#(_cactus >> 8)
      000402 75 0A 80         [24] 1063 	mov	(_LCD_set_symbol_PARM_2 + 2),#0x80
      000405 75 82 10         [24] 1064 	mov	dpl, #0x10
      000408 12 06 EA         [24] 1065 	lcall	_LCD_set_symbol
                                   1066 ;	dino.c:244: map_top[0] = 0x1C;
      00040B 75 25 1C         [24] 1067 	mov	_map_top,#0x1c
                                   1068 ;	dino.c:245: map_top[1] = 0x00;
      00040E 75 26 00         [24] 1069 	mov	(_map_top + 0x0001),#0x00
                                   1070 ;	dino.c:246: map_btm[0] = 0x00;
      000411 75 27 00         [24] 1071 	mov	_map_btm,#0x00
                                   1072 ;	dino.c:247: map_btm[1] = 0xE0;
      000414 75 28 E0         [24] 1073 	mov	(_map_btm + 0x0001),#0xe0
                                   1074 ;	dino.c:249: time = 0;
      000417 75 29 00         [24] 1075 	mov	_time,#0x00
                                   1076 ;	dino.c:250: game_over = 0;
      00041A 75 23 00         [24] 1077 	mov	_game_over,#0x00
                                   1078 ;	dino.c:251: score = 0;
      00041D 75 24 00         [24] 1079 	mov	_score,#0x00
                                   1080 ;	dino.c:252: dino_position = 0;
      000420 75 21 00         [24] 1081 	mov	_dino_position,#0x00
                                   1082 ;	dino.c:253: cactus_timer = 0;
      000423 75 2D 00         [24] 1083 	mov	_cactus_timer,#0x00
                                   1084 ;	dino.c:254: last_cactus_row = 0;
      000426 75 2E 00         [24] 1085 	mov	_last_cactus_row,#0x00
                                   1086 ;	dino.c:256: game_speed = difficulty_input();
      000429 12 03 A2         [24] 1087 	lcall	_difficulty_input
      00042C 85 82 2C         [24] 1088 	mov	_game_speed,dpl
                                   1089 ;	dino.c:257: if (game_speed > 9) game_speed = 9;  
      00042F E5 2C            [12] 1090 	mov	a,_game_speed
      000431 24 F6            [12] 1091 	add	a,#0xff - 0x09
      000433 50 03            [24] 1092 	jnc	00102$
      000435 75 2C 09         [24] 1093 	mov	_game_speed,#0x09
      000438                       1094 00102$:
                                   1095 ;	dino.c:258: if (game_speed < 1) game_speed = 1;  
      000438 74 FF            [12] 1096 	mov	a,#0x100 - 0x01
      00043A 25 2C            [12] 1097 	add	a,_game_speed
      00043C 40 03            [24] 1098 	jc	00104$
      00043E 75 2C 01         [24] 1099 	mov	_game_speed,#0x01
      000441                       1100 00104$:
                                   1101 ;	dino.c:260: ThreadCreate(render_task);
      000441 90 01 03         [24] 1102 	mov	dptr,#_render_task
      000444 12 04 83         [24] 1103 	lcall	_ThreadCreate
                                   1104 ;	dino.c:261: ThreadCreate(keypad_ctrl);
      000447 90 00 81         [24] 1105 	mov	dptr,#_keypad_ctrl
      00044A 12 04 83         [24] 1106 	lcall	_ThreadCreate
                                   1107 ;	dino.c:262: game_ctrl();
                                   1108 ;	dino.c:263: }
      00044D 02 02 36         [24] 1109 	ljmp	_game_ctrl
                                   1110 ;------------------------------------------------------------
                                   1111 ;Allocation info for local variables in function '_sdcc_gsinit_startup'
                                   1112 ;------------------------------------------------------------
                                   1113 ;	dino.c:265: void _sdcc_gsinit_startup(void) 
                                   1114 ;	-----------------------------------------
                                   1115 ;	 function _sdcc_gsinit_startup
                                   1116 ;	-----------------------------------------
      000450                       1117 __sdcc_gsinit_startup:
                                   1118 ;	dino.c:269: __endasm;
      000450 02 04 5D         [24] 1119 	LJMP	_Bootstrap
                                   1120 ;	dino.c:270: }
      000453 22               [24] 1121 	ret
                                   1122 ;------------------------------------------------------------
                                   1123 ;Allocation info for local variables in function '_mcs51_genRAMCLEAR'
                                   1124 ;------------------------------------------------------------
                                   1125 ;	dino.c:272: void _mcs51_genRAMCLEAR(void) {}
                                   1126 ;	-----------------------------------------
                                   1127 ;	 function _mcs51_genRAMCLEAR
                                   1128 ;	-----------------------------------------
      000454                       1129 __mcs51_genRAMCLEAR:
      000454 22               [24] 1130 	ret
                                   1131 ;------------------------------------------------------------
                                   1132 ;Allocation info for local variables in function '_mcs51_genXINIT'
                                   1133 ;------------------------------------------------------------
                                   1134 ;	dino.c:273: void _mcs51_genXINIT(void) {}
                                   1135 ;	-----------------------------------------
                                   1136 ;	 function _mcs51_genXINIT
                                   1137 ;	-----------------------------------------
      000455                       1138 __mcs51_genXINIT:
      000455 22               [24] 1139 	ret
                                   1140 ;------------------------------------------------------------
                                   1141 ;Allocation info for local variables in function '_mcs51_genXRAMCLEAR'
                                   1142 ;------------------------------------------------------------
                                   1143 ;	dino.c:274: void _mcs51_genXRAMCLEAR(void) {}
                                   1144 ;	-----------------------------------------
                                   1145 ;	 function _mcs51_genXRAMCLEAR
                                   1146 ;	-----------------------------------------
      000456                       1147 __mcs51_genXRAMCLEAR:
      000456 22               [24] 1148 	ret
                                   1149 ;------------------------------------------------------------
                                   1150 ;Allocation info for local variables in function 'timer0_ISR'
                                   1151 ;------------------------------------------------------------
                                   1152 ;	dino.c:276: void timer0_ISR(void) __interrupt(1)
                                   1153 ;	-----------------------------------------
                                   1154 ;	 function timer0_ISR
                                   1155 ;	-----------------------------------------
      000457                       1156 _timer0_ISR:
                                   1157 ;	dino.c:280: __endasm;
      000457 02 05 C2         [24] 1158 	LJMP	_myTimer0Handler
                                   1159 ;	dino.c:281: }
      00045A 02 00 54         [24] 1160 	ljmp	sdcc_atomic_maybe_rollback
                                   1161 ;	eliminated unneeded mov psw,# (no regs used in bank)
                                   1162 ;	eliminated unneeded push/pop not_psw
                                   1163 ;	eliminated unneeded push/pop dpl
                                   1164 ;	eliminated unneeded push/pop dph
                                   1165 ;	eliminated unneeded push/pop b
                                   1166 ;	eliminated unneeded push/pop acc
                                   1167 	.area CSEG    (CODE)
                                   1168 	.area CONST   (CODE)
                                   1169 	.area CONST   (CODE)
      0009C6                       1170 _dinosaur:
      0009C6 07                    1171 	.db #0x07	; 7
      0009C7 05                    1172 	.db #0x05	; 5
      0009C8 06                    1173 	.db #0x06	; 6
      0009C9 07                    1174 	.db #0x07	; 7
      0009CA 14                    1175 	.db #0x14	; 20
      0009CB 17                    1176 	.db #0x17	; 23
      0009CC 0E                    1177 	.db #0x0e	; 14
      0009CD 0A                    1178 	.db #0x0a	; 10
                                   1179 	.area CSEG    (CODE)
                                   1180 	.area CONST   (CODE)
      0009CE                       1181 _cactus:
      0009CE 04                    1182 	.db #0x04	; 4
      0009CF 05                    1183 	.db #0x05	; 5
      0009D0 15                    1184 	.db #0x15	; 21
      0009D1 15                    1185 	.db #0x15	; 21
      0009D2 16                    1186 	.db #0x16	; 22
      0009D3 0C                    1187 	.db #0x0c	; 12
      0009D4 04                    1188 	.db #0x04	; 4
      0009D5 04                    1189 	.db #0x04	; 4
                                   1190 	.area CSEG    (CODE)
                                   1191 	.area CONST   (CODE)
      0009D6                       1192 _cactus_patterns:
      0009D6 01                    1193 	.db #0x01	; 1
      0009D7 00                    1194 	.db #0x00	; 0
      0009D8 02                    1195 	.db #0x02	; 2
      0009D9 00                    1196 	.db #0x00	; 0
      0009DA 01                    1197 	.db #0x01	; 1
      0009DB 00                    1198 	.db #0x00	; 0
      0009DC 02                    1199 	.db #0x02	; 2
                                   1200 	.area CSEG    (CODE)
                                   1201 	.area XINIT   (CODE)
                                   1202 	.area CABS    (ABS,CODE)
