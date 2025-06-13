                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ISO C Compiler
                                      3 ; Version 4.5.0 #15242 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module test3threads
                                      6 	
                                      7 	.optsdcc -mmcs51 --model-small
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _timer0_ISR
                                     12 	.globl __mcs51_genXRAMCLEAR
                                     13 	.globl __mcs51_genXINIT
                                     14 	.globl __mcs51_genRAMCLEAR
                                     15 	.globl __sdcc_gsinit_startup
                                     16 	.globl _main
                                     17 	.globl _Consumer
                                     18 	.globl _Producer2
                                     19 	.globl _Producer1
                                     20 	.globl _ThreadCreate
                                     21 	.globl _CY
                                     22 	.globl _AC
                                     23 	.globl _F0
                                     24 	.globl _RS1
                                     25 	.globl _RS0
                                     26 	.globl _OV
                                     27 	.globl _F1
                                     28 	.globl _P
                                     29 	.globl _PS
                                     30 	.globl _PT1
                                     31 	.globl _PX1
                                     32 	.globl _PT0
                                     33 	.globl _PX0
                                     34 	.globl _RD
                                     35 	.globl _WR
                                     36 	.globl _T1
                                     37 	.globl _T0
                                     38 	.globl _INT1
                                     39 	.globl _INT0
                                     40 	.globl _TXD
                                     41 	.globl _RXD
                                     42 	.globl _P3_7
                                     43 	.globl _P3_6
                                     44 	.globl _P3_5
                                     45 	.globl _P3_4
                                     46 	.globl _P3_3
                                     47 	.globl _P3_2
                                     48 	.globl _P3_1
                                     49 	.globl _P3_0
                                     50 	.globl _EA
                                     51 	.globl _ES
                                     52 	.globl _ET1
                                     53 	.globl _EX1
                                     54 	.globl _ET0
                                     55 	.globl _EX0
                                     56 	.globl _P2_7
                                     57 	.globl _P2_6
                                     58 	.globl _P2_5
                                     59 	.globl _P2_4
                                     60 	.globl _P2_3
                                     61 	.globl _P2_2
                                     62 	.globl _P2_1
                                     63 	.globl _P2_0
                                     64 	.globl _SM0
                                     65 	.globl _SM1
                                     66 	.globl _SM2
                                     67 	.globl _REN
                                     68 	.globl _TB8
                                     69 	.globl _RB8
                                     70 	.globl _TI
                                     71 	.globl _RI
                                     72 	.globl _P1_7
                                     73 	.globl _P1_6
                                     74 	.globl _P1_5
                                     75 	.globl _P1_4
                                     76 	.globl _P1_3
                                     77 	.globl _P1_2
                                     78 	.globl _P1_1
                                     79 	.globl _P1_0
                                     80 	.globl _TF1
                                     81 	.globl _TR1
                                     82 	.globl _TF0
                                     83 	.globl _TR0
                                     84 	.globl _IE1
                                     85 	.globl _IT1
                                     86 	.globl _IE0
                                     87 	.globl _IT0
                                     88 	.globl _P0_7
                                     89 	.globl _P0_6
                                     90 	.globl _P0_5
                                     91 	.globl _P0_4
                                     92 	.globl _P0_3
                                     93 	.globl _P0_2
                                     94 	.globl _P0_1
                                     95 	.globl _P0_0
                                     96 	.globl _B
                                     97 	.globl _ACC
                                     98 	.globl _PSW
                                     99 	.globl _IP
                                    100 	.globl _P3
                                    101 	.globl _IE
                                    102 	.globl _P2
                                    103 	.globl _SBUF
                                    104 	.globl _SCON
                                    105 	.globl _P1
                                    106 	.globl _TH1
                                    107 	.globl _TH0
                                    108 	.globl _TL1
                                    109 	.globl _TL0
                                    110 	.globl _TMOD
                                    111 	.globl _TCON
                                    112 	.globl _PCON
                                    113 	.globl _DPH
                                    114 	.globl _DPL
                                    115 	.globl _SP
                                    116 	.globl _P0
                                    117 	.globl _dir
                                    118 	.globl _bounded_buffer
                                    119 	.globl _next_char2
                                    120 	.globl _next_char1
                                    121 	.globl _write
                                    122 	.globl _read
                                    123 	.globl _empty
                                    124 	.globl _full
                                    125 	.globl _mutex
                                    126 ;--------------------------------------------------------
                                    127 ; special function registers
                                    128 ;--------------------------------------------------------
                                    129 	.area RSEG    (ABS,DATA)
      000000                        130 	.org 0x0000
                           000080   131 _P0	=	0x0080
                           000081   132 _SP	=	0x0081
                           000082   133 _DPL	=	0x0082
                           000083   134 _DPH	=	0x0083
                           000087   135 _PCON	=	0x0087
                           000088   136 _TCON	=	0x0088
                           000089   137 _TMOD	=	0x0089
                           00008A   138 _TL0	=	0x008a
                           00008B   139 _TL1	=	0x008b
                           00008C   140 _TH0	=	0x008c
                           00008D   141 _TH1	=	0x008d
                           000090   142 _P1	=	0x0090
                           000098   143 _SCON	=	0x0098
                           000099   144 _SBUF	=	0x0099
                           0000A0   145 _P2	=	0x00a0
                           0000A8   146 _IE	=	0x00a8
                           0000B0   147 _P3	=	0x00b0
                           0000B8   148 _IP	=	0x00b8
                           0000D0   149 _PSW	=	0x00d0
                           0000E0   150 _ACC	=	0x00e0
                           0000F0   151 _B	=	0x00f0
                                    152 ;--------------------------------------------------------
                                    153 ; special function bits
                                    154 ;--------------------------------------------------------
                                    155 	.area RSEG    (ABS,DATA)
      000000                        156 	.org 0x0000
                           000080   157 _P0_0	=	0x0080
                           000081   158 _P0_1	=	0x0081
                           000082   159 _P0_2	=	0x0082
                           000083   160 _P0_3	=	0x0083
                           000084   161 _P0_4	=	0x0084
                           000085   162 _P0_5	=	0x0085
                           000086   163 _P0_6	=	0x0086
                           000087   164 _P0_7	=	0x0087
                           000088   165 _IT0	=	0x0088
                           000089   166 _IE0	=	0x0089
                           00008A   167 _IT1	=	0x008a
                           00008B   168 _IE1	=	0x008b
                           00008C   169 _TR0	=	0x008c
                           00008D   170 _TF0	=	0x008d
                           00008E   171 _TR1	=	0x008e
                           00008F   172 _TF1	=	0x008f
                           000090   173 _P1_0	=	0x0090
                           000091   174 _P1_1	=	0x0091
                           000092   175 _P1_2	=	0x0092
                           000093   176 _P1_3	=	0x0093
                           000094   177 _P1_4	=	0x0094
                           000095   178 _P1_5	=	0x0095
                           000096   179 _P1_6	=	0x0096
                           000097   180 _P1_7	=	0x0097
                           000098   181 _RI	=	0x0098
                           000099   182 _TI	=	0x0099
                           00009A   183 _RB8	=	0x009a
                           00009B   184 _TB8	=	0x009b
                           00009C   185 _REN	=	0x009c
                           00009D   186 _SM2	=	0x009d
                           00009E   187 _SM1	=	0x009e
                           00009F   188 _SM0	=	0x009f
                           0000A0   189 _P2_0	=	0x00a0
                           0000A1   190 _P2_1	=	0x00a1
                           0000A2   191 _P2_2	=	0x00a2
                           0000A3   192 _P2_3	=	0x00a3
                           0000A4   193 _P2_4	=	0x00a4
                           0000A5   194 _P2_5	=	0x00a5
                           0000A6   195 _P2_6	=	0x00a6
                           0000A7   196 _P2_7	=	0x00a7
                           0000A8   197 _EX0	=	0x00a8
                           0000A9   198 _ET0	=	0x00a9
                           0000AA   199 _EX1	=	0x00aa
                           0000AB   200 _ET1	=	0x00ab
                           0000AC   201 _ES	=	0x00ac
                           0000AF   202 _EA	=	0x00af
                           0000B0   203 _P3_0	=	0x00b0
                           0000B1   204 _P3_1	=	0x00b1
                           0000B2   205 _P3_2	=	0x00b2
                           0000B3   206 _P3_3	=	0x00b3
                           0000B4   207 _P3_4	=	0x00b4
                           0000B5   208 _P3_5	=	0x00b5
                           0000B6   209 _P3_6	=	0x00b6
                           0000B7   210 _P3_7	=	0x00b7
                           0000B0   211 _RXD	=	0x00b0
                           0000B1   212 _TXD	=	0x00b1
                           0000B2   213 _INT0	=	0x00b2
                           0000B3   214 _INT1	=	0x00b3
                           0000B4   215 _T0	=	0x00b4
                           0000B5   216 _T1	=	0x00b5
                           0000B6   217 _WR	=	0x00b6
                           0000B7   218 _RD	=	0x00b7
                           0000B8   219 _PX0	=	0x00b8
                           0000B9   220 _PT0	=	0x00b9
                           0000BA   221 _PX1	=	0x00ba
                           0000BB   222 _PT1	=	0x00bb
                           0000BC   223 _PS	=	0x00bc
                           0000D0   224 _P	=	0x00d0
                           0000D1   225 _F1	=	0x00d1
                           0000D2   226 _OV	=	0x00d2
                           0000D3   227 _RS0	=	0x00d3
                           0000D4   228 _RS1	=	0x00d4
                           0000D5   229 _F0	=	0x00d5
                           0000D6   230 _AC	=	0x00d6
                           0000D7   231 _CY	=	0x00d7
                                    232 ;--------------------------------------------------------
                                    233 ; overlayable register banks
                                    234 ;--------------------------------------------------------
                                    235 	.area REG_BANK_0	(REL,OVR,DATA)
      000000                        236 	.ds 8
                                    237 ;--------------------------------------------------------
                                    238 ; internal ram data
                                    239 ;--------------------------------------------------------
                                    240 	.area DSEG    (DATA)
                           000020   241 _mutex	=	0x0020
                           000021   242 _full	=	0x0021
                           000022   243 _empty	=	0x0022
                           000023   244 _read	=	0x0023
                           000024   245 _write	=	0x0024
                           000025   246 _next_char1	=	0x0025
                           000026   247 _next_char2	=	0x0026
                           000027   248 _bounded_buffer	=	0x0027
                           000038   249 _dir	=	0x0038
                                    250 ;--------------------------------------------------------
                                    251 ; overlayable items in internal ram
                                    252 ;--------------------------------------------------------
                                    253 ;--------------------------------------------------------
                                    254 ; Stack segment in internal ram
                                    255 ;--------------------------------------------------------
                                    256 	.area SSEG
      000021                        257 __start__stack:
      000021                        258 	.ds	1
                                    259 
                                    260 ;--------------------------------------------------------
                                    261 ; indirectly addressable internal ram data
                                    262 ;--------------------------------------------------------
                                    263 	.area ISEG    (DATA)
                                    264 ;--------------------------------------------------------
                                    265 ; absolute internal ram data
                                    266 ;--------------------------------------------------------
                                    267 	.area IABS    (ABS,DATA)
                                    268 	.area IABS    (ABS,DATA)
                                    269 ;--------------------------------------------------------
                                    270 ; bit data
                                    271 ;--------------------------------------------------------
                                    272 	.area BSEG    (BIT)
                                    273 ;--------------------------------------------------------
                                    274 ; paged external ram data
                                    275 ;--------------------------------------------------------
                                    276 	.area PSEG    (PAG,XDATA)
                                    277 ;--------------------------------------------------------
                                    278 ; uninitialized external ram data
                                    279 ;--------------------------------------------------------
                                    280 	.area XSEG    (XDATA)
                                    281 ;--------------------------------------------------------
                                    282 ; absolute external ram data
                                    283 ;--------------------------------------------------------
                                    284 	.area XABS    (ABS,XDATA)
                                    285 ;--------------------------------------------------------
                                    286 ; initialized external ram data
                                    287 ;--------------------------------------------------------
                                    288 	.area XISEG   (XDATA)
                                    289 	.area HOME    (CODE)
                                    290 	.area GSINIT0 (CODE)
                                    291 	.area GSINIT1 (CODE)
                                    292 	.area GSINIT2 (CODE)
                                    293 	.area GSINIT3 (CODE)
                                    294 	.area GSINIT4 (CODE)
                                    295 	.area GSINIT5 (CODE)
                                    296 	.area GSINIT  (CODE)
                                    297 	.area GSFINAL (CODE)
                                    298 	.area CSEG    (CODE)
                                    299 ;--------------------------------------------------------
                                    300 ; interrupt vector
                                    301 ;--------------------------------------------------------
                                    302 	.area HOME    (CODE)
      000000                        303 __interrupt_vect:
      000000 02 01 58         [24]  304 	ljmp	__sdcc_gsinit_startup
      000003 32               [24]  305 	reti
      000004                        306 	.ds	7
      00000B 02 01 5F         [24]  307 	ljmp	_timer0_ISR
                                    308 ; restartable atomic support routines
      00000E                        309 	.ds	2
      000010                        310 sdcc_atomic_exchange_rollback_start::
      000010 00               [12]  311 	nop
      000011 00               [12]  312 	nop
      000012                        313 sdcc_atomic_exchange_pdata_impl:
      000012 E2               [24]  314 	movx	a, @r0
      000013 FB               [12]  315 	mov	r3, a
      000014 EA               [12]  316 	mov	a, r2
      000015 F2               [24]  317 	movx	@r0, a
      000016 80 2C            [24]  318 	sjmp	sdcc_atomic_exchange_exit
      000018 00               [12]  319 	nop
      000019 00               [12]  320 	nop
      00001A                        321 sdcc_atomic_exchange_xdata_impl:
      00001A E0               [24]  322 	movx	a, @dptr
      00001B FB               [12]  323 	mov	r3, a
      00001C EA               [12]  324 	mov	a, r2
      00001D F0               [24]  325 	movx	@dptr, a
      00001E 80 24            [24]  326 	sjmp	sdcc_atomic_exchange_exit
      000020                        327 sdcc_atomic_compare_exchange_idata_impl:
      000020 E6               [12]  328 	mov	a, @r0
      000021 B5 02 02         [24]  329 	cjne	a, ar2, .+#5
      000024 EB               [12]  330 	mov	a, r3
      000025 F6               [12]  331 	mov	@r0, a
      000026 22               [24]  332 	ret
      000027 00               [12]  333 	nop
      000028                        334 sdcc_atomic_compare_exchange_pdata_impl:
      000028 E2               [24]  335 	movx	a, @r0
      000029 B5 02 02         [24]  336 	cjne	a, ar2, .+#5
      00002C EB               [12]  337 	mov	a, r3
      00002D F2               [24]  338 	movx	@r0, a
      00002E 22               [24]  339 	ret
      00002F 00               [12]  340 	nop
      000030                        341 sdcc_atomic_compare_exchange_xdata_impl:
      000030 E0               [24]  342 	movx	a, @dptr
      000031 B5 02 02         [24]  343 	cjne	a, ar2, .+#5
      000034 EB               [12]  344 	mov	a, r3
      000035 F0               [24]  345 	movx	@dptr, a
      000036 22               [24]  346 	ret
      000037                        347 sdcc_atomic_exchange_rollback_end::
                                    348 
      000037                        349 sdcc_atomic_exchange_gptr_impl::
      000037 30 F6 E0         [24]  350 	jnb	b.6, sdcc_atomic_exchange_xdata_impl
      00003A A8 82            [24]  351 	mov	r0, dpl
      00003C 20 F5 D3         [24]  352 	jb	b.5, sdcc_atomic_exchange_pdata_impl
      00003F                        353 sdcc_atomic_exchange_idata_impl:
      00003F EA               [12]  354 	mov	a, r2
      000040 C6               [12]  355 	xch	a, @r0
      000041 F5 82            [12]  356 	mov	dpl, a
      000043 22               [24]  357 	ret
      000044                        358 sdcc_atomic_exchange_exit:
      000044 8B 82            [24]  359 	mov	dpl, r3
      000046 22               [24]  360 	ret
      000047                        361 sdcc_atomic_compare_exchange_gptr_impl::
      000047 30 F6 E6         [24]  362 	jnb	b.6, sdcc_atomic_compare_exchange_xdata_impl
      00004A A8 82            [24]  363 	mov	r0, dpl
      00004C 20 F5 D9         [24]  364 	jb	b.5, sdcc_atomic_compare_exchange_pdata_impl
      00004F 80 CF            [24]  365 	sjmp	sdcc_atomic_compare_exchange_idata_impl
                                    366 ;--------------------------------------------------------
                                    367 ; global & static initialisations
                                    368 ;--------------------------------------------------------
                                    369 	.area HOME    (CODE)
                                    370 	.area GSINIT  (CODE)
                                    371 	.area GSFINAL (CODE)
                                    372 	.area GSINIT  (CODE)
                                    373 	.globl __sdcc_gsinit_startup
                                    374 	.globl __sdcc_program_startup
                                    375 	.globl __start__stack
                                    376 	.globl __mcs51_genXINIT
                                    377 	.globl __mcs51_genXRAMCLEAR
                                    378 	.globl __mcs51_genRAMCLEAR
                                    379 	.area GSFINAL (CODE)
      00007E 02 00 51         [24]  380 	ljmp	__sdcc_program_startup
                                    381 ;--------------------------------------------------------
                                    382 ; Home
                                    383 ;--------------------------------------------------------
                                    384 	.area HOME    (CODE)
                                    385 	.area HOME    (CODE)
      000051                        386 __sdcc_program_startup:
      000051 02 01 37         [24]  387 	ljmp	_main
                                    388 ;	return from main will return to caller
                                    389 ;--------------------------------------------------------
                                    390 ; code
                                    391 ;--------------------------------------------------------
                                    392 	.area CSEG    (CODE)
                                    393 ;------------------------------------------------------------
                                    394 ;Allocation info for local variables in function 'Producer1'
                                    395 ;------------------------------------------------------------
                                    396 ;	test3threads.c:14: void Producer1(void) 
                                    397 ;	-----------------------------------------
                                    398 ;	 function Producer1
                                    399 ;	-----------------------------------------
      000081                        400 _Producer1:
                           000007   401 	ar7 = 0x07
                           000006   402 	ar6 = 0x06
                           000005   403 	ar5 = 0x05
                           000004   404 	ar4 = 0x04
                           000003   405 	ar3 = 0x03
                           000002   406 	ar2 = 0x02
                           000001   407 	ar1 = 0x01
                           000000   408 	ar0 = 0x00
                                    409 ;	test3threads.c:16: next_char1 = 'A';
      000081 75 25 41         [24]  410 	mov	_next_char1,#0x41
                                    411 ;	test3threads.c:17: while(1) {
      000084                        412 00108$:
                                    413 ;	test3threads.c:18: SemaphoreWait(empty);
      000084                        414 0$:
      000084 E5 22            [12]  415 	MOV A, _empty 
      000086 60 FC            [24]  416 	JZ 0$ 
      000088 15 22            [12]  417 	DEC _empty 
                                    418 ;	test3threads.c:19: SemaphoreWait(mutex);
      00008A                        419 1$:
      00008A E5 20            [12]  420 	MOV A, _mutex 
      00008C 60 FC            [24]  421 	JZ 1$ 
      00008E 15 20            [12]  422 	DEC _mutex 
                                    423 ;	test3threads.c:21: EA = 0;
                                    424 ;	assignBit
      000090 C2 AF            [12]  425 	clr	_EA
                                    426 ;	test3threads.c:22: bounded_buffer[write] = next_char1;
      000092 E5 24            [12]  427 	mov	a,_write
      000094 24 27            [12]  428 	add	a, #_bounded_buffer
      000096 F8               [12]  429 	mov	r0,a
      000097 A6 25            [24]  430 	mov	@r0,_next_char1
                                    431 ;	test3threads.c:23: if (write == 2) write = 0;
      000099 74 02            [12]  432 	mov	a,#0x02
      00009B B5 24 05         [24]  433 	cjne	a,_write,00102$
      00009E 75 24 00         [24]  434 	mov	_write,#0x00
      0000A1 80 05            [24]  435 	sjmp	00103$
      0000A3                        436 00102$:
                                    437 ;	test3threads.c:24: else write++;
      0000A3 E5 24            [12]  438 	mov	a,_write
      0000A5 04               [12]  439 	inc	a
      0000A6 F5 24            [12]  440 	mov	_write,a
      0000A8                        441 00103$:
                                    442 ;	test3threads.c:25: EA = 1;
                                    443 ;	assignBit
      0000A8 D2 AF            [12]  444 	setb	_EA
                                    445 ;	test3threads.c:27: SemaphoreSignal(mutex);
      0000AA 05 20            [12]  446 	INC _mutex 
                                    447 ;	test3threads.c:28: SemaphoreSignal(full);
      0000AC 05 21            [12]  448 	INC _full 
                                    449 ;	test3threads.c:30: if (next_char1 == 'Z') next_char1 = 'A';
      0000AE 74 5A            [12]  450 	mov	a,#0x5a
      0000B0 B5 25 05         [24]  451 	cjne	a,_next_char1,00105$
      0000B3 75 25 41         [24]  452 	mov	_next_char1,#0x41
      0000B6 80 CC            [24]  453 	sjmp	00108$
      0000B8                        454 00105$:
                                    455 ;	test3threads.c:31: else next_char1++;
      0000B8 E5 25            [12]  456 	mov	a,_next_char1
      0000BA 04               [12]  457 	inc	a
      0000BB F5 25            [12]  458 	mov	_next_char1,a
                                    459 ;	test3threads.c:33: }
      0000BD 80 C5            [24]  460 	sjmp	00108$
                                    461 ;------------------------------------------------------------
                                    462 ;Allocation info for local variables in function 'Producer2'
                                    463 ;------------------------------------------------------------
                                    464 ;	test3threads.c:35: void Producer2(void)
                                    465 ;	-----------------------------------------
                                    466 ;	 function Producer2
                                    467 ;	-----------------------------------------
      0000BF                        468 _Producer2:
                                    469 ;	test3threads.c:37: next_char2 = '0';
      0000BF 75 26 30         [24]  470 	mov	_next_char2,#0x30
                                    471 ;	test3threads.c:38: while(1)
      0000C2                        472 00108$:
                                    473 ;	test3threads.c:40: SemaphoreWait(empty);
      0000C2                        474 2$:
      0000C2 E5 22            [12]  475 	MOV A, _empty 
      0000C4 60 FC            [24]  476 	JZ 2$ 
      0000C6 15 22            [12]  477 	DEC _empty 
                                    478 ;	test3threads.c:41: SemaphoreWait(mutex);
      0000C8                        479 3$:
      0000C8 E5 20            [12]  480 	MOV A, _mutex 
      0000CA 60 FC            [24]  481 	JZ 3$ 
      0000CC 15 20            [12]  482 	DEC _mutex 
                                    483 ;	test3threads.c:43: EA = 0;
                                    484 ;	assignBit
      0000CE C2 AF            [12]  485 	clr	_EA
                                    486 ;	test3threads.c:44: bounded_buffer[write] = next_char2;
      0000D0 E5 24            [12]  487 	mov	a,_write
      0000D2 24 27            [12]  488 	add	a, #_bounded_buffer
      0000D4 F8               [12]  489 	mov	r0,a
      0000D5 A6 26            [24]  490 	mov	@r0,_next_char2
                                    491 ;	test3threads.c:45: if (write == 2) write = 0;
      0000D7 74 02            [12]  492 	mov	a,#0x02
      0000D9 B5 24 05         [24]  493 	cjne	a,_write,00102$
      0000DC 75 24 00         [24]  494 	mov	_write,#0x00
      0000DF 80 05            [24]  495 	sjmp	00103$
      0000E1                        496 00102$:
                                    497 ;	test3threads.c:46: else write++;
      0000E1 E5 24            [12]  498 	mov	a,_write
      0000E3 04               [12]  499 	inc	a
      0000E4 F5 24            [12]  500 	mov	_write,a
      0000E6                        501 00103$:
                                    502 ;	test3threads.c:47: EA = 1;
                                    503 ;	assignBit
      0000E6 D2 AF            [12]  504 	setb	_EA
                                    505 ;	test3threads.c:49: SemaphoreSignal(mutex);
      0000E8 05 20            [12]  506 	INC _mutex 
                                    507 ;	test3threads.c:50: SemaphoreSignal(full);
      0000EA 05 21            [12]  508 	INC _full 
                                    509 ;	test3threads.c:52: if (next_char2 == '9') next_char2 = '0';
      0000EC 74 39            [12]  510 	mov	a,#0x39
      0000EE B5 26 05         [24]  511 	cjne	a,_next_char2,00105$
      0000F1 75 26 30         [24]  512 	mov	_next_char2,#0x30
      0000F4 80 CC            [24]  513 	sjmp	00108$
      0000F6                        514 00105$:
                                    515 ;	test3threads.c:53: else next_char2++;
      0000F6 E5 26            [12]  516 	mov	a,_next_char2
      0000F8 04               [12]  517 	inc	a
      0000F9 F5 26            [12]  518 	mov	_next_char2,a
                                    519 ;	test3threads.c:55: }
      0000FB 80 C5            [24]  520 	sjmp	00108$
                                    521 ;------------------------------------------------------------
                                    522 ;Allocation info for local variables in function 'Consumer'
                                    523 ;------------------------------------------------------------
                                    524 ;	test3threads.c:57: void Consumer(void) 
                                    525 ;	-----------------------------------------
                                    526 ;	 function Consumer
                                    527 ;	-----------------------------------------
      0000FD                        528 _Consumer:
                                    529 ;	test3threads.c:59: TMOD |= 0x20;
      0000FD 43 89 20         [24]  530 	orl	_TMOD,#0x20
                                    531 ;	test3threads.c:60: TH1 = 0xFA;
      000100 75 8D FA         [24]  532 	mov	_TH1,#0xfa
                                    533 ;	test3threads.c:61: SCON = 0x50;
      000103 75 98 50         [24]  534 	mov	_SCON,#0x50
                                    535 ;	test3threads.c:62: TR1 = 1;
                                    536 ;	assignBit
      000106 D2 8E            [12]  537 	setb	_TR1
                                    538 ;	test3threads.c:64: while (1)
      000108                        539 00108$:
                                    540 ;	test3threads.c:66: SemaphoreWait(full);
      000108                        541 4$:
      000108 E5 21            [12]  542 	MOV A, _full 
      00010A 60 FC            [24]  543 	JZ 4$ 
      00010C 15 21            [12]  544 	DEC _full 
                                    545 ;	test3threads.c:67: SemaphoreWait(mutex);
      00010E                        546 5$:
      00010E E5 20            [12]  547 	MOV A, _mutex 
      000110 60 FC            [24]  548 	JZ 5$ 
      000112 15 20            [12]  549 	DEC _mutex 
                                    550 ;	test3threads.c:69: EA = 0;
                                    551 ;	assignBit
      000114 C2 AF            [12]  552 	clr	_EA
                                    553 ;	test3threads.c:70: SBUF = bounded_buffer[read];
      000116 E5 23            [12]  554 	mov	a,_read
      000118 24 27            [12]  555 	add	a, #_bounded_buffer
      00011A F9               [12]  556 	mov	r1,a
      00011B 87 99            [24]  557 	mov	_SBUF,@r1
                                    558 ;	test3threads.c:71: if (read == 2) read = 0;
      00011D 74 02            [12]  559 	mov	a,#0x02
      00011F B5 23 05         [24]  560 	cjne	a,_read,00102$
      000122 75 23 00         [24]  561 	mov	_read,#0x00
      000125 80 05            [24]  562 	sjmp	00103$
      000127                        563 00102$:
                                    564 ;	test3threads.c:72: else read++;
      000127 E5 23            [12]  565 	mov	a,_read
      000129 04               [12]  566 	inc	a
      00012A F5 23            [12]  567 	mov	_read,a
      00012C                        568 00103$:
                                    569 ;	test3threads.c:73: EA = 1;
                                    570 ;	assignBit
      00012C D2 AF            [12]  571 	setb	_EA
                                    572 ;	test3threads.c:75: SemaphoreSignal(mutex);
      00012E 05 20            [12]  573 	INC _mutex 
                                    574 ;	test3threads.c:76: SemaphoreSignal(empty);
      000130 05 22            [12]  575 	INC _empty 
                                    576 ;	test3threads.c:79: while(TI == 0); 
      000132                        577 00104$:
                                    578 ;	test3threads.c:80: TI = 0;
                                    579 ;	assignBit
      000132 10 99 D3         [24]  580 	jbc	_TI,00108$
                                    581 ;	test3threads.c:82: }
      000135 80 FB            [24]  582 	sjmp	00104$
                                    583 ;------------------------------------------------------------
                                    584 ;Allocation info for local variables in function 'main'
                                    585 ;------------------------------------------------------------
                                    586 ;	test3threads.c:84: void main(void)
                                    587 ;	-----------------------------------------
                                    588 ;	 function main
                                    589 ;	-----------------------------------------
      000137                        590 _main:
                                    591 ;	test3threads.c:86: SemaphoreCreate(mutex, 1);
      000137 75 20 01         [24]  592 	mov	_mutex,#0x01
                                    593 ;	test3threads.c:87: SemaphoreCreate(full, 0);
      00013A 75 21 00         [24]  594 	mov	_full,#0x00
                                    595 ;	test3threads.c:88: SemaphoreCreate(empty, 3);
      00013D 75 22 03         [24]  596 	mov	_empty,#0x03
                                    597 ;	test3threads.c:89: write = 0;
      000140 75 24 00         [24]  598 	mov	_write,#0x00
                                    599 ;	test3threads.c:90: read = 0;
      000143 75 23 00         [24]  600 	mov	_read,#0x00
                                    601 ;	test3threads.c:91: dir = 1;
      000146 75 38 01         [24]  602 	mov	_dir,#0x01
                                    603 ;	test3threads.c:92: ThreadCreate(Producer2);
      000149 90 00 BF         [24]  604 	mov	dptr,#_Producer2
      00014C 12 01 8B         [24]  605 	lcall	_ThreadCreate
                                    606 ;	test3threads.c:94: ThreadCreate(Producer1);
      00014F 90 00 81         [24]  607 	mov	dptr,#_Producer1
      000152 12 01 8B         [24]  608 	lcall	_ThreadCreate
                                    609 ;	test3threads.c:95: Consumer();
                                    610 ;	test3threads.c:96: }
      000155 02 00 FD         [24]  611 	ljmp	_Consumer
                                    612 ;------------------------------------------------------------
                                    613 ;Allocation info for local variables in function '_sdcc_gsinit_startup'
                                    614 ;------------------------------------------------------------
                                    615 ;	test3threads.c:98: void _sdcc_gsinit_startup(void) 
                                    616 ;	-----------------------------------------
                                    617 ;	 function _sdcc_gsinit_startup
                                    618 ;	-----------------------------------------
      000158                        619 __sdcc_gsinit_startup:
                                    620 ;	test3threads.c:102: __endasm;
      000158 02 01 65         [24]  621 	LJMP	_Bootstrap
                                    622 ;	test3threads.c:103: }
      00015B 22               [24]  623 	ret
                                    624 ;------------------------------------------------------------
                                    625 ;Allocation info for local variables in function '_mcs51_genRAMCLEAR'
                                    626 ;------------------------------------------------------------
                                    627 ;	test3threads.c:105: void _mcs51_genRAMCLEAR(void) {}
                                    628 ;	-----------------------------------------
                                    629 ;	 function _mcs51_genRAMCLEAR
                                    630 ;	-----------------------------------------
      00015C                        631 __mcs51_genRAMCLEAR:
      00015C 22               [24]  632 	ret
                                    633 ;------------------------------------------------------------
                                    634 ;Allocation info for local variables in function '_mcs51_genXINIT'
                                    635 ;------------------------------------------------------------
                                    636 ;	test3threads.c:106: void _mcs51_genXINIT(void) {}
                                    637 ;	-----------------------------------------
                                    638 ;	 function _mcs51_genXINIT
                                    639 ;	-----------------------------------------
      00015D                        640 __mcs51_genXINIT:
      00015D 22               [24]  641 	ret
                                    642 ;------------------------------------------------------------
                                    643 ;Allocation info for local variables in function '_mcs51_genXRAMCLEAR'
                                    644 ;------------------------------------------------------------
                                    645 ;	test3threads.c:107: void _mcs51_genXRAMCLEAR(void) {}
                                    646 ;	-----------------------------------------
                                    647 ;	 function _mcs51_genXRAMCLEAR
                                    648 ;	-----------------------------------------
      00015E                        649 __mcs51_genXRAMCLEAR:
      00015E 22               [24]  650 	ret
                                    651 ;------------------------------------------------------------
                                    652 ;Allocation info for local variables in function 'timer0_ISR'
                                    653 ;------------------------------------------------------------
                                    654 ;	test3threads.c:109: void timer0_ISR(void) __interrupt(1)
                                    655 ;	-----------------------------------------
                                    656 ;	 function timer0_ISR
                                    657 ;	-----------------------------------------
      00015F                        658 _timer0_ISR:
                                    659 ;	test3threads.c:113: __endasm;
      00015F 02 02 CA         [24]  660 	LJMP	_myTimer0Handler
                                    661 ;	test3threads.c:114: }
      000162 02 00 54         [24]  662 	ljmp	sdcc_atomic_maybe_rollback
                                    663 ;	eliminated unneeded mov psw,# (no regs used in bank)
                                    664 ;	eliminated unneeded push/pop not_psw
                                    665 ;	eliminated unneeded push/pop dpl
                                    666 ;	eliminated unneeded push/pop dph
                                    667 ;	eliminated unneeded push/pop b
                                    668 ;	eliminated unneeded push/pop acc
                                    669 	.area CSEG    (CODE)
                                    670 	.area CONST   (CODE)
                                    671 	.area XINIT   (CODE)
                                    672 	.area CABS    (ABS,CODE)
