;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.0 #15242 (MINGW64)
;--------------------------------------------------------
	.module test3threads
	
	.optsdcc -mmcs51 --model-small
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _timer0_ISR
	.globl __mcs51_genXRAMCLEAR
	.globl __mcs51_genXINIT
	.globl __mcs51_genRAMCLEAR
	.globl __sdcc_gsinit_startup
	.globl _main
	.globl _Consumer
	.globl _Producer2
	.globl _Producer1
	.globl _ThreadCreate
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
	.globl _dir
	.globl _bounded_buffer
	.globl _next_char2
	.globl _next_char1
	.globl _write
	.globl _read
	.globl _empty
	.globl _full
	.globl _mutex
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
_mutex	=	0x0020
_full	=	0x0021
_empty	=	0x0022
_read	=	0x0023
_write	=	0x0024
_next_char1	=	0x0025
_next_char2	=	0x0026
_bounded_buffer	=	0x0027
_dir	=	0x0038
;--------------------------------------------------------
; overlayable items in internal ram
;--------------------------------------------------------
;--------------------------------------------------------
; Stack segment in internal ram
;--------------------------------------------------------
	.area SSEG
__start__stack:
	.ds	1

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
; interrupt vector
;--------------------------------------------------------
	.area HOME    (CODE)
__interrupt_vect:
	ljmp	__sdcc_gsinit_startup
	reti
	.ds	7
	ljmp	_timer0_ISR
; restartable atomic support routines
	.ds	2
sdcc_atomic_exchange_rollback_start::
	nop
	nop
sdcc_atomic_exchange_pdata_impl:
	movx	a, @r0
	mov	r3, a
	mov	a, r2
	movx	@r0, a
	sjmp	sdcc_atomic_exchange_exit
	nop
	nop
sdcc_atomic_exchange_xdata_impl:
	movx	a, @dptr
	mov	r3, a
	mov	a, r2
	movx	@dptr, a
	sjmp	sdcc_atomic_exchange_exit
sdcc_atomic_compare_exchange_idata_impl:
	mov	a, @r0
	cjne	a, ar2, .+#5
	mov	a, r3
	mov	@r0, a
	ret
	nop
sdcc_atomic_compare_exchange_pdata_impl:
	movx	a, @r0
	cjne	a, ar2, .+#5
	mov	a, r3
	movx	@r0, a
	ret
	nop
sdcc_atomic_compare_exchange_xdata_impl:
	movx	a, @dptr
	cjne	a, ar2, .+#5
	mov	a, r3
	movx	@dptr, a
	ret
sdcc_atomic_exchange_rollback_end::

sdcc_atomic_exchange_gptr_impl::
	jnb	b.6, sdcc_atomic_exchange_xdata_impl
	mov	r0, dpl
	jb	b.5, sdcc_atomic_exchange_pdata_impl
sdcc_atomic_exchange_idata_impl:
	mov	a, r2
	xch	a, @r0
	mov	dpl, a
	ret
sdcc_atomic_exchange_exit:
	mov	dpl, r3
	ret
