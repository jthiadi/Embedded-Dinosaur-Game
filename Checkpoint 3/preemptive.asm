;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.0 #15242 (MINGW64)
;--------------------------------------------------------
	.module preemptive
	
	.optsdcc -mmcs51 --model-small
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _myTimer0Handler
	.globl _Bootstrap
	.globl _main
	.globl _CY
	.globl _AC
	.globl _F0
	.globl _RS1
	.globl _RS0
	.globl _OV
	.globl _F1
	.globl _P
	.globl _PS
	.globl _PT1
	.globl _PX1
	.globl _PT0
	.globl _PX0
	.globl _RD
	.globl _WR
	.globl _T1
	.globl _T0
	.globl _INT1
	.globl _INT0
	.globl _TXD
	.globl _RXD
	.globl _P3_7
	.globl _P3_6
	.globl _P3_5
	.globl _P3_4
	.globl _P3_3
	.globl _P3_2
	.globl _P3_1
	.globl _P3_0
	.globl _EA
	.globl _ES
	.globl _ET1
	.globl _EX1
	.globl _ET0
	.globl _EX0
	.globl _P2_7
	.globl _P2_6
	.globl _P2_5
	.globl _P2_4
	.globl _P2_3
	.globl _P2_2
	.globl _P2_1
	.globl _P2_0
	.globl _SM0
	.globl _SM1
	.globl _SM2
	.globl _REN
	.globl _TB8
	.globl _RB8
	.globl _TI
	.globl _RI
	.globl _P1_7
	.globl _P1_6
	.globl _P1_5
	.globl _P1_4
	.globl _P1_3
	.globl _P1_2
	.globl _P1_1
	.globl _P1_0
	.globl _TF1
	.globl _TR1
	.globl _TF0
	.globl _TR0
	.globl _IE1
	.globl _IT1
	.globl _IE0
	.globl _IT0
	.globl _P0_7
	.globl _P0_6
	.globl _P0_5
	.globl _P0_4
	.globl _P0_3
	.globl _P0_2
	.globl _P0_1
	.globl _P0_0
	.globl _B
	.globl _ACC
	.globl _PSW
	.globl _IP
	.globl _P3
	.globl _IE
	.globl _P2
	.globl _SBUF
	.globl _SCON
	.globl _P1
	.globl _TH1
	.globl _TH0
	.globl _TL1
	.globl _TL0
	.globl _TMOD
	.globl _TCON
	.globl _PCON
	.globl _DPH
	.globl _DPL
	.globl _SP
	.globl _P0
	.globl _old_SP
	.globl _new_thread
	.globl _valid_thread
	.globl _current_thread
	.globl _saved_SP
	.globl _ThreadCreate
	.globl _ThreadYield
	.globl _ThreadExit
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
	.area RSEG    (ABS,DATA)
	.org 0x0000
_P0	=	0x0080
_SP	=	0x0081
_DPL	=	0x0082
_DPH	=	0x0083
_PCON	=	0x0087
_TCON	=	0x0088
_TMOD	=	0x0089
_TL0	=	0x008a
_TL1	=	0x008b
_TH0	=	0x008c
_TH1	=	0x008d
_P1	=	0x0090
_SCON	=	0x0098
_SBUF	=	0x0099
_P2	=	0x00a0
_IE	=	0x00a8
_P3	=	0x00b0
_IP	=	0x00b8
_PSW	=	0x00d0
_ACC	=	0x00e0
_B	=	0x00f0
;--------------------------------------------------------
; special function bits
;--------------------------------------------------------
	.area RSEG    (ABS,DATA)
	.org 0x0000
