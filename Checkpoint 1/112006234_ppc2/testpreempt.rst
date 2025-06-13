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
                                    116 	.globl _shared_buffer
                                    117 	.globl _next_char
                                    118 	.globl _full
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
                           000021   234 _full	=	0x0021
                           000025   235 _next_char	=	0x0025
                           000027   236 _shared_buffer	=	0x0027
                                    237 ;--------------------------------------------------------
                                    238 ; overlayable items in internal ram
                                    239 ;--------------------------------------------------------
                                    240 ;--------------------------------------------------------
                                    241 ; Stack segment in internal ram
                                    242 ;--------------------------------------------------------
                                    243 	.area SSEG
      000021                        244 __start__stack:
      000021                        245 	.ds	1
                                    246 
                                    247 ;--------------------------------------------------------
                                    248 ; indirectly addressable internal ram data
                                    249 ;--------------------------------------------------------
                                    250 	.area ISEG    (DATA)
                                    251 ;--------------------------------------------------------
                                    252 ; absolute internal ram data
                                    253 ;--------------------------------------------------------
                                    254 	.area IABS    (ABS,DATA)
                                    255 	.area IABS    (ABS,DATA)
                                    256 ;--------------------------------------------------------
                                    257 ; bit data
                                    258 ;--------------------------------------------------------
                                    259 	.area BSEG    (BIT)
                                    260 ;--------------------------------------------------------
                                    261 ; paged external ram data
                                    262 ;--------------------------------------------------------
                                    263 	.area PSEG    (PAG,XDATA)
                                    264 ;--------------------------------------------------------
                                    265 ; uninitialized external ram data
                                    266 ;--------------------------------------------------------
                                    267 	.area XSEG    (XDATA)
                                    268 ;--------------------------------------------------------
                                    269 ; absolute external ram data
                                    270 ;--------------------------------------------------------
                                    271 	.area XABS    (ABS,XDATA)
                                    272 ;--------------------------------------------------------
                                    273 ; initialized external ram data
                                    274 ;--------------------------------------------------------
                                    275 	.area XISEG   (XDATA)
                                    276 	.area HOME    (CODE)
                                    277 	.area GSINIT0 (CODE)
                                    278 	.area GSINIT1 (CODE)
                                    279 	.area GSINIT2 (CODE)
                                    280 	.area GSINIT3 (CODE)
                                    281 	.area GSINIT4 (CODE)
                                    282 	.area GSINIT5 (CODE)
                                    283 	.area GSINIT  (CODE)
                                    284 	.area GSFINAL (CODE)
                                    285 	.area CSEG    (CODE)
                                    286 ;--------------------------------------------------------
                                    287 ; interrupt vector
                                    288 ;--------------------------------------------------------
                                    289 	.area HOME    (CODE)
      000000                        290 __interrupt_vect:
      000000 02 00 D3         [24]  291 	ljmp	__sdcc_gsinit_startup
      000003 32               [24]  292 	reti
      000004                        293 	.ds	7
      00000B 02 00 DA         [24]  294 	ljmp	_timer0_ISR
                                    295 ; restartable atomic support routines
      00000E                        296 	.ds	2
      000010                        297 sdcc_atomic_exchange_rollback_start::
      000010 00               [12]  298 	nop
      000011 00               [12]  299 	nop
      000012                        300 sdcc_atomic_exchange_pdata_impl:
      000012 E2               [24]  301 	movx	a, @r0
      000013 FB               [12]  302 	mov	r3, a
      000014 EA               [12]  303 	mov	a, r2
      000015 F2               [24]  304 	movx	@r0, a
      000016 80 2C            [24]  305 	sjmp	sdcc_atomic_exchange_exit
      000018 00               [12]  306 	nop
      000019 00               [12]  307 	nop
      00001A                        308 sdcc_atomic_exchange_xdata_impl:
      00001A E0               [24]  309 	movx	a, @dptr
      00001B FB               [12]  310 	mov	r3, a
      00001C EA               [12]  311 	mov	a, r2
      00001D F0               [24]  312 	movx	@dptr, a
      00001E 80 24            [24]  313 	sjmp	sdcc_atomic_exchange_exit
      000020                        314 sdcc_atomic_compare_exchange_idata_impl:
      000020 E6               [12]  315 	mov	a, @r0
      000021 B5 02 02         [24]  316 	cjne	a, ar2, .+#5
      000024 EB               [12]  317 	mov	a, r3
      000025 F6               [12]  318 	mov	@r0, a
      000026 22               [24]  319 	ret
      000027 00               [12]  320 	nop
      000028                        321 sdcc_atomic_compare_exchange_pdata_impl:
      000028 E2               [24]  322 	movx	a, @r0
      000029 B5 02 02         [24]  323 	cjne	a, ar2, .+#5
      00002C EB               [12]  324 	mov	a, r3
      00002D F2               [24]  325 	movx	@r0, a
      00002E 22               [24]  326 	ret
      00002F 00               [12]  327 	nop
      000030                        328 sdcc_atomic_compare_exchange_xdata_impl:
      000030 E0               [24]  329 	movx	a, @dptr
      000031 B5 02 02         [24]  330 	cjne	a, ar2, .+#5
      000034 EB               [12]  331 	mov	a, r3
      000035 F0               [24]  332 	movx	@dptr, a
      000036 22               [24]  333 	ret
      000037                        334 sdcc_atomic_exchange_rollback_end::
                                    335 
      000037                        336 sdcc_atomic_exchange_gptr_impl::
      000037 30 F6 E0         [24]  337 	jnb	b.6, sdcc_atomic_exchange_xdata_impl
      00003A A8 82            [24]  338 	mov	r0, dpl
      00003C 20 F5 D3         [24]  339 	jb	b.5, sdcc_atomic_exchange_pdata_impl
      00003F                        340 sdcc_atomic_exchange_idata_impl:
      00003F EA               [12]  341 	mov	a, r2
      000040 C6               [12]  342 	xch	a, @r0
      000041 F5 82            [12]  343 	mov	dpl, a
      000043 22               [24]  344 	ret
      000044                        345 sdcc_atomic_exchange_exit:
      000044 8B 82            [24]  346 	mov	dpl, r3
      000046 22               [24]  347 	ret
      000047                        348 sdcc_atomic_compare_exchange_gptr_impl::
      000047 30 F6 E6         [24]  349 	jnb	b.6, sdcc_atomic_compare_exchange_xdata_impl
      00004A A8 82            [24]  350 	mov	r0, dpl
      00004C 20 F5 D9         [24]  351 	jb	b.5, sdcc_atomic_compare_exchange_pdata_impl
      00004F 80 CF            [24]  352 	sjmp	sdcc_atomic_compare_exchange_idata_impl
                                    353 ;--------------------------------------------------------
                                    354 ; global & static initialisations
                                    355 ;--------------------------------------------------------
                                    356 	.area HOME    (CODE)
                                    357 	.area GSINIT  (CODE)
                                    358 	.area GSFINAL (CODE)
                                    359 	.area GSINIT  (CODE)
                                    360 	.globl __sdcc_gsinit_startup
                                    361 	.globl __sdcc_program_startup
                                    362 	.globl __start__stack
                                    363 	.globl __mcs51_genXINIT
                                    364 	.globl __mcs51_genXRAMCLEAR
                                    365 	.globl __mcs51_genRAMCLEAR
                                    366 	.area GSFINAL (CODE)
      00007E 02 00 51         [24]  367 	ljmp	__sdcc_program_startup
                                    368 ;--------------------------------------------------------
                                    369 ; Home
                                    370 ;--------------------------------------------------------
                                    371 	.area HOME    (CODE)
                                    372 	.area HOME    (CODE)
      000051                        373 __sdcc_program_startup:
      000051 02 00 C1         [24]  374 	ljmp	_main
                                    375 ;	return from main will return to caller
                                    376 ;--------------------------------------------------------
                                    377 ; code
                                    378 ;--------------------------------------------------------
                                    379 	.area CSEG    (CODE)
                                    380 ;------------------------------------------------------------
                                    381 ;Allocation info for local variables in function 'Producer'
                                    382 ;------------------------------------------------------------
                                    383 ;	testpreempt.c:8: void Producer(void)
                                    384 ;	-----------------------------------------
                                    385 ;	 function Producer
                                    386 ;	-----------------------------------------
      000081                        387 _Producer:
                           000007   388 	ar7 = 0x07
                           000006   389 	ar6 = 0x06
                           000005   390 	ar5 = 0x05
                           000004   391 	ar4 = 0x04
                           000003   392 	ar3 = 0x03
                           000002   393 	ar2 = 0x02
                           000001   394 	ar1 = 0x01
                           000000   395 	ar0 = 0x00
                                    396 ;	testpreempt.c:10: next_char = 'A';
      000081 75 25 41         [24]  397 	mov	_next_char,#0x41
                                    398 ;	testpreempt.c:13: while(full);
      000084                        399 00101$:
      000084 E5 21            [12]  400 	mov	a,_full
      000086 70 FC            [24]  401 	jnz	00101$
                                    402 ;	testpreempt.c:14: EA = 0;                
                                    403 ;	assignBit
      000088 C2 AF            [12]  404 	clr	_EA
                                    405 ;	testpreempt.c:15: shared_buffer = next_char;
      00008A 85 25 27         [24]  406 	mov	_shared_buffer,_next_char
                                    407 ;	testpreempt.c:16: full = 1;
      00008D 75 21 01         [24]  408 	mov	_full,#0x01
                                    409 ;	testpreempt.c:17: EA = 1;
                                    410 ;	assignBit
      000090 D2 AF            [12]  411 	setb	_EA
                                    412 ;	testpreempt.c:19: if (next_char == 'Z') next_char = 'A';
      000092 74 5A            [12]  413 	mov	a,#0x5a
      000094 B5 25 05         [24]  414 	cjne	a,_next_char,00105$
      000097 75 25 41         [24]  415 	mov	_next_char,#0x41
      00009A 80 E8            [24]  416 	sjmp	00101$
      00009C                        417 00105$:
                                    418 ;	testpreempt.c:20: else next_char++;          
      00009C E5 25            [12]  419 	mov	a,_next_char
      00009E 04               [12]  420 	inc	a
      00009F F5 25            [12]  421 	mov	_next_char,a
                                    422 ;	testpreempt.c:22: }
      0000A1 80 E1            [24]  423 	sjmp	00101$
                                    424 ;------------------------------------------------------------
                                    425 ;Allocation info for local variables in function 'Consumer'
                                    426 ;------------------------------------------------------------
                                    427 ;	testpreempt.c:25: void Consumer(void) 
                                    428 ;	-----------------------------------------
                                    429 ;	 function Consumer
                                    430 ;	-----------------------------------------
      0000A3                        431 _Consumer:
                                    432 ;	testpreempt.c:27: TMOD |= 0x20;
      0000A3 43 89 20         [24]  433 	orl	_TMOD,#0x20
                                    434 ;	testpreempt.c:28: TH1 = 0xFA;
      0000A6 75 8D FA         [24]  435 	mov	_TH1,#0xfa
                                    436 ;	testpreempt.c:29: SCON = 0x50;
      0000A9 75 98 50         [24]  437 	mov	_SCON,#0x50
                                    438 ;	testpreempt.c:30: TR1 = 1;
                                    439 ;	assignBit
      0000AC D2 8E            [12]  440 	setb	_TR1
                                    441 ;	testpreempt.c:32: while (full == 0);
      0000AE                        442 00101$:
      0000AE E5 21            [12]  443 	mov	a,_full
      0000B0 60 FC            [24]  444 	jz	00101$
                                    445 ;	testpreempt.c:33: EA = 0;
                                    446 ;	assignBit
      0000B2 C2 AF            [12]  447 	clr	_EA
                                    448 ;	testpreempt.c:34: SBUF = shared_buffer;
      0000B4 85 27 99         [24]  449 	mov	_SBUF,_shared_buffer
                                    450 ;	testpreempt.c:35: full = 0;
      0000B7 75 21 00         [24]  451 	mov	_full,#0x00
                                    452 ;	testpreempt.c:36: EA = 1;          
                                    453 ;	assignBit
      0000BA D2 AF            [12]  454 	setb	_EA
                                    455 ;	testpreempt.c:38: while(TI == 0); 
      0000BC                        456 00104$:
                                    457 ;	testpreempt.c:39: TI = 0;
                                    458 ;	assignBit
      0000BC 10 99 EF         [24]  459 	jbc	_TI,00101$
                                    460 ;	testpreempt.c:41: }
      0000BF 80 FB            [24]  461 	sjmp	00104$
                                    462 ;------------------------------------------------------------
                                    463 ;Allocation info for local variables in function 'main'
                                    464 ;------------------------------------------------------------
                                    465 ;	testpreempt.c:43: void main(void)
                                    466 ;	-----------------------------------------
                                    467 ;	 function main
                                    468 ;	-----------------------------------------
      0000C1                        469 _main:
                                    470 ;	testpreempt.c:45: shared_buffer = '\0';
      0000C1 75 27 00         [24]  471 	mov	_shared_buffer,#0x00
                                    472 ;	testpreempt.c:46: next_char = 'A';
      0000C4 75 25 41         [24]  473 	mov	_next_char,#0x41
                                    474 ;	testpreempt.c:47: full = 0;
      0000C7 75 21 00         [24]  475 	mov	_full,#0x00
                                    476 ;	testpreempt.c:48: ThreadCreate(Producer);
      0000CA 90 00 81         [24]  477 	mov	dptr,#_Producer
      0000CD 12 01 06         [24]  478 	lcall	_ThreadCreate
                                    479 ;	testpreempt.c:49: Consumer();
                                    480 ;	testpreempt.c:50: }
      0000D0 02 00 A3         [24]  481 	ljmp	_Consumer
                                    482 ;------------------------------------------------------------
                                    483 ;Allocation info for local variables in function '_sdcc_gsinit_startup'
                                    484 ;------------------------------------------------------------
                                    485 ;	testpreempt.c:52: void _sdcc_gsinit_startup(void) {
                                    486 ;	-----------------------------------------
                                    487 ;	 function _sdcc_gsinit_startup
                                    488 ;	-----------------------------------------
      0000D3                        489 __sdcc_gsinit_startup:
                                    490 ;	testpreempt.c:55: __endasm;
      0000D3 02 00 E0         [24]  491 	LJMP	_Bootstrap
                                    492 ;	testpreempt.c:56: }
      0000D6 22               [24]  493 	ret
                                    494 ;------------------------------------------------------------
                                    495 ;Allocation info for local variables in function '_mcs51_genRAMCLEAR'
                                    496 ;------------------------------------------------------------
                                    497 ;	testpreempt.c:58: void _mcs51_genRAMCLEAR(void) {}
                                    498 ;	-----------------------------------------
                                    499 ;	 function _mcs51_genRAMCLEAR
                                    500 ;	-----------------------------------------
      0000D7                        501 __mcs51_genRAMCLEAR:
      0000D7 22               [24]  502 	ret
                                    503 ;------------------------------------------------------------
                                    504 ;Allocation info for local variables in function '_mcs51_genXINIT'
                                    505 ;------------------------------------------------------------
                                    506 ;	testpreempt.c:59: void _mcs51_genXINIT(void) {}
                                    507 ;	-----------------------------------------
                                    508 ;	 function _mcs51_genXINIT
                                    509 ;	-----------------------------------------
      0000D8                        510 __mcs51_genXINIT:
      0000D8 22               [24]  511 	ret
                                    512 ;------------------------------------------------------------
                                    513 ;Allocation info for local variables in function '_mcs51_genXRAMCLEAR'
                                    514 ;------------------------------------------------------------
                                    515 ;	testpreempt.c:60: void _mcs51_genXRAMCLEAR(void) {}
                                    516 ;	-----------------------------------------
                                    517 ;	 function _mcs51_genXRAMCLEAR
                                    518 ;	-----------------------------------------
      0000D9                        519 __mcs51_genXRAMCLEAR:
      0000D9 22               [24]  520 	ret
                                    521 ;------------------------------------------------------------
                                    522 ;Allocation info for local variables in function 'timer0_ISR'
                                    523 ;------------------------------------------------------------
                                    524 ;	testpreempt.c:62: void timer0_ISR(void) __interrupt(1) {
                                    525 ;	-----------------------------------------
                                    526 ;	 function timer0_ISR
                                    527 ;	-----------------------------------------
      0000DA                        528 _timer0_ISR:
                                    529 ;	testpreempt.c:65: __endasm;
      0000DA 02 02 45         [24]  530 	LJMP	_myTimer0Handler
                                    531 ;	testpreempt.c:66: }	
      0000DD 02 00 54         [24]  532 	ljmp	sdcc_atomic_maybe_rollback
                                    533 ;	eliminated unneeded mov psw,# (no regs used in bank)
                                    534 ;	eliminated unneeded push/pop not_psw
                                    535 ;	eliminated unneeded push/pop dpl
                                    536 ;	eliminated unneeded push/pop dph
                                    537 ;	eliminated unneeded push/pop b
                                    538 ;	eliminated unneeded push/pop acc
                                    539 	.area CSEG    (CODE)
                                    540 	.area CONST   (CODE)
                                    541 	.area XINIT   (CODE)
                                    542 	.area CABS    (ABS,CODE)
