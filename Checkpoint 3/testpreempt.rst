                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ISO C Compiler
                                      3 ; Version 4.5.0 #15242 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module testpreempt
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
                                     18 	.globl _Producer
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
                                    116 	.globl _bounded_buffer
                                    117 	.globl _next_char
                                    118 	.globl _write
                                    119 	.globl _read
                                    120 	.globl _empty
                                    121 	.globl _full
                                    122 	.globl _mutex
                                    123 ;--------------------------------------------------------
                                    124 ; special function registers
                                    125 ;--------------------------------------------------------
                                    126 	.area RSEG    (ABS,DATA)
      000000                        127 	.org 0x0000
                           000080   128 _P0	=	0x0080
                           000081   129 _SP	=	0x0081
                           000082   130 _DPL	=	0x0082
                           000083   131 _DPH	=	0x0083
                           000087   132 _PCON	=	0x0087
                           000088   133 _TCON	=	0x0088
                           000089   134 _TMOD	=	0x0089
                           00008A   135 _TL0	=	0x008a
                           00008B   136 _TL1	=	0x008b
                           00008C   137 _TH0	=	0x008c
                           00008D   138 _TH1	=	0x008d
                           000090   139 _P1	=	0x0090
                           000098   140 _SCON	=	0x0098
                           000099   141 _SBUF	=	0x0099
                           0000A0   142 _P2	=	0x00a0
                           0000A8   143 _IE	=	0x00a8
                           0000B0   144 _P3	=	0x00b0
                           0000B8   145 _IP	=	0x00b8
                           0000D0   146 _PSW	=	0x00d0
                           0000E0   147 _ACC	=	0x00e0
                           0000F0   148 _B	=	0x00f0
                                    149 ;--------------------------------------------------------
                                    150 ; special function bits
                                    151 ;--------------------------------------------------------
                                    152 	.area RSEG    (ABS,DATA)
      000000                        153 	.org 0x0000
                           000080   154 _P0_0	=	0x0080
                           000081   155 _P0_1	=	0x0081
                           000082   156 _P0_2	=	0x0082
                           000083   157 _P0_3	=	0x0083
                           000084   158 _P0_4	=	0x0084
                           000085   159 _P0_5	=	0x0085
                           000086   160 _P0_6	=	0x0086
                           000087   161 _P0_7	=	0x0087
                           000088   162 _IT0	=	0x0088
                           000089   163 _IE0	=	0x0089
                           00008A   164 _IT1	=	0x008a
                           00008B   165 _IE1	=	0x008b
                           00008C   166 _TR0	=	0x008c
                           00008D   167 _TF0	=	0x008d
                           00008E   168 _TR1	=	0x008e
                           00008F   169 _TF1	=	0x008f
                           000090   170 _P1_0	=	0x0090
                           000091   171 _P1_1	=	0x0091
                           000092   172 _P1_2	=	0x0092
                           000093   173 _P1_3	=	0x0093
                           000094   174 _P1_4	=	0x0094
                           000095   175 _P1_5	=	0x0095
                           000096   176 _P1_6	=	0x0096
                           000097   177 _P1_7	=	0x0097
                           000098   178 _RI	=	0x0098
                           000099   179 _TI	=	0x0099
                           00009A   180 _RB8	=	0x009a
                           00009B   181 _TB8	=	0x009b
                           00009C   182 _REN	=	0x009c
                           00009D   183 _SM2	=	0x009d
                           00009E   184 _SM1	=	0x009e
                           00009F   185 _SM0	=	0x009f
                           0000A0   186 _P2_0	=	0x00a0
                           0000A1   187 _P2_1	=	0x00a1
                           0000A2   188 _P2_2	=	0x00a2
                           0000A3   189 _P2_3	=	0x00a3
                           0000A4   190 _P2_4	=	0x00a4
                           0000A5   191 _P2_5	=	0x00a5
                           0000A6   192 _P2_6	=	0x00a6
                           0000A7   193 _P2_7	=	0x00a7
                           0000A8   194 _EX0	=	0x00a8
                           0000A9   195 _ET0	=	0x00a9
                           0000AA   196 _EX1	=	0x00aa
                           0000AB   197 _ET1	=	0x00ab
                           0000AC   198 _ES	=	0x00ac
                           0000AF   199 _EA	=	0x00af
                           0000B0   200 _P3_0	=	0x00b0
                           0000B1   201 _P3_1	=	0x00b1
                           0000B2   202 _P3_2	=	0x00b2
                           0000B3   203 _P3_3	=	0x00b3
                           0000B4   204 _P3_4	=	0x00b4
                           0000B5   205 _P3_5	=	0x00b5
                           0000B6   206 _P3_6	=	0x00b6
                           0000B7   207 _P3_7	=	0x00b7
                           0000B0   208 _RXD	=	0x00b0
                           0000B1   209 _TXD	=	0x00b1
                           0000B2   210 _INT0	=	0x00b2
                           0000B3   211 _INT1	=	0x00b3
                           0000B4   212 _T0	=	0x00b4
                           0000B5   213 _T1	=	0x00b5
                           0000B6   214 _WR	=	0x00b6
                           0000B7   215 _RD	=	0x00b7
                           0000B8   216 _PX0	=	0x00b8
                           0000B9   217 _PT0	=	0x00b9
                           0000BA   218 _PX1	=	0x00ba
                           0000BB   219 _PT1	=	0x00bb
                           0000BC   220 _PS	=	0x00bc
                           0000D0   221 _P	=	0x00d0
                           0000D1   222 _F1	=	0x00d1
                           0000D2   223 _OV	=	0x00d2
                           0000D3   224 _RS0	=	0x00d3
                           0000D4   225 _RS1	=	0x00d4
                           0000D5   226 _F0	=	0x00d5
                           0000D6   227 _AC	=	0x00d6
                           0000D7   228 _CY	=	0x00d7
                                    229 ;--------------------------------------------------------
                                    230 ; overlayable register banks
                                    231 ;--------------------------------------------------------
                                    232 	.area REG_BANK_0	(REL,OVR,DATA)
      000000                        233 	.ds 8
                                    234 ;--------------------------------------------------------
                                    235 ; internal ram data
                                    236 ;--------------------------------------------------------
                                    237 	.area DSEG    (DATA)
                           000020   238 _mutex	=	0x0020
                           000021   239 _full	=	0x0021
                           000022   240 _empty	=	0x0022
                           000023   241 _read	=	0x0023
                           000024   242 _write	=	0x0024
                           000025   243 _next_char	=	0x0025
                           000026   244 _bounded_buffer	=	0x0026
                                    245 ;--------------------------------------------------------
                                    246 ; overlayable items in internal ram
                                    247 ;--------------------------------------------------------
                                    248 ;--------------------------------------------------------
                                    249 ; Stack segment in internal ram
                                    250 ;--------------------------------------------------------
                                    251 	.area SSEG
      000021                        252 __start__stack:
      000021                        253 	.ds	1
                                    254 
                                    255 ;--------------------------------------------------------
                                    256 ; indirectly addressable internal ram data
                                    257 ;--------------------------------------------------------
                                    258 	.area ISEG    (DATA)
                                    259 ;--------------------------------------------------------
                                    260 ; absolute internal ram data
                                    261 ;--------------------------------------------------------
                                    262 	.area IABS    (ABS,DATA)
                                    263 	.area IABS    (ABS,DATA)
                                    264 ;--------------------------------------------------------
                                    265 ; bit data
                                    266 ;--------------------------------------------------------
                                    267 	.area BSEG    (BIT)
                                    268 ;--------------------------------------------------------
                                    269 ; paged external ram data
                                    270 ;--------------------------------------------------------
                                    271 	.area PSEG    (PAG,XDATA)
                                    272 ;--------------------------------------------------------
                                    273 ; uninitialized external ram data
                                    274 ;--------------------------------------------------------
                                    275 	.area XSEG    (XDATA)
                                    276 ;--------------------------------------------------------
                                    277 ; absolute external ram data
                                    278 ;--------------------------------------------------------
                                    279 	.area XABS    (ABS,XDATA)
                                    280 ;--------------------------------------------------------
                                    281 ; initialized external ram data
                                    282 ;--------------------------------------------------------
                                    283 	.area XISEG   (XDATA)
                                    284 	.area HOME    (CODE)
                                    285 	.area GSINIT0 (CODE)
                                    286 	.area GSINIT1 (CODE)
                                    287 	.area GSINIT2 (CODE)
                                    288 	.area GSINIT3 (CODE)
                                    289 	.area GSINIT4 (CODE)
                                    290 	.area GSINIT5 (CODE)
                                    291 	.area GSINIT  (CODE)
                                    292 	.area GSFINAL (CODE)
                                    293 	.area CSEG    (CODE)
                                    294 ;--------------------------------------------------------
                                    295 ; interrupt vector
                                    296 ;--------------------------------------------------------
                                    297 	.area HOME    (CODE)
      000000                        298 __interrupt_vect:
      000000 02 01 17         [24]  299 	ljmp	__sdcc_gsinit_startup
      000003 32               [24]  300 	reti
      000004                        301 	.ds	7
      00000B 02 01 1E         [24]  302 	ljmp	_timer0_ISR
                                    303 ; restartable atomic support routines
      00000E                        304 	.ds	2
      000010                        305 sdcc_atomic_exchange_rollback_start::
      000010 00               [12]  306 	nop
      000011 00               [12]  307 	nop
      000012                        308 sdcc_atomic_exchange_pdata_impl:
      000012 E2               [24]  309 	movx	a, @r0
      000013 FB               [12]  310 	mov	r3, a
      000014 EA               [12]  311 	mov	a, r2
      000015 F2               [24]  312 	movx	@r0, a
      000016 80 2C            [24]  313 	sjmp	sdcc_atomic_exchange_exit
      000018 00               [12]  314 	nop
      000019 00               [12]  315 	nop
      00001A                        316 sdcc_atomic_exchange_xdata_impl:
      00001A E0               [24]  317 	movx	a, @dptr
      00001B FB               [12]  318 	mov	r3, a
      00001C EA               [12]  319 	mov	a, r2
      00001D F0               [24]  320 	movx	@dptr, a
      00001E 80 24            [24]  321 	sjmp	sdcc_atomic_exchange_exit
      000020                        322 sdcc_atomic_compare_exchange_idata_impl:
      000020 E6               [12]  323 	mov	a, @r0
      000021 B5 02 02         [24]  324 	cjne	a, ar2, .+#5
      000024 EB               [12]  325 	mov	a, r3
      000025 F6               [12]  326 	mov	@r0, a
      000026 22               [24]  327 	ret
      000027 00               [12]  328 	nop
      000028                        329 sdcc_atomic_compare_exchange_pdata_impl:
      000028 E2               [24]  330 	movx	a, @r0
      000029 B5 02 02         [24]  331 	cjne	a, ar2, .+#5
      00002C EB               [12]  332 	mov	a, r3
      00002D F2               [24]  333 	movx	@r0, a
      00002E 22               [24]  334 	ret
      00002F 00               [12]  335 	nop
      000030                        336 sdcc_atomic_compare_exchange_xdata_impl:
      000030 E0               [24]  337 	movx	a, @dptr
      000031 B5 02 02         [24]  338 	cjne	a, ar2, .+#5
      000034 EB               [12]  339 	mov	a, r3
      000035 F0               [24]  340 	movx	@dptr, a
      000036 22               [24]  341 	ret
      000037                        342 sdcc_atomic_exchange_rollback_end::
                                    343 
      000037                        344 sdcc_atomic_exchange_gptr_impl::
      000037 30 F6 E0         [24]  345 	jnb	b.6, sdcc_atomic_exchange_xdata_impl
      00003A A8 82            [24]  346 	mov	r0, dpl
      00003C 20 F5 D3         [24]  347 	jb	b.5, sdcc_atomic_exchange_pdata_impl
      00003F                        348 sdcc_atomic_exchange_idata_impl:
      00003F EA               [12]  349 	mov	a, r2
      000040 C6               [12]  350 	xch	a, @r0
      000041 F5 82            [12]  351 	mov	dpl, a
      000043 22               [24]  352 	ret
      000044                        353 sdcc_atomic_exchange_exit:
      000044 8B 82            [24]  354 	mov	dpl, r3
      000046 22               [24]  355 	ret
      000047                        356 sdcc_atomic_compare_exchange_gptr_impl::
      000047 30 F6 E6         [24]  357 	jnb	b.6, sdcc_atomic_compare_exchange_xdata_impl
      00004A A8 82            [24]  358 	mov	r0, dpl
      00004C 20 F5 D9         [24]  359 	jb	b.5, sdcc_atomic_compare_exchange_pdata_impl
      00004F 80 CF            [24]  360 	sjmp	sdcc_atomic_compare_exchange_idata_impl
                                    361 ;--------------------------------------------------------
                                    362 ; global & static initialisations
                                    363 ;--------------------------------------------------------
                                    364 	.area HOME    (CODE)
                                    365 	.area GSINIT  (CODE)
                                    366 	.area GSFINAL (CODE)
                                    367 	.area GSINIT  (CODE)
                                    368 	.globl __sdcc_gsinit_startup
                                    369 	.globl __sdcc_program_startup
                                    370 	.globl __start__stack
                                    371 	.globl __mcs51_genXINIT
                                    372 	.globl __mcs51_genXRAMCLEAR
                                    373 	.globl __mcs51_genRAMCLEAR
                                    374 	.area GSFINAL (CODE)
      00007E 02 00 51         [24]  375 	ljmp	__sdcc_program_startup
                                    376 ;--------------------------------------------------------
                                    377 ; Home
                                    378 ;--------------------------------------------------------
                                    379 	.area HOME    (CODE)
                                    380 	.area HOME    (CODE)
      000051                        381 __sdcc_program_startup:
      000051 02 00 F9         [24]  382 	ljmp	_main
                                    383 ;	return from main will return to caller
                                    384 ;--------------------------------------------------------
                                    385 ; code
                                    386 ;--------------------------------------------------------
                                    387 	.area CSEG    (CODE)
                                    388 ;------------------------------------------------------------
                                    389 ;Allocation info for local variables in function 'Producer'
                                    390 ;------------------------------------------------------------
                                    391 ;	testpreempt.c:12: void Producer(void) {
                                    392 ;	-----------------------------------------
                                    393 ;	 function Producer
                                    394 ;	-----------------------------------------
      000081                        395 _Producer:
                           000007   396 	ar7 = 0x07
                           000006   397 	ar6 = 0x06
                           000005   398 	ar5 = 0x05
                           000004   399 	ar4 = 0x04
                           000003   400 	ar3 = 0x03
                           000002   401 	ar2 = 0x02
                           000001   402 	ar1 = 0x01
                           000000   403 	ar0 = 0x00
                                    404 ;	testpreempt.c:13: next_char = 'A';
      000081 75 25 41         [24]  405 	mov	_next_char,#0x41
                                    406 ;	testpreempt.c:14: while (1) {
      000084                        407 00108$:
                                    408 ;	testpreempt.c:15: SemaphoreWait(empty); // semaphore dri notes
      000084                        409 0$:
      000084 E5 22            [12]  410 	MOV A, _empty 
      000086 60 FC            [24]  411 	JZ 0$ 
      000088 15 22            [12]  412 	DEC _empty 
                                    413 ;	testpreempt.c:16: SemaphoreWait(mutex);
      00008A                        414 1$:
      00008A E5 20            [12]  415 	MOV A, _mutex 
      00008C 60 FC            [24]  416 	JZ 1$ 
      00008E 15 20            [12]  417 	DEC _mutex 
                                    418 ;	testpreempt.c:18: EA = 0;
                                    419 ;	assignBit
      000090 C2 AF            [12]  420 	clr	_EA
                                    421 ;	testpreempt.c:19: bounded_buffer[write] = next_char;
      000092 E5 24            [12]  422 	mov	a,_write
      000094 24 26            [12]  423 	add	a, #_bounded_buffer
      000096 F8               [12]  424 	mov	r0,a
      000097 A6 25            [24]  425 	mov	@r0,_next_char
                                    426 ;	testpreempt.c:20: if (write == 2) write = 0;
      000099 74 02            [12]  427 	mov	a,#0x02
      00009B B5 24 05         [24]  428 	cjne	a,_write,00102$
      00009E 75 24 00         [24]  429 	mov	_write,#0x00
      0000A1 80 05            [24]  430 	sjmp	00103$
      0000A3                        431 00102$:
                                    432 ;	testpreempt.c:21: else write++;
      0000A3 E5 24            [12]  433 	mov	a,_write
      0000A5 04               [12]  434 	inc	a
      0000A6 F5 24            [12]  435 	mov	_write,a
      0000A8                        436 00103$:
                                    437 ;	testpreempt.c:22: EA = 1;
                                    438 ;	assignBit
      0000A8 D2 AF            [12]  439 	setb	_EA
                                    440 ;	testpreempt.c:24: SemaphoreSignal(mutex);
      0000AA 05 20            [12]  441 	INC _mutex 
                                    442 ;	testpreempt.c:25: SemaphoreSignal(full);
      0000AC 05 21            [12]  443 	INC _full 
                                    444 ;	testpreempt.c:27: if (next_char == 'Z') next_char = 'A';
      0000AE 74 5A            [12]  445 	mov	a,#0x5a
      0000B0 B5 25 05         [24]  446 	cjne	a,_next_char,00105$
      0000B3 75 25 41         [24]  447 	mov	_next_char,#0x41
      0000B6 80 CC            [24]  448 	sjmp	00108$
      0000B8                        449 00105$:
                                    450 ;	testpreempt.c:28: else next_char++;
      0000B8 E5 25            [12]  451 	mov	a,_next_char
      0000BA 04               [12]  452 	inc	a
      0000BB F5 25            [12]  453 	mov	_next_char,a
                                    454 ;	testpreempt.c:30: }
      0000BD 80 C5            [24]  455 	sjmp	00108$
                                    456 ;------------------------------------------------------------
                                    457 ;Allocation info for local variables in function 'Consumer'
                                    458 ;------------------------------------------------------------
                                    459 ;	testpreempt.c:32: void Consumer(void) 
                                    460 ;	-----------------------------------------
                                    461 ;	 function Consumer
                                    462 ;	-----------------------------------------
      0000BF                        463 _Consumer:
                                    464 ;	testpreempt.c:34: TMOD |= 0x20;
      0000BF 43 89 20         [24]  465 	orl	_TMOD,#0x20
                                    466 ;	testpreempt.c:35: TH1 = 0xFA;
      0000C2 75 8D FA         [24]  467 	mov	_TH1,#0xfa
                                    468 ;	testpreempt.c:36: SCON = 0x50;
      0000C5 75 98 50         [24]  469 	mov	_SCON,#0x50
                                    470 ;	testpreempt.c:37: TR1 = 1;
                                    471 ;	assignBit
      0000C8 D2 8E            [12]  472 	setb	_TR1
                                    473 ;	testpreempt.c:39: while (1)
      0000CA                        474 00108$:
                                    475 ;	testpreempt.c:41: SemaphoreWait(full);
      0000CA                        476 2$:
      0000CA E5 21            [12]  477 	MOV A, _full 
      0000CC 60 FC            [24]  478 	JZ 2$ 
      0000CE 15 21            [12]  479 	DEC _full 
                                    480 ;	testpreempt.c:42: SemaphoreWait(mutex);
      0000D0                        481 3$:
      0000D0 E5 20            [12]  482 	MOV A, _mutex 
      0000D2 60 FC            [24]  483 	JZ 3$ 
      0000D4 15 20            [12]  484 	DEC _mutex 
                                    485 ;	testpreempt.c:44: EA = 0;
                                    486 ;	assignBit
      0000D6 C2 AF            [12]  487 	clr	_EA
                                    488 ;	testpreempt.c:45: SBUF = bounded_buffer[read];
      0000D8 E5 23            [12]  489 	mov	a,_read
      0000DA 24 26            [12]  490 	add	a, #_bounded_buffer
      0000DC F9               [12]  491 	mov	r1,a
      0000DD 87 99            [24]  492 	mov	_SBUF,@r1
                                    493 ;	testpreempt.c:46: if (read == 2) read = 0;
      0000DF 74 02            [12]  494 	mov	a,#0x02
      0000E1 B5 23 05         [24]  495 	cjne	a,_read,00102$
      0000E4 75 23 00         [24]  496 	mov	_read,#0x00
      0000E7 80 05            [24]  497 	sjmp	00103$
      0000E9                        498 00102$:
                                    499 ;	testpreempt.c:47: else read++;
      0000E9 E5 23            [12]  500 	mov	a,_read
      0000EB 04               [12]  501 	inc	a
      0000EC F5 23            [12]  502 	mov	_read,a
      0000EE                        503 00103$:
                                    504 ;	testpreempt.c:48: EA = 1;
                                    505 ;	assignBit
      0000EE D2 AF            [12]  506 	setb	_EA
                                    507 ;	testpreempt.c:50: SemaphoreSignal(mutex);
      0000F0 05 20            [12]  508 	INC _mutex 
                                    509 ;	testpreempt.c:51: SemaphoreSignal(empty);
      0000F2 05 22            [12]  510 	INC _empty 
                                    511 ;	testpreempt.c:53: while(TI == 0); 
      0000F4                        512 00104$:
                                    513 ;	testpreempt.c:54: TI = 0;
                                    514 ;	assignBit
      0000F4 10 99 D3         [24]  515 	jbc	_TI,00108$
                                    516 ;	testpreempt.c:56: }
      0000F7 80 FB            [24]  517 	sjmp	00104$
                                    518 ;------------------------------------------------------------
                                    519 ;Allocation info for local variables in function 'main'
                                    520 ;------------------------------------------------------------
                                    521 ;	testpreempt.c:58: void main(void) {
                                    522 ;	-----------------------------------------
                                    523 ;	 function main
                                    524 ;	-----------------------------------------
      0000F9                        525 _main:
                                    526 ;	testpreempt.c:59: SemaphoreCreate(mutex, 1);
      0000F9 75 20 01         [24]  527 	mov	_mutex,#0x01
                                    528 ;	testpreempt.c:60: SemaphoreCreate(full, 0);
      0000FC 75 21 00         [24]  529 	mov	_full,#0x00
                                    530 ;	testpreempt.c:61: SemaphoreCreate(empty, 3);
      0000FF 75 22 03         [24]  531 	mov	_empty,#0x03
                                    532 ;	testpreempt.c:62: bounded_buffer[0] = ' ';
      000102 75 26 20         [24]  533 	mov	_bounded_buffer,#0x20
                                    534 ;	testpreempt.c:63: bounded_buffer[1] = ' ';
      000105 75 27 20         [24]  535 	mov	(_bounded_buffer + 0x0001),#0x20
                                    536 ;	testpreempt.c:64: bounded_buffer[2] = ' ';
      000108 75 28 20         [24]  537 	mov	(_bounded_buffer + 0x0002),#0x20
                                    538 ;	testpreempt.c:65: read = 0;
      00010B 75 23 00         [24]  539 	mov	_read,#0x00
                                    540 ;	testpreempt.c:67: ThreadCreate(Producer);
      00010E 90 00 81         [24]  541 	mov	dptr,#_Producer
      000111 12 01 4A         [24]  542 	lcall	_ThreadCreate
                                    543 ;	testpreempt.c:68: Consumer();
                                    544 ;	testpreempt.c:69: }
      000114 02 00 BF         [24]  545 	ljmp	_Consumer
                                    546 ;------------------------------------------------------------
                                    547 ;Allocation info for local variables in function '_sdcc_gsinit_startup'
                                    548 ;------------------------------------------------------------
                                    549 ;	testpreempt.c:71: void _sdcc_gsinit_startup(void) 
                                    550 ;	-----------------------------------------
                                    551 ;	 function _sdcc_gsinit_startup
                                    552 ;	-----------------------------------------
      000117                        553 __sdcc_gsinit_startup:
                                    554 ;	testpreempt.c:75: __endasm;
      000117 02 01 24         [24]  555 	LJMP	_Bootstrap
                                    556 ;	testpreempt.c:76: }
      00011A 22               [24]  557 	ret
                                    558 ;------------------------------------------------------------
                                    559 ;Allocation info for local variables in function '_mcs51_genRAMCLEAR'
                                    560 ;------------------------------------------------------------
                                    561 ;	testpreempt.c:78: void _mcs51_genRAMCLEAR(void) {}
                                    562 ;	-----------------------------------------
                                    563 ;	 function _mcs51_genRAMCLEAR
                                    564 ;	-----------------------------------------
      00011B                        565 __mcs51_genRAMCLEAR:
      00011B 22               [24]  566 	ret
                                    567 ;------------------------------------------------------------
                                    568 ;Allocation info for local variables in function '_mcs51_genXINIT'
                                    569 ;------------------------------------------------------------
                                    570 ;	testpreempt.c:79: void _mcs51_genXINIT(void) {}
                                    571 ;	-----------------------------------------
                                    572 ;	 function _mcs51_genXINIT
                                    573 ;	-----------------------------------------
      00011C                        574 __mcs51_genXINIT:
      00011C 22               [24]  575 	ret
                                    576 ;------------------------------------------------------------
                                    577 ;Allocation info for local variables in function '_mcs51_genXRAMCLEAR'
                                    578 ;------------------------------------------------------------
                                    579 ;	testpreempt.c:80: void _mcs51_genXRAMCLEAR(void) {}
                                    580 ;	-----------------------------------------
                                    581 ;	 function _mcs51_genXRAMCLEAR
                                    582 ;	-----------------------------------------
      00011D                        583 __mcs51_genXRAMCLEAR:
      00011D 22               [24]  584 	ret
                                    585 ;------------------------------------------------------------
                                    586 ;Allocation info for local variables in function 'timer0_ISR'
                                    587 ;------------------------------------------------------------
                                    588 ;	testpreempt.c:82: void timer0_ISR(void) __interrupt(1)
                                    589 ;	-----------------------------------------
                                    590 ;	 function timer0_ISR
                                    591 ;	-----------------------------------------
      00011E                        592 _timer0_ISR:
                                    593 ;	testpreempt.c:86: __endasm;
      00011E 02 02 89         [24]  594 	LJMP	_myTimer0Handler
                                    595 ;	testpreempt.c:87: }
      000121 02 00 54         [24]  596 	ljmp	sdcc_atomic_maybe_rollback
                                    597 ;	eliminated unneeded mov psw,# (no regs used in bank)
                                    598 ;	eliminated unneeded push/pop not_psw
                                    599 ;	eliminated unneeded push/pop dpl
                                    600 ;	eliminated unneeded push/pop dph
                                    601 ;	eliminated unneeded push/pop b
                                    602 ;	eliminated unneeded push/pop acc
                                    603 	.area CSEG    (CODE)
                                    604 	.area CONST   (CODE)
                                    605 	.area XINIT   (CODE)
                                    606 	.area CABS    (ABS,CODE)