_P0_0	=	0x0080
_P0_1	=	0x0081
_P0_2	=	0x0082
_P0_3	=	0x0083
_P0_4	=	0x0084
_P0_5	=	0x0085
_P0_6	=	0x0086
_P0_7	=	0x0087
_IT0	=	0x0088
_IE0	=	0x0089
_IT1	=	0x008a
_IE1	=	0x008b
_TR0	=	0x008c
_TF0	=	0x008d
_TR1	=	0x008e
_TF1	=	0x008f
_P1_0	=	0x0090
_P1_1	=	0x0091
_P1_2	=	0x0092
_P1_3	=	0x0093
_P1_4	=	0x0094
_P1_5	=	0x0095
_P1_6	=	0x0096
_P1_7	=	0x0097
_RI	=	0x0098
_TI	=	0x0099
_RB8	=	0x009a
_TB8	=	0x009b
_REN	=	0x009c
_SM2	=	0x009d
_SM1	=	0x009e
_SM0	=	0x009f
_P2_0	=	0x00a0
_P2_1	=	0x00a1
_P2_2	=	0x00a2
_P2_3	=	0x00a3
_P2_4	=	0x00a4
_P2_5	=	0x00a5
_P2_6	=	0x00a6
_P2_7	=	0x00a7
_EX0	=	0x00a8
_ET0	=	0x00a9
_EX1	=	0x00aa
_ET1	=	0x00ab
_ES	=	0x00ac
_EA	=	0x00af
_P3_0	=	0x00b0
_P3_1	=	0x00b1
_P3_2	=	0x00b2
_P3_3	=	0x00b3
_P3_4	=	0x00b4
_P3_5	=	0x00b5
_P3_6	=	0x00b6
_P3_7	=	0x00b7
_RXD	=	0x00b0
_TXD	=	0x00b1
_INT0	=	0x00b2
_INT1	=	0x00b3
_T0	=	0x00b4
_T1	=	0x00b5
_WR	=	0x00b6
_RD	=	0x00b7
_PX0	=	0x00b8
_PT0	=	0x00b9
_PX1	=	0x00ba
_PT1	=	0x00bb
_PS	=	0x00bc
_P	=	0x00d0
_F1	=	0x00d1
_OV	=	0x00d2
_RS0	=	0x00d3
_RS1	=	0x00d4
_F0	=	0x00d5
_AC	=	0x00d6
_CY	=	0x00d7
;--------------------------------------------------------
; overlayable register banks
;--------------------------------------------------------
	.area REG_BANK_0	(REL,OVR,DATA)
	.ds 8
;--------------------------------------------------------
; internal ram data
;--------------------------------------------------------
	.area DSEG    (DATA)
_saved_SP	=	0x0030
_current_thread	=	0x0034
_valid_thread	=	0x0035
_new_thread	=	0x0036
_old_SP	=	0x0037
;--------------------------------------------------------
; overlayable items in internal ram
;--------------------------------------------------------
	.area	OSEG    (OVR,DATA)
;--------------------------------------------------------
; indirectly addressable internal ram data
;--------------------------------------------------------
	.area ISEG    (DATA)
;--------------------------------------------------------
; absolute internal ram data
;--------------------------------------------------------
	.area IABS    (ABS,DATA)
	.area IABS    (ABS,DATA)
;--------------------------------------------------------
; bit data
;--------------------------------------------------------
	.area BSEG    (BIT)
_ThreadExit_sloc0_1_0:
	.ds 1
;--------------------------------------------------------
; paged external ram data
;--------------------------------------------------------
	.area PSEG    (PAG,XDATA)