sdcc_atomic_compare_exchange_gptr_impl::
	jnb	b.6, sdcc_atomic_compare_exchange_xdata_impl
	mov	r0, dpl
	jb	b.5, sdcc_atomic_compare_exchange_pdata_impl
	sjmp	sdcc_atomic_compare_exchange_idata_impl
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME    (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area GSINIT  (CODE)
	.globl __sdcc_gsinit_startup
	.globl __sdcc_program_startup
	.globl __start__stack
	.globl __mcs51_genXINIT
	.globl __mcs51_genXRAMCLEAR
	.globl __mcs51_genRAMCLEAR
	.area GSFINAL (CODE)
	ljmp	__sdcc_program_startup
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME    (CODE)
	.area HOME    (CODE)
__sdcc_program_startup:
	ljmp	_main
;	return from main will return to caller
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CSEG    (CODE)
;------------------------------------------------------------
;Allocation info for local variables in function 'Producer1'
;------------------------------------------------------------
;	test3threads.c:14: void Producer1(void) 
;	-----------------------------------------
;	 function Producer1
;	-----------------------------------------
_Producer1:
	ar7 = 0x07
	ar6 = 0x06
	ar5 = 0x05
	ar4 = 0x04
	ar3 = 0x03
	ar2 = 0x02
	ar1 = 0x01
	ar0 = 0x00
;	test3threads.c:16: next_char1 = 'A';
	mov	_next_char1,#0x41
;	test3threads.c:17: while(1) {
00108$:
;	test3threads.c:18: SemaphoreWait(empty);
0$:
	MOV A, _empty 
	JZ 0$ 
	DEC _empty 
;	test3threads.c:19: SemaphoreWait(mutex);
1$:
	MOV A, _mutex 
	JZ 1$ 
	DEC _mutex 
;	test3threads.c:21: EA = 0;
;	assignBit
	clr	_EA
;	test3threads.c:22: bounded_buffer[write] = next_char1;
	mov	a,_write
	add	a, #_bounded_buffer
	mov	r0,a
	mov	@r0,_next_char1
;	test3threads.c:23: if (write == 2) write = 0;
	mov	a,#0x02
	cjne	a,_write,00102$
	mov	_write,#0x00
	sjmp	00103$
00102$:
;	test3threads.c:24: else write++;
	mov	a,_write
	inc	a
	mov	_write,a
00103$:
;	test3threads.c:25: EA = 1;
;	assignBit
	setb	_EA
;	test3threads.c:27: SemaphoreSignal(mutex);
	INC _mutex 
;	test3threads.c:28: SemaphoreSignal(full);
	INC _full 
;	test3threads.c:30: if (next_char1 == 'Z') next_char1 = 'A';
	mov	a,#0x5a
	cjne	a,_next_char1,00105$
	mov	_next_char1,#0x41
	sjmp	00108$
00105$:
;	test3threads.c:31: else next_char1++;
	mov	a,_next_char1
	inc	a
	mov	_next_char1,a
;	test3threads.c:33: }
	sjmp	00108$
;------------------------------------------------------------
;Allocation info for local variables in function 'Producer2'
;------------------------------------------------------------
;	test3threads.c:35: void Producer2(void)
;	-----------------------------------------
;	 function Producer2
;	-----------------------------------------
_Producer2:
;	test3threads.c:37: next_char2 = '0';
	mov	_next_char2,#0x30
;	test3threads.c:38: while(1)
00108$:
;	test3threads.c:40: SemaphoreWait(empty);
2$:
	MOV A, _empty 
	JZ 2$ 
	DEC _empty 
;	test3threads.c:41: SemaphoreWait(mutex);
3$:
	MOV A, _mutex 
	JZ 3$ 
	DEC _mutex 
;	test3threads.c:43: EA = 0;
;	assignBit
	clr	_EA
;	test3threads.c:44: bounded_buffer[write] = next_char2;
	mov	a,_write
	add	a, #_bounded_buffer
	mov	r0,a
	mov	@r0,_next_char2
;	test3threads.c:45: if (write == 2) write = 0;
	mov	a,#0x02
	cjne	a,_write,00102$
	mov	_write,#0x00
	sjmp	00103$
00102$:
;	test3threads.c:46: else write++;
	mov	a,_write
	inc	a
	mov	_write,a
00103$:
;	test3threads.c:47: EA = 1;
;	assignBit
	setb	_EA
;	test3threads.c:49: SemaphoreSignal(mutex);
	INC _mutex 
;	test3threads.c:50: SemaphoreSignal(full);
	INC _full 
;	test3threads.c:52: if (next_char2 == '9') next_char2 = '0';
	mov	a,#0x39
	cjne	a,_next_char2,00105$
	mov	_next_char2,#0x30
	sjmp	00108$
00105$:
;	test3threads.c:53: else next_char2++;
	mov	a,_next_char2
	inc	a
	mov	_next_char2,a
;	test3threads.c:55: }
	sjmp	00108$
;------------------------------------------------------------
;Allocation info for local variables in function 'Consumer'
;------------------------------------------------------------
;	test3threads.c:57: void Consumer(void) 
;	-----------------------------------------
;	 function Consumer
;	-----------------------------------------
_Consumer:
;	test3threads.c:59: TMOD |= 0x20;
	orl	_TMOD,#0x20
;	test3threads.c:60: TH1 = 0xFA;
	mov	_TH1,#0xfa
;	test3threads.c:61: SCON = 0x50;
	mov	_SCON,#0x50
;	test3threads.c:62: TR1 = 1;
;	assignBit
	setb	_TR1
;	test3threads.c:64: while (1)
00108$:
;	test3threads.c:66: SemaphoreWait(full);
4$:
	MOV A, _full 
	JZ 4$ 
	DEC _full 
