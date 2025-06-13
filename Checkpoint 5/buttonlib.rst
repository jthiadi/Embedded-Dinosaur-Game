                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ISO C Compiler
                                      3 ; Version 4.5.0 #15242 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module buttonlib
                                      6 	
                                      7 	.optsdcc -mmcs51 --model-small
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _CY
                                     12 	.globl _AC
                                     13 	.globl _F0
                                     14 	.globl _RS1
                                     15 	.globl _RS0
                                     16 	.globl _OV
                                     17 	.globl _F1
                                     18 	.globl _P
                                     19 	.globl _PS
                                     20 	.globl _PT1
                                     21 	.globl _PX1
                                     22 	.globl _PT0
                                     23 	.globl _PX0
                                     24 	.globl _RD
                                     25 	.globl _WR
                                     26 	.globl _T1
                                     27 	.globl _T0
                                     28 	.globl _INT1
                                     29 	.globl _INT0
                                     30 	.globl _TXD
                                     31 	.globl _RXD
                                     32 	.globl _P3_7
                                     33 	.globl _P3_6
                                     34 	.globl _P3_5
                                     35 	.globl _P3_4
                                     36 	.globl _P3_3
                                     37 	.globl _P3_2
                                     38 	.globl _P3_1
                                     39 	.globl _P3_0
                                     40 	.globl _EA
                                     41 	.globl _ES
                                     42 	.globl _ET1
                                     43 	.globl _EX1
                                     44 	.globl _ET0
                                     45 	.globl _EX0
                                     46 	.globl _P2_7
                                     47 	.globl _P2_6
                                     48 	.globl _P2_5
                                     49 	.globl _P2_4
                                     50 	.globl _P2_3
                                     51 	.globl _P2_2
                                     52 	.globl _P2_1
                                     53 	.globl _P2_0
                                     54 	.globl _SM0
                                     55 	.globl _SM1
                                     56 	.globl _SM2
                                     57 	.globl _REN
                                     58 	.globl _TB8
                                     59 	.globl _RB8
                                     60 	.globl _TI
                                     61 	.globl _RI
                                     62 	.globl _P1_7
                                     63 	.globl _P1_6
                                     64 	.globl _P1_5
                                     65 	.globl _P1_4
                                     66 	.globl _P1_3
                                     67 	.globl _P1_2
                                     68 	.globl _P1_1
                                     69 	.globl _P1_0
                                     70 	.globl _TF1
                                     71 	.globl _TR1
                                     72 	.globl _TF0
                                     73 	.globl _TR0
                                     74 	.globl _IE1
                                     75 	.globl _IT1
                                     76 	.globl _IE0
                                     77 	.globl _IT0
                                     78 	.globl _P0_7
                                     79 	.globl _P0_6
                                     80 	.globl _P0_5
                                     81 	.globl _P0_4
                                     82 	.globl _P0_3
                                     83 	.globl _P0_2
                                     84 	.globl _P0_1
                                     85 	.globl _P0_0
                                     86 	.globl _B
                                     87 	.globl _ACC
                                     88 	.globl _PSW
                                     89 	.globl _IP
                                     90 	.globl _P3
                                     91 	.globl _IE
                                     92 	.globl _P2
                                     93 	.globl _SBUF
                                     94 	.globl _SCON
                                     95 	.globl _P1
                                     96 	.globl _TH1
                                     97 	.globl _TH0
                                     98 	.globl _TL1
                                     99 	.globl _TL0
                                    100 	.globl _TMOD
                                    101 	.globl _TCON
                                    102 	.globl _PCON
                                    103 	.globl _DPH
                                    104 	.globl _DPL
                                    105 	.globl _SP
                                    106 	.globl _P0
                                    107 	.globl _button_state
                                    108 	.globl _AnyButtonPressed
                                    109 	.globl _ButtonToChar
                                    110 ;--------------------------------------------------------
                                    111 ; special function registers
                                    112 ;--------------------------------------------------------
                                    113 	.area RSEG    (ABS,DATA)
      000000                        114 	.org 0x0000
                           000080   115 _P0	=	0x0080
                           000081   116 _SP	=	0x0081
                           000082   117 _DPL	=	0x0082
                           000083   118 _DPH	=	0x0083
                           000087   119 _PCON	=	0x0087
                           000088   120 _TCON	=	0x0088
                           000089   121 _TMOD	=	0x0089
                           00008A   122 _TL0	=	0x008a
                           00008B   123 _TL1	=	0x008b
                           00008C   124 _TH0	=	0x008c
                           00008D   125 _TH1	=	0x008d
                           000090   126 _P1	=	0x0090
                           000098   127 _SCON	=	0x0098
                           000099   128 _SBUF	=	0x0099
                           0000A0   129 _P2	=	0x00a0
                           0000A8   130 _IE	=	0x00a8
                           0000B0   131 _P3	=	0x00b0
                           0000B8   132 _IP	=	0x00b8
                           0000D0   133 _PSW	=	0x00d0
                           0000E0   134 _ACC	=	0x00e0
                           0000F0   135 _B	=	0x00f0
                                    136 ;--------------------------------------------------------
                                    137 ; special function bits
                                    138 ;--------------------------------------------------------
                                    139 	.area RSEG    (ABS,DATA)
      000000                        140 	.org 0x0000
                           000080   141 _P0_0	=	0x0080
                           000081   142 _P0_1	=	0x0081
                           000082   143 _P0_2	=	0x0082
                           000083   144 _P0_3	=	0x0083
                           000084   145 _P0_4	=	0x0084
                           000085   146 _P0_5	=	0x0085
                           000086   147 _P0_6	=	0x0086
                           000087   148 _P0_7	=	0x0087
                           000088   149 _IT0	=	0x0088
                           000089   150 _IE0	=	0x0089
                           00008A   151 _IT1	=	0x008a
                           00008B   152 _IE1	=	0x008b
                           00008C   153 _TR0	=	0x008c
                           00008D   154 _TF0	=	0x008d
                           00008E   155 _TR1	=	0x008e
                           00008F   156 _TF1	=	0x008f
                           000090   157 _P1_0	=	0x0090
                           000091   158 _P1_1	=	0x0091
                           000092   159 _P1_2	=	0x0092
                           000093   160 _P1_3	=	0x0093
                           000094   161 _P1_4	=	0x0094
                           000095   162 _P1_5	=	0x0095
                           000096   163 _P1_6	=	0x0096
                           000097   164 _P1_7	=	0x0097
                           000098   165 _RI	=	0x0098
                           000099   166 _TI	=	0x0099
                           00009A   167 _RB8	=	0x009a
                           00009B   168 _TB8	=	0x009b
                           00009C   169 _REN	=	0x009c
                           00009D   170 _SM2	=	0x009d
                           00009E   171 _SM1	=	0x009e
                           00009F   172 _SM0	=	0x009f
                           0000A0   173 _P2_0	=	0x00a0
                           0000A1   174 _P2_1	=	0x00a1
                           0000A2   175 _P2_2	=	0x00a2
                           0000A3   176 _P2_3	=	0x00a3
                           0000A4   177 _P2_4	=	0x00a4
                           0000A5   178 _P2_5	=	0x00a5
                           0000A6   179 _P2_6	=	0x00a6
                           0000A7   180 _P2_7	=	0x00a7
                           0000A8   181 _EX0	=	0x00a8
                           0000A9   182 _ET0	=	0x00a9
                           0000AA   183 _EX1	=	0x00aa
                           0000AB   184 _ET1	=	0x00ab
                           0000AC   185 _ES	=	0x00ac
                           0000AF   186 _EA	=	0x00af
                           0000B0   187 _P3_0	=	0x00b0
                           0000B1   188 _P3_1	=	0x00b1
                           0000B2   189 _P3_2	=	0x00b2
                           0000B3   190 _P3_3	=	0x00b3
                           0000B4   191 _P3_4	=	0x00b4
                           0000B5   192 _P3_5	=	0x00b5
                           0000B6   193 _P3_6	=	0x00b6
                           0000B7   194 _P3_7	=	0x00b7
                           0000B0   195 _RXD	=	0x00b0
                           0000B1   196 _TXD	=	0x00b1
                           0000B2   197 _INT0	=	0x00b2
                           0000B3   198 _INT1	=	0x00b3
                           0000B4   199 _T0	=	0x00b4
                           0000B5   200 _T1	=	0x00b5
                           0000B6   201 _WR	=	0x00b6
                           0000B7   202 _RD	=	0x00b7
                           0000B8   203 _PX0	=	0x00b8
                           0000B9   204 _PT0	=	0x00b9
                           0000BA   205 _PX1	=	0x00ba
                           0000BB   206 _PT1	=	0x00bb
                           0000BC   207 _PS	=	0x00bc
                           0000D0   208 _P	=	0x00d0
                           0000D1   209 _F1	=	0x00d1
                           0000D2   210 _OV	=	0x00d2
                           0000D3   211 _RS0	=	0x00d3
                           0000D4   212 _RS1	=	0x00d4
                           0000D5   213 _F0	=	0x00d5
                           0000D6   214 _AC	=	0x00d6
                           0000D7   215 _CY	=	0x00d7
                                    216 ;--------------------------------------------------------
                                    217 ; overlayable register banks
                                    218 ;--------------------------------------------------------
                                    219 	.area REG_BANK_0	(REL,OVR,DATA)
      000000                        220 	.ds 8
                                    221 ;--------------------------------------------------------
                                    222 ; internal ram data
                                    223 ;--------------------------------------------------------
                                    224 	.area DSEG    (DATA)
                           00003B   225 _button_state	=	0x003b
                                    226 ;--------------------------------------------------------
                                    227 ; overlayable items in internal ram
                                    228 ;--------------------------------------------------------
                                    229 ;--------------------------------------------------------
                                    230 ; indirectly addressable internal ram data
                                    231 ;--------------------------------------------------------
                                    232 	.area ISEG    (DATA)
                                    233 ;--------------------------------------------------------
                                    234 ; absolute internal ram data
                                    235 ;--------------------------------------------------------
                                    236 	.area IABS    (ABS,DATA)
                                    237 	.area IABS    (ABS,DATA)
                                    238 ;--------------------------------------------------------
                                    239 ; bit data
                                    240 ;--------------------------------------------------------
                                    241 	.area BSEG    (BIT)
                                    242 ;--------------------------------------------------------
                                    243 ; paged external ram data
                                    244 ;--------------------------------------------------------
                                    245 	.area PSEG    (PAG,XDATA)
                                    246 ;--------------------------------------------------------
                                    247 ; uninitialized external ram data
                                    248 ;--------------------------------------------------------
                                    249 	.area XSEG    (XDATA)
                                    250 ;--------------------------------------------------------
                                    251 ; absolute external ram data
                                    252 ;--------------------------------------------------------
                                    253 	.area XABS    (ABS,XDATA)
                                    254 ;--------------------------------------------------------
                                    255 ; initialized external ram data
                                    256 ;--------------------------------------------------------
                                    257 	.area XISEG   (XDATA)
                                    258 	.area HOME    (CODE)
                                    259 	.area GSINIT0 (CODE)
                                    260 	.area GSINIT1 (CODE)
                                    261 	.area GSINIT2 (CODE)
                                    262 	.area GSINIT3 (CODE)
                                    263 	.area GSINIT4 (CODE)
                                    264 	.area GSINIT5 (CODE)
                                    265 	.area GSINIT  (CODE)
                                    266 	.area GSFINAL (CODE)
                                    267 	.area CSEG    (CODE)
                                    268 ;--------------------------------------------------------
                                    269 ; global & static initialisations
                                    270 ;--------------------------------------------------------
                                    271 	.area HOME    (CODE)
                                    272 	.area GSINIT  (CODE)
                                    273 	.area GSFINAL (CODE)
                                    274 	.area GSINIT  (CODE)
                                    275 ;--------------------------------------------------------
                                    276 ; Home
                                    277 ;--------------------------------------------------------
                                    278 	.area HOME    (CODE)
                                    279 	.area HOME    (CODE)
                                    280 ;--------------------------------------------------------
                                    281 ; code
                                    282 ;--------------------------------------------------------
                                    283 	.area CSEG    (CODE)
                                    284 ;------------------------------------------------------------
                                    285 ;Allocation info for local variables in function 'AnyButtonPressed'
                                    286 ;------------------------------------------------------------
                                    287 ;	buttonlib.c:13: char AnyButtonPressed(void) {
                                    288 ;	-----------------------------------------
                                    289 ;	 function AnyButtonPressed
                                    290 ;	-----------------------------------------
      0007FB                        291 _AnyButtonPressed:
                           000007   292 	ar7 = 0x07
                           000006   293 	ar6 = 0x06
                           000005   294 	ar5 = 0x05
                           000004   295 	ar4 = 0x04
                           000003   296 	ar3 = 0x03
                           000002   297 	ar2 = 0x02
                           000001   298 	ar1 = 0x01
                           000000   299 	ar0 = 0x00
                                    300 ;	buttonlib.c:14: button_state = ~P2;      // buat bkin pressed buttons = 1
      0007FB E5 A0            [12]  301 	mov	a,_P2
      0007FD F4               [12]  302 	cpl	a
      0007FE F5 3B            [12]  303 	mov	_button_state,a
                                    304 ;	buttonlib.c:15: if (button_state != 0)
      000800 E5 3B            [12]  305 	mov	a,_button_state
      000802 60 04            [24]  306 	jz	00102$
                                    307 ;	buttonlib.c:16: return 1;            // ada 1 at least yg kepencet
      000804 75 82 01         [24]  308 	mov	dpl, #0x01
      000807 22               [24]  309 	ret
      000808                        310 00102$:
                                    311 ;	buttonlib.c:18: return 0;            // no button pressed
      000808 75 82 00         [24]  312 	mov	dpl, #0x00
                                    313 ;	buttonlib.c:19: }
      00080B 22               [24]  314 	ret
                                    315 ;------------------------------------------------------------
                                    316 ;Allocation info for local variables in function 'ButtonToChar'
                                    317 ;------------------------------------------------------------
                                    318 ;	buttonlib.c:25: char ButtonToChar(void) {
                                    319 ;	-----------------------------------------
                                    320 ;	 function ButtonToChar
                                    321 ;	-----------------------------------------
      00080C                        322 _ButtonToChar:
                                    323 ;	buttonlib.c:26: if ((~P2) & 0x80) {
      00080C AE A0            [24]  324 	mov	r6,_P2
      00080E 7F 00            [12]  325 	mov	r7,#0x00
      000810 EE               [12]  326 	mov	a,r6
      000811 F4               [12]  327 	cpl	a
      000812 FE               [12]  328 	mov	r6,a
      000813 EF               [12]  329 	mov	a,r7
      000814 F4               [12]  330 	cpl	a
      000815 EE               [12]  331 	mov	a,r6
      000816 30 E7 04         [24]  332 	jnb	acc.7,00123$
                                    333 ;	buttonlib.c:27: return '7';
      000819 75 82 37         [24]  334 	mov	dpl, #0x37
      00081C 22               [24]  335 	ret
      00081D                        336 00123$:
                                    337 ;	buttonlib.c:28: } else if ((~P2) & 0x40) {
      00081D AE A0            [24]  338 	mov	r6,_P2
      00081F 7F 00            [12]  339 	mov	r7,#0x00
      000821 EE               [12]  340 	mov	a,r6
      000822 F4               [12]  341 	cpl	a
      000823 FE               [12]  342 	mov	r6,a
      000824 EF               [12]  343 	mov	a,r7
      000825 F4               [12]  344 	cpl	a
      000826 EE               [12]  345 	mov	a,r6
      000827 30 E6 04         [24]  346 	jnb	acc.6,00120$
                                    347 ;	buttonlib.c:29: return '6';
      00082A 75 82 36         [24]  348 	mov	dpl, #0x36
      00082D 22               [24]  349 	ret
      00082E                        350 00120$:
                                    351 ;	buttonlib.c:30: } else if ((~P2) & 0x20) {
      00082E AE A0            [24]  352 	mov	r6,_P2
      000830 7F 00            [12]  353 	mov	r7,#0x00
      000832 EE               [12]  354 	mov	a,r6
      000833 F4               [12]  355 	cpl	a
      000834 FE               [12]  356 	mov	r6,a
      000835 EF               [12]  357 	mov	a,r7
      000836 F4               [12]  358 	cpl	a
      000837 EE               [12]  359 	mov	a,r6
      000838 30 E5 04         [24]  360 	jnb	acc.5,00117$
                                    361 ;	buttonlib.c:31: return '5';
      00083B 75 82 35         [24]  362 	mov	dpl, #0x35
      00083E 22               [24]  363 	ret
      00083F                        364 00117$:
                                    365 ;	buttonlib.c:32: } else if ((~P2) & 0x10) {
      00083F AE A0            [24]  366 	mov	r6,_P2
      000841 7F 00            [12]  367 	mov	r7,#0x00
      000843 EE               [12]  368 	mov	a,r6
      000844 F4               [12]  369 	cpl	a
      000845 FE               [12]  370 	mov	r6,a
      000846 EF               [12]  371 	mov	a,r7
      000847 F4               [12]  372 	cpl	a
      000848 EE               [12]  373 	mov	a,r6
      000849 30 E4 04         [24]  374 	jnb	acc.4,00114$
                                    375 ;	buttonlib.c:33: return '4';
      00084C 75 82 34         [24]  376 	mov	dpl, #0x34
      00084F 22               [24]  377 	ret
      000850                        378 00114$:
                                    379 ;	buttonlib.c:34: } else if ((~P2) & 0x08) {
      000850 AE A0            [24]  380 	mov	r6,_P2
      000852 7F 00            [12]  381 	mov	r7,#0x00
      000854 EE               [12]  382 	mov	a,r6
      000855 F4               [12]  383 	cpl	a
      000856 FE               [12]  384 	mov	r6,a
      000857 EF               [12]  385 	mov	a,r7
      000858 F4               [12]  386 	cpl	a
      000859 EE               [12]  387 	mov	a,r6
      00085A 30 E3 04         [24]  388 	jnb	acc.3,00111$
                                    389 ;	buttonlib.c:35: return '3';
      00085D 75 82 33         [24]  390 	mov	dpl, #0x33
      000860 22               [24]  391 	ret
      000861                        392 00111$:
                                    393 ;	buttonlib.c:36: } else if ((~P2) & 0x04) {
      000861 AE A0            [24]  394 	mov	r6,_P2
      000863 7F 00            [12]  395 	mov	r7,#0x00
      000865 EE               [12]  396 	mov	a,r6
      000866 F4               [12]  397 	cpl	a
      000867 FE               [12]  398 	mov	r6,a
      000868 EF               [12]  399 	mov	a,r7
      000869 F4               [12]  400 	cpl	a
      00086A EE               [12]  401 	mov	a,r6
      00086B 30 E2 04         [24]  402 	jnb	acc.2,00108$
                                    403 ;	buttonlib.c:37: return '2';
      00086E 75 82 32         [24]  404 	mov	dpl, #0x32
      000871 22               [24]  405 	ret
      000872                        406 00108$:
                                    407 ;	buttonlib.c:38: } else if ((~P2) & 0x02) {
      000872 AE A0            [24]  408 	mov	r6,_P2
      000874 7F 00            [12]  409 	mov	r7,#0x00
      000876 EE               [12]  410 	mov	a,r6
      000877 F4               [12]  411 	cpl	a
      000878 FE               [12]  412 	mov	r6,a
      000879 EF               [12]  413 	mov	a,r7
      00087A F4               [12]  414 	cpl	a
      00087B EE               [12]  415 	mov	a,r6
      00087C 30 E1 04         [24]  416 	jnb	acc.1,00105$
                                    417 ;	buttonlib.c:39: return '1';
      00087F 75 82 31         [24]  418 	mov	dpl, #0x31
      000882 22               [24]  419 	ret
      000883                        420 00105$:
                                    421 ;	buttonlib.c:40: } else if ((~P2) & 0x01) {
      000883 AE A0            [24]  422 	mov	r6,_P2
      000885 7F 00            [12]  423 	mov	r7,#0x00
      000887 EE               [12]  424 	mov	a,r6
      000888 F4               [12]  425 	cpl	a
      000889 FE               [12]  426 	mov	r6,a
      00088A EF               [12]  427 	mov	a,r7
      00088B F4               [12]  428 	cpl	a
      00088C EE               [12]  429 	mov	a,r6
      00088D 30 E0 04         [24]  430 	jnb	acc.0,00102$
                                    431 ;	buttonlib.c:41: return '0';
      000890 75 82 30         [24]  432 	mov	dpl, #0x30
      000893 22               [24]  433 	ret
      000894                        434 00102$:
                                    435 ;	buttonlib.c:42: } else return '\0';
      000894 75 82 00         [24]  436 	mov	dpl, #0x00
                                    437 ;	buttonlib.c:43: }
      000897 22               [24]  438 	ret
                                    439 	.area CSEG    (CODE)
                                    440 	.area CONST   (CODE)
                                    441 	.area XINIT   (CODE)
                                    442 	.area CABS    (ABS,CODE)
