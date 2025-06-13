;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.0 #15242 (MINGW64)
;--------------------------------------------------------
	.module dino
	
	.optsdcc -mmcs51 --model-small
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _cactus_patterns
	.globl _cactus
	.globl _dinosaur
	.globl _timer0_ISR
	.globl __mcs51_genXRAMCLEAR
	.globl __mcs51_genXINIT
	.globl __mcs51_genRAMCLEAR
	.globl __sdcc_gsinit_startup
	.globl _main
	.globl _game_ctrl
	.globl _render_task
	.globl _keypad_ctrl
	.globl _LCD_set_symbol
	.globl _LCD_write_char
	.globl _LCD_IRWrite
	.globl _LCD_Init
	.globl _AnyKeyPressed
	.globl _KeyToChar
	.globl _Init_Keypad
	.globl _ThreadYield
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
	.globl _last_cactus_row
	.globl _cactus_timer
	.globl _game_speed
	.globl _mask
	.globl _carry_bit
	.globl _time
	.globl _map_btm
	.globl _map_top
	.globl _score
	.globl _game_over
	.globl _game_start
	.globl _dino_position
	.globl _pressed_key
	.globl _difficulty_input
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
_pressed_key	=	0x0020
_dino_position	=	0x0021
_game_start	=	0x0022
_game_over	=	0x0023
_score	=	0x0024
_map_top	=	0x0025
_map_btm	=	0x0027
_time	=	0x0029
_carry_bit	=	0x002a
_mask	=	0x002b
_game_speed	=	0x002c
_cactus_timer	=	0x002d
_last_cactus_row	=	0x002e
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
;Allocation info for local variables in function 'keypad_ctrl'
;------------------------------------------------------------
;	dino.c:33: void keypad_ctrl(void)
;	-----------------------------------------
;	 function keypad_ctrl
;	-----------------------------------------
_keypad_ctrl:
	ar7 = 0x07
	ar6 = 0x06
	ar5 = 0x05
	ar4 = 0x04
	ar3 = 0x03
	ar2 = 0x02
	ar1 = 0x01
	ar0 = 0x00
;	dino.c:36: while (AnyKeyPressed() == 0);
00101$:
	lcall	_AnyKeyPressed
	mov	a, dpl
	jz	00101$
;	dino.c:37: EA = 0;
;	assignBit
	clr	_EA
;	dino.c:38: pressed_key = KeyToChar();
	lcall	_KeyToChar
	mov	_pressed_key,dpl
;	dino.c:39: EA = 1;
;	assignBit
	setb	_EA