;	test3threads.c:67: SemaphoreWait(mutex);
5$:
	MOV A, _mutex 
	JZ 5$ 
	DEC _mutex 
;	test3threads.c:69: EA = 0;
;	assignBit
	clr	_EA
;	test3threads.c:70: SBUF = bounded_buffer[read];
	mov	a,_read
	add	a, #_bounded_buffer
	mov	r1,a
	mov	_SBUF,@r1
;	test3threads.c:71: if (read == 2) read = 0;
	mov	a,#0x02
	cjne	a,_read,00102$
	mov	_read,#0x00
	sjmp	00103$
00102$:
;	test3threads.c:72: else read++;
	mov	a,_read
	inc	a
	mov	_read,a
00103$:
;	test3threads.c:73: EA = 1;
;	assignBit
	setb	_EA
;	test3threads.c:75: SemaphoreSignal(mutex);
	INC _mutex 
;	test3threads.c:76: SemaphoreSignal(empty);
	INC _empty 
;	test3threads.c:79: while(TI == 0); 
00104$:
;	test3threads.c:80: TI = 0;
;	assignBit
	jbc	_TI,00108$
;	test3threads.c:82: }
	sjmp	00104$
;------------------------------------------------------------
;Allocation info for local variables in function 'main'
;------------------------------------------------------------
;	test3threads.c:84: void main(void)
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	test3threads.c:86: SemaphoreCreate(mutex, 1);
	mov	_mutex,#0x01
;	test3threads.c:87: SemaphoreCreate(full, 0);
	mov	_full,#0x00
;	test3threads.c:88: SemaphoreCreate(empty, 3);
	mov	_empty,#0x03
;	test3threads.c:89: write = 0;
	mov	_write,#0x00
;	test3threads.c:90: read = 0;
	mov	_read,#0x00
;	test3threads.c:91: dir = 1;
	mov	_dir,#0x01
;	test3threads.c:92: ThreadCreate(Producer2);
	mov	dptr,#_Producer2
	lcall	_ThreadCreate
;	test3threads.c:94: ThreadCreate(Producer1);
	mov	dptr,#_Producer1
	lcall	_ThreadCreate
;	test3threads.c:95: Consumer();
;	test3threads.c:96: }
	ljmp	_Consumer
;------------------------------------------------------------
;Allocation info for local variables in function '_sdcc_gsinit_startup'
;------------------------------------------------------------
;	test3threads.c:98: void _sdcc_gsinit_startup(void) 
;	-----------------------------------------
;	 function _sdcc_gsinit_startup
;	-----------------------------------------
__sdcc_gsinit_startup:
;	test3threads.c:102: __endasm;
	LJMP	_Bootstrap
;	test3threads.c:103: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function '_mcs51_genRAMCLEAR'
;------------------------------------------------------------
;	test3threads.c:105: void _mcs51_genRAMCLEAR(void) {}
;	-----------------------------------------
;	 function _mcs51_genRAMCLEAR
;	-----------------------------------------
__mcs51_genRAMCLEAR:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function '_mcs51_genXINIT'
;------------------------------------------------------------
;	test3threads.c:106: void _mcs51_genXINIT(void) {}
;	-----------------------------------------
;	 function _mcs51_genXINIT
;	-----------------------------------------
__mcs51_genXINIT:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function '_mcs51_genXRAMCLEAR'
;------------------------------------------------------------
;	test3threads.c:107: void _mcs51_genXRAMCLEAR(void) {}
;	-----------------------------------------
;	 function _mcs51_genXRAMCLEAR
;	-----------------------------------------
__mcs51_genXRAMCLEAR:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'timer0_ISR'
;------------------------------------------------------------
;	test3threads.c:109: void timer0_ISR(void) __interrupt(1)
;	-----------------------------------------
;	 function timer0_ISR
;	-----------------------------------------
_timer0_ISR:
;	test3threads.c:113: __endasm;
	LJMP	_myTimer0Handler
;	test3threads.c:114: }
	ljmp	sdcc_atomic_maybe_rollback
;	eliminated unneeded mov psw,# (no regs used in bank)
;	eliminated unneeded push/pop not_psw
;	eliminated unneeded push/pop dpl
;	eliminated unneeded push/pop dph
;	eliminated unneeded push/pop b
;	eliminated unneeded push/pop acc
	.area CSEG    (CODE)
	.area CONST   (CODE)
	.area XINIT   (CODE)
	.area CABS    (ABS,CODE)