;--------------------------------------------------------
; uninitialized external ram data
;--------------------------------------------------------
	.area XSEG    (XDATA)
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area XABS    (ABS,XDATA)
;--------------------------------------------------------
; initialized external ram data
;--------------------------------------------------------
	.area XISEG   (XDATA)
	.area HOME    (CODE)
	.area GSINIT0 (CODE)
	.area GSINIT1 (CODE)
	.area GSINIT2 (CODE)
	.area GSINIT3 (CODE)
	.area GSINIT4 (CODE)
	.area GSINIT5 (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area CSEG    (CODE)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME    (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area GSINIT  (CODE)
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME    (CODE)
	.area HOME    (CODE)
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CSEG    (CODE)
;------------------------------------------------------------
;Allocation info for local variables in function 'Bootstrap'
;------------------------------------------------------------
;	preemptive.c:36: void Bootstrap(void)
;	-----------------------------------------
;	 function Bootstrap
;	-----------------------------------------
_Bootstrap:
	ar7 = 0x07
	ar6 = 0x06
	ar5 = 0x05
	ar4 = 0x04
	ar3 = 0x03
	ar2 = 0x02
	ar1 = 0x01
	ar0 = 0x00
;	preemptive.c:38: TMOD = 0;  		// timer 0 mode 0
	mov	_TMOD,#0x00
;	preemptive.c:39: IE = 0x82;  	// enable timer 0 interrupt; keep consumer polling
	mov	_IE,#0x82
;	preemptive.c:41: TR0 = 1; 		// set bit TR0 to start running timer 0
;	assignBit
	setb	_TR0
;	preemptive.c:43: valid_thread = 0x00;
	mov	_valid_thread,#0x00
;	preemptive.c:45: current_thread = ThreadCreate(main);
	mov	dptr,#_main
	lcall	_ThreadCreate
	mov	_current_thread,dpl
;	preemptive.c:46: RESTORESTATE;
	mov	a,_current_thread
	add	a, #_saved_SP
	mov	r1,a
	mov	_SP,@r1
	POP PSW 
	POP DPH 
	POP DPL 
	POP B 
	POP ACC 
;	preemptive.c:47: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'ThreadCreate'
;------------------------------------------------------------
;fp            Allocated to registers 
;i             Allocated to registers r7 
;------------------------------------------------------------
;	preemptive.c:49: ThreadID ThreadCreate(FunctionPtr fp)
;	-----------------------------------------
;	 function ThreadCreate
;	-----------------------------------------
_ThreadCreate:
;	preemptive.c:51: EA = 0;
;	assignBit
	clr	_EA
;	preemptive.c:52: if (valid_thread == 0xF) return -1; 
	mov	a,#0x0f
	cjne	a,_valid_thread,00102$
	mov	dpl, #0xff
	ret
00102$:
;	preemptive.c:54: new_thread = 3; 
	mov	_new_thread,#0x03
;	preemptive.c:55: for (int i = 0; i < MAXTHREADS; i++) {
	mov	r7,#0x00
	mov	r6,#0x00
00107$:
	cjne	r6,#0x04,00137$
00137$:
	jnc	00105$
;	preemptive.c:56: if (!(valid_thread & (1 << i))) {
	mov	b,r6
	inc	b
	mov	r4,#0x01
	mov	r5,#0x00
	sjmp	00140$
00139$:
	mov	a,r4
	add	a,r4
	mov	r4,a
	mov	a,r5
	rlc	a
	mov	r5,a
00140$:
	djnz	b,00139$
	mov	r2,_valid_thread
	mov	r3,#0x00
	mov	a,r2
	anl	ar4,a
	mov	a,r3
	anl	ar5,a
	mov	a,r4
	orl	a,r5
	jnz	00108$
;	preemptive.c:57: new_thread = i;
	mov	_new_thread,r7
;	preemptive.c:58: break;
	sjmp	00105$
00108$:
;	preemptive.c:55: for (int i = 0; i < MAXTHREADS; i++) {
	inc	r6
	mov	ar7,r6
	sjmp	00107$
00105$:
;	preemptive.c:62: valid_thread |= (1 << new_thread);
	mov	b,_new_thread
	inc	b
	mov	a,#0x01
	sjmp	00143$
00142$:
	add	a,acc
00143$:
	djnz	b,00142$
	orl	_valid_thread,a
;	preemptive.c:64: old_SP = SP;
	mov	_old_SP,_SP
;	preemptive.c:65: SP = (0x3A) + (new_thread * 8);
	mov	a,_new_thread
	swap	a
	rr	a
	anl	a,#0xf8
	mov	r7,a
	add	a,#0x3a
	mov	_SP,a
;	preemptive.c:75: __endasm;
	PUSH	DPL
	PUSH	DPH
	CLR	A
	PUSH	ACC
	PUSH	ACC
	PUSH	ACC
	PUSH	ACC
;	preemptive.c:77: PSW = (new_thread << 3);
	mov	a,_new_thread
	swap	a
	rr	a
	anl	a,#0xf8
	mov	_PSW,a
;	preemptive.c:81: __endasm;
	PUSH	PSW
;	preemptive.c:83: saved_SP[new_thread] = SP;
	mov	a,_new_thread
	add	a, #_saved_SP
	mov	r0,a
	mov	@r0,_SP
;	preemptive.c:84: SP = old_SP;
	mov	_SP,_old_SP
;	preemptive.c:86: EA = 1;
;	assignBit
	setb	_EA
;	preemptive.c:87: return new_thread;
	mov	dpl, _new_thread
;	preemptive.c:88: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'ThreadYield'
;------------------------------------------------------------
;	preemptive.c:90: void ThreadYield(void)
;	-----------------------------------------
;	 function ThreadYield
;	-----------------------------------------
_ThreadYield:
;	preemptive.c:92: EA = 0;
;	assignBit
	clr	_EA
;	preemptive.c:93: SAVESTATE;
	PUSH ACC 
	PUSH B 
	PUSH DPL 
	PUSH DPH 
	PUSH PSW 
	mov	a,_current_thread
	add	a, #_saved_SP
	mov	r0,a
	mov	@r0,_SP
;	preemptive.c:94: do {
00110$:
;	preemptive.c:95: current_thread = (current_thread + 1) & 3;
	mov	r7,_current_thread
	inc	r7
	mov	a,#0x03
	anl	a,r7
	mov	_current_thread,a
;	preemptive.c:97: if ((current_thread == 0 && (valid_thread & 0x01)) ||
	mov	a,_current_thread
	jnz	00105$
	mov	a,_valid_thread
	mov	r7,a
	jb	acc.0,00113$
00105$:
;	preemptive.c:98: (current_thread == 1 && (valid_thread & 0x02)) ||
	mov	a,#0x01
	cjne	a,_current_thread,00107$
	mov	a,_valid_thread
	mov	r7,a
	jb	acc.1,00113$
00107$:
;	preemptive.c:99: (current_thread == 2 && (valid_thread & 0x04)) ||
	mov	a,#0x02
	cjne	a,_current_thread,00109$
	mov	a,_valid_thread
	mov	r7,a
	jb	acc.2,00113$
00109$:
;	preemptive.c:100: (current_thread == 3 && (valid_thread & 0x08))) {
	mov	a,#0x03
	cjne	a,_current_thread,00110$
	mov	a,_valid_thread
	mov	r7,a
	jnb	acc.3,00110$
;	preemptive.c:105: found:
00113$:
;	preemptive.c:106: RESTORESTATE;
	mov	a,_current_thread
	add	a, #_saved_SP
	mov	r1,a
	mov	_SP,@r1
	POP PSW 
	POP DPH 
	POP DPL 
	POP B 
	POP ACC 
;	preemptive.c:107: EA = 1;
;	assignBit
	setb	_EA
;	preemptive.c:108: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'ThreadExit'
;------------------------------------------------------------
;	preemptive.c:110: void ThreadExit(void)
;	-----------------------------------------
;	 function ThreadExit
;	-----------------------------------------
_ThreadExit:
;	preemptive.c:121: }
	setb	_ThreadExit_sloc0_1_0
	jbc	ea,00127$
	clr	_ThreadExit_sloc0_1_0
00127$:
;	preemptive.c:113: valid_thread &= ~(1 << current_thread);
	mov	b,_current_thread
	inc	b
	mov	a,#0x01
	sjmp	00129$
00128$:
	add	a,acc
00129$:
	djnz	b,00128$
	cpl	a
	anl	_valid_thread,a
;	preemptive.c:115: do {
00104$:
;	preemptive.c:116: if (current_thread == 3) current_thread = 0;
	mov	a,#0x03
	cjne	a,_current_thread,00102$
	mov	_current_thread,#0x00
	sjmp	00105$
00102$:
;	preemptive.c:117: else current_thread += 1;
	mov	a,_current_thread
	inc	a
	mov	_current_thread,a
00105$:
;	preemptive.c:118: } while (!(valid_thread & (1 << current_thread)));
	mov	b,_current_thread
	inc	b
	mov	r6,#0x01
	mov	r7,#0x00
	sjmp	00133$
00132$:
	mov	a,r6
	add	a,r6
	mov	r6,a
	mov	a,r7
	rlc	a
	mov	r7,a
00133$:
	djnz	b,00132$
	mov	r4,_valid_thread
	mov	r5,#0x00
	mov	a,r4
	anl	ar6,a
	mov	a,r5
	anl	ar7,a
	mov	a,r6
	orl	a,r7
	jz	00104$
;	preemptive.c:120: RESTORESTATE;
	mov	a,_current_thread
	add	a, #_saved_SP
	mov	r1,a
	mov	_SP,@r1
	POP PSW 
	POP DPH 
	POP DPL 
	POP B 
	POP ACC 
	mov	c,_ThreadExit_sloc0_1_0
	mov	ea,c
;	preemptive.c:122: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'myTimer0Handler'
;------------------------------------------------------------
;	preemptive.c:124: void myTimer0Handler(void)
;	-----------------------------------------
;	 function myTimer0Handler
;	-----------------------------------------
_myTimer0Handler:
;	preemptive.c:126: EA = 0;
;	assignBit
	clr	_EA
;	preemptive.c:127: SAVESTATE;
	PUSH ACC 
	PUSH B 
	PUSH DPL 
	PUSH DPH 
	PUSH PSW 
	mov	a,_current_thread
	add	a, #_saved_SP
	mov	r0,a
	mov	@r0,_SP
;	preemptive.c:129: do {
00110$:
;	preemptive.c:130: current_thread = (current_thread + 1) & 3;
	mov	r7,_current_thread
	inc	r7
	mov	a,#0x03
	anl	a,r7
	mov	_current_thread,a
;	preemptive.c:132: if ((current_thread == 0 && (valid_thread & 0x01)) ||
	mov	a,_current_thread
	jnz	00105$
	mov	a,_valid_thread
	mov	r7,a
	jb	acc.0,00113$
00105$:
;	preemptive.c:133: (current_thread == 1 && (valid_thread & 0x02)) ||
	mov	a,#0x01
	cjne	a,_current_thread,00107$
	mov	a,_valid_thread
	mov	r7,a
	jb	acc.1,00113$
00107$:
;	preemptive.c:134: (current_thread == 2 && (valid_thread & 0x04)) ||
	mov	a,#0x02
	cjne	a,_current_thread,00109$
	mov	a,_valid_thread
	mov	r7,a
	jb	acc.2,00113$
00109$:
;	preemptive.c:135: (current_thread == 3 && (valid_thread & 0x08))) {
	mov	a,#0x03
	cjne	a,_current_thread,00110$
	mov	a,_valid_thread
	mov	r7,a
	jnb	acc.3,00110$
;	preemptive.c:140: found:
00113$:
;	preemptive.c:141: RESTORESTATE;
	mov	a,_current_thread
	add	a, #_saved_SP
	mov	r1,a
	mov	_SP,@r1
	POP PSW 
	POP DPH 
	POP DPL 
	POP B 
	POP ACC 
;	preemptive.c:142: EA = 1;
;	assignBit
	setb	_EA
;	preemptive.c:146: __endasm;
	RETI
;	preemptive.c:147: }
	ret
	.area CSEG    (CODE)
	.area CONST   (CODE)
	.area XINIT   (CODE)
	.area CABS    (ABS,CODE)
