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
                                    110 	.globl _reload_time
                                    111 	.globl _old_SP
                                    112 	.globl _new_thread
                                    113 	.globl _valid_thread
                                    114 	.globl _current_thread
                                    115 	.globl _saved_SP
                                    116 	.globl _ThreadCreate
                                    117 	.globl _ThreadYield
                                    118 	.globl _ThreadExit
                                    119 ;--------------------------------------------------------
                                    120 ; special function registers
                                    121 ;--------------------------------------------------------
                                    122 	.area RSEG    (ABS,DATA)
      000000                        123 	.org 0x0000
                           000080   124 _P0	=	0x0080
                           000081   125 _SP	=	0x0081
                           000082   126 _DPL	=	0x0082
                           000083   127 _DPH	=	0x0083
                           000087   128 _PCON	=	0x0087
                           000088   129 _TCON	=	0x0088
                           000089   130 _TMOD	=	0x0089
                           00008A   131 _TL0	=	0x008a
                           00008B   132 _TL1	=	0x008b
                           00008C   133 _TH0	=	0x008c
                           00008D   134 _TH1	=	0x008d
                           000090   135 _P1	=	0x0090
                           000098   136 _SCON	=	0x0098
                           000099   137 _SBUF	=	0x0099
                           0000A0   138 _P2	=	0x00a0
                           0000A8   139 _IE	=	0x00a8
                           0000B0   140 _P3	=	0x00b0
                           0000B8   141 _IP	=	0x00b8
                           0000D0   142 _PSW	=	0x00d0
                           0000E0   143 _ACC	=	0x00e0
                           0000F0   144 _B	=	0x00f0
                                    145 ;--------------------------------------------------------
                                    146 ; special function bits
                                    147 ;--------------------------------------------------------
                                    148 	.area RSEG    (ABS,DATA)
      000000                        149 	.org 0x0000
                           000080   150 _P0_0	=	0x0080
                           000081   151 _P0_1	=	0x0081
                           000082   152 _P0_2	=	0x0082
                           000083   153 _P0_3	=	0x0083
                           000084   154 _P0_4	=	0x0084
                           000085   155 _P0_5	=	0x0085
                           000086   156 _P0_6	=	0x0086
                           000087   157 _P0_7	=	0x0087
                           000088   158 _IT0	=	0x0088
                           000089   159 _IE0	=	0x0089
                           00008A   160 _IT1	=	0x008a
                           00008B   161 _IE1	=	0x008b
                           00008C   162 _TR0	=	0x008c
                           00008D   163 _TF0	=	0x008d
                           00008E   164 _TR1	=	0x008e
                           00008F   165 _TF1	=	0x008f
                           000090   166 _P1_0	=	0x0090
                           000091   167 _P1_1	=	0x0091
                           000092   168 _P1_2	=	0x0092
                           000093   169 _P1_3	=	0x0093
                           000094   170 _P1_4	=	0x0094
                           000095   171 _P1_5	=	0x0095
                           000096   172 _P1_6	=	0x0096
                           000097   173 _P1_7	=	0x0097
                           000098   174 _RI	=	0x0098
                           000099   175 _TI	=	0x0099
                           00009A   176 _RB8	=	0x009a
                           00009B   177 _TB8	=	0x009b
                           00009C   178 _REN	=	0x009c
                           00009D   179 _SM2	=	0x009d
                           00009E   180 _SM1	=	0x009e
                           00009F   181 _SM0	=	0x009f
                           0000A0   182 _P2_0	=	0x00a0
                           0000A1   183 _P2_1	=	0x00a1
                           0000A2   184 _P2_2	=	0x00a2
                           0000A3   185 _P2_3	=	0x00a3
                           0000A4   186 _P2_4	=	0x00a4
                           0000A5   187 _P2_5	=	0x00a5
                           0000A6   188 _P2_6	=	0x00a6
                           0000A7   189 _P2_7	=	0x00a7
                           0000A8   190 _EX0	=	0x00a8
                           0000A9   191 _ET0	=	0x00a9
                           0000AA   192 _EX1	=	0x00aa
                           0000AB   193 _ET1	=	0x00ab
                           0000AC   194 _ES	=	0x00ac
                           0000AF   195 _EA	=	0x00af
                           0000B0   196 _P3_0	=	0x00b0
                           0000B1   197 _P3_1	=	0x00b1
                           0000B2   198 _P3_2	=	0x00b2
                           0000B3   199 _P3_3	=	0x00b3
                           0000B4   200 _P3_4	=	0x00b4
                           0000B5   201 _P3_5	=	0x00b5
                           0000B6   202 _P3_6	=	0x00b6
                           0000B7   203 _P3_7	=	0x00b7
                           0000B0   204 _RXD	=	0x00b0
                           0000B1   205 _TXD	=	0x00b1
                           0000B2   206 _INT0	=	0x00b2
                           0000B3   207 _INT1	=	0x00b3
                           0000B4   208 _T0	=	0x00b4
                           0000B5   209 _T1	=	0x00b5
                           0000B6   210 _WR	=	0x00b6
                           0000B7   211 _RD	=	0x00b7
                           0000B8   212 _PX0	=	0x00b8
                           0000B9   213 _PT0	=	0x00b9
                           0000BA   214 _PX1	=	0x00ba
                           0000BB   215 _PT1	=	0x00bb
                           0000BC   216 _PS	=	0x00bc
                           0000D0   217 _P	=	0x00d0
                           0000D1   218 _F1	=	0x00d1
                           0000D2   219 _OV	=	0x00d2
                           0000D3   220 _RS0	=	0x00d3
                           0000D4   221 _RS1	=	0x00d4
                           0000D5   222 _F0	=	0x00d5
                           0000D6   223 _AC	=	0x00d6
                           0000D7   224 _CY	=	0x00d7
                                    225 ;--------------------------------------------------------
                                    226 ; overlayable register banks
                                    227 ;--------------------------------------------------------
                                    228 	.area REG_BANK_0	(REL,OVR,DATA)
      000000                        229 	.ds 8
                                    230 ;--------------------------------------------------------
                                    231 ; internal ram data
                                    232 ;--------------------------------------------------------
                                    233 	.area DSEG    (DATA)
                           000030   234 _saved_SP	=	0x0030
                           000034   235 _current_thread	=	0x0034
                           000035   236 _valid_thread	=	0x0035
                           000036   237 _new_thread	=	0x0036
                           000037   238 _old_SP	=	0x0037
                           000038   239 _reload_time	=	0x0038
                                    240 ;--------------------------------------------------------
                                    241 ; overlayable items in internal ram
                                    242 ;--------------------------------------------------------
                                    243 	.area	OSEG    (OVR,DATA)
                                    244 ;--------------------------------------------------------
                                    245 ; indirectly addressable internal ram data
                                    246 ;--------------------------------------------------------
                                    247 	.area ISEG    (DATA)
                                    248 ;--------------------------------------------------------
                                    249 ; absolute internal ram data
                                    250 ;--------------------------------------------------------
                                    251 	.area IABS    (ABS,DATA)
                                    252 	.area IABS    (ABS,DATA)
                                    253 ;--------------------------------------------------------
                                    254 ; bit data
                                    255 ;--------------------------------------------------------
                                    256 	.area BSEG    (BIT)
      000000                        257 _ThreadExit_sloc0_1_0:
      000000                        258 	.ds 1
                                    259 ;--------------------------------------------------------
                                    260 ; paged external ram data
                                    261 ;--------------------------------------------------------
                                    262 	.area PSEG    (PAG,XDATA)
                                    263 ;--------------------------------------------------------
                                    264 ; uninitialized external ram data
                                    265 ;--------------------------------------------------------
                                    266 	.area XSEG    (XDATA)
                                    267 ;--------------------------------------------------------
                                    268 ; absolute external ram data
                                    269 ;--------------------------------------------------------
                                    270 	.area XABS    (ABS,XDATA)
                                    271 ;--------------------------------------------------------
                                    272 ; initialized external ram data
                                    273 ;--------------------------------------------------------
                                    274 	.area XISEG   (XDATA)
                                    275 	.area HOME    (CODE)
                                    276 	.area GSINIT0 (CODE)
                                    277 	.area GSINIT1 (CODE)
                                    278 	.area GSINIT2 (CODE)
                                    279 	.area GSINIT3 (CODE)
                                    280 	.area GSINIT4 (CODE)
                                    281 	.area GSINIT5 (CODE)
                                    282 	.area GSINIT  (CODE)
                                    283 	.area GSFINAL (CODE)
                                    284 	.area CSEG    (CODE)
                                    285 ;--------------------------------------------------------
                                    286 ; global & static initialisations
                                    287 ;--------------------------------------------------------
                                    288 	.area HOME    (CODE)
                                    289 	.area GSINIT  (CODE)
                                    290 	.area GSFINAL (CODE)
                                    291 	.area GSINIT  (CODE)
                                    292 ;--------------------------------------------------------
                                    293 ; Home
                                    294 ;--------------------------------------------------------
                                    295 	.area HOME    (CODE)
                                    296 	.area HOME    (CODE)
                                    297 ;--------------------------------------------------------
                                    298 ; code
                                    299 ;--------------------------------------------------------
                                    300 	.area CSEG    (CODE)
                                    301 ;------------------------------------------------------------
                                    302 ;Allocation info for local variables in function 'Bootstrap'
                                    303 ;------------------------------------------------------------
                                    304 ;	preemptive.c:37: void Bootstrap(void) 
                                    305 ;	-----------------------------------------
                                    306 ;	 function Bootstrap
                                    307 ;	-----------------------------------------
      00045D                        308 _Bootstrap:
                           000007   309 	ar7 = 0x07
                           000006   310 	ar6 = 0x06
                           000005   311 	ar5 = 0x05
                           000004   312 	ar4 = 0x04
                           000003   313 	ar3 = 0x03
                           000002   314 	ar2 = 0x02
                           000001   315 	ar1 = 0x01
                           000000   316 	ar0 = 0x00
                                    317 ;	preemptive.c:39: TMOD = 0;  		// timer 0 mode 0
      00045D 75 89 00         [24]  318 	mov	_TMOD,#0x00
                                    319 ;	preemptive.c:40: IE = 0x82;  	// enable timer 0 interrupt; keep consumer polling
      000460 75 A8 82         [24]  320 	mov	_IE,#0x82
                                    321 ;	preemptive.c:42: TR0 = 1; 		// set bit TR0 to start running timer 0
                                    322 ;	assignBit
      000463 D2 8C            [12]  323 	setb	_TR0
                                    324 ;	preemptive.c:44: valid_thread = 0x00;
      000465 75 35 00         [24]  325 	mov	_valid_thread,#0x00
                                    326 ;	preemptive.c:46: current_thread = ThreadCreate(main);
      000468 90 03 E7         [24]  327 	mov	dptr,#_main
      00046B 12 04 83         [24]  328 	lcall	_ThreadCreate
      00046E 85 82 34         [24]  329 	mov	_current_thread,dpl
                                    330 ;	preemptive.c:47: RESTORESTATE;
      000471 E5 34            [12]  331 	mov	a,_current_thread
      000473 24 30            [12]  332 	add	a, #_saved_SP
      000475 F9               [12]  333 	mov	r1,a
      000476 87 81            [24]  334 	mov	_SP,@r1
      000478 D0 D0            [24]  335 	POP PSW 
      00047A D0 83            [24]  336 	POP DPH 
      00047C D0 82            [24]  337 	POP DPL 
      00047E D0 F0            [24]  338 	POP B 
      000480 D0 E0            [24]  339 	POP ACC 
                                    340 ;	preemptive.c:48: }
      000482 22               [24]  341 	ret
                                    342 ;------------------------------------------------------------
                                    343 ;Allocation info for local variables in function 'ThreadCreate'
                                    344 ;------------------------------------------------------------
                                    345 ;fp            Allocated to registers 
                                    346 ;i             Allocated to registers r7 
                                    347 ;------------------------------------------------------------
                                    348 ;	preemptive.c:50: ThreadID ThreadCreate(FunctionPtr fp)
                                    349 ;	-----------------------------------------
                                    350 ;	 function ThreadCreate
                                    351 ;	-----------------------------------------
      000483                        352 _ThreadCreate:
                                    353 ;	preemptive.c:52: EA = 0;
                                    354 ;	assignBit
      000483 C2 AF            [12]  355 	clr	_EA
                                    356 ;	preemptive.c:53: if (valid_thread == 0xF) return -1;
      000485 74 0F            [12]  357 	mov	a,#0x0f
      000487 B5 35 04         [24]  358 	cjne	a,_valid_thread,00102$
      00048A 75 82 FF         [24]  359 	mov	dpl, #0xff
      00048D 22               [24]  360 	ret
      00048E                        361 00102$:
                                    362 ;	preemptive.c:55: new_thread = 3;
      00048E 75 36 03         [24]  363 	mov	_new_thread,#0x03
                                    364 ;	preemptive.c:56: for (int i = 0; i < MAXTHREADS; i++) {
      000491 7F 00            [12]  365 	mov	r7,#0x00
      000493 7E 00            [12]  366 	mov	r6,#0x00
      000495                        367 00107$:
      000495 BE 04 00         [24]  368 	cjne	r6,#0x04,00137$
      000498                        369 00137$:
      000498 50 2A            [24]  370 	jnc	00105$
                                    371 ;	preemptive.c:57: if (!(valid_thread & (1 << i))) {
      00049A 8E F0            [24]  372 	mov	b,r6
      00049C 05 F0            [12]  373 	inc	b
      00049E 7C 01            [12]  374 	mov	r4,#0x01
      0004A0 7D 00            [12]  375 	mov	r5,#0x00
      0004A2 80 06            [24]  376 	sjmp	00140$
      0004A4                        377 00139$:
      0004A4 EC               [12]  378 	mov	a,r4
      0004A5 2C               [12]  379 	add	a,r4
      0004A6 FC               [12]  380 	mov	r4,a
      0004A7 ED               [12]  381 	mov	a,r5
      0004A8 33               [12]  382 	rlc	a
      0004A9 FD               [12]  383 	mov	r5,a
      0004AA                        384 00140$:
      0004AA D5 F0 F7         [24]  385 	djnz	b,00139$
      0004AD AA 35            [24]  386 	mov	r2,_valid_thread
      0004AF 7B 00            [12]  387 	mov	r3,#0x00
      0004B1 EA               [12]  388 	mov	a,r2
      0004B2 52 04            [12]  389 	anl	ar4,a
      0004B4 EB               [12]  390 	mov	a,r3
      0004B5 52 05            [12]  391 	anl	ar5,a
      0004B7 EC               [12]  392 	mov	a,r4
      0004B8 4D               [12]  393 	orl	a,r5
      0004B9 70 04            [24]  394 	jnz	00108$
                                    395 ;	preemptive.c:58: new_thread = i;
      0004BB 8F 36            [24]  396 	mov	_new_thread,r7
                                    397 ;	preemptive.c:59: break;
      0004BD 80 05            [24]  398 	sjmp	00105$
      0004BF                        399 00108$:
                                    400 ;	preemptive.c:56: for (int i = 0; i < MAXTHREADS; i++) {
      0004BF 0E               [12]  401 	inc	r6
      0004C0 8E 07            [24]  402 	mov	ar7,r6
      0004C2 80 D1            [24]  403 	sjmp	00107$
      0004C4                        404 00105$:
                                    405 ;	preemptive.c:63: valid_thread |= (1 << new_thread);
      0004C4 85 36 F0         [24]  406 	mov	b,_new_thread
      0004C7 05 F0            [12]  407 	inc	b
      0004C9 74 01            [12]  408 	mov	a,#0x01
      0004CB 80 02            [24]  409 	sjmp	00143$
      0004CD                        410 00142$:
      0004CD 25 E0            [12]  411 	add	a,acc
      0004CF                        412 00143$:
      0004CF D5 F0 FB         [24]  413 	djnz	b,00142$
      0004D2 42 35            [12]  414 	orl	_valid_thread,a
                                    415 ;	preemptive.c:65: old_SP = SP;
      0004D4 85 81 37         [24]  416 	mov	_old_SP,_SP
                                    417 ;	preemptive.c:66: SP = (0x3D) + (new_thread * 10);
      0004D7 E5 36            [12]  418 	mov	a,_new_thread
      0004D9 FF               [12]  419 	mov	r7,a
      0004DA 75 F0 0A         [24]  420 	mov	b,#0x0a
      0004DD A4               [48]  421 	mul	ab
      0004DE 24 3D            [12]  422 	add	a, #0x3d
      0004E0 F5 81            [12]  423 	mov	_SP,a
                                    424 ;	preemptive.c:76: __endasm;
      0004E2 C0 82            [24]  425 	PUSH	DPL
      0004E4 C0 83            [24]  426 	PUSH	DPH
      0004E6 E4               [12]  427 	CLR	A
      0004E7 C0 E0            [24]  428 	PUSH	ACC
      0004E9 C0 E0            [24]  429 	PUSH	ACC
      0004EB C0 E0            [24]  430 	PUSH	ACC
      0004ED C0 E0            [24]  431 	PUSH	ACC
                                    432 ;	preemptive.c:78: PSW = (new_thread << 3);
      0004EF E5 36            [12]  433 	mov	a,_new_thread
      0004F1 C4               [12]  434 	swap	a
      0004F2 03               [12]  435 	rr	a
      0004F3 54 F8            [12]  436 	anl	a,#0xf8
      0004F5 F5 D0            [12]  437 	mov	_PSW,a
                                    438 ;	preemptive.c:82: __endasm;
      0004F7 C0 D0            [24]  439 	PUSH	PSW
                                    440 ;	preemptive.c:84: saved_SP[new_thread] = SP;
      0004F9 E5 36            [12]  441 	mov	a,_new_thread
      0004FB 24 30            [12]  442 	add	a, #_saved_SP
      0004FD F8               [12]  443 	mov	r0,a
      0004FE A6 81            [24]  444 	mov	@r0,_SP
                                    445 ;	preemptive.c:85: SP = old_SP;
      000500 85 37 81         [24]  446 	mov	_SP,_old_SP
                                    447 ;	preemptive.c:87: EA = 1;
                                    448 ;	assignBit
      000503 D2 AF            [12]  449 	setb	_EA
                                    450 ;	preemptive.c:88: return new_thread;
      000505 85 36 82         [24]  451 	mov	dpl, _new_thread
                                    452 ;	preemptive.c:89: }
      000508 22               [24]  453 	ret
                                    454 ;------------------------------------------------------------
                                    455 ;Allocation info for local variables in function 'ThreadYield'
                                    456 ;------------------------------------------------------------
                                    457 ;	preemptive.c:91: void ThreadYield(void)
                                    458 ;	-----------------------------------------
                                    459 ;	 function ThreadYield
                                    460 ;	-----------------------------------------
      000509                        461 _ThreadYield:
                                    462 ;	preemptive.c:93: EA = 0;
                                    463 ;	assignBit
      000509 C2 AF            [12]  464 	clr	_EA
                                    465 ;	preemptive.c:94: SAVESTATE;
      00050B C0 E0            [24]  466 	PUSH ACC 
      00050D C0 F0            [24]  467 	PUSH B 
      00050F C0 82            [24]  468 	PUSH DPL 
      000511 C0 83            [24]  469 	PUSH DPH 
      000513 C0 D0            [24]  470 	PUSH PSW 
      000515 E5 34            [12]  471 	mov	a,_current_thread
      000517 24 30            [12]  472 	add	a, #_saved_SP
      000519 F8               [12]  473 	mov	r0,a
      00051A A6 81            [24]  474 	mov	@r0,_SP
                                    475 ;	preemptive.c:95: do {
      00051C                        476 00110$:
                                    477 ;	preemptive.c:96: current_thread = (current_thread + 1) & 3;
      00051C AF 34            [24]  478 	mov	r7,_current_thread
      00051E 0F               [12]  479 	inc	r7
      00051F 74 03            [12]  480 	mov	a,#0x03
      000521 5F               [12]  481 	anl	a,r7
      000522 F5 34            [12]  482 	mov	_current_thread,a
                                    483 ;	preemptive.c:98: if ((current_thread == 0 && (valid_thread & 0x01)) ||
      000524 E5 34            [12]  484 	mov	a,_current_thread
      000526 70 06            [24]  485 	jnz	00105$
      000528 E5 35            [12]  486 	mov	a,_valid_thread
      00052A FF               [12]  487 	mov	r7,a
      00052B 20 E0 21         [24]  488 	jb	acc.0,00113$
      00052E                        489 00105$:
                                    490 ;	preemptive.c:99: (current_thread == 1 && (valid_thread & 0x02)) ||
      00052E 74 01            [12]  491 	mov	a,#0x01
      000530 B5 34 06         [24]  492 	cjne	a,_current_thread,00107$
      000533 E5 35            [12]  493 	mov	a,_valid_thread
      000535 FF               [12]  494 	mov	r7,a
      000536 20 E1 16         [24]  495 	jb	acc.1,00113$
      000539                        496 00107$:
                                    497 ;	preemptive.c:100: (current_thread == 2 && (valid_thread & 0x04)) ||
      000539 74 02            [12]  498 	mov	a,#0x02
      00053B B5 34 06         [24]  499 	cjne	a,_current_thread,00109$
      00053E E5 35            [12]  500 	mov	a,_valid_thread
      000540 FF               [12]  501 	mov	r7,a
      000541 20 E2 0B         [24]  502 	jb	acc.2,00113$
      000544                        503 00109$:
                                    504 ;	preemptive.c:101: (current_thread == 3 && (valid_thread & 0x08))) {
      000544 74 03            [12]  505 	mov	a,#0x03
      000546 B5 34 D3         [24]  506 	cjne	a,_current_thread,00110$
      000549 E5 35            [12]  507 	mov	a,_valid_thread
      00054B FF               [12]  508 	mov	r7,a
      00054C 30 E3 CD         [24]  509 	jnb	acc.3,00110$
                                    510 ;	preemptive.c:106: found:
      00054F                        511 00113$:
                                    512 ;	preemptive.c:107: RESTORESTATE;
      00054F E5 34            [12]  513 	mov	a,_current_thread
      000551 24 30            [12]  514 	add	a, #_saved_SP
      000553 F9               [12]  515 	mov	r1,a
      000554 87 81            [24]  516 	mov	_SP,@r1
      000556 D0 D0            [24]  517 	POP PSW 
      000558 D0 83            [24]  518 	POP DPH 
      00055A D0 82            [24]  519 	POP DPL 
      00055C D0 F0            [24]  520 	POP B 
      00055E D0 E0            [24]  521 	POP ACC 
                                    522 ;	preemptive.c:108: EA = 1;
                                    523 ;	assignBit
      000560 D2 AF            [12]  524 	setb	_EA
                                    525 ;	preemptive.c:109: }
      000562 22               [24]  526 	ret
                                    527 ;------------------------------------------------------------
                                    528 ;Allocation info for local variables in function 'ThreadExit'
                                    529 ;------------------------------------------------------------
                                    530 ;	preemptive.c:111: void ThreadExit(void)
                                    531 ;	-----------------------------------------
                                    532 ;	 function ThreadExit
                                    533 ;	-----------------------------------------
      000563                        534 _ThreadExit:
                                    535 ;	preemptive.c:122: }
      000563 D2 00            [12]  536 	setb	_ThreadExit_sloc0_1_0
      000565 10 AF 02         [24]  537 	jbc	ea,00127$
      000568 C2 00            [12]  538 	clr	_ThreadExit_sloc0_1_0
      00056A                        539 00127$:
                                    540 ;	preemptive.c:114: valid_thread &= ~(1 << current_thread);
      00056A 85 34 F0         [24]  541 	mov	b,_current_thread
      00056D 05 F0            [12]  542 	inc	b
      00056F 74 01            [12]  543 	mov	a,#0x01
      000571 80 02            [24]  544 	sjmp	00129$
      000573                        545 00128$:
      000573 25 E0            [12]  546 	add	a,acc
      000575                        547 00129$:
      000575 D5 F0 FB         [24]  548 	djnz	b,00128$
      000578 F4               [12]  549 	cpl	a
      000579 52 35            [12]  550 	anl	_valid_thread,a
                                    551 ;	preemptive.c:116: do {
      00057B                        552 00104$:
                                    553 ;	preemptive.c:117: if (current_thread == 3) current_thread = 0;
      00057B 74 03            [12]  554 	mov	a,#0x03
      00057D B5 34 05         [24]  555 	cjne	a,_current_thread,00102$
      000580 75 34 00         [24]  556 	mov	_current_thread,#0x00
      000583 80 05            [24]  557 	sjmp	00105$
      000585                        558 00102$:
                                    559 ;	preemptive.c:118: else current_thread += 1;
      000585 E5 34            [12]  560 	mov	a,_current_thread
      000587 04               [12]  561 	inc	a
      000588 F5 34            [12]  562 	mov	_current_thread,a
      00058A                        563 00105$:
                                    564 ;	preemptive.c:119: } while (!(valid_thread & (1 << current_thread)));
      00058A 85 34 F0         [24]  565 	mov	b,_current_thread
      00058D 05 F0            [12]  566 	inc	b
      00058F 7E 01            [12]  567 	mov	r6,#0x01
      000591 7F 00            [12]  568 	mov	r7,#0x00
      000593 80 06            [24]  569 	sjmp	00133$
      000595                        570 00132$:
      000595 EE               [12]  571 	mov	a,r6
      000596 2E               [12]  572 	add	a,r6
      000597 FE               [12]  573 	mov	r6,a
      000598 EF               [12]  574 	mov	a,r7
      000599 33               [12]  575 	rlc	a
      00059A FF               [12]  576 	mov	r7,a
      00059B                        577 00133$:
      00059B D5 F0 F7         [24]  578 	djnz	b,00132$
      00059E AC 35            [24]  579 	mov	r4,_valid_thread
      0005A0 7D 00            [12]  580 	mov	r5,#0x00
      0005A2 EC               [12]  581 	mov	a,r4
      0005A3 52 06            [12]  582 	anl	ar6,a
      0005A5 ED               [12]  583 	mov	a,r5
      0005A6 52 07            [12]  584 	anl	ar7,a
      0005A8 EE               [12]  585 	mov	a,r6
      0005A9 4F               [12]  586 	orl	a,r7
      0005AA 60 CF            [24]  587 	jz	00104$
                                    588 ;	preemptive.c:121: RESTORESTATE;
      0005AC E5 34            [12]  589 	mov	a,_current_thread
      0005AE 24 30            [12]  590 	add	a, #_saved_SP
      0005B0 F9               [12]  591 	mov	r1,a
      0005B1 87 81            [24]  592 	mov	_SP,@r1
      0005B3 D0 D0            [24]  593 	POP PSW 
      0005B5 D0 83            [24]  594 	POP DPH 
      0005B7 D0 82            [24]  595 	POP DPL 
      0005B9 D0 F0            [24]  596 	POP B 
      0005BB D0 E0            [24]  597 	POP ACC 
      0005BD A2 00            [12]  598 	mov	c,_ThreadExit_sloc0_1_0
      0005BF 92 AF            [24]  599 	mov	ea,c
                                    600 ;	preemptive.c:123: }
      0005C1 22               [24]  601 	ret
                                    602 ;------------------------------------------------------------
                                    603 ;Allocation info for local variables in function 'myTimer0Handler'
                                    604 ;------------------------------------------------------------
                                    605 ;	preemptive.c:125: void myTimer0Handler(void) 
                                    606 ;	-----------------------------------------
                                    607 ;	 function myTimer0Handler
                                    608 ;	-----------------------------------------
      0005C2                        609 _myTimer0Handler:
                                    610 ;	preemptive.c:127: EA = 0;
                                    611 ;	assignBit
      0005C2 C2 AF            [12]  612 	clr	_EA
                                    613 ;	preemptive.c:128: SAVESTATE;
      0005C4 C0 E0            [24]  614 	PUSH ACC 
      0005C6 C0 F0            [24]  615 	PUSH B 
      0005C8 C0 82            [24]  616 	PUSH DPL 
      0005CA C0 83            [24]  617 	PUSH DPH 
      0005CC C0 D0            [24]  618 	PUSH PSW 
      0005CE E5 34            [12]  619 	mov	a,_current_thread
      0005D0 24 30            [12]  620 	add	a, #_saved_SP
      0005D2 F8               [12]  621 	mov	r0,a
      0005D3 A6 81            [24]  622 	mov	@r0,_SP
                                    623 ;	preemptive.c:129: do{
      0005D5                        624 00110$:
                                    625 ;	preemptive.c:130: current_thread = (current_thread + 1) & 3;
      0005D5 AF 34            [24]  626 	mov	r7,_current_thread
      0005D7 0F               [12]  627 	inc	r7
      0005D8 74 03            [12]  628 	mov	a,#0x03
      0005DA 5F               [12]  629 	anl	a,r7
      0005DB F5 34            [12]  630 	mov	_current_thread,a
                                    631 ;	preemptive.c:132: if ((current_thread == 0 && (valid_thread & 0x01)) ||
      0005DD E5 34            [12]  632 	mov	a,_current_thread
      0005DF 70 06            [24]  633 	jnz	00105$
      0005E1 E5 35            [12]  634 	mov	a,_valid_thread
      0005E3 FF               [12]  635 	mov	r7,a
      0005E4 20 E0 21         [24]  636 	jb	acc.0,00113$
      0005E7                        637 00105$:
                                    638 ;	preemptive.c:133: (current_thread == 1 && (valid_thread & 0x02)) ||
      0005E7 74 01            [12]  639 	mov	a,#0x01
      0005E9 B5 34 06         [24]  640 	cjne	a,_current_thread,00107$
      0005EC E5 35            [12]  641 	mov	a,_valid_thread
      0005EE FF               [12]  642 	mov	r7,a
      0005EF 20 E1 16         [24]  643 	jb	acc.1,00113$
      0005F2                        644 00107$:
                                    645 ;	preemptive.c:134: (current_thread == 2 && (valid_thread & 0x04)) ||
      0005F2 74 02            [12]  646 	mov	a,#0x02
      0005F4 B5 34 06         [24]  647 	cjne	a,_current_thread,00109$
      0005F7 E5 35            [12]  648 	mov	a,_valid_thread
      0005F9 FF               [12]  649 	mov	r7,a
      0005FA 20 E2 0B         [24]  650 	jb	acc.2,00113$
      0005FD                        651 00109$:
                                    652 ;	preemptive.c:135: (current_thread == 3 && (valid_thread & 0x08))) {
      0005FD 74 03            [12]  653 	mov	a,#0x03
      0005FF B5 34 D3         [24]  654 	cjne	a,_current_thread,00110$
      000602 E5 35            [12]  655 	mov	a,_valid_thread
      000604 FF               [12]  656 	mov	r7,a
      000605 30 E3 CD         [24]  657 	jnb	acc.3,00110$
                                    658 ;	preemptive.c:140: found:
      000608                        659 00113$:
                                    660 ;	preemptive.c:141: TH0 = (reload_time << 4);
      000608 E5 38            [12]  661 	mov	a,_reload_time
      00060A C4               [12]  662 	swap	a
      00060B 54 F0            [12]  663 	anl	a,#0xf0
      00060D F5 8C            [12]  664 	mov	_TH0,a
                                    665 ;	preemptive.c:142: EA = 1;
                                    666 ;	assignBit
      00060F D2 AF            [12]  667 	setb	_EA
                                    668 ;	preemptive.c:143: RESTORESTATE;
      000611 E5 34            [12]  669 	mov	a,_current_thread
      000613 24 30            [12]  670 	add	a, #_saved_SP
      000615 F9               [12]  671 	mov	r1,a
      000616 87 81            [24]  672 	mov	_SP,@r1
      000618 D0 D0            [24]  673 	POP PSW 
      00061A D0 83            [24]  674 	POP DPH 
      00061C D0 82            [24]  675 	POP DPL 
      00061E D0 F0            [24]  676 	POP B 
      000620 D0 E0            [24]  677 	POP ACC 
                                    678 ;	preemptive.c:147: __endasm;
      000622 32               [24]  679 	RETI
                                    680 ;	preemptive.c:148: }
      000623 22               [24]  681 	ret
                                    682 	.area CSEG    (CODE)
                                    683 	.area CONST   (CODE)
                                    684 	.area XINIT   (CODE)
                                    685 	.area CABS    (ABS,CODE)
