                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ISO C Compiler
                                      3 ; Version 4.5.0 #15242 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module testcoop
                                      6 	
                                      7 	.optsdcc -mmcs51 --model-small
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl __mcs51_genXRAMCLEAR
                                     12 	.globl __mcs51_genXINIT
                                     13 	.globl __mcs51_genRAMCLEAR
                                     14 	.globl __sdcc_gsinit_startup
                                     15 	.globl _main
                                     16 	.globl _Consumer
                                     17 	.globl _Producer
                                     18 	.globl _ThreadYield
                                     19 	.globl _ThreadCreate
                                     20 	.globl _CY
                                     21 	.globl _AC
                                     22 	.globl _F0
                                     23 	.globl _RS1
                                     24 	.globl _RS0
                                     25 	.globl _OV
                                     26 	.globl _F1
                                     27 	.globl _P
                                     28 	.globl _PS
                                     29 	.globl _PT1
                                     30 	.globl _PX1
                                     31 	.globl _PT0
                                     32 	.globl _PX0
                                     33 	.globl _RD
                                     34 	.globl _WR
                                     35 	.globl _T1
                                     36 	.globl _T0
                                     37 	.globl _INT1
                                     38 	.globl _INT0
                                     39 	.globl _TXD
                                     40 	.globl _RXD
                                     41 	.globl _P3_7
                                     42 	.globl _P3_6
                                     43 	.globl _P3_5
                                     44 	.globl _P3_4
                                     45 	.globl _P3_3
                                     46 	.globl _P3_2
                                     47 	.globl _P3_1
                                     48 	.globl _P3_0
                                     49 	.globl _EA
                                     50 	.globl _ES
                                     51 	.globl _ET1
                                     52 	.globl _EX1
                                     53 	.globl _ET0
                                     54 	.globl _EX0
                                     55 	.globl _P2_7
                                     56 	.globl _P2_6
                                     57 	.globl _P2_5
                                     58 	.globl _P2_4
                                     59 	.globl _P2_3
                                     60 	.globl _P2_2
                                     61 	.globl _P2_1
                                     62 	.globl _P2_0
                                     63 	.globl _SM0
                                     64 	.globl _SM1
                                     65 	.globl _SM2
                                     66 	.globl _REN
                                     67 	.globl _TB8
                                     68 	.globl _RB8
                                     69 	.globl _TI
                                     70 	.globl _RI
                                     71 	.globl _P1_7
                                     72 	.globl _P1_6
                                     73 	.globl _P1_5
                                     74 	.globl _P1_4
                                     75 	.globl _P1_3
                                     76 	.globl _P1_2
                                     77 	.globl _P1_1
                                     78 	.globl _P1_0
                                     79 	.globl _TF1
                                     80 	.globl _TR1
                                     81 	.globl _TF0
                                     82 	.globl _TR0
                                     83 	.globl _IE1
                                     84 	.globl _IT1
                                     85 	.globl _IE0
                                     86 	.globl _IT0
                                     87 	.globl _P0_7
                                     88 	.globl _P0_6
                                     89 	.globl _P0_5
                                     90 	.globl _P0_4
                                     91 	.globl _P0_3
                                     92 	.globl _P0_2
                                     93 	.globl _P0_1
                                     94 	.globl _P0_0
                                     95 	.globl _B
                                     96 	.globl _ACC
                                     97 	.globl _PSW
                                     98 	.globl _IP
                                     99 	.globl _P3
                                    100 	.globl _IE
                                    101 	.globl _P2
                                    102 	.globl _SBUF
                                    103 	.globl _SCON
                                    104 	.globl _P1
                                    105 	.globl _TH1
                                    106 	.globl _TH0
                                    107 	.globl _TL1
                                    108 	.globl _TL0
                                    109 	.globl _TMOD
                                    110 	.globl _TCON
                                    111 	.globl _PCON
                                    112 	.globl _DPH
                                    113 	.globl _DPL
                                    114 	.globl _SP
                                    115 	.globl _P0
                                    116 	.globl _shared_buffer
                                    117 	.globl _next_char
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
                           000025   233 _next_char	=	0x0025
                           000027   234 _shared_buffer	=	0x0027
                                    235 ;--------------------------------------------------------
                                    236 ; overlayable items in internal ram
                                    237 ;--------------------------------------------------------
                                    238 ;--------------------------------------------------------
                                    239 ; Stack segment in internal ram
                                    240 ;--------------------------------------------------------
                                    241 	.area SSEG
      000008                        242 __start__stack:
      000008                        243 	.ds	1
                                    244 
                                    245 ;--------------------------------------------------------
                                    246 ; indirectly addressable internal ram data
                                    247 ;--------------------------------------------------------
                                    248 	.area ISEG    (DATA)
                                    249 ;--------------------------------------------------------
                                    250 ; absolute internal ram data
                                    251 ;--------------------------------------------------------
                                    252 	.area IABS    (ABS,DATA)
                                    253 	.area IABS    (ABS,DATA)
                                    254 ;--------------------------------------------------------
                                    255 ; bit data
                                    256 ;--------------------------------------------------------
                                    257 	.area BSEG    (BIT)
                                    258 ;--------------------------------------------------------
                                    259 ; paged external ram data
                                    260 ;--------------------------------------------------------
                                    261 	.area PSEG    (PAG,XDATA)
                                    262 ;--------------------------------------------------------
                                    263 ; uninitialized external ram data
                                    264 ;--------------------------------------------------------
                                    265 	.area XSEG    (XDATA)
                                    266 ;--------------------------------------------------------
                                    267 ; absolute external ram data
                                    268 ;--------------------------------------------------------
                                    269 	.area XABS    (ABS,XDATA)
                                    270 ;--------------------------------------------------------
                                    271 ; initialized external ram data
                                    272 ;--------------------------------------------------------
                                    273 	.area XISEG   (XDATA)
                                    274 	.area HOME    (CODE)
                                    275 	.area GSINIT0 (CODE)
                                    276 	.area GSINIT1 (CODE)
                                    277 	.area GSINIT2 (CODE)
                                    278 	.area GSINIT3 (CODE)
                                    279 	.area GSINIT4 (CODE)
                                    280 	.area GSINIT5 (CODE)
                                    281 	.area GSINIT  (CODE)
                                    282 	.area GSFINAL (CODE)
                                    283 	.area CSEG    (CODE)
                                    284 ;--------------------------------------------------------
                                    285 ; interrupt vector
                                    286 ;--------------------------------------------------------
                                    287 	.area HOME    (CODE)
      000000                        288 __interrupt_vect:
      000000 02 00 A0         [24]  289 	ljmp	__sdcc_gsinit_startup
                                    290 ; restartable atomic support routines
      000003                        291 	.ds	5
      000008                        292 sdcc_atomic_exchange_rollback_start::
      000008 00               [12]  293 	nop
      000009 00               [12]  294 	nop
      00000A                        295 sdcc_atomic_exchange_pdata_impl:
      00000A E2               [24]  296 	movx	a, @r0
      00000B FB               [12]  297 	mov	r3, a
      00000C EA               [12]  298 	mov	a, r2
      00000D F2               [24]  299 	movx	@r0, a
      00000E 80 2C            [24]  300 	sjmp	sdcc_atomic_exchange_exit
      000010 00               [12]  301 	nop
      000011 00               [12]  302 	nop
      000012                        303 sdcc_atomic_exchange_xdata_impl:
      000012 E0               [24]  304 	movx	a, @dptr
      000013 FB               [12]  305 	mov	r3, a
      000014 EA               [12]  306 	mov	a, r2
      000015 F0               [24]  307 	movx	@dptr, a
      000016 80 24            [24]  308 	sjmp	sdcc_atomic_exchange_exit
      000018                        309 sdcc_atomic_compare_exchange_idata_impl:
      000018 E6               [12]  310 	mov	a, @r0
      000019 B5 02 02         [24]  311 	cjne	a, ar2, .+#5
      00001C EB               [12]  312 	mov	a, r3
      00001D F6               [12]  313 	mov	@r0, a
      00001E 22               [24]  314 	ret
      00001F 00               [12]  315 	nop
      000020                        316 sdcc_atomic_compare_exchange_pdata_impl:
      000020 E2               [24]  317 	movx	a, @r0
      000021 B5 02 02         [24]  318 	cjne	a, ar2, .+#5
      000024 EB               [12]  319 	mov	a, r3
      000025 F2               [24]  320 	movx	@r0, a
      000026 22               [24]  321 	ret
      000027 00               [12]  322 	nop
      000028                        323 sdcc_atomic_compare_exchange_xdata_impl:
      000028 E0               [24]  324 	movx	a, @dptr
      000029 B5 02 02         [24]  325 	cjne	a, ar2, .+#5
      00002C EB               [12]  326 	mov	a, r3
      00002D F0               [24]  327 	movx	@dptr, a
      00002E 22               [24]  328 	ret
      00002F                        329 sdcc_atomic_exchange_rollback_end::
                                    330 
      00002F                        331 sdcc_atomic_exchange_gptr_impl::
      00002F 30 F6 E0         [24]  332 	jnb	b.6, sdcc_atomic_exchange_xdata_impl
      000032 A8 82            [24]  333 	mov	r0, dpl
      000034 20 F5 D3         [24]  334 	jb	b.5, sdcc_atomic_exchange_pdata_impl
      000037                        335 sdcc_atomic_exchange_idata_impl:
      000037 EA               [12]  336 	mov	a, r2
      000038 C6               [12]  337 	xch	a, @r0
      000039 F5 82            [12]  338 	mov	dpl, a
      00003B 22               [24]  339 	ret
      00003C                        340 sdcc_atomic_exchange_exit:
      00003C 8B 82            [24]  341 	mov	dpl, r3
      00003E 22               [24]  342 	ret
      00003F                        343 sdcc_atomic_compare_exchange_gptr_impl::
      00003F 30 F6 E6         [24]  344 	jnb	b.6, sdcc_atomic_compare_exchange_xdata_impl
      000042 A8 82            [24]  345 	mov	r0, dpl
      000044 20 F5 D9         [24]  346 	jb	b.5, sdcc_atomic_compare_exchange_pdata_impl
      000047 80 CF            [24]  347 	sjmp	sdcc_atomic_compare_exchange_idata_impl
                                    348 ;--------------------------------------------------------
                                    349 ; global & static initialisations
                                    350 ;--------------------------------------------------------
                                    351 	.area HOME    (CODE)
                                    352 	.area GSINIT  (CODE)
                                    353 	.area GSFINAL (CODE)
                                    354 	.area GSINIT  (CODE)
                                    355 	.globl __sdcc_gsinit_startup
                                    356 	.globl __sdcc_program_startup
                                    357 	.globl __start__stack
                                    358 	.globl __mcs51_genXINIT
                                    359 	.globl __mcs51_genXRAMCLEAR
                                    360 	.globl __mcs51_genRAMCLEAR
                                    361 	.area GSFINAL (CODE)
      00004C 02 00 49         [24]  362 	ljmp	__sdcc_program_startup
                                    363 ;--------------------------------------------------------
                                    364 ; Home
                                    365 ;--------------------------------------------------------
                                    366 	.area HOME    (CODE)
                                    367 	.area HOME    (CODE)
      000049                        368 __sdcc_program_startup:
      000049 02 00 91         [24]  369 	ljmp	_main
                                    370 ;	return from main will return to caller
                                    371 ;--------------------------------------------------------
                                    372 ; code
                                    373 ;--------------------------------------------------------
                                    374 	.area CSEG    (CODE)
                                    375 ;------------------------------------------------------------
                                    376 ;Allocation info for local variables in function 'Producer'
                                    377 ;------------------------------------------------------------
                                    378 ;	testcoop.c:24: void Producer(void)
                                    379 ;	-----------------------------------------
                                    380 ;	 function Producer
                                    381 ;	-----------------------------------------
      00004F                        382 _Producer:
                           000007   383 	ar7 = 0x07
                           000006   384 	ar6 = 0x06
                           000005   385 	ar5 = 0x05
                           000004   386 	ar4 = 0x04
                           000003   387 	ar3 = 0x03
                           000002   388 	ar2 = 0x02
                           000001   389 	ar1 = 0x01
                           000000   390 	ar0 = 0x00
                                    391 ;	testcoop.c:27: next_char = 'A';
      00004F 75 25 41         [24]  392 	mov	_next_char,#0x41
                                    393 ;	testcoop.c:31: do {
      000052                        394 00101$:
                                    395 ;	testcoop.c:32: ThreadYield(); 
      000052 12 01 48         [24]  396 	lcall	_ThreadYield
                                    397 ;	testcoop.c:33: } while (shared_buffer != '\0');
      000055 E5 27            [12]  398 	mov	a,_shared_buffer
      000057 70 F9            [24]  399 	jnz	00101$
                                    400 ;	testcoop.c:36: shared_buffer = next_char;
      000059 85 25 27         [24]  401 	mov	_shared_buffer,_next_char
                                    402 ;	testcoop.c:37: if (next_char == 'Z') next_char = 'A';
      00005C 74 5A            [12]  403 	mov	a,#0x5a
      00005E B5 25 05         [24]  404 	cjne	a,_next_char,00105$
      000061 75 25 41         [24]  405 	mov	_next_char,#0x41
      000064 80 EC            [24]  406 	sjmp	00101$
      000066                        407 00105$:
                                    408 ;	testcoop.c:38: else next_char++;          
      000066 E5 25            [12]  409 	mov	a,_next_char
      000068 04               [12]  410 	inc	a
      000069 F5 25            [12]  411 	mov	_next_char,a
                                    412 ;	testcoop.c:40: }
      00006B 80 E5            [24]  413 	sjmp	00101$
                                    414 ;------------------------------------------------------------
                                    415 ;Allocation info for local variables in function 'Consumer'
                                    416 ;------------------------------------------------------------
                                    417 ;	testcoop.c:47: void Consumer(void)
                                    418 ;	-----------------------------------------
                                    419 ;	 function Consumer
                                    420 ;	-----------------------------------------
      00006D                        421 _Consumer:
                                    422 ;	testcoop.c:53: TMOD = 0x20;
      00006D 75 89 20         [24]  423 	mov	_TMOD,#0x20
                                    424 ;	testcoop.c:54: TH1 = 0xFA;
      000070 75 8D FA         [24]  425 	mov	_TH1,#0xfa
                                    426 ;	testcoop.c:55: SCON = 0x50;
      000073 75 98 50         [24]  427 	mov	_SCON,#0x50
                                    428 ;	testcoop.c:56: TR1 = 1;
                                    429 ;	assignBit
      000076 D2 8E            [12]  430 	setb	_TR1
                                    431 ;	testcoop.c:68: do {
      000078                        432 00101$:
                                    433 ;	testcoop.c:69: ThreadYield(); 
      000078 12 01 48         [24]  434 	lcall	_ThreadYield
                                    435 ;	testcoop.c:70: } while (shared_buffer == '\0');
      00007B E5 27            [12]  436 	mov	a,_shared_buffer
      00007D 60 F9            [24]  437 	jz	00101$
                                    438 ;	testcoop.c:73: SBUF = shared_buffer; // ini mulai transmission
      00007F 85 27 99         [24]  439 	mov	_SBUF,_shared_buffer
                                    440 ;	testcoop.c:74: shared_buffer = '\0'; // kosongin buffer biar producer bisa write next char
      000082 75 27 00         [24]  441 	mov	_shared_buffer,#0x00
                                    442 ;	testcoop.c:76: while(TI == 0) ThreadYield(); // 8051 bkl set TI = 1 pas kelar transmission, jdi yield ke producer selama belom
      000085                        443 00104$:
      000085 20 99 05         [24]  444 	jb	_TI,00106$
      000088 12 01 48         [24]  445 	lcall	_ThreadYield
      00008B 80 F8            [24]  446 	sjmp	00104$
      00008D                        447 00106$:
                                    448 ;	testcoop.c:77: TI = 0;
                                    449 ;	assignBit
      00008D C2 99            [12]  450 	clr	_TI
                                    451 ;	testcoop.c:79: }
      00008F 80 E7            [24]  452 	sjmp	00101$
                                    453 ;------------------------------------------------------------
                                    454 ;Allocation info for local variables in function 'main'
                                    455 ;------------------------------------------------------------
                                    456 ;	testcoop.c:86: void main(void)
                                    457 ;	-----------------------------------------
                                    458 ;	 function main
                                    459 ;	-----------------------------------------
      000091                        460 _main:
                                    461 ;	testcoop.c:89: shared_buffer = '\0';
      000091 75 27 00         [24]  462 	mov	_shared_buffer,#0x00
                                    463 ;	testcoop.c:90: next_char = 'A';
      000094 75 25 41         [24]  464 	mov	_next_char,#0x41
                                    465 ;	testcoop.c:92: ThreadCreate(Producer);
      000097 90 00 4F         [24]  466 	mov	dptr,#_Producer
      00009A 12 00 C5         [24]  467 	lcall	_ThreadCreate
                                    468 ;	testcoop.c:93: Consumer();
                                    469 ;	testcoop.c:94: }
      00009D 02 00 6D         [24]  470 	ljmp	_Consumer
                                    471 ;------------------------------------------------------------
                                    472 ;Allocation info for local variables in function '_sdcc_gsinit_startup'
                                    473 ;------------------------------------------------------------
                                    474 ;	testcoop.c:96: void _sdcc_gsinit_startup(void)
                                    475 ;	-----------------------------------------
                                    476 ;	 function _sdcc_gsinit_startup
                                    477 ;	-----------------------------------------
      0000A0                        478 __sdcc_gsinit_startup:
                                    479 ;	testcoop.c:100: __endasm;
      0000A0 02 00 A7         [24]  480 	LJMP	_Bootstrap
                                    481 ;	testcoop.c:101: }
      0000A3 22               [24]  482 	ret
                                    483 ;------------------------------------------------------------
                                    484 ;Allocation info for local variables in function '_mcs51_genRAMCLEAR'
                                    485 ;------------------------------------------------------------
                                    486 ;	testcoop.c:103: void _mcs51_genRAMCLEAR(void) {}
                                    487 ;	-----------------------------------------
                                    488 ;	 function _mcs51_genRAMCLEAR
                                    489 ;	-----------------------------------------
      0000A4                        490 __mcs51_genRAMCLEAR:
      0000A4 22               [24]  491 	ret
                                    492 ;------------------------------------------------------------
                                    493 ;Allocation info for local variables in function '_mcs51_genXINIT'
                                    494 ;------------------------------------------------------------
                                    495 ;	testcoop.c:104: void _mcs51_genXINIT(void) {}
                                    496 ;	-----------------------------------------
                                    497 ;	 function _mcs51_genXINIT
                                    498 ;	-----------------------------------------
      0000A5                        499 __mcs51_genXINIT:
      0000A5 22               [24]  500 	ret
                                    501 ;------------------------------------------------------------
                                    502 ;Allocation info for local variables in function '_mcs51_genXRAMCLEAR'
                                    503 ;------------------------------------------------------------
                                    504 ;	testcoop.c:105: void _mcs51_genXRAMCLEAR(void) {}
                                    505 ;	-----------------------------------------
                                    506 ;	 function _mcs51_genXRAMCLEAR
                                    507 ;	-----------------------------------------
      0000A6                        508 __mcs51_genXRAMCLEAR:
      0000A6 22               [24]  509 	ret
                                    510 	.area CSEG    (CODE)
                                    511 	.area CONST   (CODE)
                                    512 	.area XINIT   (CODE)
                                    513 	.area CABS    (ABS,CODE)
