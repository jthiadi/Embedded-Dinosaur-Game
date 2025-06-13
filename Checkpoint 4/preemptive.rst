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
                                    110 	.globl _dir
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
                           000038   239 _dir	=	0x0038
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
      000165                        308 _Bootstrap:
                           000007   309 	ar7 = 0x07
                           000006   310 	ar6 = 0x06
                           000005   311 	ar5 = 0x05
                           000004   312 	ar4 = 0x04
                           000003   313 	ar3 = 0x03
                           000002   314 	ar2 = 0x02
                           000001   315 	ar1 = 0x01
                           000000   316 	ar0 = 0x00
                                    317 ;	preemptive.c:39: TMOD = 0;  		// timer 0 mode 0
      000165 75 89 00         [24]  318 	mov	_TMOD,#0x00
                                    319 ;	preemptive.c:40: IE = 0x82;  	// enable timer 0 interrupt; keep consumer polling
      000168 75 A8 82         [24]  320 	mov	_IE,#0x82
                                    321 ;	preemptive.c:42: TR0 = 1; 		// set bit TR0 to start running timer 0
                                    322 ;	assignBit
      00016B D2 8C            [12]  323 	setb	_TR0
                                    324 ;	preemptive.c:44: valid_thread = 0x00;
      00016D 75 35 00         [24]  325 	mov	_valid_thread,#0x00
                                    326 ;	preemptive.c:46: current_thread = ThreadCreate(main);
      000170 90 01 37         [24]  327 	mov	dptr,#_main
      000173 12 01 8B         [24]  328 	lcall	_ThreadCreate
      000176 85 82 34         [24]  329 	mov	_current_thread,dpl
                                    330 ;	preemptive.c:47: RESTORESTATE;
      000179 E5 34            [12]  331 	mov	a,_current_thread
      00017B 24 30            [12]  332 	add	a, #_saved_SP
      00017D F9               [12]  333 	mov	r1,a
      00017E 87 81            [24]  334 	mov	_SP,@r1
      000180 D0 D0            [24]  335 	POP PSW 
      000182 D0 83            [24]  336 	POP DPH 
      000184 D0 82            [24]  337 	POP DPL 
      000186 D0 F0            [24]  338 	POP B 
      000188 D0 E0            [24]  339 	POP ACC 
                                    340 ;	preemptive.c:48: }
      00018A 22               [24]  341 	ret
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
      00018B                        352 _ThreadCreate:
                                    353 ;	preemptive.c:52: EA = 0;
                                    354 ;	assignBit
      00018B C2 AF            [12]  355 	clr	_EA
                                    356 ;	preemptive.c:53: if (valid_thread == 0xF) return -1; 
      00018D 74 0F            [12]  357 	mov	a,#0x0f
      00018F B5 35 04         [24]  358 	cjne	a,_valid_thread,00102$
      000192 75 82 FF         [24]  359 	mov	dpl, #0xff
      000195 22               [24]  360 	ret
      000196                        361 00102$:
                                    362 ;	preemptive.c:55: new_thread = 3; 
      000196 75 36 03         [24]  363 	mov	_new_thread,#0x03
                                    364 ;	preemptive.c:56: for (int i = 0; i < MAXTHREADS; i++) {
      000199 7F 00            [12]  365 	mov	r7,#0x00
      00019B 7E 00            [12]  366 	mov	r6,#0x00
      00019D                        367 00107$:
      00019D BE 04 00         [24]  368 	cjne	r6,#0x04,00137$
      0001A0                        369 00137$:
      0001A0 50 2A            [24]  370 	jnc	00105$
                                    371 ;	preemptive.c:57: if (!(valid_thread & (1 << i))) {
      0001A2 8E F0            [24]  372 	mov	b,r6
      0001A4 05 F0            [12]  373 	inc	b
      0001A6 7C 01            [12]  374 	mov	r4,#0x01
      0001A8 7D 00            [12]  375 	mov	r5,#0x00
      0001AA 80 06            [24]  376 	sjmp	00140$
      0001AC                        377 00139$:
      0001AC EC               [12]  378 	mov	a,r4
      0001AD 2C               [12]  379 	add	a,r4
      0001AE FC               [12]  380 	mov	r4,a
      0001AF ED               [12]  381 	mov	a,r5
      0001B0 33               [12]  382 	rlc	a
      0001B1 FD               [12]  383 	mov	r5,a
      0001B2                        384 00140$:
      0001B2 D5 F0 F7         [24]  385 	djnz	b,00139$
      0001B5 AA 35            [24]  386 	mov	r2,_valid_thread
      0001B7 7B 00            [12]  387 	mov	r3,#0x00
      0001B9 EA               [12]  388 	mov	a,r2
      0001BA 52 04            [12]  389 	anl	ar4,a
      0001BC EB               [12]  390 	mov	a,r3
      0001BD 52 05            [12]  391 	anl	ar5,a
      0001BF EC               [12]  392 	mov	a,r4
      0001C0 4D               [12]  393 	orl	a,r5
      0001C1 70 04            [24]  394 	jnz	00108$
                                    395 ;	preemptive.c:58: new_thread = i;
      0001C3 8F 36            [24]  396 	mov	_new_thread,r7
                                    397 ;	preemptive.c:59: break;
      0001C5 80 05            [24]  398 	sjmp	00105$
      0001C7                        399 00108$:
                                    400 ;	preemptive.c:56: for (int i = 0; i < MAXTHREADS; i++) {
      0001C7 0E               [12]  401 	inc	r6
      0001C8 8E 07            [24]  402 	mov	ar7,r6
      0001CA 80 D1            [24]  403 	sjmp	00107$
      0001CC                        404 00105$:
                                    405 ;	preemptive.c:63: valid_thread |= (1 << new_thread);
      0001CC 85 36 F0         [24]  406 	mov	b,_new_thread
      0001CF 05 F0            [12]  407 	inc	b
      0001D1 74 01            [12]  408 	mov	a,#0x01
      0001D3 80 02            [24]  409 	sjmp	00143$
      0001D5                        410 00142$:
      0001D5 25 E0            [12]  411 	add	a,acc
      0001D7                        412 00143$:
      0001D7 D5 F0 FB         [24]  413 	djnz	b,00142$
      0001DA 42 35            [12]  414 	orl	_valid_thread,a
                                    415 ;	preemptive.c:65: old_SP = SP;
      0001DC 85 81 37         [24]  416 	mov	_old_SP,_SP
                                    417 ;	preemptive.c:66: SP = (0x3A) + (new_thread * 8);
      0001DF E5 36            [12]  418 	mov	a,_new_thread
      0001E1 C4               [12]  419 	swap	a
      0001E2 03               [12]  420 	rr	a
      0001E3 54 F8            [12]  421 	anl	a,#0xf8
      0001E5 FF               [12]  422 	mov	r7,a
      0001E6 24 3A            [12]  423 	add	a,#0x3a
      0001E8 F5 81            [12]  424 	mov	_SP,a
                                    425 ;	preemptive.c:76: __endasm;
      0001EA C0 82            [24]  426 	PUSH	DPL
      0001EC C0 83            [24]  427 	PUSH	DPH
      0001EE E4               [12]  428 	CLR	A
      0001EF C0 E0            [24]  429 	PUSH	ACC
      0001F1 C0 E0            [24]  430 	PUSH	ACC
      0001F3 C0 E0            [24]  431 	PUSH	ACC
      0001F5 C0 E0            [24]  432 	PUSH	ACC
                                    433 ;	preemptive.c:78: PSW = (new_thread << 3);
      0001F7 E5 36            [12]  434 	mov	a,_new_thread
      0001F9 C4               [12]  435 	swap	a
      0001FA 03               [12]  436 	rr	a
      0001FB 54 F8            [12]  437 	anl	a,#0xf8
      0001FD F5 D0            [12]  438 	mov	_PSW,a
                                    439 ;	preemptive.c:82: __endasm;
      0001FF C0 D0            [24]  440 	PUSH	PSW
                                    441 ;	preemptive.c:84: saved_SP[new_thread] = SP;
      000201 E5 36            [12]  442 	mov	a,_new_thread
      000203 24 30            [12]  443 	add	a, #_saved_SP
      000205 F8               [12]  444 	mov	r0,a
      000206 A6 81            [24]  445 	mov	@r0,_SP
                                    446 ;	preemptive.c:85: SP = old_SP;
      000208 85 37 81         [24]  447 	mov	_SP,_old_SP
                                    448 ;	preemptive.c:87: EA = 1;
                                    449 ;	assignBit
      00020B D2 AF            [12]  450 	setb	_EA
                                    451 ;	preemptive.c:88: return new_thread;
      00020D 85 36 82         [24]  452 	mov	dpl, _new_thread
                                    453 ;	preemptive.c:89: }
      000210 22               [24]  454 	ret
                                    455 ;------------------------------------------------------------
                                    456 ;Allocation info for local variables in function 'ThreadYield'
                                    457 ;------------------------------------------------------------
                                    458 ;	preemptive.c:91: void ThreadYield(void)
                                    459 ;	-----------------------------------------
                                    460 ;	 function ThreadYield
                                    461 ;	-----------------------------------------
      000211                        462 _ThreadYield:
                                    463 ;	preemptive.c:93: EA = 0;
                                    464 ;	assignBit
      000211 C2 AF            [12]  465 	clr	_EA
                                    466 ;	preemptive.c:94: SAVESTATE;
      000213 C0 E0            [24]  467 	PUSH ACC 
      000215 C0 F0            [24]  468 	PUSH B 
      000217 C0 82            [24]  469 	PUSH DPL 
      000219 C0 83            [24]  470 	PUSH DPH 
      00021B C0 D0            [24]  471 	PUSH PSW 
      00021D E5 34            [12]  472 	mov	a,_current_thread
      00021F 24 30            [12]  473 	add	a, #_saved_SP
      000221 F8               [12]  474 	mov	r0,a
      000222 A6 81            [24]  475 	mov	@r0,_SP
                                    476 ;	preemptive.c:95: do {
      000224                        477 00110$:
                                    478 ;	preemptive.c:96: current_thread = (current_thread + 1) & 3;
      000224 AF 34            [24]  479 	mov	r7,_current_thread
      000226 0F               [12]  480 	inc	r7
      000227 74 03            [12]  481 	mov	a,#0x03
      000229 5F               [12]  482 	anl	a,r7
      00022A F5 34            [12]  483 	mov	_current_thread,a
                                    484 ;	preemptive.c:98: if ((current_thread == 0 && (valid_thread & 0x01)) ||
      00022C E5 34            [12]  485 	mov	a,_current_thread
      00022E 70 06            [24]  486 	jnz	00105$
      000230 E5 35            [12]  487 	mov	a,_valid_thread
      000232 FF               [12]  488 	mov	r7,a
      000233 20 E0 21         [24]  489 	jb	acc.0,00113$
      000236                        490 00105$:
                                    491 ;	preemptive.c:99: (current_thread == 1 && (valid_thread & 0x02)) ||
      000236 74 01            [12]  492 	mov	a,#0x01
      000238 B5 34 06         [24]  493 	cjne	a,_current_thread,00107$
      00023B E5 35            [12]  494 	mov	a,_valid_thread
      00023D FF               [12]  495 	mov	r7,a
      00023E 20 E1 16         [24]  496 	jb	acc.1,00113$
      000241                        497 00107$:
                                    498 ;	preemptive.c:100: (current_thread == 2 && (valid_thread & 0x04)) ||
      000241 74 02            [12]  499 	mov	a,#0x02
      000243 B5 34 06         [24]  500 	cjne	a,_current_thread,00109$
      000246 E5 35            [12]  501 	mov	a,_valid_thread
      000248 FF               [12]  502 	mov	r7,a
      000249 20 E2 0B         [24]  503 	jb	acc.2,00113$
      00024C                        504 00109$:
                                    505 ;	preemptive.c:101: (current_thread == 3 && (valid_thread & 0x08))) {
      00024C 74 03            [12]  506 	mov	a,#0x03
      00024E B5 34 D3         [24]  507 	cjne	a,_current_thread,00110$
      000251 E5 35            [12]  508 	mov	a,_valid_thread
      000253 FF               [12]  509 	mov	r7,a
      000254 30 E3 CD         [24]  510 	jnb	acc.3,00110$
                                    511 ;	preemptive.c:106: found:
      000257                        512 00113$:
                                    513 ;	preemptive.c:107: RESTORESTATE;
      000257 E5 34            [12]  514 	mov	a,_current_thread
      000259 24 30            [12]  515 	add	a, #_saved_SP
      00025B F9               [12]  516 	mov	r1,a
      00025C 87 81            [24]  517 	mov	_SP,@r1
      00025E D0 D0            [24]  518 	POP PSW 
      000260 D0 83            [24]  519 	POP DPH 
      000262 D0 82            [24]  520 	POP DPL 
      000264 D0 F0            [24]  521 	POP B 
      000266 D0 E0            [24]  522 	POP ACC 
                                    523 ;	preemptive.c:108: EA = 1;
                                    524 ;	assignBit
      000268 D2 AF            [12]  525 	setb	_EA
                                    526 ;	preemptive.c:109: }
      00026A 22               [24]  527 	ret
                                    528 ;------------------------------------------------------------
                                    529 ;Allocation info for local variables in function 'ThreadExit'
                                    530 ;------------------------------------------------------------
                                    531 ;	preemptive.c:111: void ThreadExit(void)
                                    532 ;	-----------------------------------------
                                    533 ;	 function ThreadExit
                                    534 ;	-----------------------------------------
      00026B                        535 _ThreadExit:
                                    536 ;	preemptive.c:122: }
      00026B D2 00            [12]  537 	setb	_ThreadExit_sloc0_1_0
      00026D 10 AF 02         [24]  538 	jbc	ea,00127$
      000270 C2 00            [12]  539 	clr	_ThreadExit_sloc0_1_0
      000272                        540 00127$:
                                    541 ;	preemptive.c:114: valid_thread &= ~(1 << current_thread);
      000272 85 34 F0         [24]  542 	mov	b,_current_thread
      000275 05 F0            [12]  543 	inc	b
      000277 74 01            [12]  544 	mov	a,#0x01
      000279 80 02            [24]  545 	sjmp	00129$
      00027B                        546 00128$:
      00027B 25 E0            [12]  547 	add	a,acc
      00027D                        548 00129$:
      00027D D5 F0 FB         [24]  549 	djnz	b,00128$
      000280 F4               [12]  550 	cpl	a
      000281 52 35            [12]  551 	anl	_valid_thread,a
                                    552 ;	preemptive.c:116: do {
      000283                        553 00104$:
                                    554 ;	preemptive.c:117: if (current_thread == 3) current_thread = 0;
      000283 74 03            [12]  555 	mov	a,#0x03
      000285 B5 34 05         [24]  556 	cjne	a,_current_thread,00102$
      000288 75 34 00         [24]  557 	mov	_current_thread,#0x00
      00028B 80 05            [24]  558 	sjmp	00105$
      00028D                        559 00102$:
                                    560 ;	preemptive.c:118: else current_thread += 1;
      00028D E5 34            [12]  561 	mov	a,_current_thread
      00028F 04               [12]  562 	inc	a
      000290 F5 34            [12]  563 	mov	_current_thread,a
      000292                        564 00105$:
                                    565 ;	preemptive.c:119: } while (!(valid_thread & (1 << current_thread)));
      000292 85 34 F0         [24]  566 	mov	b,_current_thread
      000295 05 F0            [12]  567 	inc	b
      000297 7E 01            [12]  568 	mov	r6,#0x01
      000299 7F 00            [12]  569 	mov	r7,#0x00
      00029B 80 06            [24]  570 	sjmp	00133$
      00029D                        571 00132$:
      00029D EE               [12]  572 	mov	a,r6
      00029E 2E               [12]  573 	add	a,r6
      00029F FE               [12]  574 	mov	r6,a
      0002A0 EF               [12]  575 	mov	a,r7
      0002A1 33               [12]  576 	rlc	a
      0002A2 FF               [12]  577 	mov	r7,a
      0002A3                        578 00133$:
      0002A3 D5 F0 F7         [24]  579 	djnz	b,00132$
      0002A6 AC 35            [24]  580 	mov	r4,_valid_thread
      0002A8 7D 00            [12]  581 	mov	r5,#0x00
      0002AA EC               [12]  582 	mov	a,r4
      0002AB 52 06            [12]  583 	anl	ar6,a
      0002AD ED               [12]  584 	mov	a,r5
      0002AE 52 07            [12]  585 	anl	ar7,a
      0002B0 EE               [12]  586 	mov	a,r6
      0002B1 4F               [12]  587 	orl	a,r7
      0002B2 60 CF            [24]  588 	jz	00104$
                                    589 ;	preemptive.c:121: RESTORESTATE;
      0002B4 E5 34            [12]  590 	mov	a,_current_thread
      0002B6 24 30            [12]  591 	add	a, #_saved_SP
      0002B8 F9               [12]  592 	mov	r1,a
      0002B9 87 81            [24]  593 	mov	_SP,@r1
      0002BB D0 D0            [24]  594 	POP PSW 
      0002BD D0 83            [24]  595 	POP DPH 
      0002BF D0 82            [24]  596 	POP DPL 
      0002C1 D0 F0            [24]  597 	POP B 
      0002C3 D0 E0            [24]  598 	POP ACC 
      0002C5 A2 00            [12]  599 	mov	c,_ThreadExit_sloc0_1_0
      0002C7 92 AF            [24]  600 	mov	ea,c
                                    601 ;	preemptive.c:123: }
      0002C9 22               [24]  602 	ret
                                    603 ;------------------------------------------------------------
                                    604 ;Allocation info for local variables in function 'myTimer0Handler'
                                    605 ;------------------------------------------------------------
                                    606 ;	preemptive.c:125: void myTimer0Handler(void)
                                    607 ;	-----------------------------------------
                                    608 ;	 function myTimer0Handler
                                    609 ;	-----------------------------------------
      0002CA                        610 _myTimer0Handler:
                                    611 ;	preemptive.c:127: EA = 0;
                                    612 ;	assignBit
      0002CA C2 AF            [12]  613 	clr	_EA
                                    614 ;	preemptive.c:128: SAVESTATE;
      0002CC C0 E0            [24]  615 	PUSH ACC 
      0002CE C0 F0            [24]  616 	PUSH B 
      0002D0 C0 82            [24]  617 	PUSH DPL 
      0002D2 C0 83            [24]  618 	PUSH DPH 
      0002D4 C0 D0            [24]  619 	PUSH PSW 
      0002D6 E5 34            [12]  620 	mov	a,_current_thread
      0002D8 24 30            [12]  621 	add	a, #_saved_SP
      0002DA F8               [12]  622 	mov	r0,a
      0002DB A6 81            [24]  623 	mov	@r0,_SP
                                    624 ;	preemptive.c:130: do {
      0002DD                        625 00110$:
                                    626 ;	preemptive.c:131: current_thread = (current_thread + dir) & 3;
      0002DD E5 38            [12]  627 	mov	a,_dir
      0002DF 25 34            [12]  628 	add	a, _current_thread
      0002E1 54 03            [12]  629 	anl	a,#0x03
      0002E3 F5 34            [12]  630 	mov	_current_thread,a
                                    631 ;	preemptive.c:133: if ((current_thread == 0 && ((dir = ~dir | 0x01), (valid_thread & 0x01))) ||
      0002E5 E5 34            [12]  632 	mov	a,_current_thread
      0002E7 70 0F            [24]  633 	jnz	00105$
      0002E9 E5 38            [12]  634 	mov	a,_dir
      0002EB F4               [12]  635 	cpl	a
      0002EC FF               [12]  636 	mov	r7,a
      0002ED 74 01            [12]  637 	mov	a,#0x01
      0002EF 4F               [12]  638 	orl	a,r7
      0002F0 F5 38            [12]  639 	mov	_dir,a
      0002F2 E5 35            [12]  640 	mov	a,_valid_thread
      0002F4 FF               [12]  641 	mov	r7,a
      0002F5 20 E0 21         [24]  642 	jb	acc.0,00113$
      0002F8                        643 00105$:
                                    644 ;	preemptive.c:134: (current_thread == 1 && (valid_thread & 0x02)) ||
      0002F8 74 01            [12]  645 	mov	a,#0x01
      0002FA B5 34 06         [24]  646 	cjne	a,_current_thread,00107$
      0002FD E5 35            [12]  647 	mov	a,_valid_thread
      0002FF FF               [12]  648 	mov	r7,a
      000300 20 E1 16         [24]  649 	jb	acc.1,00113$
      000303                        650 00107$:
                                    651 ;	preemptive.c:135: (current_thread == 2 && (valid_thread & 0x04)) ||
      000303 74 02            [12]  652 	mov	a,#0x02
      000305 B5 34 06         [24]  653 	cjne	a,_current_thread,00109$
      000308 E5 35            [12]  654 	mov	a,_valid_thread
      00030A FF               [12]  655 	mov	r7,a
      00030B 20 E2 0B         [24]  656 	jb	acc.2,00113$
      00030E                        657 00109$:
                                    658 ;	preemptive.c:136: (current_thread == 3 && (valid_thread & 0x08))) {
      00030E 74 03            [12]  659 	mov	a,#0x03
      000310 B5 34 CA         [24]  660 	cjne	a,_current_thread,00110$
      000313 E5 35            [12]  661 	mov	a,_valid_thread
      000315 FF               [12]  662 	mov	r7,a
      000316 30 E3 C4         [24]  663 	jnb	acc.3,00110$
                                    664 ;	preemptive.c:141: found:
      000319                        665 00113$:
                                    666 ;	preemptive.c:142: RESTORESTATE;
      000319 E5 34            [12]  667 	mov	a,_current_thread
      00031B 24 30            [12]  668 	add	a, #_saved_SP
      00031D F9               [12]  669 	mov	r1,a
      00031E 87 81            [24]  670 	mov	_SP,@r1
      000320 D0 D0            [24]  671 	POP PSW 
      000322 D0 83            [24]  672 	POP DPH 
      000324 D0 82            [24]  673 	POP DPL 
      000326 D0 F0            [24]  674 	POP B 
      000328 D0 E0            [24]  675 	POP ACC 
                                    676 ;	preemptive.c:143: EA = 1;
                                    677 ;	assignBit
      00032A D2 AF            [12]  678 	setb	_EA
                                    679 ;	preemptive.c:147: __endasm;
      00032C 32               [24]  680 	RETI
                                    681 ;	preemptive.c:148: }
      00032D 22               [24]  682 	ret
                                    683 	.area CSEG    (CODE)
                                    684 	.area CONST   (CODE)
                                    685 	.area XINIT   (CODE)
                                    686 	.area CABS    (ABS,CODE)
