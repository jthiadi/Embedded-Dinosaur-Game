                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ISO C Compiler
                                      3 ; Version 4.5.0 #15242 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module preemptive
                                      6 	
                                      7 	.optsdcc -mmcs51 --model-small
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _myTimer0Handler
                                     12 	.globl _Bootstrap
                                     13 	.globl _main
                                     14 	.globl _CY
                                     15 	.globl _AC
                                     16 	.globl _F0
                                     17 	.globl _RS1
                                     18 	.globl _RS0
                                     19 	.globl _OV
                                     20 	.globl _F1
                                     21 	.globl _P
                                     22 	.globl _PS
                                     23 	.globl _PT1
                                     24 	.globl _PX1
                                     25 	.globl _PT0
                                     26 	.globl _PX0
                                     27 	.globl _RD
                                     28 	.globl _WR
                                     29 	.globl _T1
                                     30 	.globl _T0
                                     31 	.globl _INT1
                                     32 	.globl _INT0
                                     33 	.globl _TXD
                                     34 	.globl _RXD
                                     35 	.globl _P3_7
                                     36 	.globl _P3_6
                                     37 	.globl _P3_5
                                     38 	.globl _P3_4
                                     39 	.globl _P3_3
                                     40 	.globl _P3_2
                                     41 	.globl _P3_1
                                     42 	.globl _P3_0
                                     43 	.globl _EA
                                     44 	.globl _ES
                                     45 	.globl _ET1
                                     46 	.globl _EX1
                                     47 	.globl _ET0
                                     48 	.globl _EX0
                                     49 	.globl _P2_7
                                     50 	.globl _P2_6
                                     51 	.globl _P2_5
                                     52 	.globl _P2_4
                                     53 	.globl _P2_3
                                     54 	.globl _P2_2
                                     55 	.globl _P2_1
                                     56 	.globl _P2_0
                                     57 	.globl _SM0
                                     58 	.globl _SM1
                                     59 	.globl _SM2
                                     60 	.globl _REN
                                     61 	.globl _TB8
                                     62 	.globl _RB8
                                     63 	.globl _TI
                                     64 	.globl _RI
                                     65 	.globl _P1_7
                                     66 	.globl _P1_6
                                     67 	.globl _P1_5
                                     68 	.globl _P1_4
                                     69 	.globl _P1_3
                                     70 	.globl _P1_2
                                     71 	.globl _P1_1
                                     72 	.globl _P1_0
                                     73 	.globl _TF1
                                     74 	.globl _TR1
                                     75 	.globl _TF0
                                     76 	.globl _TR0
                                     77 	.globl _IE1
                                     78 	.globl _IT1
                                     79 	.globl _IE0
                                     80 	.globl _IT0
                                     81 	.globl _P0_7
                                     82 	.globl _P0_6
                                     83 	.globl _P0_5
                                     84 	.globl _P0_4
                                     85 	.globl _P0_3
                                     86 	.globl _P0_2
                                     87 	.globl _P0_1
                                     88 	.globl _P0_0
                                     89 	.globl _B
                                     90 	.globl _ACC
                                     91 	.globl _PSW
                                     92 	.globl _IP
                                     93 	.globl _P3
                                     94 	.globl _IE
                                     95 	.globl _P2
                                     96 	.globl _SBUF
                                     97 	.globl _SCON
                                     98 	.globl _P1
                                     99 	.globl _TH1
                                    100 	.globl _TH0
                                    101 	.globl _TL1
                                    102 	.globl _TL0
                                    103 	.globl _TMOD
                                    104 	.globl _TCON
                                    105 	.globl _PCON
                                    106 	.globl _DPH
                                    107 	.globl _DPL
                                    108 	.globl _SP
                                    109 	.globl _P0
                                    110 	.globl _old_SP
                                    111 	.globl _new_thread
                                    112 	.globl _valid_thread
                                    113 	.globl _current_thread
                                    114 	.globl _saved_SP
                                    115 	.globl _ThreadCreate
                                    116 	.globl _ThreadYield
                                    117 	.globl _ThreadExit
                                    118 ;--------------------------------------------------------
                                    119 ; special function registers
                                    120 ;--------------------------------------------------------
                                    121 	.area RSEG    (ABS,DATA)
      000000                        122 	.org 0x0000
                           000080   123 _P0	=	0x0080
                           000081   124 _SP	=	0x0081
                           000082   125 _DPL	=	0x0082
                           000083   126 _DPH	=	0x0083
                           000087   127 _PCON	=	0x0087
                           000088   128 _TCON	=	0x0088
                           000089   129 _TMOD	=	0x0089
                           00008A   130 _TL0	=	0x008a
                           00008B   131 _TL1	=	0x008b
                           00008C   132 _TH0	=	0x008c
                           00008D   133 _TH1	=	0x008d
                           000090   134 _P1	=	0x0090
                           000098   135 _SCON	=	0x0098
                           000099   136 _SBUF	=	0x0099
                           0000A0   137 _P2	=	0x00a0
                           0000A8   138 _IE	=	0x00a8
                           0000B0   139 _P3	=	0x00b0
                           0000B8   140 _IP	=	0x00b8
                           0000D0   141 _PSW	=	0x00d0
                           0000E0   142 _ACC	=	0x00e0
                           0000F0   143 _B	=	0x00f0
                                    144 ;--------------------------------------------------------
                                    145 ; special function bits
                                    146 ;--------------------------------------------------------
                                    147 	.area RSEG    (ABS,DATA)
      000000                        148 	.org 0x0000
                           000080   149 _P0_0	=	0x0080
                           000081   150 _P0_1	=	0x0081
                           000082   151 _P0_2	=	0x0082
                           000083   152 _P0_3	=	0x0083
                           000084   153 _P0_4	=	0x0084
                           000085   154 _P0_5	=	0x0085
                           000086   155 _P0_6	=	0x0086
                           000087   156 _P0_7	=	0x0087
                           000088   157 _IT0	=	0x0088
                           000089   158 _IE0	=	0x0089
                           00008A   159 _IT1	=	0x008a
                           00008B   160 _IE1	=	0x008b
                           00008C   161 _TR0	=	0x008c
                           00008D   162 _TF0	=	0x008d
                           00008E   163 _TR1	=	0x008e
                           00008F   164 _TF1	=	0x008f
                           000090   165 _P1_0	=	0x0090
                           000091   166 _P1_1	=	0x0091
                           000092   167 _P1_2	=	0x0092
                           000093   168 _P1_3	=	0x0093
                           000094   169 _P1_4	=	0x0094
                           000095   170 _P1_5	=	0x0095
                           000096   171 _P1_6	=	0x0096
                           000097   172 _P1_7	=	0x0097
                           000098   173 _RI	=	0x0098
                           000099   174 _TI	=	0x0099
                           00009A   175 _RB8	=	0x009a
                           00009B   176 _TB8	=	0x009b
                           00009C   177 _REN	=	0x009c
                           00009D   178 _SM2	=	0x009d
                           00009E   179 _SM1	=	0x009e
                           00009F   180 _SM0	=	0x009f
                           0000A0   181 _P2_0	=	0x00a0
                           0000A1   182 _P2_1	=	0x00a1
                           0000A2   183 _P2_2	=	0x00a2
                           0000A3   184 _P2_3	=	0x00a3
                           0000A4   185 _P2_4	=	0x00a4
                           0000A5   186 _P2_5	=	0x00a5
                           0000A6   187 _P2_6	=	0x00a6
                           0000A7   188 _P2_7	=	0x00a7
                           0000A8   189 _EX0	=	0x00a8
                           0000A9   190 _ET0	=	0x00a9
                           0000AA   191 _EX1	=	0x00aa
                           0000AB   192 _ET1	=	0x00ab
                           0000AC   193 _ES	=	0x00ac
                           0000AF   194 _EA	=	0x00af
                           0000B0   195 _P3_0	=	0x00b0
                           0000B1   196 _P3_1	=	0x00b1
                           0000B2   197 _P3_2	=	0x00b2
                           0000B3   198 _P3_3	=	0x00b3
                           0000B4   199 _P3_4	=	0x00b4
                           0000B5   200 _P3_5	=	0x00b5
                           0000B6   201 _P3_6	=	0x00b6
                           0000B7   202 _P3_7	=	0x00b7
                           0000B0   203 _RXD	=	0x00b0
                           0000B1   204 _TXD	=	0x00b1
                           0000B2   205 _INT0	=	0x00b2
                           0000B3   206 _INT1	=	0x00b3
                           0000B4   207 _T0	=	0x00b4
                           0000B5   208 _T1	=	0x00b5
                           0000B6   209 _WR	=	0x00b6
                           0000B7   210 _RD	=	0x00b7
                           0000B8   211 _PX0	=	0x00b8
                           0000B9   212 _PT0	=	0x00b9
                           0000BA   213 _PX1	=	0x00ba
                           0000BB   214 _PT1	=	0x00bb
                           0000BC   215 _PS	=	0x00bc
                           0000D0   216 _P	=	0x00d0
                           0000D1   217 _F1	=	0x00d1
                           0000D2   218 _OV	=	0x00d2
                           0000D3   219 _RS0	=	0x00d3
                           0000D4   220 _RS1	=	0x00d4
                           0000D5   221 _F0	=	0x00d5
                           0000D6   222 _AC	=	0x00d6
                           0000D7   223 _CY	=	0x00d7
                                    224 ;--------------------------------------------------------
                                    225 ; overlayable register banks
                                    226 ;--------------------------------------------------------
                                    227 	.area REG_BANK_0	(REL,OVR,DATA)
      000000                        228 	.ds 8
                                    229 ;--------------------------------------------------------
                                    230 ; internal ram data
                                    231 ;--------------------------------------------------------
                                    232 	.area DSEG    (DATA)
                           000030   233 _saved_SP	=	0x0030
                           000034   234 _current_thread	=	0x0034
                           000035   235 _valid_thread	=	0x0035
                           000036   236 _new_thread	=	0x0036
                           000037   237 _old_SP	=	0x0037
                                    238 ;--------------------------------------------------------
                                    239 ; overlayable items in internal ram
                                    240 ;--------------------------------------------------------
                                    241 	.area	OSEG    (OVR,DATA)
                                    242 ;--------------------------------------------------------
                                    243 ; indirectly addressable internal ram data
                                    244 ;--------------------------------------------------------
                                    245 	.area ISEG    (DATA)
                                    246 ;--------------------------------------------------------
                                    247 ; absolute internal ram data
                                    248 ;--------------------------------------------------------
                                    249 	.area IABS    (ABS,DATA)
                                    250 	.area IABS    (ABS,DATA)
                                    251 ;--------------------------------------------------------
                                    252 ; bit data
                                    253 ;--------------------------------------------------------
                                    254 	.area BSEG    (BIT)
      000000                        255 _ThreadExit_sloc0_1_0:
      000000                        256 	.ds 1
                                    257 ;--------------------------------------------------------
                                    258 ; paged external ram data
                                    259 ;--------------------------------------------------------
                                    260 	.area PSEG    (PAG,XDATA)
                                    261 ;--------------------------------------------------------
                                    262 ; uninitialized external ram data
                                    263 ;--------------------------------------------------------
                                    264 	.area XSEG    (XDATA)
                                    265 ;--------------------------------------------------------
                                    266 ; absolute external ram data
                                    267 ;--------------------------------------------------------
                                    268 	.area XABS    (ABS,XDATA)
                                    269 ;--------------------------------------------------------
                                    270 ; initialized external ram data
                                    271 ;--------------------------------------------------------
                                    272 	.area XISEG   (XDATA)
                                    273 	.area HOME    (CODE)
                                    274 	.area GSINIT0 (CODE)
                                    275 	.area GSINIT1 (CODE)
                                    276 	.area GSINIT2 (CODE)
                                    277 	.area GSINIT3 (CODE)
                                    278 	.area GSINIT4 (CODE)
                                    279 	.area GSINIT5 (CODE)
                                    280 	.area GSINIT  (CODE)
                                    281 	.area GSFINAL (CODE)
                                    282 	.area CSEG    (CODE)
                                    283 ;--------------------------------------------------------
                                    284 ; global & static initialisations
                                    285 ;--------------------------------------------------------
                                    286 	.area HOME    (CODE)
                                    287 	.area GSINIT  (CODE)
                                    288 	.area GSFINAL (CODE)
                                    289 	.area GSINIT  (CODE)
                                    290 ;--------------------------------------------------------
                                    291 ; Home
                                    292 ;--------------------------------------------------------
                                    293 	.area HOME    (CODE)
                                    294 	.area HOME    (CODE)
                                    295 ;--------------------------------------------------------
                                    296 ; code
                                    297 ;--------------------------------------------------------
                                    298 	.area CSEG    (CODE)
                                    299 ;------------------------------------------------------------
                                    300 ;Allocation info for local variables in function 'Bootstrap'
                                    301 ;------------------------------------------------------------
                                    302 ;	preemptive.c:36: void Bootstrap(void)
                                    303 ;	-----------------------------------------
                                    304 ;	 function Bootstrap
                                    305 ;	-----------------------------------------
      000124                        306 _Bootstrap:
                           000007   307 	ar7 = 0x07
                           000006   308 	ar6 = 0x06
                           000005   309 	ar5 = 0x05
                           000004   310 	ar4 = 0x04
                           000003   311 	ar3 = 0x03
                           000002   312 	ar2 = 0x02
                           000001   313 	ar1 = 0x01
                           000000   314 	ar0 = 0x00
                                    315 ;	preemptive.c:38: TMOD = 0;  		// timer 0 mode 0
      000124 75 89 00         [24]  316 	mov	_TMOD,#0x00
                                    317 ;	preemptive.c:39: IE = 0x82;  	// enable timer 0 interrupt; keep consumer polling
      000127 75 A8 82         [24]  318 	mov	_IE,#0x82
                                    319 ;	preemptive.c:41: TR0 = 1; 		// set bit TR0 to start running timer 0
                                    320 ;	assignBit
      00012A D2 8C            [12]  321 	setb	_TR0
                                    322 ;	preemptive.c:43: valid_thread = 0x00;
      00012C 75 35 00         [24]  323 	mov	_valid_thread,#0x00
                                    324 ;	preemptive.c:45: current_thread = ThreadCreate(main);
      00012F 90 00 F9         [24]  325 	mov	dptr,#_main
      000132 12 01 4A         [24]  326 	lcall	_ThreadCreate
      000135 85 82 34         [24]  327 	mov	_current_thread,dpl
                                    328 ;	preemptive.c:46: RESTORESTATE;
      000138 E5 34            [12]  329 	mov	a,_current_thread
      00013A 24 30            [12]  330 	add	a, #_saved_SP
      00013C F9               [12]  331 	mov	r1,a
      00013D 87 81            [24]  332 	mov	_SP,@r1
      00013F D0 D0            [24]  333 	POP PSW 
      000141 D0 83            [24]  334 	POP DPH 
      000143 D0 82            [24]  335 	POP DPL 
      000145 D0 F0            [24]  336 	POP B 
      000147 D0 E0            [24]  337 	POP ACC 
                                    338 ;	preemptive.c:47: }
      000149 22               [24]  339 	ret
                                    340 ;------------------------------------------------------------
                                    341 ;Allocation info for local variables in function 'ThreadCreate'
                                    342 ;------------------------------------------------------------
                                    343 ;fp            Allocated to registers 
                                    344 ;i             Allocated to registers r7 
                                    345 ;------------------------------------------------------------
                                    346 ;	preemptive.c:49: ThreadID ThreadCreate(FunctionPtr fp)
                                    347 ;	-----------------------------------------
                                    348 ;	 function ThreadCreate
                                    349 ;	-----------------------------------------
      00014A                        350 _ThreadCreate:
                                    351 ;	preemptive.c:51: EA = 0;
                                    352 ;	assignBit
      00014A C2 AF            [12]  353 	clr	_EA
                                    354 ;	preemptive.c:52: if (valid_thread == 0xF) return -1; 
      00014C 74 0F            [12]  355 	mov	a,#0x0f
      00014E B5 35 04         [24]  356 	cjne	a,_valid_thread,00102$
      000151 75 82 FF         [24]  357 	mov	dpl, #0xff
      000154 22               [24]  358 	ret
      000155                        359 00102$:
                                    360 ;	preemptive.c:54: new_thread = 3; 
      000155 75 36 03         [24]  361 	mov	_new_thread,#0x03
                                    362 ;	preemptive.c:55: for (int i = 0; i < MAXTHREADS; i++) {
      000158 7F 00            [12]  363 	mov	r7,#0x00
      00015A 7E 00            [12]  364 	mov	r6,#0x00
      00015C                        365 00107$:
      00015C BE 04 00         [24]  366 	cjne	r6,#0x04,00137$
      00015F                        367 00137$:
      00015F 50 2A            [24]  368 	jnc	00105$
                                    369 ;	preemptive.c:56: if (!(valid_thread & (1 << i))) {
      000161 8E F0            [24]  370 	mov	b,r6
      000163 05 F0            [12]  371 	inc	b
      000165 7C 01            [12]  372 	mov	r4,#0x01
      000167 7D 00            [12]  373 	mov	r5,#0x00
      000169 80 06            [24]  374 	sjmp	00140$
      00016B                        375 00139$:
      00016B EC               [12]  376 	mov	a,r4
      00016C 2C               [12]  377 	add	a,r4
      00016D FC               [12]  378 	mov	r4,a
      00016E ED               [12]  379 	mov	a,r5
      00016F 33               [12]  380 	rlc	a
      000170 FD               [12]  381 	mov	r5,a
      000171                        382 00140$:
      000171 D5 F0 F7         [24]  383 	djnz	b,00139$
      000174 AA 35            [24]  384 	mov	r2,_valid_thread
      000176 7B 00            [12]  385 	mov	r3,#0x00
      000178 EA               [12]  386 	mov	a,r2
      000179 52 04            [12]  387 	anl	ar4,a
      00017B EB               [12]  388 	mov	a,r3
      00017C 52 05            [12]  389 	anl	ar5,a
      00017E EC               [12]  390 	mov	a,r4
      00017F 4D               [12]  391 	orl	a,r5
      000180 70 04            [24]  392 	jnz	00108$
                                    393 ;	preemptive.c:57: new_thread = i;
      000182 8F 36            [24]  394 	mov	_new_thread,r7
                                    395 ;	preemptive.c:58: break;
      000184 80 05            [24]  396 	sjmp	00105$
      000186                        397 00108$:
                                    398 ;	preemptive.c:55: for (int i = 0; i < MAXTHREADS; i++) {
      000186 0E               [12]  399 	inc	r6
      000187 8E 07            [24]  400 	mov	ar7,r6
      000189 80 D1            [24]  401 	sjmp	00107$
      00018B                        402 00105$:
                                    403 ;	preemptive.c:62: valid_thread |= (1 << new_thread);
      00018B 85 36 F0         [24]  404 	mov	b,_new_thread
      00018E 05 F0            [12]  405 	inc	b
      000190 74 01            [12]  406 	mov	a,#0x01
      000192 80 02            [24]  407 	sjmp	00143$
      000194                        408 00142$:
      000194 25 E0            [12]  409 	add	a,acc
      000196                        410 00143$:
      000196 D5 F0 FB         [24]  411 	djnz	b,00142$
      000199 42 35            [12]  412 	orl	_valid_thread,a
                                    413 ;	preemptive.c:64: old_SP = SP;
      00019B 85 81 37         [24]  414 	mov	_old_SP,_SP
                                    415 ;	preemptive.c:65: SP = (0x3A) + (new_thread * 8);
      00019E E5 36            [12]  416 	mov	a,_new_thread
      0001A0 C4               [12]  417 	swap	a
      0001A1 03               [12]  418 	rr	a
      0001A2 54 F8            [12]  419 	anl	a,#0xf8
      0001A4 FF               [12]  420 	mov	r7,a
      0001A5 24 3A            [12]  421 	add	a,#0x3a
      0001A7 F5 81            [12]  422 	mov	_SP,a
                                    423 ;	preemptive.c:75: __endasm;
      0001A9 C0 82            [24]  424 	PUSH	DPL
      0001AB C0 83            [24]  425 	PUSH	DPH
      0001AD E4               [12]  426 	CLR	A
      0001AE C0 E0            [24]  427 	PUSH	ACC
      0001B0 C0 E0            [24]  428 	PUSH	ACC
      0001B2 C0 E0            [24]  429 	PUSH	ACC
      0001B4 C0 E0            [24]  430 	PUSH	ACC
                                    431 ;	preemptive.c:77: PSW = (new_thread << 3);
      0001B6 E5 36            [12]  432 	mov	a,_new_thread
      0001B8 C4               [12]  433 	swap	a
      0001B9 03               [12]  434 	rr	a
      0001BA 54 F8            [12]  435 	anl	a,#0xf8
      0001BC F5 D0            [12]  436 	mov	_PSW,a
                                    437 ;	preemptive.c:81: __endasm;
      0001BE C0 D0            [24]  438 	PUSH	PSW
                                    439 ;	preemptive.c:83: saved_SP[new_thread] = SP;
      0001C0 E5 36            [12]  440 	mov	a,_new_thread
      0001C2 24 30            [12]  441 	add	a, #_saved_SP
      0001C4 F8               [12]  442 	mov	r0,a
      0001C5 A6 81            [24]  443 	mov	@r0,_SP
                                    444 ;	preemptive.c:84: SP = old_SP;
      0001C7 85 37 81         [24]  445 	mov	_SP,_old_SP
                                    446 ;	preemptive.c:86: EA = 1;
                                    447 ;	assignBit
      0001CA D2 AF            [12]  448 	setb	_EA
                                    449 ;	preemptive.c:87: return new_thread;
      0001CC 85 36 82         [24]  450 	mov	dpl, _new_thread
                                    451 ;	preemptive.c:88: }
      0001CF 22               [24]  452 	ret
                                    453 ;------------------------------------------------------------
                                    454 ;Allocation info for local variables in function 'ThreadYield'
                                    455 ;------------------------------------------------------------
                                    456 ;	preemptive.c:90: void ThreadYield(void)
                                    457 ;	-----------------------------------------
                                    458 ;	 function ThreadYield
                                    459 ;	-----------------------------------------
      0001D0                        460 _ThreadYield:
                                    461 ;	preemptive.c:92: EA = 0;
                                    462 ;	assignBit
      0001D0 C2 AF            [12]  463 	clr	_EA
                                    464 ;	preemptive.c:93: SAVESTATE;
      0001D2 C0 E0            [24]  465 	PUSH ACC 
      0001D4 C0 F0            [24]  466 	PUSH B 
      0001D6 C0 82            [24]  467 	PUSH DPL 
      0001D8 C0 83            [24]  468 	PUSH DPH 
      0001DA C0 D0            [24]  469 	PUSH PSW 
      0001DC E5 34            [12]  470 	mov	a,_current_thread
      0001DE 24 30            [12]  471 	add	a, #_saved_SP
      0001E0 F8               [12]  472 	mov	r0,a
      0001E1 A6 81            [24]  473 	mov	@r0,_SP
                                    474 ;	preemptive.c:94: do {
      0001E3                        475 00110$:
                                    476 ;	preemptive.c:95: current_thread = (current_thread + 1) & 3;
      0001E3 AF 34            [24]  477 	mov	r7,_current_thread
      0001E5 0F               [12]  478 	inc	r7
      0001E6 74 03            [12]  479 	mov	a,#0x03
      0001E8 5F               [12]  480 	anl	a,r7
      0001E9 F5 34            [12]  481 	mov	_current_thread,a
                                    482 ;	preemptive.c:97: if ((current_thread == 0 && (valid_thread & 0x01)) ||
      0001EB E5 34            [12]  483 	mov	a,_current_thread
      0001ED 70 06            [24]  484 	jnz	00105$
      0001EF E5 35            [12]  485 	mov	a,_valid_thread
      0001F1 FF               [12]  486 	mov	r7,a
      0001F2 20 E0 21         [24]  487 	jb	acc.0,00113$
      0001F5                        488 00105$:
                                    489 ;	preemptive.c:98: (current_thread == 1 && (valid_thread & 0x02)) ||
      0001F5 74 01            [12]  490 	mov	a,#0x01
      0001F7 B5 34 06         [24]  491 	cjne	a,_current_thread,00107$
      0001FA E5 35            [12]  492 	mov	a,_valid_thread
      0001FC FF               [12]  493 	mov	r7,a
      0001FD 20 E1 16         [24]  494 	jb	acc.1,00113$
      000200                        495 00107$:
                                    496 ;	preemptive.c:99: (current_thread == 2 && (valid_thread & 0x04)) ||
      000200 74 02            [12]  497 	mov	a,#0x02
      000202 B5 34 06         [24]  498 	cjne	a,_current_thread,00109$
      000205 E5 35            [12]  499 	mov	a,_valid_thread
      000207 FF               [12]  500 	mov	r7,a
      000208 20 E2 0B         [24]  501 	jb	acc.2,00113$
      00020B                        502 00109$:
                                    503 ;	preemptive.c:100: (current_thread == 3 && (valid_thread & 0x08))) {
      00020B 74 03            [12]  504 	mov	a,#0x03
      00020D B5 34 D3         [24]  505 	cjne	a,_current_thread,00110$
      000210 E5 35            [12]  506 	mov	a,_valid_thread
      000212 FF               [12]  507 	mov	r7,a
      000213 30 E3 CD         [24]  508 	jnb	acc.3,00110$
                                    509 ;	preemptive.c:105: found:
      000216                        510 00113$:
                                    511 ;	preemptive.c:106: RESTORESTATE;
      000216 E5 34            [12]  512 	mov	a,_current_thread
      000218 24 30            [12]  513 	add	a, #_saved_SP
      00021A F9               [12]  514 	mov	r1,a
      00021B 87 81            [24]  515 	mov	_SP,@r1
      00021D D0 D0            [24]  516 	POP PSW 
      00021F D0 83            [24]  517 	POP DPH 
      000221 D0 82            [24]  518 	POP DPL 
      000223 D0 F0            [24]  519 	POP B 
      000225 D0 E0            [24]  520 	POP ACC 
                                    521 ;	preemptive.c:107: EA = 1;
                                    522 ;	assignBit
      000227 D2 AF            [12]  523 	setb	_EA
                                    524 ;	preemptive.c:108: }
      000229 22               [24]  525 	ret
                                    526 ;------------------------------------------------------------
                                    527 ;Allocation info for local variables in function 'ThreadExit'
                                    528 ;------------------------------------------------------------
                                    529 ;	preemptive.c:110: void ThreadExit(void)
                                    530 ;	-----------------------------------------
                                    531 ;	 function ThreadExit
                                    532 ;	-----------------------------------------
      00022A                        533 _ThreadExit:
                                    534 ;	preemptive.c:121: }
      00022A D2 00            [12]  535 	setb	_ThreadExit_sloc0_1_0
      00022C 10 AF 02         [24]  536 	jbc	ea,00127$
      00022F C2 00            [12]  537 	clr	_ThreadExit_sloc0_1_0
      000231                        538 00127$:
                                    539 ;	preemptive.c:113: valid_thread &= ~(1 << current_thread);
      000231 85 34 F0         [24]  540 	mov	b,_current_thread
      000234 05 F0            [12]  541 	inc	b
      000236 74 01            [12]  542 	mov	a,#0x01
      000238 80 02            [24]  543 	sjmp	00129$
      00023A                        544 00128$:
      00023A 25 E0            [12]  545 	add	a,acc
      00023C                        546 00129$:
      00023C D5 F0 FB         [24]  547 	djnz	b,00128$
      00023F F4               [12]  548 	cpl	a
      000240 52 35            [12]  549 	anl	_valid_thread,a
                                    550 ;	preemptive.c:115: do {
      000242                        551 00104$:
                                    552 ;	preemptive.c:116: if (current_thread == 3) current_thread = 0;
      000242 74 03            [12]  553 	mov	a,#0x03
      000244 B5 34 05         [24]  554 	cjne	a,_current_thread,00102$
      000247 75 34 00         [24]  555 	mov	_current_thread,#0x00
      00024A 80 05            [24]  556 	sjmp	00105$
      00024C                        557 00102$:
                                    558 ;	preemptive.c:117: else current_thread += 1;
      00024C E5 34            [12]  559 	mov	a,_current_thread
      00024E 04               [12]  560 	inc	a
      00024F F5 34            [12]  561 	mov	_current_thread,a
      000251                        562 00105$:
                                    563 ;	preemptive.c:118: } while (!(valid_thread & (1 << current_thread)));
      000251 85 34 F0         [24]  564 	mov	b,_current_thread
      000254 05 F0            [12]  565 	inc	b
      000256 7E 01            [12]  566 	mov	r6,#0x01
      000258 7F 00            [12]  567 	mov	r7,#0x00
      00025A 80 06            [24]  568 	sjmp	00133$
      00025C                        569 00132$:
      00025C EE               [12]  570 	mov	a,r6
      00025D 2E               [12]  571 	add	a,r6
      00025E FE               [12]  572 	mov	r6,a
      00025F EF               [12]  573 	mov	a,r7
      000260 33               [12]  574 	rlc	a
      000261 FF               [12]  575 	mov	r7,a
      000262                        576 00133$:
      000262 D5 F0 F7         [24]  577 	djnz	b,00132$
      000265 AC 35            [24]  578 	mov	r4,_valid_thread
      000267 7D 00            [12]  579 	mov	r5,#0x00
      000269 EC               [12]  580 	mov	a,r4
      00026A 52 06            [12]  581 	anl	ar6,a
      00026C ED               [12]  582 	mov	a,r5
      00026D 52 07            [12]  583 	anl	ar7,a
      00026F EE               [12]  584 	mov	a,r6
      000270 4F               [12]  585 	orl	a,r7
      000271 60 CF            [24]  586 	jz	00104$
                                    587 ;	preemptive.c:120: RESTORESTATE;
      000273 E5 34            [12]  588 	mov	a,_current_thread
      000275 24 30            [12]  589 	add	a, #_saved_SP
      000277 F9               [12]  590 	mov	r1,a
      000278 87 81            [24]  591 	mov	_SP,@r1
      00027A D0 D0            [24]  592 	POP PSW 
      00027C D0 83            [24]  593 	POP DPH 
      00027E D0 82            [24]  594 	POP DPL 
      000280 D0 F0            [24]  595 	POP B 
      000282 D0 E0            [24]  596 	POP ACC 
      000284 A2 00            [12]  597 	mov	c,_ThreadExit_sloc0_1_0
      000286 92 AF            [24]  598 	mov	ea,c
                                    599 ;	preemptive.c:122: }
      000288 22               [24]  600 	ret
                                    601 ;------------------------------------------------------------
                                    602 ;Allocation info for local variables in function 'myTimer0Handler'
                                    603 ;------------------------------------------------------------
                                    604 ;	preemptive.c:124: void myTimer0Handler(void)
                                    605 ;	-----------------------------------------
                                    606 ;	 function myTimer0Handler
                                    607 ;	-----------------------------------------
      000289                        608 _myTimer0Handler:
                                    609 ;	preemptive.c:126: EA = 0;
                                    610 ;	assignBit
      000289 C2 AF            [12]  611 	clr	_EA
                                    612 ;	preemptive.c:127: SAVESTATE;
      00028B C0 E0            [24]  613 	PUSH ACC 
      00028D C0 F0            [24]  614 	PUSH B 
      00028F C0 82            [24]  615 	PUSH DPL 
      000291 C0 83            [24]  616 	PUSH DPH 
      000293 C0 D0            [24]  617 	PUSH PSW 
      000295 E5 34            [12]  618 	mov	a,_current_thread
      000297 24 30            [12]  619 	add	a, #_saved_SP
      000299 F8               [12]  620 	mov	r0,a
      00029A A6 81            [24]  621 	mov	@r0,_SP
                                    622 ;	preemptive.c:129: do {
      00029C                        623 00110$:
                                    624 ;	preemptive.c:130: current_thread = (current_thread + 1) & 3;
      00029C AF 34            [24]  625 	mov	r7,_current_thread
      00029E 0F               [12]  626 	inc	r7
      00029F 74 03            [12]  627 	mov	a,#0x03
      0002A1 5F               [12]  628 	anl	a,r7
      0002A2 F5 34            [12]  629 	mov	_current_thread,a
                                    630 ;	preemptive.c:132: if ((current_thread == 0 && (valid_thread & 0x01)) ||
      0002A4 E5 34            [12]  631 	mov	a,_current_thread
      0002A6 70 06            [24]  632 	jnz	00105$
      0002A8 E5 35            [12]  633 	mov	a,_valid_thread
      0002AA FF               [12]  634 	mov	r7,a
      0002AB 20 E0 21         [24]  635 	jb	acc.0,00113$
      0002AE                        636 00105$:
                                    637 ;	preemptive.c:133: (current_thread == 1 && (valid_thread & 0x02)) ||
      0002AE 74 01            [12]  638 	mov	a,#0x01
      0002B0 B5 34 06         [24]  639 	cjne	a,_current_thread,00107$
      0002B3 E5 35            [12]  640 	mov	a,_valid_thread
      0002B5 FF               [12]  641 	mov	r7,a
      0002B6 20 E1 16         [24]  642 	jb	acc.1,00113$
      0002B9                        643 00107$:
                                    644 ;	preemptive.c:134: (current_thread == 2 && (valid_thread & 0x04)) ||
      0002B9 74 02            [12]  645 	mov	a,#0x02
      0002BB B5 34 06         [24]  646 	cjne	a,_current_thread,00109$
      0002BE E5 35            [12]  647 	mov	a,_valid_thread
      0002C0 FF               [12]  648 	mov	r7,a
      0002C1 20 E2 0B         [24]  649 	jb	acc.2,00113$
      0002C4                        650 00109$:
                                    651 ;	preemptive.c:135: (current_thread == 3 && (valid_thread & 0x08))) {
      0002C4 74 03            [12]  652 	mov	a,#0x03
      0002C6 B5 34 D3         [24]  653 	cjne	a,_current_thread,00110$
      0002C9 E5 35            [12]  654 	mov	a,_valid_thread
      0002CB FF               [12]  655 	mov	r7,a
      0002CC 30 E3 CD         [24]  656 	jnb	acc.3,00110$
                                    657 ;	preemptive.c:140: found:
      0002CF                        658 00113$:
                                    659 ;	preemptive.c:141: RESTORESTATE;
      0002CF E5 34            [12]  660 	mov	a,_current_thread
      0002D1 24 30            [12]  661 	add	a, #_saved_SP
      0002D3 F9               [12]  662 	mov	r1,a
      0002D4 87 81            [24]  663 	mov	_SP,@r1
      0002D6 D0 D0            [24]  664 	POP PSW 
      0002D8 D0 83            [24]  665 	POP DPH 
      0002DA D0 82            [24]  666 	POP DPL 
      0002DC D0 F0            [24]  667 	POP B 
      0002DE D0 E0            [24]  668 	POP ACC 
                                    669 ;	preemptive.c:142: EA = 1;
                                    670 ;	assignBit
      0002E0 D2 AF            [12]  671 	setb	_EA
                                    672 ;	preemptive.c:146: __endasm;
      0002E2 32               [24]  673 	RETI
                                    674 ;	preemptive.c:147: }
      0002E3 22               [24]  675 	ret
                                    676 	.area CSEG    (CODE)
                                    677 	.area CONST   (CODE)
                                    678 	.area XINIT   (CODE)
                                    679 	.area CABS    (ABS,CODE)
