                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ISO C Compiler
                                      3 ; Version 4.5.0 #15242 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module cooperative
                                      6 	
                                      7 	.optsdcc -mmcs51 --model-small
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _Bootstrap
                                     12 	.globl _main
                                     13 	.globl _CY
                                     14 	.globl _AC
                                     15 	.globl _F0
                                     16 	.globl _RS1
                                     17 	.globl _RS0
                                     18 	.globl _OV
                                     19 	.globl _F1
                                     20 	.globl _P
                                     21 	.globl _PS
                                     22 	.globl _PT1
                                     23 	.globl _PX1
                                     24 	.globl _PT0
                                     25 	.globl _PX0
                                     26 	.globl _RD
                                     27 	.globl _WR
                                     28 	.globl _T1
                                     29 	.globl _T0
                                     30 	.globl _INT1
                                     31 	.globl _INT0
                                     32 	.globl _TXD
                                     33 	.globl _RXD
                                     34 	.globl _P3_7
                                     35 	.globl _P3_6
                                     36 	.globl _P3_5
                                     37 	.globl _P3_4
                                     38 	.globl _P3_3
                                     39 	.globl _P3_2
                                     40 	.globl _P3_1
                                     41 	.globl _P3_0
                                     42 	.globl _EA
                                     43 	.globl _ES
                                     44 	.globl _ET1
                                     45 	.globl _EX1
                                     46 	.globl _ET0
                                     47 	.globl _EX0
                                     48 	.globl _P2_7
                                     49 	.globl _P2_6
                                     50 	.globl _P2_5
                                     51 	.globl _P2_4
                                     52 	.globl _P2_3
                                     53 	.globl _P2_2
                                     54 	.globl _P2_1
                                     55 	.globl _P2_0
                                     56 	.globl _SM0
                                     57 	.globl _SM1
                                     58 	.globl _SM2
                                     59 	.globl _REN
                                     60 	.globl _TB8
                                     61 	.globl _RB8
                                     62 	.globl _TI
                                     63 	.globl _RI
                                     64 	.globl _P1_7
                                     65 	.globl _P1_6
                                     66 	.globl _P1_5
                                     67 	.globl _P1_4
                                     68 	.globl _P1_3
                                     69 	.globl _P1_2
                                     70 	.globl _P1_1
                                     71 	.globl _P1_0
                                     72 	.globl _TF1
                                     73 	.globl _TR1
                                     74 	.globl _TF0
                                     75 	.globl _TR0
                                     76 	.globl _IE1
                                     77 	.globl _IT1
                                     78 	.globl _IE0
                                     79 	.globl _IT0
                                     80 	.globl _P0_7
                                     81 	.globl _P0_6
                                     82 	.globl _P0_5
                                     83 	.globl _P0_4
                                     84 	.globl _P0_3
                                     85 	.globl _P0_2
                                     86 	.globl _P0_1
                                     87 	.globl _P0_0
                                     88 	.globl _B
                                     89 	.globl _ACC
                                     90 	.globl _PSW
                                     91 	.globl _IP
                                     92 	.globl _P3
                                     93 	.globl _IE
                                     94 	.globl _P2
                                     95 	.globl _SBUF
                                     96 	.globl _SCON
                                     97 	.globl _P1
                                     98 	.globl _TH1
                                     99 	.globl _TH0
                                    100 	.globl _TL1
                                    101 	.globl _TL0
                                    102 	.globl _TMOD
                                    103 	.globl _TCON
                                    104 	.globl _PCON
                                    105 	.globl _DPH
                                    106 	.globl _DPL
                                    107 	.globl _SP
                                    108 	.globl _P0
                                    109 	.globl _old_SP
                                    110 	.globl _new_thread
                                    111 	.globl _valid_thread
                                    112 	.globl _current_thread
                                    113 	.globl _saved_SP
                                    114 	.globl _ThreadCreate
                                    115 	.globl _ThreadYield
                                    116 	.globl _ThreadExit
                                    117 ;--------------------------------------------------------
                                    118 ; special function registers
                                    119 ;--------------------------------------------------------
                                    120 	.area RSEG    (ABS,DATA)
      000000                        121 	.org 0x0000
                           000080   122 _P0	=	0x0080
                           000081   123 _SP	=	0x0081
                           000082   124 _DPL	=	0x0082
                           000083   125 _DPH	=	0x0083
                           000087   126 _PCON	=	0x0087
                           000088   127 _TCON	=	0x0088
                           000089   128 _TMOD	=	0x0089
                           00008A   129 _TL0	=	0x008a
                           00008B   130 _TL1	=	0x008b
                           00008C   131 _TH0	=	0x008c
                           00008D   132 _TH1	=	0x008d
                           000090   133 _P1	=	0x0090
                           000098   134 _SCON	=	0x0098
                           000099   135 _SBUF	=	0x0099
                           0000A0   136 _P2	=	0x00a0
                           0000A8   137 _IE	=	0x00a8
                           0000B0   138 _P3	=	0x00b0
                           0000B8   139 _IP	=	0x00b8
                           0000D0   140 _PSW	=	0x00d0
                           0000E0   141 _ACC	=	0x00e0
                           0000F0   142 _B	=	0x00f0
                                    143 ;--------------------------------------------------------
                                    144 ; special function bits
                                    145 ;--------------------------------------------------------
                                    146 	.area RSEG    (ABS,DATA)
      000000                        147 	.org 0x0000
                           000080   148 _P0_0	=	0x0080
                           000081   149 _P0_1	=	0x0081
                           000082   150 _P0_2	=	0x0082
                           000083   151 _P0_3	=	0x0083
                           000084   152 _P0_4	=	0x0084
                           000085   153 _P0_5	=	0x0085
                           000086   154 _P0_6	=	0x0086
                           000087   155 _P0_7	=	0x0087
                           000088   156 _IT0	=	0x0088
                           000089   157 _IE0	=	0x0089
                           00008A   158 _IT1	=	0x008a
                           00008B   159 _IE1	=	0x008b
                           00008C   160 _TR0	=	0x008c
                           00008D   161 _TF0	=	0x008d
                           00008E   162 _TR1	=	0x008e
                           00008F   163 _TF1	=	0x008f
                           000090   164 _P1_0	=	0x0090
                           000091   165 _P1_1	=	0x0091
                           000092   166 _P1_2	=	0x0092
                           000093   167 _P1_3	=	0x0093
                           000094   168 _P1_4	=	0x0094
                           000095   169 _P1_5	=	0x0095
                           000096   170 _P1_6	=	0x0096
                           000097   171 _P1_7	=	0x0097
                           000098   172 _RI	=	0x0098
                           000099   173 _TI	=	0x0099
                           00009A   174 _RB8	=	0x009a
                           00009B   175 _TB8	=	0x009b
                           00009C   176 _REN	=	0x009c
                           00009D   177 _SM2	=	0x009d
                           00009E   178 _SM1	=	0x009e
                           00009F   179 _SM0	=	0x009f
                           0000A0   180 _P2_0	=	0x00a0
                           0000A1   181 _P2_1	=	0x00a1
                           0000A2   182 _P2_2	=	0x00a2
                           0000A3   183 _P2_3	=	0x00a3
                           0000A4   184 _P2_4	=	0x00a4
                           0000A5   185 _P2_5	=	0x00a5
                           0000A6   186 _P2_6	=	0x00a6
                           0000A7   187 _P2_7	=	0x00a7
                           0000A8   188 _EX0	=	0x00a8
                           0000A9   189 _ET0	=	0x00a9
                           0000AA   190 _EX1	=	0x00aa
                           0000AB   191 _ET1	=	0x00ab
                           0000AC   192 _ES	=	0x00ac
                           0000AF   193 _EA	=	0x00af
                           0000B0   194 _P3_0	=	0x00b0
                           0000B1   195 _P3_1	=	0x00b1
                           0000B2   196 _P3_2	=	0x00b2
                           0000B3   197 _P3_3	=	0x00b3
                           0000B4   198 _P3_4	=	0x00b4
                           0000B5   199 _P3_5	=	0x00b5
                           0000B6   200 _P3_6	=	0x00b6
                           0000B7   201 _P3_7	=	0x00b7
                           0000B0   202 _RXD	=	0x00b0
                           0000B1   203 _TXD	=	0x00b1
                           0000B2   204 _INT0	=	0x00b2
                           0000B3   205 _INT1	=	0x00b3
                           0000B4   206 _T0	=	0x00b4
                           0000B5   207 _T1	=	0x00b5
                           0000B6   208 _WR	=	0x00b6
                           0000B7   209 _RD	=	0x00b7
                           0000B8   210 _PX0	=	0x00b8
                           0000B9   211 _PT0	=	0x00b9
                           0000BA   212 _PX1	=	0x00ba
                           0000BB   213 _PT1	=	0x00bb
                           0000BC   214 _PS	=	0x00bc
                           0000D0   215 _P	=	0x00d0
                           0000D1   216 _F1	=	0x00d1
                           0000D2   217 _OV	=	0x00d2
                           0000D3   218 _RS0	=	0x00d3
                           0000D4   219 _RS1	=	0x00d4
                           0000D5   220 _F0	=	0x00d5
                           0000D6   221 _AC	=	0x00d6
                           0000D7   222 _CY	=	0x00d7
                                    223 ;--------------------------------------------------------
                                    224 ; overlayable register banks
                                    225 ;--------------------------------------------------------
                                    226 	.area REG_BANK_0	(REL,OVR,DATA)
      000000                        227 	.ds 8
                                    228 ;--------------------------------------------------------
                                    229 ; internal ram data
                                    230 ;--------------------------------------------------------
                                    231 	.area DSEG    (DATA)
                           000030   232 _saved_SP	=	0x0030
                           000034   233 _current_thread	=	0x0034
                           000035   234 _valid_thread	=	0x0035
                           000036   235 _new_thread	=	0x0036
                           000037   236 _old_SP	=	0x0037
                                    237 ;--------------------------------------------------------
                                    238 ; overlayable items in internal ram
                                    239 ;--------------------------------------------------------
                                    240 	.area	OSEG    (OVR,DATA)
                                    241 ;--------------------------------------------------------
                                    242 ; indirectly addressable internal ram data
                                    243 ;--------------------------------------------------------
                                    244 	.area ISEG    (DATA)
                                    245 ;--------------------------------------------------------
                                    246 ; absolute internal ram data
                                    247 ;--------------------------------------------------------
                                    248 	.area IABS    (ABS,DATA)
                                    249 	.area IABS    (ABS,DATA)
                                    250 ;--------------------------------------------------------
                                    251 ; bit data
                                    252 ;--------------------------------------------------------
                                    253 	.area BSEG    (BIT)
                                    254 ;--------------------------------------------------------
                                    255 ; paged external ram data
                                    256 ;--------------------------------------------------------
                                    257 	.area PSEG    (PAG,XDATA)
                                    258 ;--------------------------------------------------------
                                    259 ; uninitialized external ram data
                                    260 ;--------------------------------------------------------
                                    261 	.area XSEG    (XDATA)
                                    262 ;--------------------------------------------------------
                                    263 ; absolute external ram data
                                    264 ;--------------------------------------------------------
                                    265 	.area XABS    (ABS,XDATA)
                                    266 ;--------------------------------------------------------
                                    267 ; initialized external ram data
                                    268 ;--------------------------------------------------------
                                    269 	.area XISEG   (XDATA)
                                    270 	.area HOME    (CODE)
                                    271 	.area GSINIT0 (CODE)
                                    272 	.area GSINIT1 (CODE)
                                    273 	.area GSINIT2 (CODE)
                                    274 	.area GSINIT3 (CODE)
                                    275 	.area GSINIT4 (CODE)
                                    276 	.area GSINIT5 (CODE)
                                    277 	.area GSINIT  (CODE)
                                    278 	.area GSFINAL (CODE)
                                    279 	.area CSEG    (CODE)
                                    280 ;--------------------------------------------------------
                                    281 ; global & static initialisations
                                    282 ;--------------------------------------------------------
                                    283 	.area HOME    (CODE)
                                    284 	.area GSINIT  (CODE)
                                    285 	.area GSFINAL (CODE)
                                    286 	.area GSINIT  (CODE)
                                    287 ;--------------------------------------------------------
                                    288 ; Home
                                    289 ;--------------------------------------------------------
                                    290 	.area HOME    (CODE)
                                    291 	.area HOME    (CODE)
                                    292 ;--------------------------------------------------------
                                    293 ; code
                                    294 ;--------------------------------------------------------
                                    295 	.area CSEG    (CODE)
                                    296 ;------------------------------------------------------------
                                    297 ;Allocation info for local variables in function 'Bootstrap'
                                    298 ;------------------------------------------------------------
                                    299 ;	cooperative.c:76: void Bootstrap(void)
                                    300 ;	-----------------------------------------
                                    301 ;	 function Bootstrap
                                    302 ;	-----------------------------------------
      0000A7                        303 _Bootstrap:
                           000007   304 	ar7 = 0x07
                           000006   305 	ar6 = 0x06
                           000005   306 	ar5 = 0x05
                           000004   307 	ar4 = 0x04
                           000003   308 	ar3 = 0x03
                           000002   309 	ar2 = 0x02
                           000001   310 	ar1 = 0x01
                           000000   311 	ar0 = 0x00
                                    312 ;	cooperative.c:79: valid_thread = 0x00; // initialize: gaada yg aktif awalnya threadnya
      0000A7 75 35 00         [24]  313 	mov	_valid_thread,#0x00
                                    314 ;	cooperative.c:82: current_thread = ThreadCreate(main);  // bkin thread buat main, kasi thread ID (dia setup stack buat main, jadi thread bs jump ke main)
      0000AA 90 00 91         [24]  315 	mov	dptr,#_main
      0000AD 12 00 C5         [24]  316 	lcall	_ThreadCreate
      0000B0 85 82 34         [24]  317 	mov	_current_thread,dpl
                                    318 ;	cooperative.c:83: RESTORESTATE;                         // restore the context
      0000B3 E5 34            [12]  319 	mov	a,_current_thread
      0000B5 24 30            [12]  320 	add	a, #_saved_SP
      0000B7 F9               [12]  321 	mov	r1,a
      0000B8 87 81            [24]  322 	mov	_SP,@r1
      0000BA D0 D0            [24]  323 	POP PSW 
      0000BC D0 83            [24]  324 	POP DPH 
      0000BE D0 82            [24]  325 	POP DPL 
      0000C0 D0 F0            [24]  326 	POP B 
      0000C2 D0 E0            [24]  327 	POP ACC 
                                    328 ;	cooperative.c:84: }
      0000C4 22               [24]  329 	ret
                                    330 ;------------------------------------------------------------
                                    331 ;Allocation info for local variables in function 'ThreadCreate'
                                    332 ;------------------------------------------------------------
                                    333 ;fp            Allocated to registers 
                                    334 ;i             Allocated to registers r7 
                                    335 ;------------------------------------------------------------
                                    336 ;	cooperative.c:92: ThreadID ThreadCreate(FunctionPtr fp)
                                    337 ;	-----------------------------------------
                                    338 ;	 function ThreadCreate
                                    339 ;	-----------------------------------------
      0000C5                        340 _ThreadCreate:
                                    341 ;	cooperative.c:95: if (valid_thread == 0xF) return -1; 
      0000C5 74 0F            [12]  342 	mov	a,#0x0f
      0000C7 B5 35 04         [24]  343 	cjne	a,_valid_thread,00102$
      0000CA 75 82 FF         [24]  344 	mov	dpl, #0xff
      0000CD 22               [24]  345 	ret
      0000CE                        346 00102$:
                                    347 ;	cooperative.c:105: new_thread = 3; 
      0000CE 75 36 03         [24]  348 	mov	_new_thread,#0x03
                                    349 ;	cooperative.c:106: for (int i = 0; i < MAXTHREADS; i++) {
      0000D1 7F 00            [12]  350 	mov	r7,#0x00
      0000D3 7E 00            [12]  351 	mov	r6,#0x00
      0000D5                        352 00107$:
      0000D5 BE 04 00         [24]  353 	cjne	r6,#0x04,00137$
      0000D8                        354 00137$:
      0000D8 50 2A            [24]  355 	jnc	00105$
                                    356 ;	cooperative.c:107: if (!(valid_thread & (1 << i))) {
      0000DA 8E F0            [24]  357 	mov	b,r6
      0000DC 05 F0            [12]  358 	inc	b
      0000DE 7C 01            [12]  359 	mov	r4,#0x01
      0000E0 7D 00            [12]  360 	mov	r5,#0x00
      0000E2 80 06            [24]  361 	sjmp	00140$
      0000E4                        362 00139$:
      0000E4 EC               [12]  363 	mov	a,r4
      0000E5 2C               [12]  364 	add	a,r4
      0000E6 FC               [12]  365 	mov	r4,a
      0000E7 ED               [12]  366 	mov	a,r5
      0000E8 33               [12]  367 	rlc	a
      0000E9 FD               [12]  368 	mov	r5,a
      0000EA                        369 00140$:
      0000EA D5 F0 F7         [24]  370 	djnz	b,00139$
      0000ED AA 35            [24]  371 	mov	r2,_valid_thread
      0000EF 7B 00            [12]  372 	mov	r3,#0x00
      0000F1 EA               [12]  373 	mov	a,r2
      0000F2 52 04            [12]  374 	anl	ar4,a
      0000F4 EB               [12]  375 	mov	a,r3
      0000F5 52 05            [12]  376 	anl	ar5,a
      0000F7 EC               [12]  377 	mov	a,r4
      0000F8 4D               [12]  378 	orl	a,r5
      0000F9 70 04            [24]  379 	jnz	00108$
                                    380 ;	cooperative.c:108: new_thread = i;
      0000FB 8F 36            [24]  381 	mov	_new_thread,r7
                                    382 ;	cooperative.c:109: break;
      0000FD 80 05            [24]  383 	sjmp	00105$
      0000FF                        384 00108$:
                                    385 ;	cooperative.c:106: for (int i = 0; i < MAXTHREADS; i++) {
      0000FF 0E               [12]  386 	inc	r6
      000100 8E 07            [24]  387 	mov	ar7,r6
      000102 80 D1            [24]  388 	sjmp	00107$
      000104                        389 00105$:
                                    390 ;	cooperative.c:113: valid_thread |= (1 << new_thread);
      000104 85 36 F0         [24]  391 	mov	b,_new_thread
      000107 05 F0            [12]  392 	inc	b
      000109 74 01            [12]  393 	mov	a,#0x01
      00010B 80 02            [24]  394 	sjmp	00143$
      00010D                        395 00142$:
      00010D 25 E0            [12]  396 	add	a,acc
      00010F                        397 00143$:
      00010F D5 F0 FB         [24]  398 	djnz	b,00142$
      000112 42 35            [12]  399 	orl	_valid_thread,a
                                    400 ;	cooperative.c:117: old_SP = SP;
      000114 85 81 37         [24]  401 	mov	_old_SP,_SP
                                    402 ;	cooperative.c:118: SP = (0x3A) + (new_thread * 8);
      000117 E5 36            [12]  403 	mov	a,_new_thread
      000119 C4               [12]  404 	swap	a
      00011A 03               [12]  405 	rr	a
      00011B 54 F8            [12]  406 	anl	a,#0xf8
      00011D FF               [12]  407 	mov	r7,a
      00011E 24 3A            [12]  408 	add	a,#0x3a
      000120 F5 81            [12]  409 	mov	_SP,a
                                    410 ;	cooperative.c:141: __endasm;
      000122 C0 82            [24]  411 	PUSH	DPL
      000124 C0 83            [24]  412 	PUSH	DPH
      000126 74 00            [12]  413 	MOV	A, #0
      000128 C0 E0            [24]  414 	PUSH	A
      00012A C0 E0            [24]  415 	PUSH	A
      00012C C0 E0            [24]  416 	PUSH	A
      00012E C0 E0            [24]  417 	PUSH	A
                                    418 ;	cooperative.c:160: PSW = (new_thread << 3);
      000130 E5 36            [12]  419 	mov	a,_new_thread
      000132 C4               [12]  420 	swap	a
      000133 03               [12]  421 	rr	a
      000134 54 F8            [12]  422 	anl	a,#0xf8
      000136 F5 D0            [12]  423 	mov	_PSW,a
                                    424 ;	cooperative.c:164: __endasm;
      000138 C0 D0            [24]  425 	PUSH	PSW
                                    426 ;	cooperative.c:166: saved_SP[new_thread] = SP; // [todo] write current stack pointer to saved stack for newly created thread id
      00013A E5 36            [12]  427 	mov	a,_new_thread
      00013C 24 30            [12]  428 	add	a, #_saved_SP
      00013E F8               [12]  429 	mov	r0,a
      00013F A6 81            [24]  430 	mov	@r0,_SP
                                    431 ;	cooperative.c:167: SP = old_SP;               // [todo] set SP to saved SP
      000141 85 37 81         [24]  432 	mov	_SP,_old_SP
                                    433 ;	cooperative.c:168: return new_thread;         // [todo] return newly created thread ID
      000144 85 36 82         [24]  434 	mov	dpl, _new_thread
                                    435 ;	cooperative.c:169: }
      000147 22               [24]  436 	ret
                                    437 ;------------------------------------------------------------
                                    438 ;Allocation info for local variables in function 'ThreadYield'
                                    439 ;------------------------------------------------------------
                                    440 ;	cooperative.c:178: void ThreadYield(void)
                                    441 ;	-----------------------------------------
                                    442 ;	 function ThreadYield
                                    443 ;	-----------------------------------------
      000148                        444 _ThreadYield:
                                    445 ;	cooperative.c:180: SAVESTATE;
      000148 C0 E0            [24]  446 	PUSH ACC 
      00014A C0 F0            [24]  447 	PUSH B 
      00014C C0 82            [24]  448 	PUSH DPL 
      00014E C0 83            [24]  449 	PUSH DPH 
      000150 C0 D0            [24]  450 	PUSH PSW 
      000152 E5 34            [12]  451 	mov	a,_current_thread
      000154 24 30            [12]  452 	add	a, #_saved_SP
      000156 F8               [12]  453 	mov	r0,a
      000157 A6 81            [24]  454 	mov	@r0,_SP
                                    455 ;	cooperative.c:181: do
      000159                        456 00110$:
                                    457 ;	cooperative.c:195: current_thread = (current_thread + 1) & 3;
      000159 AF 34            [24]  458 	mov	r7,_current_thread
      00015B 0F               [12]  459 	inc	r7
      00015C 74 03            [12]  460 	mov	a,#0x03
      00015E 5F               [12]  461 	anl	a,r7
      00015F F5 34            [12]  462 	mov	_current_thread,a
                                    463 ;	cooperative.c:197: if ((current_thread == 0 && (valid_thread & 0x01)) ||
      000161 E5 34            [12]  464 	mov	a,_current_thread
      000163 70 06            [24]  465 	jnz	00105$
      000165 E5 35            [12]  466 	mov	a,_valid_thread
      000167 FF               [12]  467 	mov	r7,a
      000168 20 E0 21         [24]  468 	jb	acc.0,00113$
      00016B                        469 00105$:
                                    470 ;	cooperative.c:198: (current_thread == 1 && (valid_thread & 0x02)) ||
      00016B 74 01            [12]  471 	mov	a,#0x01
      00016D B5 34 06         [24]  472 	cjne	a,_current_thread,00107$
      000170 E5 35            [12]  473 	mov	a,_valid_thread
      000172 FF               [12]  474 	mov	r7,a
      000173 20 E1 16         [24]  475 	jb	acc.1,00113$
      000176                        476 00107$:
                                    477 ;	cooperative.c:199: (current_thread == 2 && (valid_thread & 0x04)) ||
      000176 74 02            [12]  478 	mov	a,#0x02
      000178 B5 34 06         [24]  479 	cjne	a,_current_thread,00109$
      00017B E5 35            [12]  480 	mov	a,_valid_thread
      00017D FF               [12]  481 	mov	r7,a
      00017E 20 E2 0B         [24]  482 	jb	acc.2,00113$
      000181                        483 00109$:
                                    484 ;	cooperative.c:200: (current_thread == 3 && (valid_thread & 0x08))) {
      000181 74 03            [12]  485 	mov	a,#0x03
      000183 B5 34 D3         [24]  486 	cjne	a,_current_thread,00110$
      000186 E5 35            [12]  487 	mov	a,_valid_thread
      000188 FF               [12]  488 	mov	r7,a
      000189 30 E3 CD         [24]  489 	jnb	acc.3,00110$
                                    490 ;	cooperative.c:205: found:
      00018C                        491 00113$:
                                    492 ;	cooperative.c:206: RESTORESTATE;
      00018C E5 34            [12]  493 	mov	a,_current_thread
      00018E 24 30            [12]  494 	add	a, #_saved_SP
      000190 F9               [12]  495 	mov	r1,a
      000191 87 81            [24]  496 	mov	_SP,@r1
      000193 D0 D0            [24]  497 	POP PSW 
      000195 D0 83            [24]  498 	POP DPH 
      000197 D0 82            [24]  499 	POP DPL 
      000199 D0 F0            [24]  500 	POP B 
      00019B D0 E0            [24]  501 	POP ACC 
                                    502 ;	cooperative.c:207: }
      00019D 22               [24]  503 	ret
                                    504 ;------------------------------------------------------------
                                    505 ;Allocation info for local variables in function 'ThreadExit'
                                    506 ;------------------------------------------------------------
                                    507 ;	cooperative.c:214: void ThreadExit(void)
                                    508 ;	-----------------------------------------
                                    509 ;	 function ThreadExit
                                    510 ;	-----------------------------------------
      00019E                        511 _ThreadExit:
                                    512 ;	cooperative.c:223: valid_thread &= ~(1 << current_thread);   // mark current thread as inactive 
      00019E 85 34 F0         [24]  513 	mov	b,_current_thread
      0001A1 05 F0            [12]  514 	inc	b
      0001A3 74 01            [12]  515 	mov	a,#0x01
      0001A5 80 02            [24]  516 	sjmp	00128$
      0001A7                        517 00127$:
      0001A7 25 E0            [12]  518 	add	a,acc
      0001A9                        519 00128$:
      0001A9 D5 F0 FB         [24]  520 	djnz	b,00127$
      0001AC F4               [12]  521 	cpl	a
      0001AD 52 35            [12]  522 	anl	_valid_thread,a
                                    523 ;	cooperative.c:225: do {
      0001AF                        524 00104$:
                                    525 ;	cooperative.c:227: if (current_thread == 3) current_thread = 0;
      0001AF 74 03            [12]  526 	mov	a,#0x03
      0001B1 B5 34 05         [24]  527 	cjne	a,_current_thread,00102$
      0001B4 75 34 00         [24]  528 	mov	_current_thread,#0x00
      0001B7 80 05            [24]  529 	sjmp	00105$
      0001B9                        530 00102$:
                                    531 ;	cooperative.c:228: else current_thread += 1;
      0001B9 E5 34            [12]  532 	mov	a,_current_thread
      0001BB 04               [12]  533 	inc	a
      0001BC F5 34            [12]  534 	mov	_current_thread,a
      0001BE                        535 00105$:
                                    536 ;	cooperative.c:229: } while (!(valid_thread & (1 << current_thread))); // keep looping until valid thread is found
      0001BE 85 34 F0         [24]  537 	mov	b,_current_thread
      0001C1 05 F0            [12]  538 	inc	b
      0001C3 7E 01            [12]  539 	mov	r6,#0x01
      0001C5 7F 00            [12]  540 	mov	r7,#0x00
      0001C7 80 06            [24]  541 	sjmp	00132$
      0001C9                        542 00131$:
      0001C9 EE               [12]  543 	mov	a,r6
      0001CA 2E               [12]  544 	add	a,r6
      0001CB FE               [12]  545 	mov	r6,a
      0001CC EF               [12]  546 	mov	a,r7
      0001CD 33               [12]  547 	rlc	a
      0001CE FF               [12]  548 	mov	r7,a
      0001CF                        549 00132$:
      0001CF D5 F0 F7         [24]  550 	djnz	b,00131$
      0001D2 AC 35            [24]  551 	mov	r4,_valid_thread
      0001D4 7D 00            [12]  552 	mov	r5,#0x00
      0001D6 EC               [12]  553 	mov	a,r4
      0001D7 52 06            [12]  554 	anl	ar6,a
      0001D9 ED               [12]  555 	mov	a,r5
      0001DA 52 07            [12]  556 	anl	ar7,a
      0001DC EE               [12]  557 	mov	a,r6
      0001DD 4F               [12]  558 	orl	a,r7
      0001DE 60 CF            [24]  559 	jz	00104$
                                    560 ;	cooperative.c:231: RESTORESTATE;
      0001E0 E5 34            [12]  561 	mov	a,_current_thread
      0001E2 24 30            [12]  562 	add	a, #_saved_SP
      0001E4 F9               [12]  563 	mov	r1,a
      0001E5 87 81            [24]  564 	mov	_SP,@r1
      0001E7 D0 D0            [24]  565 	POP PSW 
      0001E9 D0 83            [24]  566 	POP DPH 
      0001EB D0 82            [24]  567 	POP DPL 
      0001ED D0 F0            [24]  568 	POP B 
      0001EF D0 E0            [24]  569 	POP ACC 
                                    570 ;	cooperative.c:232: }
      0001F1 22               [24]  571 	ret
                                    572 	.area CSEG    (CODE)
                                    573 	.area CONST   (CODE)
                                    574 	.area XINIT   (CODE)
                                    575 	.area CABS    (ABS,CODE)