;	dino.c:41: if (pressed_key == '2') {
	mov	a,#0x32
	cjne	a,_pressed_key,00109$
;	dino.c:42: EA = 0;                           
;	assignBit
	clr	_EA
;	dino.c:43: if(dino_position == 1) {
	mov	a,#0x01
	cjne	a,_dino_position,00109$
;	dino.c:44: if(map_top[0] & 0x80) {
	mov	a,_map_top
	jnb	acc.7,00105$
;	dino.c:45: game_over = 1;
	mov	_game_over,#0x01
;	dino.c:46: ThreadYield();
	lcall	_ThreadYield
00105$:
;	dino.c:49: dino_position = 0;
	mov	_dino_position,#0x00
;	dino.c:50: LCD_cursorGoTo(1, 0);
	mov	dpl, #0xc0
	lcall	_LCD_IRWrite
;	dino.c:51: LCD_write_char(' ');
	mov	dpl, #0x20
	lcall	_LCD_write_char
;	dino.c:52: LCD_cursorGoTo(0, 0);
	mov	dpl, #0x80
	lcall	_LCD_IRWrite
;	dino.c:53: LCD_write_char('\1');               
	mov	dpl, #0x01
	lcall	_LCD_write_char
00109$:
;	dino.c:56: EA = 1;
;	assignBit
	setb	_EA
;	dino.c:58: if(pressed_key == '8'){
	mov	a,#0x38
	cjne	a,_pressed_key,00115$
;	dino.c:59: EA = 0;
;	assignBit
	clr	_EA
;	dino.c:60: if(dino_position == 0){
	mov	a,_dino_position
	jnz	00115$
;	dino.c:61: if(map_btm[0] & 0x80){
	mov	a,_map_btm
	jnb	acc.7,00111$
;	dino.c:62: game_over = 1;
	mov	_game_over,#0x01
;	dino.c:63: ThreadYield();
	lcall	_ThreadYield
00111$:
;	dino.c:66: dino_position = 1;
	mov	_dino_position,#0x01
;	dino.c:67: LCD_cursorGoTo(0, 0);
	mov	dpl, #0x80
	lcall	_LCD_IRWrite
;	dino.c:68: LCD_write_char(' ');
	mov	dpl, #0x20
	lcall	_LCD_write_char
;	dino.c:69: LCD_cursorGoTo(1, 0);
	mov	dpl, #0xc0
	lcall	_LCD_IRWrite
;	dino.c:70: LCD_write_char('\1'); 
	mov	dpl, #0x01
	lcall	_LCD_write_char
00115$:
;	dino.c:73: EA = 1;
;	assignBit
	setb	_EA
;	dino.c:75: while (AnyKeyPressed());
00116$:
	lcall	_AnyKeyPressed
	mov	a, dpl
	jnz	00116$
;	dino.c:77: }
	ljmp	00101$
;------------------------------------------------------------
;Allocation info for local variables in function 'render_task'
;------------------------------------------------------------
;	dino.c:79: void render_task(void){
;	-----------------------------------------
;	 function render_task
;	-----------------------------------------
_render_task:
;	dino.c:80: while(1){
00121$:
;	dino.c:81: EA = 0;
;	assignBit
	clr	_EA
;	dino.c:83: if (game_over) ThreadYield();
	mov	a,_game_over
	jz	00102$
	lcall	_ThreadYield
00102$:
;	dino.c:85: if ((dino_position == 0 && (map_top[0] & 0x40)) ||
	mov	a,_dino_position
	jnz	00107$
	mov	a,_map_top
	jb	acc.6,00103$
00107$:
;	dino.c:86: (dino_position == 1 && (map_btm[0] & 0x40))) {
	mov	a,#0x01
	cjne	a,_dino_position,00104$
	mov	a,_map_btm
	jnb	acc.6,00104$
00103$:
;	dino.c:87: game_over = 1;
	mov	_game_over,#0x01
;	dino.c:88: ThreadYield();
	lcall	_ThreadYield
00104$:
;	dino.c:91: carry_bit = (map_top[0] & 0x80) ? 1 : 0;
	mov	a,_map_top
	jnb	acc.7,00137$
	mov	r7,#0x01
	sjmp	00138$
00137$:
	mov	r7,#0x00
00138$:
	mov	_carry_bit,r7
;	dino.c:92: map_top[0] <<= 1;
	mov	a,_map_top
	add	a,_map_top
	mov	_map_top, a
;	dino.c:93: if (map_top[1] & 0x80) map_top[0]++;
	mov	a,(_map_top + 0x0001)
	jnb	acc.7,00109$
	mov	a,_map_top
	inc	a
	mov	_map_top,a
00109$:
;	dino.c:94: map_top[1] <<= 1;
	mov	a,(_map_top + 0x0001)
	add	a,acc
	mov	(_map_top + 0x0001), a
;	dino.c:95: if (carry_bit) { 
	mov	a,_carry_bit
	jz	00111$
;	dino.c:96: score++; 
	mov	a,_score
	inc	a
	mov	_score,a
;	dino.c:97: map_top[1]++; 
	mov	a,(_map_top + 0x0001)
	inc	a
	mov	(_map_top + 0x0001),a
00111$:
;	dino.c:100: carry_bit = (map_btm[0] & 0x80) ? 1 : 0;
	mov	a,_map_btm
	jnb	acc.7,00139$
	mov	r7,#0x01
	sjmp	00140$
00139$:
	mov	r7,#0x00
00140$:
	mov	_carry_bit,r7
;	dino.c:101: map_btm[0] <<= 1;
	mov	a,_map_btm
	add	a,_map_btm
	mov	_map_btm, a
;	dino.c:102: if (map_btm[1] & 0x80) map_btm[0]++;
	mov	a,(_map_btm + 0x0001)
	jnb	acc.7,00113$
	mov	a,_map_btm
	inc	a
	mov	_map_btm,a
00113$:
;	dino.c:103: map_btm[1] <<= 1;
	mov	a,(_map_btm + 0x0001)
	add	a,acc
	mov	(_map_btm + 0x0001), a
;	dino.c:104: if (carry_bit) { 
	mov	a,_carry_bit
	jz	00115$
;	dino.c:105: score++; 
	mov	a,_score
	inc	a
	mov	_score,a
;	dino.c:106: map_btm[1]++; 
	mov	a,(_map_btm + 0x0001)
	inc	a
	mov	(_map_btm + 0x0001),a
00115$:
;	dino.c:109: LCD_cursorGoTo(0, 0);
	mov	dpl, #0x80
	lcall	_LCD_IRWrite
;	dino.c:110: for(mask = 0x80; mask; mask >>= 1){ 
	mov	_mask,#0x80
00124$:
	mov	a,_mask
	jz	00116$
;	dino.c:111: LCD_write_char((map_top[0] & mask) ? '\2' : ' '); 
	mov	a,_mask
	anl	a,_map_top
	jz	00141$
	mov	r7,#0x02
	sjmp	00142$
00141$:
	mov	r7,#0x20
00142$:
	mov	dpl,r7
	lcall	_LCD_write_char
;	dino.c:110: for(mask = 0x80; mask; mask >>= 1){ 
	mov	a,_mask
	clr	c
	rrc	a
	mov	_mask,a
	sjmp	00124$
00116$:
;	dino.c:114: for(mask = 0x80; mask != 1; mask >>= 1){
	mov	_mask,#0x80
00127$:
	mov	a,#0x01
	cjne	a,_mask,00295$
	sjmp	00117$
00295$:
;	dino.c:115: LCD_write_char((map_top[1] & mask) ? '\2' : ' ');
	mov	a,_mask
	anl	a,(_map_top + 0x0001)
	jz	00143$
	mov	r7,#0x02
	sjmp	00144$
00143$:
	mov	r7,#0x20
00144$:
	mov	dpl,r7
	lcall	_LCD_write_char
;	dino.c:114: for(mask = 0x80; mask != 1; mask >>= 1){
	mov	a,_mask
	clr	c
	rrc	a
	mov	_mask,a
	sjmp	00127$
00117$:
;	dino.c:118: LCD_cursorGoTo(1, 0);
	mov	dpl, #0xc0
	lcall	_LCD_IRWrite
;	dino.c:119: for(mask = 0x80; mask; mask >>= 1){
	mov	_mask,#0x80
00130$:
	mov	a,_mask
	jz	00118$
;	dino.c:120: LCD_write_char((map_btm[0] & mask) ? '\2' : ' ');
	mov	a,_mask
	anl	a,_map_btm
	jz	00145$
	mov	r7,#0x02
	sjmp	00146$
00145$:
	mov	r7,#0x20
00146$:
	mov	dpl,r7
	lcall	_LCD_write_char
;	dino.c:119: for(mask = 0x80; mask; mask >>= 1){
	mov	a,_mask
	clr	c
	rrc	a
	mov	_mask,a
	sjmp	00130$
00118$:
;	dino.c:122: for(mask = 0x80; mask != 1; mask >>= 1){
	mov	_mask,#0x80
00133$:
	mov	a,#0x01
	cjne	a,_mask,00299$
	sjmp	00119$
00299$:
;	dino.c:123: LCD_write_char((map_btm[1] & mask) ? '\2' : ' ');
	mov	a,_mask
	anl	a,(_map_btm + 0x0001)
	jz	00147$
	mov	r7,#0x02
	sjmp	00148$
00147$:
	mov	r7,#0x20
00148$:
	mov	dpl,r7
	lcall	_LCD_write_char
;	dino.c:122: for(mask = 0x80; mask != 1; mask >>= 1){
	mov	a,_mask
	clr	c
	rrc	a
	mov	_mask,a
	sjmp	00133$
00119$:
;	dino.c:126: LCD_cursorGoTo(dino_position, 0);
	mov	a,_dino_position
	rr	a
	rr	a
	anl	a,#0xc0
	mov	r7,a
	mov	a,#0x80
	orl	a,r7
	mov	dpl,a
	lcall	_LCD_IRWrite
;	dino.c:127: LCD_write_char('\1');
	mov	dpl, #0x01
	lcall	_LCD_write_char
;	dino.c:129: EA = 1;
;	assignBit
	setb	_EA
;	dino.c:130: ThreadYield();
	lcall	_ThreadYield
;	dino.c:132: }
	ljmp	00121$
;------------------------------------------------------------
;Allocation info for local variables in function 'game_ctrl'
;------------------------------------------------------------
;pattern       Allocated to registers r7 
;i             Allocated to registers r7 
;------------------------------------------------------------
;	dino.c:134: void game_ctrl(void)
;	-----------------------------------------
;	 function game_ctrl
;	-----------------------------------------
_game_ctrl:
;	dino.c:136: while (1){
00113$:
;	dino.c:137: if(game_over){
	mov	a,_game_over
	jnz	00162$
	ljmp	00102$
00162$:
;	dino.c:138: EA = 0;
;	assignBit
	clr	_EA
;	dino.c:139: LCD_cursorGoTo(0, 0);
	mov	dpl, #0x80
	lcall	_LCD_IRWrite
;	dino.c:140: LCD_write_char(' ');
	mov	dpl, #0x20
	lcall	_LCD_write_char
;	dino.c:141: LCD_write_char(' ');
	mov	dpl, #0x20
	lcall	_LCD_write_char
;	dino.c:142: LCD_write_char(' ');
	mov	dpl, #0x20
	lcall	_LCD_write_char
;	dino.c:143: LCD_write_char(' ');
	mov	dpl, #0x20
	lcall	_LCD_write_char
;	dino.c:144: LCD_write_char('G');
	mov	dpl, #0x47
	lcall	_LCD_write_char
;	dino.c:145: LCD_write_char('A');
	mov	dpl, #0x41
	lcall	_LCD_write_char
;	dino.c:146: LCD_write_char('M');
	mov	dpl, #0x4d
	lcall	_LCD_write_char
;	dino.c:147: LCD_write_char('E');
	mov	dpl, #0x45
	lcall	_LCD_write_char
;	dino.c:148: LCD_write_char(' ');
	mov	dpl, #0x20
	lcall	_LCD_write_char
;	dino.c:149: LCD_write_char('O');
	mov	dpl, #0x4f
	lcall	_LCD_write_char
;	dino.c:150: LCD_write_char('V');
	mov	dpl, #0x56
	lcall	_LCD_write_char
;	dino.c:151: LCD_write_char('E');
	mov	dpl, #0x45
	lcall	_LCD_write_char
;	dino.c:152: LCD_write_char('R');
	mov	dpl, #0x52
	lcall	_LCD_write_char
;	dino.c:153: LCD_write_char(' ');
	mov	dpl, #0x20
	lcall	_LCD_write_char
;	dino.c:154: LCD_write_char(' ');
	mov	dpl, #0x20
	lcall	_LCD_write_char
;	dino.c:155: LCD_write_char(' ');
	mov	dpl, #0x20
	lcall	_LCD_write_char
;	dino.c:156: LCD_cursorGoTo(1, 0);
	mov	dpl, #0xc0
	lcall	_LCD_IRWrite
;	dino.c:157: LCD_write_char(' ');
	mov	dpl, #0x20
	lcall	_LCD_write_char
;	dino.c:158: LCD_write_char(' ');
	mov	dpl, #0x20
	lcall	_LCD_write_char
;	dino.c:159: LCD_write_char(' ');
	mov	dpl, #0x20
	lcall	_LCD_write_char
;	dino.c:160: LCD_write_char(' ');
	mov	dpl, #0x20
	lcall	_LCD_write_char
;	dino.c:161: LCD_write_char('S');
	mov	dpl, #0x53
	lcall	_LCD_write_char
;	dino.c:162: LCD_write_char('C');
	mov	dpl, #0x43
	lcall	_LCD_write_char
;	dino.c:163: LCD_write_char('O');
	mov	dpl, #0x4f
	lcall	_LCD_write_char
;	dino.c:164: LCD_write_char('R');
	mov	dpl, #0x52
	lcall	_LCD_write_char
;	dino.c:165: LCD_write_char('E');
	mov	dpl, #0x45
	lcall	_LCD_write_char
;	dino.c:166: LCD_write_char(':');
	mov	dpl, #0x3a
	lcall	_LCD_write_char
;	dino.c:167: LCD_write_char(' ');
	mov	dpl, #0x20
	lcall	_LCD_write_char
;	dino.c:168: LCD_write_char(score/10 + '0');
	mov	r7,_score
	mov	b,#0x0a
	mov	a,r7
	div	ab
	add	a,#0x30
	mov	dpl,a
	lcall	_LCD_write_char
;	dino.c:169: LCD_write_char(score%10 + '0');
	mov	r7,_score
	mov	b,#0x0a
	mov	a,r7
	div	ab
	mov	r7,b
	mov	a,#0x30
	add	a, r7
	mov	dpl,a
	lcall	_LCD_write_char
;	dino.c:170: LCD_write_char(' ');
	mov	dpl, #0x20
	lcall	_LCD_write_char
;	dino.c:171: LCD_write_char(' ');
	mov	dpl, #0x20
	lcall	_LCD_write_char
;	dino.c:172: LCD_write_char(' ');
	mov	dpl, #0x20
;	dino.c:173: return;
	ljmp	_LCD_write_char
00102$:
;	dino.c:176: cactus_timer++;
	mov	a,_cactus_timer
	inc	a
	mov	_cactus_timer,a
;	dino.c:177: if (cactus_timer >= (10 - game_speed)) {  
	mov	r6,_game_speed
	mov	r7,#0x00
	mov	a,#0x0a
	clr	c
	subb	a,r6
	mov	r6,a
	clr	a
	subb	a,r7
	mov	r7,a
	mov	r4,_cactus_timer
	mov	r5,#0x00
	clr	c
	mov	a,r4
	subb	a,r6
	mov	a,r5
	xrl	a,#0x80
	mov	b,r7
	xrl	b,#0x80
	subb	a,b
	jc	00126$
;	dino.c:178: cactus_timer = 0;
	mov	_cactus_timer,#0x00
;	dino.c:180: unsigned char pattern = cactus_patterns[(score + last_cactus_row) % 8];
	mov	r6,_score
	mov	r7,#0x00
	mov	r4,_last_cactus_row
	mov	r5,#0x00
	mov	a,r4
	add	a, r6
	mov	dpl,a
	mov	a,r5
	addc	a, r7
	mov	dph,a
	mov	__modsint_PARM_2,#0x08
	mov	(__modsint_PARM_2 + 1),r7
	lcall	__modsint
	mov	r6, dpl
	mov	r7, dph
	mov	a,r6
	add	a, #_cactus_patterns
	mov	dpl,a
	mov	a,r7
	addc	a, #(_cactus_patterns >> 8)
	mov	dph,a
	clr	a
	movc	a,@a+dptr
	mov	r7,a
;	dino.c:182: if (pattern == 1) {
	cjne	r7,#0x01,00107$
;	dino.c:183: map_top[1] |= 0x01;  
	mov	a,#0x01
	orl	a,(_map_top + 0x0001)
	mov	(_map_top + 0x0001),a
;	dino.c:184: last_cactus_row = 1;
	mov	_last_cactus_row,#0x01
	sjmp	00126$
00107$:
;	dino.c:185: } else if (pattern == 2) {
	cjne	r7,#0x02,00104$
;	dino.c:186: map_btm[1] |= 0x01;  
	mov	a,#0x01
	orl	a,(_map_btm + 0x0001)
	mov	(_map_btm + 0x0001),a
;	dino.c:187: last_cactus_row = 2;
	mov	_last_cactus_row,#0x02
	sjmp	00126$
00104$:
;	dino.c:189: last_cactus_row = 0;  
	mov	_last_cactus_row,#0x00
;	dino.c:194: for (i = 0; i < game_speed; i++) {
00126$:
	mov	r7,#0x00
00116$:
	clr	c
	mov	a,r7
	subb	a,_game_speed
	jc	00168$
	ljmp	00113$
00168$:
;	dino.c:195: ThreadYield();
	push	ar7
	lcall	_ThreadYield
	pop	ar7
;	dino.c:194: for (i = 0; i < game_speed; i++) {
	inc	r7
;	dino.c:198: }
	sjmp	00116$
;------------------------------------------------------------
;Allocation info for local variables in function 'difficulty_input'
;------------------------------------------------------------
;input_time    Allocated to registers r7 
;key           Allocated to registers r6 
;------------------------------------------------------------
;	dino.c:203: unsigned char difficulty_input() {
;	-----------------------------------------
;	 function difficulty_input
;	-----------------------------------------
_difficulty_input:
;	dino.c:204: unsigned char input_time = 0;
	mov	r7,#0x00
;	dino.c:207: while (!AnyKeyPressed());
00101$:
	push	ar7
	lcall	_AnyKeyPressed
	mov	a, dpl
	pop	ar7
	jz	00101$
;	dino.c:208: key = KeyToChar();
	push	ar7
	lcall	_KeyToChar
	mov	r6, dpl
	pop	ar7
;	dino.c:209: while (AnyKeyPressed());
00104$:
	push	ar7
	push	ar6
	lcall	_AnyKeyPressed
	mov	a, dpl
	pop	ar6
	pop	ar7
	jnz	00104$
;	dino.c:211: if (key == '#') {
	cjne	r6,#0x23,00111$
;	dino.c:212: if (input_time == 0)
	mov	a,r7
	jnz	00119$
;	dino.c:213: continue;
;	dino.c:215: break;
	sjmp	00101$
00111$:
;	dino.c:218: if (key == '*') {
	cjne	r6,#0x2a,00181$
	sjmp	00101$
00181$:
;	dino.c:222: if (key >= '1' && key <= '9') {
	cjne	r6,#0x31,00182$
00182$:
	jc	00101$
	mov	a,r6
	add	a,#0xff - 0x39
	jc	00101$
;	dino.c:223: input_time = (key - '0');
	mov	a,r6
	add	a,#0xd0
	mov	r7,a
	sjmp	00101$
00119$:
;	dino.c:226: return input_time;
	mov	dpl, r7
;	dino.c:227: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'main'
;------------------------------------------------------------
;	dino.c:237: void main(void)
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	dino.c:239: Init_Keypad();
	lcall	_Init_Keypad
;	dino.c:240: LCD_Init();
	lcall	_LCD_Init
;	dino.c:241: LCD_set_symbol('\10', dinosaur); 
	mov	_LCD_set_symbol_PARM_2,#_dinosaur
	mov	(_LCD_set_symbol_PARM_2 + 1),#(_dinosaur >> 8)
	mov	(_LCD_set_symbol_PARM_2 + 2),#0x80
	mov	dpl, #0x08
	lcall	_LCD_set_symbol
;	dino.c:242: LCD_set_symbol('\20', cactus);   
	mov	_LCD_set_symbol_PARM_2,#_cactus
	mov	(_LCD_set_symbol_PARM_2 + 1),#(_cactus >> 8)
	mov	(_LCD_set_symbol_PARM_2 + 2),#0x80
	mov	dpl, #0x10
	lcall	_LCD_set_symbol
;	dino.c:244: map_top[0] = 0x1C;
	mov	_map_top,#0x1c
;	dino.c:245: map_top[1] = 0x00;
	mov	(_map_top + 0x0001),#0x00
;	dino.c:246: map_btm[0] = 0x00;
	mov	_map_btm,#0x00
;	dino.c:247: map_btm[1] = 0xE0;
	mov	(_map_btm + 0x0001),#0xe0
;	dino.c:249: time = 0;
	mov	_time,#0x00
;	dino.c:250: game_over = 0;
	mov	_game_over,#0x00
;	dino.c:251: score = 0;
	mov	_score,#0x00
;	dino.c:252: dino_position = 0;
	mov	_dino_position,#0x00
;	dino.c:253: cactus_timer = 0;
	mov	_cactus_timer,#0x00
;	dino.c:254: last_cactus_row = 0;
	mov	_last_cactus_row,#0x00
;	dino.c:256: game_speed = difficulty_input();
	lcall	_difficulty_input
	mov	_game_speed,dpl
;	dino.c:257: if (game_speed > 9) game_speed = 9;  
	mov	a,_game_speed
	add	a,#0xff - 0x09
	jnc	00102$
	mov	_game_speed,#0x09
00102$:
;	dino.c:258: if (game_speed < 1) game_speed = 1;  
	mov	a,#0x100 - 0x01
	add	a,_game_speed
	jc	00104$
	mov	_game_speed,#0x01
00104$:
;	dino.c:260: ThreadCreate(render_task);
	mov	dptr,#_render_task
	lcall	_ThreadCreate
;	dino.c:261: ThreadCreate(keypad_ctrl);
	mov	dptr,#_keypad_ctrl
	lcall	_ThreadCreate
;	dino.c:262: game_ctrl();
;	dino.c:263: }
	ljmp	_game_ctrl
;------------------------------------------------------------
;Allocation info for local variables in function '_sdcc_gsinit_startup'
;------------------------------------------------------------
;	dino.c:265: void _sdcc_gsinit_startup(void) 
;	-----------------------------------------
;	 function _sdcc_gsinit_startup
;	-----------------------------------------
__sdcc_gsinit_startup:
;	dino.c:269: __endasm;
	LJMP	_Bootstrap
;	dino.c:270: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function '_mcs51_genRAMCLEAR'
;------------------------------------------------------------
;	dino.c:272: void _mcs51_genRAMCLEAR(void) {}
;	-----------------------------------------
;	 function _mcs51_genRAMCLEAR
;	-----------------------------------------
__mcs51_genRAMCLEAR:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function '_mcs51_genXINIT'
;------------------------------------------------------------
;	dino.c:273: void _mcs51_genXINIT(void) {}
;	-----------------------------------------
;	 function _mcs51_genXINIT
;	-----------------------------------------
__mcs51_genXINIT:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function '_mcs51_genXRAMCLEAR'
;------------------------------------------------------------
;	dino.c:274: void _mcs51_genXRAMCLEAR(void) {}
;	-----------------------------------------
;	 function _mcs51_genXRAMCLEAR
;	-----------------------------------------
__mcs51_genXRAMCLEAR:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'timer0_ISR'
;------------------------------------------------------------
;	dino.c:276: void timer0_ISR(void) __interrupt(1)
;	-----------------------------------------
;	 function timer0_ISR
;	-----------------------------------------
_timer0_ISR:
;	dino.c:280: __endasm;
	LJMP	_myTimer0Handler
;	dino.c:281: }
	ljmp	sdcc_atomic_maybe_rollback
;	eliminated unneeded mov psw,# (no regs used in bank)
;	eliminated unneeded push/pop not_psw
;	eliminated unneeded push/pop dpl
;	eliminated unneeded push/pop dph
;	eliminated unneeded push/pop b
;	eliminated unneeded push/pop acc
	.area CSEG    (CODE)
	.area CONST   (CODE)
	.area CONST   (CODE)
_dinosaur:
	.db #0x07	; 7
	.db #0x05	; 5
	.db #0x06	; 6
	.db #0x07	; 7
	.db #0x14	; 20
	.db #0x17	; 23
	.db #0x0e	; 14
	.db #0x0a	; 10
	.area CSEG    (CODE)
	.area CONST   (CODE)
_cactus:
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x15	; 21
	.db #0x15	; 21
	.db #0x16	; 22
	.db #0x0c	; 12
	.db #0x04	; 4
	.db #0x04	; 4
	.area CSEG    (CODE)
	.area CONST   (CODE)
_cactus_patterns:
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x02	; 2
	.area CSEG    (CODE)
	.area XINIT   (CODE)
	.area CABS    (ABS,CODE)
